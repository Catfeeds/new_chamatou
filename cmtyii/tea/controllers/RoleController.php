<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace  tea\controllers;

use tea\models\RBAC;

class  RoleController extends ObjectController{

    public function actionInit()
    {
        return ['code'=>1,'msg'=>'ok','data'=>\Yii::$app->params['rbacInitList']];
    }

    public function actionGetRoles()
    {
        return ['code'=>1,'msg'=>'ok','data'=>RBAC::getPermissions()];
    }

}