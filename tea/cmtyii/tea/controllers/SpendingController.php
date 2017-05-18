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
                $datas = ArrayHelper::toArray($order);
                $datas['goods_price_sum'] = 0;
                $datas['consume_time'] = Time::ToHour($datas['start_time'], $datas['end_time']);
                $datas['start_time'] = date('Y-m-d H:i:s', $datas['start_time']);
                $datas['end_time'] = date('Y-m-d H:i:s', $datas['end_time']);
                $datas['staff_id'] = UsersForm::getUserNameById($datas['staff_id']);
                $datas['sfk'] = $datas['total_amount'] - $datas['coupon_amount'];
                $datas['goods_list'] = $goods_list;
                $datas['merge_order']=$order->getMergeOrderAndGoods();
                $datas['father_order']=$order->getFatherOrderAndGoods();
                foreach ($goods_list as $key => $value) {
                    $datas['goods_price_sum'] = $datas['goods_price_sum'] + $value['sum_price'];
                }
                return ['code' => 1, 'msg' => '成功！', 'data' => $datas];
            }
            return ['code' => 0, 'msg' => '订单不存在！'];
        }
    }
}