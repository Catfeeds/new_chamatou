<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/17
 * Time: 下午12:02
 */
namespace backend\module\statistics\models;

use backend\models\Order;

class B2b
{
    /**
     * 本月销售额
     * @var int
     */
    public static $monthSalesSumNum = 0;

    /**
     * 累计销售额
     * @var int
     */
    public static $salesSumNum = 0;

    /**
     * 商品总数量
     * @var int
     */
    public static $goodsSumNum = 0;

    /**
     * 商品分类数量
     * @var int
     */
    public static $categorySumNum = 0;

    /**
     * 获取本月销售额
     * @return int
     */
    public static function getMonthSalesSumNum()
    {
        $startTime = date('Y-m').'01 00:00:00';
        $startTime = strtotime($startTime);
        $orderModel = Order::find()->andWhere(['>','add_time',$startTime])
            ->andWhere(['!=','status',1])->select(['total_amount'])->asArray()->all();
        foreach ($orderModel as $key=>$value)
        {
            self::$monthSalesSumNum += $value['total_amount'];
        }
        return self::$monthSalesSumNum;
    }

    /**
     * 获取累计消费额度
     * @return int
     */
    public static function getSalesSumNum()
    {
        $startTime = date('Y-m').'01 00:00:00';
        $startTime = strtotime($startTime);
        $orderModel = Order::find()
            ->andWhere(['!=','status',1])->select(['total_amount'])->asArray()->all();
        foreach ($orderModel as $key=>$value)
        {
            self::$salesSumNum += $value['total_amount'];
        }
        return self::$salesSumNum;
    }


    public static function getGoodsSumNum()
    {

    }
}