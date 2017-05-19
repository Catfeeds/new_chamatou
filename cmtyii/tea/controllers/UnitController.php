<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace  tea\controllers;

use Yii;
use tea\models\Unit;

class UnitController extends  ObjectController
{
    /**
     * 商品单位添加
     * @return array
     */
    public function actionAdd()
    {
        if (Yii::$app->request->isPost)
        {
            $unit = new Unit();
            $addRet = $unit->add(Yii::$app->request->post());
            if($addRet){
                return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
            }
            $message = $unit->getFirstErrors();
            $message = reset($message);

            return ['code'=>0,'msg'=>$message];
        }
    }

    /**
     * 商品单位修改
     * @return array
     */
    public function actionEdit()
    {
        if (Yii::$app->request->isPost)
        {
            $unit = Unit::findOne(Yii::$app->request->post('unit_id'));
            if($unit)
            {
                $addRet = $unit->edit(Yii::$app->request->post());
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $unit->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','unit_id_exist')];
        }
    }

    /**
     * 商品单位删除
     * @return array
     */
    public function actionDel()
    {
        if (Yii::$app->request->isPost)
        {
            $unit = Unit::findOne(Yii::$app->request->post('unit_id'));
            if($unit)
            {
                $addRet = $unit->del(Yii::$app->request->post());
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $unit->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','unit_id_exist')];
        }
    }

    /**
     * 获取所有商品单位
     * @return array
     */
    public function actionGetAll()
    {
        if(\Yii::$app->request->isGet)
        {
            $unit = new Unit();
            $data = $unit->getAll();
            return ['code'=>1,'msg'=>\Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    /**
     * 获取单位的一条数据
     * @return array
     */
    public function actionGetOne()
    {
        if(Yii::$app->request->isGet){
            $unit_id = Yii::$app->request->get('unit_id');
            if(empty($unit_id)){
                return ['code'=>0,'msg'=>Yii::t('app','model')['required']];
            }

            $data = Unit::findOne($unit_id);
            if(empty($data)){
                return ['code'=>1,'msg'=>Yii::t('app','unit_id_exist')];
            }

            $data->time = date('Y-m-d H:i:s',$data->time);
            return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
        }
    }
}