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
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['phone','password'],'required','on'=>['add','edit']],
            [['phone'],'match','pattern'=>'/^1[34578]\d{9}$/'],
            [['phone'],'validatePhoneExist','on'=>['add','edit']],
        ];
    }


    /**
     * 添加和修改检查时检查手机号码是否存在
     * @param $attributes
     * @param $p
     */
    public function validatePhoneExist($attributes,$p)
    {
        if(!$this->hasErrors())
        {
            $data = self::find()->andWhere(['phone'=>$this->phone]);
            if($this->scenario == 'edit') {
                $data = $data->andWhere(['!=','id',$this->id]);
            }
            $data = $data->select(['id'])->one();

            if($data){
                return $this->addError($attributes,Yii::t('app','phone_exist'));
            }
        }
    }


    public function attributeLabels()
    {
        return [
            'phone'=>'手机号'
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
        if($this->load($data,'') && $this->validate())
        {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id  = Yii::$app->session->get('store_id');
            $this->add_time  = time();
            $this->is_admin  = 0;
            $this->status    = 0;
            $this->password  = $this->setPassword($this->password);
            return $this->save();
        }
    }

    /**
     * 添加管理员
     * @param $data
     * @return bool
     */
    public function edit($data)
    {
        $this->scenario = 'edit';
        if($this->load($data,'') && $this->validate())
        {
            if($this->password != ''){
                $this->password  = $this->setPassword($this->password);
            }
            return $this->save();
        }
    }

    /**
     * 删除业务员
     * @return false|int
     */
    public function del()
    {
        $this->scenario = 'del';
        if($this->validate())
        {
            return $this->delete();
        }
    }

    /**
     * 获取所有管理员列表
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getList()
    {
        $data = UsersForm::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                    ->select(['id','user','phone','is_admin','status'])
                    ->all();
        return $data;
    }

    /**
     * 根据ID获取名称
     * @param $goods_id
     * @return string
     */
    public static function getUserNameById($user_id){
        if($user_id){
            $data = self::findOne($user_id);
            return $data['user'];
        }
        return '';
    }
}