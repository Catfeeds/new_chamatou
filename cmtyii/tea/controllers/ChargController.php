<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\controllers;


use tea\models\ChargRule;

class ChargController extends  ObjectController
{
    /**
     * 创建一个收费类型
     * @return array
     */
    public function actionAdd()
    {
        if(\Yii::$app->request->isPost)
        {
            $charg = new ChargRule();
            if ($charg->create(\Yii::$app->request->post()))
            {
                return ['code'=>1,'msg'=>"成功！"];
            }
            $message = $charg->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
        return ['code'=>0,'msg'=>'请POST提交数据！'];
    }
}