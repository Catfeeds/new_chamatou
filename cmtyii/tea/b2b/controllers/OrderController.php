<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\b2b\controllers;

use tea\b2b\models\Cart;
use tea\b2b\models\Order;
use tea\models\Request;
use tea\models\TeaBeansConfig;
use Yii;
use tea\controllers\ObjectController;

/**
 * Class OrderController
 * @package tea\b2b\controllers
 */
class  OrderController extends ObjectController
{
    /**
     * 订单中心的列表
     * @return array
     */
    public function actionList()
    {
        if (Yii::$app->request->isGet) {
            $order = new Order();
            $data = $order->search(Yii::$app->request->get());
            return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'], 'data' => $data];
        }
    }

    /**
     * 获取最近购买
     * @return array
     */
    public function actionZjgm()
    {
        $order = new Order();
        $data = $order->getZuiJinGouMai();
        return ['code'=>1,'msg'=>'ok','data'=>$data];
    }
    /**
     * 获取订单信息、与保存订单
     * @return array
     */
    public function actionSaveOrder()
    {
        if (Yii::$app->request->isGet) {
            $cart_id = Yii::$app->request->get('cart_id', []);

            $cart = new Cart();
            $cart = $cart->getSaveOrderList($cart_id);
            $data['cart_list'] = $cart;
            $data['bili'] = TeaBeansConfig::getBili();
            return [
                'code' => 1,
                'msg' => Yii::t('app', 'global')['true'],
                'data' => $data
            ];
        } elseif (Yii::$app->request->isPost) {

            $order = new Order();
            $ret = $order->add(Yii::$app->request->post());
            if ($ret) {
                return [
                    'code' => 1,
                    'msg' => Yii::t('app', 'global')['true'],
                    'data' => $ret
                ];
            } else {
                $message = $order->getFirstErrors();
                $message = reset($message);
                return ['code' => 0, 'msg' => $message];
            }
        }
    }

    /**
     * 确认收货
     * @return array
     */
    public function actionSendOrder()
    {
        if (Yii::$app->request->isGet) {
            $order_id = Yii::$app->request->get('order_id');
            $orderModel = Order::findOne($order_id);
            if ($orderModel) {
                if ($orderModel->status == Order::STATUS_DAISOUHUO) {
                    $orderModel->status = Order::STATUS_YIWANCHENG;
                    $orderModel->pay_time = time();
                    if ($orderModel->save()) {
                        return ['code' => 1, 'msg' => '成功!'];
                    } else {
                        return ['code' => 0, 'msg' => '保存失败！'];
                    }
                } else {
                    return ['code' => 0, 'msg' => '订单状态不正确！'];
                }
            } else {
                return ['code' => 0, 'msg' => '订单不存在！'];
            }
        }
    }

    /**
     * 微信支付一个订单
     * @return array
     */
    public function actionPayOne()
    {
        if (Yii::$app->request->isGet) {
            $order_id = Yii::$app->request->get('order_id');
            $orderModel = Order::findOne($order_id);
            if ($orderModel) {

                $goods_price_surplus = $orderModel->cash_amout * 100;
                $wxPayConf = Yii::$app->params['wxPay'];
                $wxParam['appid'] = $wxPayConf['appid'];
                $wxParam['mch_id'] = $wxPayConf['mch_id'];
                $wxParam['nonce_str'] = md5($wxPayConf['appid']);
                $wxParam['body'] = '茶码头订单:' . $orderModel->order_no;
                $wxParam['out_trade_no'] = $orderModel->order_no;
                $wxParam['total_fee'] = $goods_price_surplus;
                $wxParam['spbill_create_ip'] = $wxPayConf['spbill_create_ip'];
                $wxParam['notify_url'] = $wxPayConf['notify_url'];
                $wxParam['trade_type'] = $wxPayConf['trade_type'];
                /* 算出sing */
                ksort($wxParam);
                $stringA = urldecode(http_build_query($wxParam));
                $stringSignTemp = "$stringA&key=" . $wxPayConf['api_key'];
                $wxParam['sign'] = strtoupper(md5($stringSignTemp));
                $wxRet = Request::request_post($wxPayConf['pay_url'], $wxParam);
                /* 解析返回的XML*/
                libxml_disable_entity_loader(true);
                $xmlstring = simplexml_load_string($wxRet, 'SimpleXMLElement', LIBXML_NOCDATA);
                $val = json_decode(json_encode($xmlstring), true);
                /* 判断是否正确 */
                if (isset($val['code_url'])) {
                    return ['code' => 1, 'msg' => 'OK', 'data' => ['wx_pay_url' => $val['code_url'], 'order_id' => $orderModel->Id]];
                } else {
                    return ['code' => 0, 'msg' => '微信获取拉取失败！', 'data' => $val];
                }
            } else {
                return ['code' => 0, 'msg' => '订单不存在'];
            }
        }
    }

    /**
     * 获取订单的支付状态
     * @return array
     */
    public function actionPayStatus()
    {
        if (Yii::$app->request->isGet) {
            $order_id = Yii::$app->request->get('order_id');
            $orderModel = Order::findOne($order_id);
            if ($orderModel) {
                if ($orderModel->status != Order::STATUS_DAIZHIFU) {
                    return ['code' => 1, 'msg' => '支付成功！'];
                } else {
                    return ['code' => 0, 'msg' => '支付失败！'];
                }
            } else {
                return ['code' => 0, 'msg' => '订单不存在!'];
            }
        }
    }

    /**
     * 微信回调函数
     */
    public function actionWxPayRet()
    {
        $wxRet = file_get_contents('php://input');
        libxml_disable_entity_loader(true);
        $xmlstring = simplexml_load_string($wxRet, 'SimpleXMLElement', LIBXML_NOCDATA);
        $val = json_decode(json_encode($xmlstring), true);
        if ($val['return_code'] == 'SUCCESS') {
            Yii::$app->cache->set('wxPay', $val);
            $order = Order::find()
                ->andWhere(['order_no' => $val['out_trade_no']])
                ->andWhere(['status' => Order::STATUS_DAIZHIFU])
                ->one();
            if ($order) {
                $order->status = Order::STATUS_DAIFAHUO;
                $order->pay_time = time();
                $order->save();
            }
        }
    }
}