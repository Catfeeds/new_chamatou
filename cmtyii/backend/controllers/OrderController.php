<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/28
 * Time: 16:27
 */

namespace backend\controllers;


use backend\models\Order;
use yii\base\Controller;
use yii\data\Pagination;
use yii\db\ActiveRecord;

/**
 * 订单的控制器
 * Class OrderController
 * @package backend\controllers
 */
class OrderController extends ObjectController
{

    /**
     * 订单列表
     * @return string
     */
    public function actionIndex()
    {
        $model = new Order();
        $res = $model->getList();
        return $this->render('index',[
            'data'=>$res['data'],
            'pager'=>$res['pager'],
        ]);
    }

    /**
     * 确认发货
     * @return array
     */
    public function actionSed()
    {
        \Yii::$app->response->format=\yii\web\Response::FORMAT_JSON;
        $data = \Yii::$app->request->get();
        $order = Order::findOne($data['order_id']);
        $order->status = 3;
        $order->express_no = $data['express_no'];
        $order->send_time = time();
        if($order->save()){
            $result = [
                'status' => 1,
                'msg'    => '操作成功!'
            ];
        }else{
            $result = [
                'status' => 0,
                'msg'    => '操作失败',
            ];
        }
        return $result;
    }

    /**
     * 订单导出
     */
    public function actionExcel()
    {
        $id = \Yii::$app->request->get('id');
        $data = Order::find()->where(['id'=>$id])->all();
       //var_dump($data[0]->goods);die;
        $data[0]->add_time = date('Y-m-d H:i:s',$data[0]->add_time);
        $data[0]->pay_time = date('Y-m-d H:i:s',$data[0]->pay_time);
        $data[0]->send_time = date('Y-m-d H:i:s',$data[0]->send_time);
        \moonland\phpexcel\Excel::export([
            'models'=>$data,
            'mode' => 'export',
            'fileName'=>$data[0]->order_no.'(发货单)',
            'columns' => [
                'order_no',
                'total_amount','add_time','pay_time','send_time','goods','phone','address','username'],
            'headers' => [
                'order_no' => '订单号',
                'add_time' => '下单时间',
                'phone' => '电话',
                'address' => '收货地址',
                'username' => '收货人',
                'total_amount' => '金额',
                'goods' => '商品',
                'pay_time' => '支付时间',
                'send_time'  => '发货时间'
            ],
        ]);
    }
}