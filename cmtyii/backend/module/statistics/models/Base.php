<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/16
 * Time: 下午6:24
 */
namespace backend\module\statistics\models;
/**
 * 基础处理函数
 * Class Base
 * @package backend\module\statistics\models
 */
class Base{
    /**
     * 时间转换
     * @return mixed
     */
    public static function toGetTime()
    {
        $time = empty(\Yii::$app->request->get('time')) ?
                \Yii::$app->request->post('time','') : \Yii::$app->request->get('time');
        if(strlen($time) == 23)
        {
            $data['startTime'] = substr($time,0,10);
            $data['endTime'] = substr($time,13);
            return $data;
        }
        $data['startTime'] = date('Y-m-d',time()-60*60*24*7);
        $data['endTime'] = date('Y-m-d');
        return $data;
    }

    /**
     * 获取月份
     * @return false|string
     */
    public static function month()
    {
        $month = date('M');
        return $month;
    }

    /**
     * 获取上一月
     * @return int
     */
    public static function upMonth()
    {
        $month = Base::month();
        if($month == 1){
            return 12;
        }else{
            return $month--;
        }
    }
}