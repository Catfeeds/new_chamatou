<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%shop}}".
 *
 * @property integer $id
 * @property string $sp_name
 * @property string $address
 * @property string $lat
 * @property string $lot
 * @property integer $provinces_id
 * @property integer $city_id
 * @property integer $area_id
 * @property string $add_detail
 * @property string $sp_phone
 * @property string $cover
 * @property string $intro
 */
class Shop extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%shop}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['lat', 'lot'], 'number'],
            [['provinces_id', 'city_id', 'area_id', 'add_detail'], 'required'],
            [['provinces_id', 'city_id', 'area_id'], 'integer'],
            [['sp_name', 'address', 'cover', 'intro'], 'string', 'max' => 255],
            [['add_detail'], 'string', 'max' => 100],
            [['sp_phone'], 'string', 'max' => 15],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sp_name' => '店铺名称',
            'address' => '店铺地址',
            'lat' => '纬度',
            'lot' => '经度',
            'provinces_id' => '省id',
            'city_id' => '城市id',
            'area_id' => '地区id',
            'add_detail' => '详细地址',
            'sp_phone' => '联系电话',
            'cover' => '封面',
            'intro' => '简介',
        ];
    }
}
