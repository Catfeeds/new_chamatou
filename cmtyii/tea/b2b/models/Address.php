<?php

namespace tea\b2b\models;

use Yii;

/**
 * This is the model class for table "{{%sp_address}}".
 *
 * @property integer $id
 * @property integer $store_id
 * @property integer $shoper_id
 * @property string $province
 * @property string $city
 * @property string $district
 * @property integer $zip_code
 * @property string $address
 * @property string $phone
 * @property string $tel
 * @property string $username
 * @property integer $default
 */
class Address extends \yii\db\ActiveRecord
{
    /*是默认收货地址*/
    const DEFAULT_YES = 1;

    /*不是默认地址*/
    const DEFAULT_NO = 0;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_address}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['store_id', 'shoper_id', 'zip_code', 'default'], 'integer'],
            [['province', 'city', 'district', 'tel'], 'string', 'max' => 32],
            [['address'], 'string', 'max' => 255],
            [['phone'], 'string', 'max' => 15],
            [['username'], 'string', 'max' => 10],
            [['store_id', 'shoper_id', 'province', 'city', 'district', 'phone', 'address'], 'required', 'on' => ['add', 'edit']],
            [['default'], 'validateDefault', 'on' => ['add', 'edit']],
            [['phone'], 'match', 'pattern' => '/^(1(([35][0-9])|(47)|[8][0126789]))\d{8}$/', 'on' => ['add', 'edit']],
        ];
    }

    /**
     * 默认收货地址判断操作
     * @param $attr
     * @param $params
     */
    public function validateDefault($attr, $params)
    {
        if (!$this->hasErrors()) {
            if ($this->default == Address::DEFAULT_YES) {
                $model = self::find()
                    ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                    ->andWhere(['default' => Address::DEFAULT_YES]);
                if ($this->scenario == 'edit') {
                    $model = $model->andWhere(['!=', 'id', $this->id]);
                }
                $model = $model->one();
                if ($model) {
                    $model->default = Address::DEFAULT_NO;
                    $model->save();
                }
            }
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'store_id' => '店铺ID',
            'shoper_id' => '商家ID',
            'province' => '省',
            'city' => '市',
            'district' => '区',
            'zip_code' => '邮编',
            'address' => '详细地址',
            'phone' => '手机号',
            'tel' => '座机号码',
            'username' => '联系人',
            'default' => '默认地址',
        ];
    }

    /**
     * 获取所有收货地址
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getList()
    {
        $model = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->select([])
            ->all();
        return $model;
    }

    /**
     * 添加收货地址
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $this->scenario = 'add';
        $data['shoper_id'] = Yii::$app->session->get('shoper_id');
        $data['store_id'] = Yii::$app->session->get('store_id');

        if ($this->load($data, '') && $this->validate()) {
            return $this->save();
        }
    }

    /**
     * 修改一个收货地址
     * @param $data
     * @return bool
     */
    public function edit($data)
    {
        $this->scenario = 'edit';
        if ($this->load($data, '') && $this->validate()) {
            return $this->save();
        }
    }

    /**
     * 修改默认地址
     */
    public function editDefault()
    {
        $this->scenario = 'edit';
        $this->default = Address::DEFAULT_YES;
        if ($this->validate()) {
            return $this->save();
        }
    }
}
