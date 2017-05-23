<?php

/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/4
 * Time: 20:16
 */
namespace frontend\common;
use gmars\sms\Sms;

class SendSms
{
    public static function send($phone,$code){
        $params = \Yii::$app->params['sms'];
        $smsObj = new Sms($params['type'],['appkey'=>$params['ak'],'secretkey'=>$params['sk']]);
        $re  = $smsObj->send([
            'mobile' => $phone,
            'signname' => $params['signname'],
            'templatecode' => $params['templatecode'],
            'data' => [
                'code' =>$code,
                'time' => '100'
            ],
        ]);
        return $re;
    }
}