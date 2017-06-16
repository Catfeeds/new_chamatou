<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/6/15
 * Time: 16:13
 */

namespace tea\b2b\controllers;


use backend\models\Adv;
use tea\controllers\ObjectController;

class AdvController extends ObjectController
{

    /**
     * 获取广告列表
     * @return array
     */
    public function actionIndex()
    {
        $data = Adv::find()->select(['photo'])->asArray()->all();
        return ['code'=>1,'message'=>\Yii::t('app','global')['true'],'data'=>$data];
    }
}