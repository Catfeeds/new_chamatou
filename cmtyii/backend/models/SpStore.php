<?php

namespace backend\models;

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
 * @property integer $provinces_id
 * @property integer $city_id
 * @property integer $area_id
 * @property string $add_detail
 * @property string $sp_phone
 * @property string $cover
 * @property string $intro
 */
class SpStore extends \yii\db\ActiveRecord
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
            'id' => Yii::t('app', 'ID'),
            'shoper_id' => Yii::t('app', 'Shoper ID'),
            'sp_name' => Yii::t('app', 'Sp Name'),
            'address' => Yii::t('app', 'Address'),
            'lat' => Yii::t('app', 'Lat'),
            'lot' => Yii::t('app', 'Lot'),
            'provinces_id' => Yii::t('app', 'Provinces ID'),
            'city_id' => Yii::t('app', 'City ID'),
            'area_id' => Yii::t('app', 'Area ID'),
            'add_detail' => Yii::t('app', 'Add Detail'),
            'sp_phone' => Yii::t('app', 'Sp Phone'),
            'cover' => Yii::t('app', 'Cover'),
            'intro' => Yii::t('app', 'Intro'),
        ];
    }
}
