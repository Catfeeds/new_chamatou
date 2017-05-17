<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/16
 * Time: 下午1:42
 */

namespace backend\module\statistics\models;


use backend\models\WxUser;

/**
 * 用户统计逻辑代码
 * Class Store
 * @package backend\module\statistics\models
 */
class User
{

    /**
     * 用户总数
     * @var int
     */
    public static $userSum = 0;

    /**
     * 一周用户增加数量
     * @var int
     */
    public static $weekUserUpSum = 0;

    /**
     * 一月用户增加数量
     * @var int
     */
    public static $monthUserUpSum = 0;

    /**
     * 逾期店铺增加数量
     * @var int
     */
    public static $cdbSum = 0;

    /**
     * 获取用户总数
     * @return int
     */
    public static function getUserSum()
    {
        self::$userSum = (int)WxUser::find()->count();
        return self::$userSum;
    }

    /**
     * 一周店铺增加数量
     * @return int
     */
    public static function getWeekUserUpSum()
    {
        $time = time() - 60 * 60 * 24 * 7;
        self::$weekUserUpSum = (int)WxUser::find()->andWhere(['>', 'add_time', $time])->count();
        return self::$weekUserUpSum;
    }

    /**
     * 一月店铺增加数量
     * @return int
     */
    public static function getMonthUserUpSum()
    {
        $time = time() - 60 * 60 * 24 * 30;
        self::$monthUserUpSum = (int)WxUser::find()->andWhere(['>', 'add_time', $time])->count();
        return self::$monthUserUpSum;
    }

    /**
     * 用户茶豆币总额
     * @return int
     */
    public static function getOverdueUserSum()
    {
        $temp  = WxUser::find()->select(['beans'])->asArray()->all();
        foreach ($temp as $key=>$value)
        {
            self::$cdbSum += $value['beans'];
        }
        return self::$cdbSum;
    }

    /**
     * 获取用户报表数据
     * @param $pn
     * @return array
     */
    public static function getStatistics($pn = [])
    {
        $time = [];
        if(empty($pn)){
            $time = Base::toGetTime();
        }
        $model = WxUser::find()->andWhere(['>', 'add_time', strtotime($time['startTime'])])
                    ->andWhere(['<', 'add_time', strtotime($time['endTime'])])
                    ->select(['add_time'])->asArray()->all();
        $dataList = [];//数据列表
        $timeList = [];//时间列表
        $startTime = strtotime($time['startTime']);
        $endTime = strtotime($time['endTime']);
        $i = 0;
        while ($startTime <= $endTime)
        {
            if(!isset($dataList[$i])){
                $dataList[$i] = 0;
            }
            $temp = date('Y-m-d',$startTime)." 23:59:59";
            $temp = strtotime($temp);
            foreach ($model as $key=>$value){
                if($temp > $value['add_time']){

                    $dataList[$i]++ ;
                    unset($model[$key]);
                }else{
                    continue;
                }
            }
            $timeList[$i] = date('Y-m-d',$startTime);
            $startTime += 60*60*24;
            $i++;
        }
        return ['dataList'=>$dataList,'timeList'=>$timeList];
    }

}