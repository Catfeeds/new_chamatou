<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\controllers;

use tea\models\Order;
use tea\models\Spending;
use tea\models\Time;
use tea\models\UsersForm;
use Yii;
use yii\helpers\ArrayHelper;

/**
 *
 * Class SpendingController
 * @package tea\controllers
 */
class SpendingController extends ObjectController
{
    /**
     * 获取消费单接口
     * @return array
     */
    public function actionList()
    {
        if (Yii::$app->request->isGet) {
            $model = new Spending();
            $data = $model->search(Yii::$app->request->get());
            return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'], 'data' => $data];
        }
    }

    /**
     * 获取一个消费单的详情
     * @return array
     */
    public function actionOne()
    {
        if (Yii::$app->request->isGet) {
            $order = Order::findOne(Yii::$app->request->get('id'));
            if ($order) {
                $goods_list = $order->getGoods();
                $orderArray = ArrayHelper::toArray($order);
                $orderArray['goods_price_sum'] = 0;
                $orderArray['consume_time'] = Time::ToHour($orderArray['start_time'], $orderArray['end_time']);
                $orderArray['start_time'] = date('Y-m-d H:i:s', $orderArray['start_time']);
                $orderArray['end_time'] = date('Y-m-d H:i:s', $orderArray['end_time']);
                $orderArray['staff_id'] = UsersForm::getUserNameById($orderArray['staff_id']);
                $orderArray['sfk'] = $orderArray['pay_amount'];
                $orderArray['goods_list'] = $goods_list;
                $orderArray['merge_order']=$order->getMergeOrderAndGoods();
                $orderArray['father_order']=$order->getFatherOrderAndGoods();
                foreach ($goods_list as $key => $goods) {
                    if($goods['is_discount'] == 1){
                        $goods['sum_price'] += $goods['discount_money'];
                    }
                    $orderArray['goods_price_sum'] = $orderArray['goods_price_sum'] + $goods['sum_price'];
                }
                return ['code' => 1, 'msg' => '成功！', 'data' => $orderArray];
            }
            return ['code' => 0, 'msg' => '订单不存在！'];
        }
    }
}