<?php

namespace backend\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "t_locations".
 *
 * @property integer $id
 * @property string $name
 * @property integer $parent_id
 * @property integer $level
 */
class Locations extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 't_locations';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'parent_id', 'level'], 'required'],
            [['parent_id', 'level'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'        => Yii::t('app', 'ID'),
            'name'      => Yii::t('app', 'Name'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'level'     => Yii::t('app', 'Level'),
        ];
    }

    /**
     * @param $pid
     * @return array
     */
    public static function getCityList($pid)
    {
        $model = Locations::findAll(array('parent_id' => $pid));
        return ArrayHelper::map($model, 'id', 'name');
    }

    public static function getLatLog($city, $address)
    {

    }

    /**
     * 根据地址获取经纬度
     * @param $address
     * @param $city
     * @return array
     */
    public static function address2ll($address, $city)
    {
        $city = Locations::findOne(['id' => $city]);
        $q = $address;
        $region = $city['name'];
        $api_url = "http://api.map.baidu.com/place/v2/search?q={$q}&region={$region}&output=json&ak=CAdKE7vTaNmnVjA4jGQvq2Amz0dkZ4iF&scope=1";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $api_url);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $response = curl_exec($ch);
        curl_close($ch);
        if (isset($response)) {
            $res = json_decode($response, true);

            if ($res['status'] === 0) {
                return [
                    'lat' => $res['results'][0]['location']['lat'],
                    'lon' => $res['results'][0]['location']['lng'],
                ];
            }
        }
        return [
            'lat' => null,
            'lon' => null,
        ];
    }

    /**
     * 根据地址id获取详细地址
     * @param $provinces_id
     * @param $city_id
     * @param $area_id
     * @param $add_detail
     * @return string
     */
    public static function byIdAddress($provinces_id, $city_id, $area_id, $add_detail)
    {
        $provinces = Locations::find()->select('name')->where(['id'=>$provinces_id])->column();
        $city = Locations::find()->select('name')->where(['id'=>$city_id])->column();
        $area = Locations::find()->select('name')->where(['id'=>$area_id])->column();
        return current($provinces) . current($city) . current($area) . $add_detail;
    }
}
