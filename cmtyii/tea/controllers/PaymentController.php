<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\controllers;

use tea\models\PaymentSelect;

class PaymentController extends ObjectController
{
    /**
     * 支付种类设置
     * @return array
     */
    public function actionPaymentSelect()
    {
        if (\Yii::$app->request->isGet) {
            $paymentSelect = PaymentSelect::get();
            return ['code'=>1,'msg'=>"成功",'data'=>['paymentSelect'=>$paymentSelect]];
        }elseif(\Yii::$app->request->isPost){
            if (PaymentSelect::set(\Yii::$app->request->post('payment_select'))) {
                return ['code'=>1,'msg'=>'成功'];
            }
            return ['code'=>0,'msg'=>'未知错误！'];
        }
    }
}
