<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/5
 * Time: 18:23
 */

namespace frontend\controllers;


use EasyWeChat\Payment\Order;
use frontend\models\BeansConfig;
use frontend\models\Consumption;
use frontend\models\User;
use yii\web\Controller;
use yii\web\Response;
class WechatController extends Controller
{
    public $enableCsrfValidation = false;
    public function init()
    {
        parent::init();
        \Yii::$app->response->format = Response::FORMAT_JSON;
    }
    //初始化jssdk配置(签名)
    public function actionConfig()
    {
        $js = \Yii::$app->wechat->app->js;
        $js->setUrl("http://127.0.0.1.tunnel.qydev.com/wx/");
        $config = $js->config([
                'openLocation',
                'getLocation',
                'scanQRCode',
                'chooseWXPay'
            ]
            , $debug = false, $beta = false, $json = false);
        if($config){
            return ['status'=>1,'data'=>$config];
        }
        return ['status'=>0,'data'=>''];
    }


    //调用微信支付(下单流程获取支付调用接口所需参数)
    public function actionPay()
    {
        $openid = \Yii::$app->session->get('openid');
        $beans = BeansConfig::find()->asArray()->one();
        $re_beans = intval(\Yii::$app->request->get('money')) * $beans['scale'];
        $orderData = [
            'body'             => '茶豆币充值',
            'detail'           => '茶豆币充值',
            'out_trade_no'     => time(), // 这是自己ERP系统里的订单ID，不重复就行。
            'total_fee'        => $re_beans, // 金额，这里的8888分人民币。单位只能是分。
            //'notify_url'       => '', // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            'openid'           => $openid, // 这个不能少，少了要报错。
            'trade_type'       => 'JSAPI'
        ];
        $order = new Order($orderData);
        $payment = \Yii::$app->wechat->payment;
        $prepayRequest = $payment->prepare($order);
        if($prepayRequest->return_code = 'SUCCESS' && $prepayRequest->result_code == 'SUCCESS') {
            $prepayId = $prepayRequest->prepay_id;
        }else{
            return ['status'=>0,'msg'=>'支付异常,请稍后再试!'];
        }
        $jsApiConfig = $payment->configForPayment($prepayId);
        $jsApiConfig = json_decode($jsApiConfig,true);
        return [
            'status'  => 1,
            'jsApiConfig' => $jsApiConfig,
            'orderData'   => $orderData
        ];
    }


    //支付结果回调页
    public function actionNotify()
    {
         \Yii::$app->wechat->payment->handleNotify(function($notify, $successful) {
             // 用户是否支付成功
             if ($successful) {
                $transaction_id = \Yii::$app->cache->get('transaction_id');
                 if($transaction_id === false || $transaction_id != $notify->transaction_id){
                     $beans = BeansConfig::find()->asArray()->one();
                     $re_beans = ($notify->total_fee) * $beans["scale"];
                     $userModel = User::find()->where(['openid'=>$notify->openid])->one();
                     $userModel->beans += $re_beans;
                     if($userModel->save()){
                         $model = new Consumption();
                         $model->user_id = $userModel->id;
                         $model->num = $re_beans;
                         $model->type = 1;
                         $model->method = 1;
                         $model->add_time = time();
                         if($model->save()){
                             \Yii::$app->cache->set('transaction_id',$notify->transaction_id,2*3600);
                             return true;
                         }
                     }
                 }
             }
         });
    }

    //获取自定义菜单配置
//    public function actionMenu()
//    {
//       echo \Yii::$app->cache->get('no');
//        $transaction_id = \Yii::$app->cache->get('transaction_id');
//        var_dump($transaction_id);die;
//        $menu  =  \Yii::$app->wechat->app->menu;
//        $menus = $menu->current();
//        var_dump($menus);
//    }
}