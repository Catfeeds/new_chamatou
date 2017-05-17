<?php
namespace tea\controllers;

use tea\models\Goods;
use tea\models\GoodsCate;
use tea\models\OrderGoods;
use Yii;
use yii\data\Pagination;

class  OrderController extends ObjectController
{

    /**
     * 订单商品取消操作方法
     * @return array
     */
    public function actionGoodsClose()
    {
        if (Yii::$app->request->isPost) {
            $orderOrderId = Yii::$app->request->post('order_id','0');
            $orderGoodsId = Yii::$app->request->post('order_goods_id','0');
            $model = OrderGoods::find()->where('order_id=:order_id and id =:id',[':order_id' => $orderOrderId, ':id' => $orderGoodsId])->one();
            if (!empty($model) && $model->delete())
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            return ['code' => 0, 'msg' => Yii::t('app', 'global')['false']];
        }
    }

    /**
     * 订单商品转配操作方法
     * @return array
     */
    public function actionGoodsGiv()
    {
        if (Yii::$app->request->isPost) {
            $orderOrderId = Yii::$app->request->post('order_id','0');
            $orderGoodsId = Yii::$app->request->post('order_goods_id','0');
            $model = OrderGoods::find()->where('order_id=:order_id and id =:id',[':order_id' => $orderOrderId, ':id' => $orderGoodsId])->one();
            if (!empty($model) && $model->is_give == 1)
            {
                $model->give        =1;
                $model->is_give     =0;
                $model->sum_price   =0.00;
                if($model->save())
                    return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            }
            return ['code' => 0, 'msg' => Yii::t('app', 'global')['false']];
        }
    }



}