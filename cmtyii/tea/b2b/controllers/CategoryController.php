<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\b2b\controllers;

use tea\b2b\models\Cart;
use tea\b2b\models\GoodsCate;
use tea\controllers\ObjectController;
use Yii;

/**
 * 商品分类控制器
 * Class CategoryController
 * @package tea\b2b\controllers
 */
class  CategoryController extends ObjectController
{
    /**
     * 获取商品分类
     * @return array
     */
    public function actionIndex(){
        $model = new GoodsCate();
        $data  = $model->getList();
        return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$data];
    }

}