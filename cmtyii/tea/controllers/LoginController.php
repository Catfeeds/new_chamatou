<?php
/***********************************************************************
 * -  Copyright ©, 2017-2017，Lr double
 * -  File name : .php
 * -  Author : Lr double   Version: 1.0    Dete: 21:09
 * -  Description ：//用于处理茶坊端用户登录
 * -  Others :      //其他内容说明，
 * -  Function List ：//主要函数列表，每条记录包含函数名及功能简要说明
 * -  History ：//暂无修改记录
 ***********************************************************************/
namespace  tea\controllers;

use tea\models\RBAC;
use tea\models\Store;
use tea\models\Users;
use tea\models\UsersForm;
use Yii;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\Response;

class LoginController extends Controller
{

    public $enableCsrfValidation = false;



    /**
     * 用户登陆操作
     * @return array
     */
    public function actionIndex()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $userFrom = Yii::$app->request->post();
        $loginModel = new Users();
        if ($loginModel->login($userFrom)) {
            $role = RBAC::getPermissions();
            $info = Store::getThisUserToStoreInfo();
            $user = UsersForm::findOne(Yii::$app->session->get('tea_user_id'));
            $user = ArrayHelper::toArray($user);
            unset($user['password']);
            return ['code' => 1, 'msg' => Yii::t('app', 'user')['loginTrue'],'data'=>['role'=>$role,'store'=>$info,'user'=>$user]];
        }
        $msg = $loginModel->getFirstErrors();
        return ['code' => 0, 'msg' =>reset($msg)];
    }
}