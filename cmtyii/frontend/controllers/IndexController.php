<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/5
 * Time: 13:03
 */

namespace frontend\controllers;

use frontend\models\User;

class IndexController extends BaseController
{
    public function init()
    {
        parent::init();
    }

    //用户访问就去请求授权接口
    public function actionIndex()
    {
        return \Yii::$app->wechat->authorizeRequired()->send();

    }

    //授权回调页面
    public function actionCallback()
    {
        $user = \Yii::$app->wechat->app->oauth->user();
        $openid = $user->getId();
        //获取用户信息
        $userinfo = User::find()->where("openid = '$openid'")->asArray()->one();
        //没有用户信息执行保存信息
        if(!$userinfo){
            $userModel = new User();//实例化用户对象
            $userModel->openid = $user->getId();//将用户openid复制给对象
            $userModel->photo = $user->getAvatar();//赋值头像地址
            $userModel->nickname = $user->getNickname();//赋值昵称
            $userModel->add_time = time();//赋值添加时间
            if(!$userModel->save(false)){
                echo "<script>alert('出错啦!!!')</script>";
                exit;
            }
            //保存成功后获取用户信息
            $userinfo = User::find()->where("openid = '$openid'")->asArray()->one();
        }
        //将用户信息保存到session中
        \Yii::$app->session->set('wx_user',$userinfo);
        //跳转到用户首页
        header("Location: http://test5.angkebrand.com/#/main/nearbyTea");
    }


}