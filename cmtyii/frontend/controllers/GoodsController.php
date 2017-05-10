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
use tea\models\Order;
use tea\models\OrderGoods;
use tea\models\Table;

class GoodsController extends BaseController
{
    public $user_id = 1;
    public function beforeAction($action)
    {
        $user = \Yii::$app->session->get('wx_user');
        $this->user_id = $user['id'];
//        \Yii::$app->session->set('shoper_id',1);
//        \Yii::$app->session->set('store_id',29);
        return true;
    }

    //扫码进入点单页面  商品列表
    public function actionIndex()
    {
        //  ids   需要的参数  商家id和店铺id
        $ids = \Yii::$app->request->get();
        //将获得的id保存
        \Yii::$app->session->set('shoper_id',$ids['shoper_id']);
        \Yii::$app->session->set('store_id',$ids['store_id']);
        //实例化数据模型类  查出商家对应的商品数据
        $model = new Goods();
        $data  = $model->getList($ids);
        if($data){
            $result = ['status'=>1,'data'=>$data];
        }else{
            $result = ['status'=>0,'data'=>[]];
        }
        return $result;
    }
    
    //扫码点单后提交商品  保存到对应的订单中
    public function actionOrder()
    {
        //var_dump(\Yii::$app->session->get('shoper_id'));die;
        $data = \Yii::$app->request->post();
        //调用茶坊端的台桌模型 查询对应的台桌对象
        $tableModel = Table::find()->where("table_name = :table_name and shoper_id = :shoper_id and store_id = :store_id",
            [':table_name'=>$data['table_no'],
              'shoper_id'=>\Yii::$app->session->get('shoper_id'),
              'store_id'=>\Yii::$app->session->get('store_id')])
            ->one();
        //这里的桌号是用户输入的  存在输入错误的情况  所以要判断是否存在该台桌
        if(!$tableModel){
            return ['status'=>0,'msg'=>'台桌不存在!请检查桌号是否输入正确'];
        }
        //通过调用台桌对象获取关联的订单对象
       $orderModel = $tableModel->getOrderAR();
        //如果为空 说明该台桌还没有开台
        if(!$orderModel){
            return ['status'=>0,'msg'=>'该台桌还未开台,请联系服务员开台!'];
        }
        //如果选择了茶豆币抵用 进行记录并扣除用户余额
        if($data['beans'] > 0){
            $model = new Consumption();
            $re = $model->consumption($data['beans'],$this->user_id);
            if(!$re){
                return ['status'=>0,'msg'=>'点单失败'];
            }
            $orderModel->beans_amount = $data['beans'];
        }
        $orderModel->wx_user_id = $this->user_id;
        if(!$orderModel->save()){
            return ['status'=>0,'msg'=>'订单关联失败'];
        }
        //往订单中添加用户选择的商品
        if($orderModel->addGoods($data['goodsList'])){
            return ['status'=>1,'msg'=>'点单成功!','order_id'=>$orderModel->id];
        }
        return ['status'=>0,'msg'=>$orderModel->getFirstErrors()];
    }

}