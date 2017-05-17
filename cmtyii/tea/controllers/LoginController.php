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

use tea\models\Users;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\Response;

class LoginController extends Controller
{

    public $enableCsrfValidation = false;

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'index' => ['post'],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $userFrom = Yii::$app->request->post();
        $loginModel = new Users();
        if ($loginModel->login($userFrom)) {
            return ['code' => 1, 'msg' => Yii::t('app', 'user')['loginTrue']];
        }
        $msg = $loginModel->getFirstErrors();
        return ['code' => 0, 'msg' =>reset($msg)];
    }
}