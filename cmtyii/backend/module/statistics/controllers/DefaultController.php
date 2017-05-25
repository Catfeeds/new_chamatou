<?php

namespace backend\module\statistics\controllers;

use backend\controllers\ObjectController;
use yii\web\Controller;

/**
 * Default controller for the `statistics` module
 */
class DefaultController extends ObjectController
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
