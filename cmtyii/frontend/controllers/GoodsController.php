<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/3
 * Time: 9:56
 */

namespace frontend\controllers;



use frontend\models\Consumption;
use frontend\models\Goods;
use frontend\models\User;
use tea\models\Table;

class GoodsController extends BaseController
{
    //扫码进入点单页面  商品列表
    public function actionIndex()
    {
        //  ids   需要的参数  商家id和店铺id
        $ids = \Yii::$app->request->get();
        \Yii::$app->session->set('shoper_id',$ids['shoper_id']);
        \Yii::$app->session->set('store_id',$ids['store_id']);
        $model =new Goods();
        $data = $model->getList($ids);
        return $data;
    }
    
    //扫码点单后提交商品  保存到对应的订单中
    public function actionOrder()
    {
        $data = \Yii::$app->request->post();
        //如果选择了茶豆币抵用 进行记录并扣除用户余额
//        if($data['beans'] > 0){
//            $model = new Consumption();
//            $re = $model->consumption($data['beans']);
//            if(!$re){
//                return ['status'=>0,'msg'=>'点单失败!'];
//            }
//            if(!(User::deduction($data['beans']))){
//                return ['status'=>0,'msg'=>'点单失败-->茶豆币未能扣除'];
//            }
//        }
        //调用茶坊端的台桌模型 查询对应的台桌对象
        $tableModel = Table::find()->where("table_name = :table_name and shoper_id = :shoper_id and store_id = :store_id",
            [':table_name'=>$data['table_no'],'shoper_id'=>\Yii::$app->session->get('shoper_id'),'store_id'=>\Yii::$app->session->get('store_id')])
            ->one();
        //通过调用台桌对象获取关联的订单对象
        $orderModel = $tableModel->getOrderAR();
        //如果为空 说明该台桌还没有开台
        if(!$orderModel){
            return ['status'=>0,'msg'=>'该台桌还未开台,请联系服务员开台!'];
        }
//        if($orderModel->addGoods($data['goodsList'])){
//            return ['status'=>1,'msg'=>'订单提交成功!'];
//        }
//        return ['status'=>0,'msg'=>$orderModel->getFirstErrors()];
    }
}