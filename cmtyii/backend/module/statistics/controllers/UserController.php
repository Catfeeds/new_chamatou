<?php

namespace backend\module\statistics\controllers;

use backend\module\statistics\models\Base;
use backend\module\statistics\models\User;
use yii\web\Controller;

/**
 * Default controller for the `statistics` module
 */
class UserController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $data['number']['user'] = User::getUserSum();
        $data['number']['weekUser'] = User::getWeekUserUpSum();
        $data['number']['monthUser'] = User::getMonthUserUpSum();
        $data['number']['overdueUser'] = User::getOverdueUserSum();
        $data['statistics'] =User::getStatistics();
        $data['time'] = Base::toGetTime();
        return $this->render('index',['output'=>$data]);
    }
}
