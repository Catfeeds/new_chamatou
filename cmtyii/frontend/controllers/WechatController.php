<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/5
 * Time: 18:23
 */

namespace frontend\controllers;


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
    //初始化jssdk配置
    public function actionConfig()
    {
        $js = \Yii::$app->wechat->app->js;
        $js->setUrl("http://test5.angkebrand.com/");
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
}