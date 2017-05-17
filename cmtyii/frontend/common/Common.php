<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/6
 * Time: 14:37
 */

namespace frontend\common;


class Common
{
    /**
     * 根据经纬度计算两点之间的距离  这里是计算一个位置与多个位置的距离
     * @param $address1 经纬度数组1
     * @param $arr  经纬度数组1
     */
    public function distance($address,$arr)
    {
        foreach ($arr as &$value){
            $value['distance'] = $this->getDistance($address,$value);
        }
        //在根据数组中distance的值进行排序
        $arr2 = $this->getArr($arr,'distance');
        return $arr2;
    }

    /**
     * @param $address1  第一个位置  经纬度数组
     * @param $address2  第二个位置  经纬度数组
     */
    public function getDistance($address1,$address2)
    {
        $earthRadius = 6367000; //approximate radius of earth in meters
        //var_dump($address1);die;
        $lat1 = ($address1['lat'] * pi() ) / 180;
        $lng1 = ($address1['lon'] * pi() ) / 180;
        $lat2 = ($address2['lat'] * pi() ) / 180;
        $lng2 = ($address2['lon'] * pi() ) / 180;
        $calcLongitude = $lng2 - $lng1;
        $calcLatitude = $lat2 - $lat1;
        $stepOne = pow(sin($calcLatitude / 2), 2) + cos($lat1) * cos($lat2) * pow(sin($calcLongitude / 2), 2);
        $stepTwo = 2 * asin(min(1, sqrt($stepOne)));
        $calculatedDistance = $earthRadius * $stepTwo;
        $calculatedDistance =  $calculatedDistance/1000;
        return round($calculatedDistance,2);
    }

    //根据数组的键值大小由低到高排序  仅支持二维数组
    //$arr  数组  $field排序键名
    public function getArr($arr,$field)
    {
        $arr1 = [];
        foreach ($arr as $k=>$value){
            $arr1[$k] = $value[$field];
        }
        array_multisort($arr1,SORT_ASC,$arr);
        return $arr;
    }
}