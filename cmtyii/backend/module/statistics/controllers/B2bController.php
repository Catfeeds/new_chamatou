<?php

namespace backend\module\statistics\controllers;

use yii\web\Controller;

/**
 * Default controller for the `statistics` module
 */
class B2bController extends Controller
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}
