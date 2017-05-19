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
    /**
     * 商品搜索接口
     * @return array
     */
    public function actionSearch()
    {
        if (\Yii::$app->request->isGet) {
            $model = new Goods();
            $data = $model->search(\Yii::$app->request->get());
            return ['code' => 1, 'msg' => \Yii::t('app', 'global')['true'], 'data' => $data];
        }
    }

    /**
     * 获取一个商品的详细信息
     * @return array
     */
    public function actionInfoOne()
    {
        if (\Yii::$app->request->isGet) {
            $model = Goods::findOne(\Yii::$app->request->get('goods_id'));
            if ($model) {
                $data = $model->getOne(\Yii::$app->request->get('goods_id'));
                return ['code' => 1, 'msg' => \Yii::t('app', 'global')['true'], 'data' => $data];
            }
            return ['code' => 0, 'msg' => \Yii::t('app', 'b2b_goods_exist')];
        }
    }
}