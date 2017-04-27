<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\controllers;

use tea\models\ErpLogic;
use tea\models\Pandian;
use tea\models\Storage;
use tea\models\StorageInfo;
use Yii;

class ErpController extends ObjectController
{
    /**
     * 获取库存列表
     * @return array
     */
    public function actionGoodsList()
    {

        if(\Yii::$app->request->isGet)
        {
           $erp  = new ErpLogic();
           $data =  $erp->getListSearchPage(Yii::$app->request->get());
           return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
        }
    }

    /**
     * 入库一个商品
     * @return array
     */
    public function actionPushOne()
    {
        if(Yii::$app->request->isPost){
            $storageInfo = new StorageInfo();
            $data = $storageInfo->add(Yii::$app->request->post());
            if($data){
                return [
                    'code'=>1,
                    'msg'=>Yii::t('app','global')['true']
                ];
            }else{
                $message = $storageInfo->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
        }
    }


    /**
     * 多商品入库、并生成入库单
     * @return array
     */
    public function actionPushAll()
    {

        if(Yii::$app->request->isPost){
            $storage = new Storage();
            $data    = $storage->add(Yii::$app->request->post());
            if($data){
                return [
                    'code'=>1,
                    'msg'=>Yii::t('app','global')['true']
                ];
            }else{
                $message = $storage->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
        }
    }

    /**
     * 商品或原料入库记录
     * @return array
     */
    public function actionPushLog()
    {
        if(Yii::$app->request->isGet)
        {
            $storageInfo = new StorageInfo();
            $data = $storageInfo->getListPushPage(Yii::$app->request->get());
            return [
                'code'=>1,
                'msg'=>Yii::t('app','global')['true'],
                'data'=>$data
            ];
        }
    }

    /**
     * 获取出库单列表
     * @return array
     */
    public function actionPushDocuments()
    {
        if(Yii::$app->request->isGet)
        {
            $storage = new Storage();
            $data = $storage->getListPushPage(Yii::$app->request->get());
            return [
                'code'=>1,
                'msg'=>Yii::t('app','global')['true'],
                'data'=>$data
            ];
        }
    }

    /**
     * 单商品出库操作
     * @return array
     */
    public function actionPopOne()
    {
        if (Yii::$app->request->isPost)
        {
            $storageInfo = new StorageInfo();
            $data = $storageInfo->pop(Yii::$app->request->post());
            if($data){
                return [
                    'code'=>1,
                    'msg'=>Yii::t('app','global')['true']
                ];
            }else{
                $message = $storageInfo->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
        }
    }
    /**
     * 多商品入库、并生成入库单
     * @return array
     */
    public function actionPopAll()
    {

        if(Yii::$app->request->isPost){
            $storage = new Storage();
            $data    = $storage->pop(Yii::$app->request->post());
            if($data){
                return [
                    'code'=>1,
                    'msg'=>Yii::t('app','global')['true']
                ];
            }else{
                $message = $storage->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
        }
    }
    /**
     * 商品或原料入库记录
     * @return array
     */
    public function actionPopLog()
    {
        if(Yii::$app->request->isGet)
        {
            $storageInfo = new StorageInfo();
            $data = $storageInfo->getListPopPage(Yii::$app->request->get());
            return [
                'code'=>1,
                'msg'=>Yii::t('app','global')['true'],
                'data'=>$data
            ];
        }
    }

    /**
     * 获取出库单列表
     * @return array
     */
    public function actionPopDocuments()
    {
        if(Yii::$app->request->isGet)
        {
            $storage = new Storage();
            $data = $storage->getListPopPage(Yii::$app->request->get());
            return [
                'code'=>1,
                'msg'=>Yii::t('app','global')['true'],
                'data'=>$data
            ];
        }
    }

    /**
     * 初始化商品列表--商品入出库使用
     * @return array
     */
    public function actionInitPushGoods()
    {
        if(Yii::$app->request->isGet)
        {
            $erpLogic = new ErpLogic();
            $data     = $erpLogic->initPushGoodsPage(Yii::$app->request->get());
            return [
              'code'=>1,
              'msg' =>Yii::t('app','global')['true'],
              'data'=>$data
            ];
        }
    }

    /**
     * 商品原料盘存
     * @return array
     */
    public function actionPanDian()
    {
        if (Yii::$app->request->isPost) {
            $panDian = new Pandian();
            $ret = $panDian->add(Yii::$app->request->post());
            if ($ret) {
                return [
                    'code' => 1,
                    'msg' => Yii::t('app', 'global')['true']
                ];
            } else {
                $message = $panDian->getFirstErrors();
                $message = reset($message);
                return ['code' => 0, 'msg' => $message];
            }
        }
    }

    /**
     * 商品盘点列表
     * @return array
     */
    public function actionPanDianLog()
    {

        if(Yii::$app->request->isGet)
        {
            $panDian = new Pandian();
            $data = $panDian->getListPage(Yii::$app->request->get());
            return [
                'code'=>1,
                'msg'=>Yii::t('app','global')['true'],
                'data'=>$data
            ];
        }
    }

}