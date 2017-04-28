<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/28
 * Time: 16:27
 */

namespace backend\controllers;


use backend\models\Order;
use yii\base\Controller;use yii\db\ActiveRecord;

class OrderController extends Controller
{
    public function actionIndex()
    {
        $data = Order::find()->all();
        return $this->render('index',[
            'data'=>$data,
        ]);
    }
}