<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/17
 * Time: 下午12:02
 */
namespace backend\module\statistics\models;

use backend\models\Goods;
use backend\models\GoodsCat;
use backend\models\Order;
use backend\models\Salesman;
use backend\models\Shoper;
use backend\models\SpStore;
use yii\data\Pagination;

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

    /**
     * 获取商品数量
     * @return int|string
     */
    public static function getGoodsSumNum()
    {
        self::$goodsSumNum = Goods::find()->count();
        return self::$goodsSumNum;
    }

    /**
     * 获取商品分类
     * @return int|string
     */
    public static function getCategorySumNum()
    {
        self::$categorySumNum = GoodsCat::find()->count();
        return self::$categorySumNum;
    }

    /**
     * 获取时间区间的营业额的数据
     * @param $pn
     * @return array
     */
    public static function getStatistics($pn = [])
    {
        $time = [];
        if(empty($pn)){
            $time = Base::toGetTime();
        }

        $model = Order::find()->andWhere(['>', 'add_time', strtotime($time['startTime'])])
            ->andWhere(['<', 'add_time', strtotime($time['endTime'])])
            ->andWhere(['!=','status',1])
            ->select(['add_time','total_amount'])->asArray()->all();
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

                    $dataList[$i]+=$value['total_amount'] ;
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

    /**
     * 获取商品消费列表
     * @return mixed
     */
    public static function getGoodsSales()
    {
        $goodsList = Goods::find();
        $count = $goodsList->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => 25]);

        #按价格由高到底
        if (\Yii::$app->request->get('sort') == 3) {
            $list = $goodsList->orderBy('sum_price DESC')->offset($pages->offset)->limit($pages->limit)->all();
        } elseif (\Yii::$app->request->get('sort') == 4) {
            #由价格由低到高
            $list = $goodsList->orderBy('sum_price ASC')->offset($pages->offset)->limit($pages->limit)->all();
        } elseif (\Yii::$app->request->get('sort') == 1) {
            #由销量由高到底排序
            $list = $goodsList->orderBy('sum_sell DESC')->offset($pages->offset)->limit($pages->limit)->all();
        } else {
            #由销量由底到高排序
            $list = $goodsList->orderBy('sum_sell ASC')->offset($pages->offset)->limit($pages->limit)->all();
        }

        $data['list'] = $list;
        $data['pages'] = $pages;
        return $data;
    }

    /**
     * 获取商家采购的列表
     * @return mixed
     */
    public static function getStoreBuy()
    {

        if(\Yii::$app->request->get('name','')){
            $salesman = Salesman::find()->andWhere(['username'=>\Yii::$app->request->get('name')])->one();
            if($salesman){
                $shoper = Shoper::find()->andWhere(['salesman_id'=>$salesman->id]);
            }else{
                $data['type'] = true;
                return $data;
            }
        }else{
            $shoper = Shoper::find();
        }
        $count = $shoper->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => 25]);

        #按价格由高到底
        if (\Yii::$app->request->get('sort') == 1) {
            $list = $shoper->orderBy('b2b_sum_price DESC')->offset($pages->offset)->limit($pages->limit)->asArray()->all();
        } elseif (\Yii::$app->request->get('sort') == 2) {
            #由价格由低到高
            $list = $shoper->orderBy('b2b_sum_price ASC')->offset($pages->offset)->limit($pages->limit)->asArray()->all();
        }else{
            $list = $shoper->orderBy('b2b_sum_price DESC')->offset($pages->offset)->limit($pages->limit)->asArray()->all();
        }

        foreach ($list as $key=>$value){
            $list[$key]['sp_name'] = SpStore::find()->andWhere(['shoper_id'=>$value['id']])->select(['sp_name'])->asArray()->one();
            $list[$key]['sp_name'] = $list[$key]['sp_name']['sp_name'];
            $list[$key]['salesman_id'] = Salesman::getUsernameById($value['salesman_id']);
        }

        $data['list'] = $list;
        $data['pages'] = $pages;
        return $data;
    }
}