<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\b2b\controllers;

use tea\controllers\ObjectController;

/**
 * Default controller for the `b2b` module
 */
class DefaultController extends ObjectController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return ['code'=>1,'message'=>'hello b2b!'];
    }
}
