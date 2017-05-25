<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace  tea\controllers;

use dosamigos\qrcode\QrCode;

class QrcodeController extends ObjectController{

    /**
     * 生成店铺二维码
     */

    public function actionStore()
    {
        $url = "http://wx.chamatou.cn/index/index?shoper_id=".\Yii::$app->session->get('shoper_id')."&store_id=".\Yii::$app->session->get('store_id')."&type=qr";
        return QrCode::png($url);
    }
}