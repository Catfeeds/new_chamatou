<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/16
 * Time: 下午1:42
 */

namespace backend\module\statistics\models;

use backend\models\Shoper;

/**
 * 店铺统计逻辑代码
 * Class Store
 * @package backend\module\statistics\models
 */
class Store
{

    /**
     * 商铺总数
     * @var int
     */
    public static $storeSum = 0;

    /**
     * 一周店铺增加数量
     * @var int
     */
    public static $weekStoreUpSum = 0;

    /**
     * 一月店铺增加数量
     * @var int
     */
    public static $monthStoreUpSum = 0;
    /**
     * 逾期店铺增加数量
     * @var int
     */
    public static $overdueStoreUpSum = 0;

    /**
     * 获取商家总数
     * @return int
     */
    public static function getStoreSum()
    {
        self::$storeSum = (int)Shoper::find()->count();
        return self::$storeSum;
    }

    /**
     * 一周店铺增加数量
     * @return int
     */
    public static function getWeekStoreUpSum()
    {
        $time = time() - 60 * 60 * 24 * 7;
        self::$weekStoreUpSum = (int)Shoper::find()->andWhere(['>', 'add_time', $time])->count();
        return self::$weekStoreUpSum;
    }

    /**
     * 一月店铺增加数量
     * @return int
     */
    public static function getMonthStoreUpSum()
    {
        $time = time() - 60 * 60 * 24 * 30;
        self::$monthStoreUpSum = (int)Shoper::find()->andWhere(['>', 'add_time', $time])->count();
        return self::$monthStoreUpSum;
    }

    /**
     * 逾期店铺增加数量
     * @return int
     */
    public static function getOverdueStoreSum()
    {
        self::$overdueStoreUpSum = (int)Shoper::find()->andWhere(['status' => 1])->count();
        return self::$overdueStoreUpSum;
    }

    /**
     * 获取商家报表数据
     * @param $pn
     * @return array
     */
    public static function getStatistics($pn = [])
    {
        $time = [];
        if(empty($pn)){
            $time = Base::toGetTime();
        }
        $model = Shoper::find()->andWhere(['>', 'add_time', strtotime($time['startTime'])])
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