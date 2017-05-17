<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */


namespace tea\b2b\controllers;

use tea\b2b\models\Goods;
use tea\controllers\ObjectController;

/**
 * Class GoodsController
 * @package tea\b2b\controllers
 */
class GoodsController extends ObjectController
{
    public function actionSearch()
    {
        if (\Yii::$app->request->isGet) {
            $model = new Goods();
            $data = $model->search(\Yii::$app->request->get());
            return ['code' => 1, 'msg' => \Yii::t('app', 'global')['true'], 'data' => $data];
        }
    }
}