<?php
namespace tea\controllers;

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
        return ['code'=>1,'msg'=>Yii::t('app','GLOBAL')];
    }

}
