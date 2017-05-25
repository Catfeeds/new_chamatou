<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/24
 * Time: 下午12:17
 */
namespace backend\controllers;

use yii\helpers\ArrayHelper;
use yii\web\Controller;

class ErrorController extends Controller
{
    public function actionRoles()
    {
        return $this->render('roles');
    }
}