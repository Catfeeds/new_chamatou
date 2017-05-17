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
        $url = "https://blog.lrdouble.com?id=".\Yii::$app->session->get('shoper_id');
        return QrCode::png($url);
    }
}