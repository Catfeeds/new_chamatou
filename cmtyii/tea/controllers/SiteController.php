<?php
namespace tea\controllers;

use dosamigos\qrcode\QrCode;
use tea\models\RBAC;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\Response;


/**
 * Site controller
 */
class SiteController extends ObjectController
{

    /**
     * @inheritdoc
     */
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
    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $auth = Yii::$app->authManager;
        $test = $auth->getPermission('test');
        return ['code'=>1,'msg'=>Yii::t('app','GLOBAL')];
    }


    public function actionRbac()
    {
        return ['code'=>1,'msg'=>'ok','data'=>Yii::$app->params['loginInitRbacList']];
    }

    /**
     * 开始使用更新数据表权限
     */
    public function actionUpdateRole()
    {
        RBAC::initAuth();
        die('更新成功');
    }
}
