<?php

namespace backend\module\statistics\controllers;

use backend\controllers\ObjectController;
use backend\module\statistics\models\Base;
use backend\module\statistics\models\Store;
use yii\web\Controller;

/**
 * Default controller for the `statistics` module
 */
class StoreController extends ObjectController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $data['number']['store'] = Store::getStoreSum();
        $data['number']['weekStore'] = Store::getWeekStoreUpSum();
        $data['number']['monthStore'] = Store::getMonthStoreUpSum();
        $data['number']['overdueStore'] = Store::getOverdueStoreSum();
        $data['statistics'] =Store::getStatistics();
        $data['time'] = Base::toGetTime();
        return $this->render('index',['output'=>$data]);
    }
}
