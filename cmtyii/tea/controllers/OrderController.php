<?php

namespace tea\controllers;

use tea\models\Dosing;
use tea\models\Draw;
use tea\models\DrawCard;
use tea\models\Goods;
use tea\models\GoodsCate;
use tea\models\GoodsToDosing;
use tea\models\Order;
use tea\models\OrderGoods;
use tea\models\StorageInfo;
use tea\models\UsersForm;
use tea\models\Vip;
use tea\models\VipGrade;
use Yii;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

class  OrderController extends ObjectController
{

    /**
     * 订单商品取消操作方法
     * @return array
     */
    public function actionGoodsClose()
    {
        if (Yii::$app->request->isPost) {
            $orderOrderId = Yii::$app->request->post('order_id', '0');
            $orderGoodsId = Yii::$app->request->post('order_goods_id', '0');
            $model = OrderGoods::find()->where('order_id=:order_id and id =:id', [':order_id' => $orderOrderId, ':id' => $orderGoodsId])->one();
            /**
             * 入库操作！
             */
            $goods = Goods::findOne($model->goods_id);
            $stockType = $goods->getGoodsStockType($model->goods_id);

            if ($stockType == 'goods') {
                $data['type'] = $stockType;
                $data['id'] = $model->goods_id;
                $data['type'] = $stockType;
                $data['push_type'] = StorageInfo::STATUS_BACK_PUSH;
                $data['buy_price'] = $model['price'];
                $data['num'] = $model['num'];
                $data['note'] = '销售回退--系统生成';
                $storageInfo = new StorageInfo();
                $storageInfo->add($data);
            } elseif ($stockType == 'dosing') {
                $goodsToDosing = GoodsToDosing::getGoodsRelate($model->goods_id);
                foreach ($goodsToDosing as $keys => $values) {
                    $data['type'] = $stockType;
                    $data['id'] = $values['dosing_id'];
                    $data['type'] = $stockType;
                    $data['push_type'] = StorageInfo::STATUS_BACK_PUSH;
                    $data['buy_price'] = $model['price'];
                    $data['num'] = $model['num'] * $values['number'];
                    $data['note'] = '销售回退--系统生成';
                    $storageInfo = new StorageInfo();
                    $storageInfo->add($data);
                }
            }
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
            $orderOrderId = Yii::$app->request->post('order_id', '0');
            $orderGoodsId = Yii::$app->request->post('order_goods_id', '0');
            $model = OrderGoods::find()->where('order_id=:order_id and id =:id', [':order_id' => $orderOrderId, ':id' => $orderGoodsId])->one();
            if (!empty($model) && $model->is_give == 1) {
                $model->give = 1;
                $model->is_give = 0;
                $model->sum_price = 0.00;
                if ($model->save())
                    return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            }
            return ['code' => 0, 'msg' => Yii::t('app', 'global')['false']];
        }
    }

    /**
     * 获取一个会员资料
     * @return array
     */
    public function actionGetVipOne()
    {
        $model = Vip::getVipByPhone(Yii::$app->request->get('phone'), ['username', 'vip_amount', 'id','grade_id']);
        if ($model){
            $data   = ArrayHelper::toArray($model);
            $data['discount'] = VipGrade::getDiscount($model['grade_id']);
            return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'], 'data' => $data];
        }else
            return ['code' => 0, 'msg' => Yii::t('app', 'vip')['phone_null']];
    }

    /**
     * 获取折扣/优惠券的参数
     * @return array
     */
    public function actionPreferential()
    {
        $model = DrawCard::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
        ->andWhere(['store_id'=>Yii::$app->get('store_id')])
        ->andWhere(['sn'=>Yii::$app->request->get('sn')]);
        if(Yii::$app->request->get('type') == 2)
        {
            $model = $model->andWhere(['type'=>2])->one();
            if($model){
                return ['code'=>1,'msg'=>'成功','data'=>['discount'=>$model->number]];
            }
            return ['code'=>0,'msg'=>'不存在'];

            $model->end_time = time();
            $model->status = 1;
            if($model->save()){
                return ['code'=>1,'msg'=>'成功'];
            }
            $message = $model->getFirstErrors();
            $message = reset($message);
            return ['code'=>1,'msg'=>$message];
        }
        return ['code'=>0,'msg'=>'不存在'];
    }
    /**
     * 结算操作
     * @return array
     */
    public function actionPay()
    {
        if (Yii::$app->request->isPost) {
            $order = new Order();
            $ret = $order->endOrder(Yii::$app->request->post());
            if ($ret) {
                return ['code' => 1, 'msg' => '成功！'];
            }
            $message = $order->getFirstErrors();
            $message = reset($message);
            return ['code' => 0, 'msg' => $message];
        }
    }

    /**
     * 结算操作吧台消费
     * @return array
     */
    public function actionPaybtxf()
    {
        if (Yii::$app->request->isPost) {
            $data['table_id'] = 0;
            $data['start_time'] = date('Y-m-d H:i:s');
            $data['person'] = 0;
            $data['table_name'] = '吧台消费订单';
            $data['notes'] = '吧台消费订单';
            $data['staff_id'] = Yii::$app->session->get('tea_user_id');
            $data['shoper_id'] = Yii::$app->session->get('shoper_id');
            $data['store_id'] = Yii::$app->session->get('store_id');
            $data['start_time'] = time();
            $data['status'] = 1;
            $order = new Order();
            if ($order->load($data, '') && $order->validate()) {
                if ($order->save()) {
                    if ($order->addGoods(Yii::$app->session->get('btxfGoods'))) {
                        $param = Yii::$app->request->post();
                        $param['order_id'] = $order->id;
                        unset($order);
                        $order = new Order();
                        $ret = $order->endOrderBtxf($param);
                        if ($ret) {
                            return ['code' => 1, 'msg' => '成功！'];
                        }
                        $message = $order->getFirstErrors();
                        $message = reset($message);
                        return ['code' => 0, 'msg' => $message];
                    }
                }
                $message = $order->getFirstErrors();
                $message = reset($message);
                return ['code' => 0, 'msg' => $message];
            }


        }
    }

    /**
     * 吧台消费的订单
     * @return array
     */
    public function actionBtxf()
    {
        Yii::$app->session->set('btxfGoods',Yii::$app->request->post('goodsList'));
        return ['code' => 1, 'msg' => '成功！','data'=>['order_id'=>1]];

    }


}