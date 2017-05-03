<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/3
 * Time: 14:04
 */

namespace frontend\controllers;


use frontend\models\User;

class UserController extends BaseController
{

    /**
     * 用户茶豆币充值
     * @return array
     */
    public function actionRecharge()
    {
        $user = \Yii::$app->session->get('wx_user');
        //查出茶豆币的兑换比例
        $beans = \Yii::$app->db->createCommand("select scale from `t_tea_beans_config`")->queryColumn();
        $userModel = User::findOne(1);
        if(\Yii::$app->request->isPost){
            $userModel->beans += (\Yii::$app->request->post('money')*$beans[0]);
            if($userModel->save()){
                return ['status'=>1,'msg'=>'充值成功'];
            }else{
                return ['status'=>0,'msg'=>'充值失败'];
            }
        }
        return [
            'userBeans' => $userModel->beans,//用户茶豆币余额
            'beans'     => $beans[0],//茶豆币兑换比例  1元兑换多少茶豆币
        ];
    }
}