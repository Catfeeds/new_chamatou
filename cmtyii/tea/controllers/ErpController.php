<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\controllers;

use moonland\phpexcel\Excel;
use tea\models\Dosing;
use tea\models\ErpLogic;
use tea\models\Goods;
use tea\models\Pandian;
use tea\models\Storage;
use tea\models\StorageInfo;
use tea\models\UsersForm;
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

    public function actionExcel()
    {
        $data = Yii::$app->request->get();

        if(Yii::$app->request->get('type') == 'push'){
            $mode = StorageInfo::find()
                ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                ->andWhere(['status' => StorageInfo::STATUS_PUSH])
                ->andWhere(['>', 'add_time', strtotime($data['start_time'])])
                ->andWhere(['<', 'add_time', strtotime($data['end_time'])])
                ->select(['id', 'users_id', 'goods_id', 'add_time', 'num', 'buy_price', 'note', 'type'])
                ->all();
        }elseif (Yii::$app->request->get('type')=='pop'){
            $mode = StorageInfo::find()
                ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                ->andWhere(['status' => StorageInfo::STATUS_POP])
                ->andWhere(['>', 'add_time', strtotime($data['start_time'])])
                ->andWhere(['<', 'add_time', strtotime($data['end_time'])])
                ->select(['id', 'users_id', 'goods_id', 'add_time', 'num', 'buy_price', 'note', 'type'])
                ->all();
        }else{
            return false;
        }


        $i = 1;
        foreach ($mode as $key=>$value)
        {
            $mode[$key]['id']   = $i++;
            $mode[$key]['add_time'] = date("Y-m-d H:i:s",$value->add_time);
            $mode[$key]['note']     = (string)$value['note'];
            $mode[$key]['users_id'] = UsersForm::getUserNameById($value->users_id);
            if($value['type'] == StorageInfo::TYPE_GOODS)
            {
                $mode[$key]['type'] = '商品';
                $mode[$key]['goods_id'] = (string)Goods::getGoodsNameById($value->goods_id);
            }elseif ($value['type'] == StorageInfo::TYPE_DOSING){
                $mode[$key]['type'] = '原料';
                $mode[$key]['goods_id'] = (string)Dosing::getDosingNameById($value->goods_id);
            }
        }

        Excel::export([
            'models' => $mode,
            'fileName' => date("Y-m-d",strtotime($data['start_time'] )). "--" . date("Y-m-d",strtotime($data['end_time'])).'-'.$data['type'],
            'columns' => ['id','goods_id','num', 'add_time', 'buy_price', 'type','note', 'users_id'],
            'headers' => [
                'id'=>'编号',
                'goods_id' => '商品名称',
                'users_id' => '操作员',
                'num' => '数量',
                'add_time' => '添加时间',
                'note' => '备注',
                'buy_price' => '价格',
                'type' => '类型',
            ]
        ]);
    }
}