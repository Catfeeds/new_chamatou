<?php

namespace backend\module\statistics\controllers;

use backend\controllers\ObjectController;
use backend\module\statistics\models\Base;
use backend\module\statistics\models\Cdb;
use yii\web\Controller;

/**
 * Default controller for the `statistics` module
 */
class CdbController extends ObjectController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $data['number']['paySumNum'] = Cdb::getPaySumNum();
        $data['number']['storeWithdraw'] = Cdb::getStoreWithdraw();
        $data['number']['userCdbSumNum'] = Cdb::getCdbSumNum();
//        $data['number']['overdueUser'] = Cdb::getOverdueUserSum();
//        $data['statistics'] =Cdb::getStatistics();
        $data['time'] = Base::toGetTime();
        return $this->render('index',['output'=>$data]);
    }
}
