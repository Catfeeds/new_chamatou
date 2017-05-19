<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\models;

use Yii;

/**
 * 由于Users类很大、所以派生这个类
 * Class UsersForm
 * @package tea\models
 */
class UsersForm extends Users
{

    /**
     * 角色名称
     * @var string
     */
    public $role_name = '';

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['phone', 'password', 'role_name', 'user'], 'required', 'on' => ['add']],
            [['phone',  'role_name', 'user'], 'required', 'on' => ['edit']],
            [['phone'], 'match', 'pattern' => '/^1[34578]\d{9}$/'],
            [['phone'], 'validatePhoneExist', 'on' => ['add', 'edit']],
            [['role_name'], 'validateRoleNameExist', 'on' => ['add', 'edit']],
            [['user'], 'validateUserExist', 'on' => ['add', 'edit']],
        ];
    }

    public function validateRoleNameExist($attributes, $p)
    {
        if (!$this->hasErrors()) {
            if (RBAC::isRoleNameExist($this->role_name)) {
                return true;
            }
            $this->addError('id', '角色不存在！');
        }
    }

    /**
     * 添加和修改检查时检查手机号码是否存在
     * @param $attributes
     * @param $p
     */
    public function validatePhoneExist($attributes, $p)
    {
        if (!$this->hasErrors()) {
            $data = self::find()->andWhere(['phone' => $this->phone]);
            if ($this->scenario == 'edit') {
                $data = $data->andWhere(['!=', 'id', $this->id]);
            }
            $data = $data->select(['id'])->one();

            if ($data) {
                return $this->addError($attributes, Yii::t('app', 'phone_exist'));
            }
        }
    }
    /**
     * 添加和修改检查时检查手机号码是否存在
     * @param $attributes
     * @param $p
     */
    public function validateUserExist($attributes, $p)
    {
        if (!$this->hasErrors()) {
            $data = self::find()->andWhere(['user' => $this->user]);
            if ($this->scenario == 'edit') {
                $data = $data->andWhere(['!=', 'id', $this->id]);
            }
            $data = $data->select(['id'])->one();

            if ($data) {
                return $this->addError($attributes, Yii::t('app', '用户名存在'));
            }
        }
    }

    public function attributeLabels()
    {
        return [
            'phone' => '手机号',
            'role_name' => '角色'
        ];
    }

    /**
     * 添加管理员
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $this->scenario = 'add';
        if ($this->load($data, '') && $this->validate()) {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            $this->add_time = time();
            $this->is_admin = 0;
            $this->status = 0;
            $this->password = $this->setPassword($this->password);
            if ($this->save()) {
                if (RBAC::addUserRoleName(['role_name' => $this->role_name, 'user_id' => $this->id])) {
                    return true;
                }
            }
        }
    }

    /**
     * 修改管理员
     * @param $data
     * @return bool
     */
    public function edit($data)
    {
        $this->scenario = 'edit';
        if ($this->load($data, '') && $this->validate()) {
            if ($data['password'] != '') {
                $this->password = $this->setPassword($data['password']);
            }
            $roleName = RBAC::getUserRoleNameByUserId($this->id);
            if (RBAC::revokeUserRoleName(['role_name' => $roleName, 'user_id' => $this->id])) {
                if (RBAC::addUserRoleName(['role_name' => $this->role_name, 'user_id' => $this->id])) {
                    return $this->save();
                }
            }
            $this->addError('id', '权限编辑失败');
        }
    }

    /**
     * 修改管理员
     * @return false|int
     */
    public function del()
    {
        $roleName = RBAC::getUserRoleNameByUserId($this->id);
        if (RBAC::revokeUserRoleName(['role_name' => $roleName, 'user_id' => $this->id])) {
            return $this->delete();
        }
    }

    /**
     * 获取所有管理员列表
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getList()
    {
        $data = UsersForm::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->select(['id', 'user', 'phone', 'is_admin', 'status'])
            ->all();
        return $data;
    }

    /**
     * 根据ID获取名称
     * @param $user_id
     * @return string
     */
    public static function getUserNameById($user_id)
    {
        if ($user_id) {
            $data = self::findOne($user_id);
            return $data['user'];
        }
        return '';
    }

    /**
     * 根据用户获取ID
     * @param $user_name
     * @return string
     */
    public static function getIdByName($user_name)
    {
        if ($user_name) {
            $data = self::find()->andWhere(['user' => $user_name])
                ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                ->one();
            return $data['id'];
        }
        return '';
    }

    /**
     * 修改用户密码
     * @param $pn
     * @return bool
     */
    public function editPassword($pn)
    {
        $user = self::find()->andWhere(['id'=>Yii::$app->session->get('tea_user_id')])->one();
        if($user->password == $this->setPassword($pn['old_password'])){
            $user->password = $this->setPassword($pn['new_password']);
            if ($user->save()){
                return true;
            }
        }
        $this->addError('id','原密码不正确!');
        return false;
    }
}