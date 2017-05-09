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
 * @property string $lon
 * @property integer $provinces_id
 * @property integer $city_id
 * @property integer $area_id
 * @property string $add_detail
 * @property string $sp_phone
 * @property string $cover
 * @property string $intro
 * @property string $add_time
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
            [['shoper_id', 'provinces_id', 'city_id', 'area_id','add_time'], 'integer'],
            [['lat', 'lon'], 'number'],
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
            'shoper_id' => Yii::t('app', '公司名称'),
            'sp_name' => Yii::t('app', '店铺名称'),
            'address' => Yii::t('app', '店铺地址'),
            'lat' => Yii::t('app', 'Lat'),
            'lon' => Yii::t('app', 'Lon'),
            'provinces_id' => Yii::t('app', '省'),
            'city_id' => Yii::t('app', '市'),
            'area_id' => Yii::t('app', '区'),
            'add_detail' => Yii::t('app', '详细地址'),
            'sp_phone' => Yii::t('app', '联系电话'),
            'cover' => Yii::t('app', '封面图'),
            'intro' => Yii::t('app', '店铺简介'),
            'add_time' => Yii::t('app', '添加时间'),
        ];
    }

    public function getProvince(){
        return $this->hasOne(Locations::className(), ['id'=>'provinces_id']);
    }

    public function getCity(){
        return $this->hasOne(Locations::className(),  ['id'=>'city_id']);
    }

    public function getArea(){
        return $this->hasOne(Locations::className(),  ['id'=>'area_id']);
    }

    public function getImg()
    {
        return $this->hasMany(ShoperImg::className(), ['store_id' => 'id']);
    }

    public function getImgs()
    {
        return $this->getImg()->select('path')->column();
    }

    public function getShoper()
    {
        return $this->hasOne(Shoper::className(), ['id'=> 'shoper_id']);
    }

    public function getSalesman()
    {
        return $this->getShoper()->getSalesman();
    }
}
