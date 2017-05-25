<?php

namespace backend\module\statistics\controllers;

use backend\controllers\ObjectController;
use backend\module\statistics\models\B2b;
use backend\module\statistics\models\Base;
use yii\web\Controller;

/**
 * Default controller for the `statistics` module
 */
class B2bController extends ObjectController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $data['number']['monthSalesSumNum'] = B2b::getMonthSalesSumNum();
        $data['number']['salesSumNum'] = B2b::getSalesSumNum();
        $data['number']['goodsSumNum'] = B2b::getGoodsSumNum();
        $data['number']['categorySumNum'] = B2b::getCategorySumNum();
        $data['statistics'] =B2b::getStatistics();
        $data['time'] = Base::toGetTime();
        return $this->render('index',['output'=>$data]);
    }

    /**
     * 获取商品销量的数据
     * @return string
     */
    public function actionGoods()
    {
        $list = B2b::getGoodsSales();
        return $this->render('goods',['output'=>$list]);
    }

    /**
     * 茶房端采购统计表报
     * @return string
     */
    public function actionStoreBuy()
    {
        $list = B2b::getStoreBuy();
        return $this->render('storeBuy',['output'=>$list]);
    }
}
