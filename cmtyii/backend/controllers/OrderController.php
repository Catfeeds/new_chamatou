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

class OrderController extends Controller
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

    public function actionExcel()
    {
        $data = Order::findOne(1);
        \moonland\phpexcel\Excel::export([
            'models'=>$data,
            'fileName'=> '订单表',
            'columns' => ['order_no','phone','add_time','address','username'],
            'headers' => [
                'order_no' => '订单号',
                'add_time' => '下单时间',
                'phone' => '电话号码',
                'address' => '收货地址',
                'username' => '收货人',
            ],
        ]);
    }
}