<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_store}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property string $sp_name
 * @property string $address
 * @property string $lat
 * @property string $lot
 * @property string $provinces_id
 * @property string $city_id
 * @property string $area_id
 * @property string $add_detail
 * @property string $sp_phone
 * @property string $cover
 * @property string $intro
 */
class Store extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_store}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'provinces_id', 'city_id', 'area_id'], 'integer'],
            [['lat', 'lot'], 'number'],
            [['provinces_id', 'city_id', 'area_id', 'add_detail'], 'required'],
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
            'shoper_id' => 'Shoper ID',
            'sp_name' => 'Sp Name',
            'address' => 'Address',
            'lat' => 'Lat',
            'lot' => 'Lot',
            'provinces_id' => 'Provinces ID',
            'city_id' => 'City ID',
            'area_id' => 'Area ID',
            'add_detail' => 'Add Detail',
            'sp_phone' => 'Sp Phone',
            'cover' => 'Cover',
            'intro' => 'Intro',
        ];
    }
    public static function getThisUserToStoreInfo()
    {
        return self::findOne(Yii::$app->session->get('store_id'));
    }
}
