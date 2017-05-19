<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace  tea\controllers;

use tea\models\Dosing;
use Yii;
use tea\models\Unit;

/**
 * 商品原料控制器
 * Class DosingController
 * @package tea\controllers
 */
class DosingController extends  ObjectController
{
    /**
     * 商品原料添加
     * @return array
     */
    public function actionAdd()
    {
        if (Yii::$app->request->isPost)
        {
            $dosing = new Dosing();
            $addRet = $dosing->add(Yii::$app->request->post());
            if($addRet){
                return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
            }
            $message = $dosing->getFirstErrors();
            $message = reset($message);

            return ['code'=>0,'msg'=>$message];
        }
    }

    /**
     * 商品原料修改
     * @return array
     */
    public function actionEdit()
    {
        if (Yii::$app->request->isPost)
        {
            $dosing = Dosing::findOne(Yii::$app->request->post('dosing_id'));
            if($dosing)
            {
                $addRet = $dosing->edit(Yii::$app->request->post());
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $dosing->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','dosing_id_exist')];
        }
    }

    /**
     * 商品原料删除
     * @return array
     */
    public function actionDel()
    {
        if (Yii::$app->request->isPost)
        {
            $dosing = Dosing::findOne(Yii::$app->request->post('dosing_id'));
            if($dosing)
            {
                $addRet = $dosing->del(Yii::$app->request->post());
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $dosing->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','dosing_id_exist')];
        }
    }

    /**
     * 获取所有原料单位
     * @return array
     */
    public function actionGetAll()
    {
        if(\Yii::$app->request->isGet)
        {
            $dosing = new Dosing();
            $data = $dosing->getAll();
            return ['code'=>1,'msg'=>\Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    public function actionGetAllPage()
    {
        if(\Yii::$app->request->isGet)
        {
            $dosing = new Dosing();
            $data = $dosing->getAllPage();
            return ['code'=>1,'msg'=>\Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    /**
     * 获取一个原料单位
     * @return array
     */
    public function actionGetOne()
    {
        if(\Yii::$app->request->isGet)
        {
            $dosing = Dosing::findOne(Yii::$app->request->get('dosing_id'));
            if($dosing)
            {
                $dosing->time = date("Y-m-d H:i:s",$dosing->time);
                return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$dosing];
            }
            return ['code'=>0,'msg'=>Yii::t('app','dosing_id_exist')];
        }
    }

}