<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace  tea\controllers;

use dosamigos\qrcode\QrCode;
use kartik\helpers\Enum;
use tea\models\Shoper;
use tea\models\Store;

class QrcodeController extends ObjectController{

    /**
     * 生成店铺二维码
     */
    public function actionStore()
    {
        $url = "http://wx.chamatou.cn/index/index?shoper_id=".\Yii::$app->session->get('shoper_id')."&store_id=".\Yii::$app->session->get('store_id')."&type=qr";
        $fileNamePath = $this->getQRFileName();
        return QrCode::png($url,$fileNamePath,0,10,4,true);
    }

    /**
     * 二维码文件文件下载
     * @return $this
     */
    public function actionDownload()
    {
        $fileNamePath = $this->getQRFileName();
        return \Yii::$app->response->sendFile($fileNamePath);
    }

    /**
     * 获取二维码文件路径
     * @return string
     */
    private function getQRFileName()
    {
        return $filesNamePath = "updata/".\Yii::$app->session->get('shoper_id').".png";
    }
}