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

class ObjectController extends Controller
{
    public function beforeAction($action)
    {

        $list = [
            'site/logout' => 1,
            'site/login' => 1,
        ];
        if (isset($list[$action->controller->route])) {
            return true;
        }

        if(empty(\Yii::$app->user->id))
        {
            return $this->redirect(['site/login']);
        }

        $roles = \Yii::$app->authManager->getPermissionsByUser(\Yii::$app->user->id);
        \Yii::$app->session->set('roles', $roles);
        if (\Yii::$app->user->can('/' . $action->controller->route)) {
            return true;
        }

        return $this->redirect(['/error/roles']);
    }
}