<?php

namespace tea\models;

use tea\models\Goods;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%sp_order}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $wx_user_id
 * @property integer $vip_user_id
 * @property integer $table_id
 * @property integer $staff_id
 * @property string $table_name
 * @property integer $status
 * @property string $table_amount
 * @property string $total_amount
 * @property string $cash_amout
 * @property string $beans_amount
 * @property integer $start_time
 * @property integer $end_time
 * @property double $discount
 * @property string $coupon_amount
 * @property string $merge_order_id
 * @property integer $person
 * @property string $notes
 * @property string $store_id
 * @property string $wx_pay
 * @property string $ali_pay
 * @property string $card_pay
 * @property int $is_exempt
 * @property int $user_id
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'wx_user_id', 'vip_user_id', 'table_id', 'status', 'start_time', 'end_time', 'person', 'is_exempt', 'merge_order_id', 'staff_id', 'store_id'], 'integer'],
            [['table_amount', 'total_amount', 'beans_amount',  'discount', 'coupon_amount', 'wx_pay', 'ali_pay', 'card_pay', 'cash_amout'], 'number'],
            [['table_name',], 'string', 'max' => 255],
            [['notes'], 'string', 'max' => 120],
            [['shoper_id', 'start_time', 'table_id', 'status'], 'required'],
            ['shoper_id', 'validateTableuse', 'on' => ['add']],
        ];
    }

    public function getStore($select)
    {
        return $this->hasOne(Store::className(),['id'=>'store_id'])->select($select)->asArray()->all();
    }
    /**
     * 获取所有关连订单
     */
    public function getMergeOrder()
    {
        return self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['merge_order_id' => $this->id])
            ->all();
    }

    /**
     * 获取所有关连订单和商品列表
     */
    public function getMergeOrderAndGoods()
    {
        $data = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['merge_order_id' => $this->id])
            ->all();
        $datas = ArrayHelper::toArray($data);
        foreach ($data as $key => $value) {
            $datas[$key]['goods_list'] = ArrayHelper::toArray($value->getGoods());
        }
        return $datas;
    }

    /**
     * 获取账单父账单
     * @return array
     */
    public function getFatherOrderAndGoods()
    {
        $data = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['id' => $this->merge_order_id])
            ->one();
        $datas = [];
        if ($data) {
            $datas[0] = ArrayHelper::toArray($data);
            $datas[0]['goods_list'] = ArrayHelper::toArray($data->getGoods());
        }
        return $datas;
    }

    /**
     * 判断台座是否可以操作
     * @param $attribute
     * @param $params
     * @return bool
     */
    public function validateTableuse($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $tableModel = Table::findOne($this->table_id);
            if (!$tableModel)
                return $this->addError($attribute, Yii::t('app', 'book_table_null'));
            if ($tableModel->getOrderAR())
                return $this->addError($attribute, Yii::t('app', 'book_table_not_null'));

            $cate_name = $tableModel->getTableType(['cate_name']);
            $this->table_name = reset($cate_name) . '--' . $tableModel->table_name;
        }
    }

    /**
     * 获取订单的商品
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getGoods($select = [])
    {
        $data = $this->hasMany(OrderGoods::className(), ['order_id' => 'id'])->select($select)->asArray()->all();
        foreach ($data as $key=>$val){
            $data[$key]['add_time'] = date('Y-m-d H:i:s',$val['add_time']);
        }
        return $data;
    }

    /**
     * 获取商品的价格和
     */
    public function getGoodsSumPrice()
    {
        $data = $this->getGoods();
        $sumPrice = 0;
        foreach ($data as $key => $value)
            $sumPrice += $value['sum_price'];
        return $sumPrice;
    }

    /**
     * 获取订单的商品
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getGoodsAR($select = [])
    {
        return $this->hasMany(OrderGoods::className(), ['order_id' => 'id'])->select($select)->all();
    }

    /**
     * 订单生成方法
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $data['shoper_id'] = Yii::$app->session->get('shoper_id');
        $data['store_id'] = Yii::$app->session->get('store_id');
        $data['start_time'] = time();
        $data['status'] = 1;
        $this->scenario = 'add';
        if ($this->load($data, '') && $this->save()) {
            return true;
        }
        return false;
    }

    /**
     * 添加商品操作
     * @param $data
     * @return bool
     */
    public function addGoods($data)
    {
        $transaction = Yii::$app->db->beginTransaction();
        try{

            $goodsID = [];
            $goodsNum = [];
            if(isset($data['type']))
            {
                $type = $data['type'];
                unset($data['type']);
            }else{
                $type = 1;
            }

            foreach ($data as $key => $value) {
                $goodsID[] = $value['id'];
                $goodsNum[$value['id']] = $value['count'];
            }

            $goodsList = Goods::find()->where([
                'and', 'shoper_id =' . Yii::$app->session->get('shoper_id'), ['in', 'id', $goodsID]])->all();


            foreach ($goodsList as $key => $value) {
                /**
                 * 出库操作！
                 */
                $stockType = $value->getGoodsStockType($value['id']);
                if($stockType == 'goods'){
                    $data['type'] = $stockType;
                    $data['id'] = $value['id'];
                    $data['type'] = $stockType;
                    $data['pop_type'] = 3;
                    $data['buy_price'] = $value['sales_price'];
                    $data['num'] = $goodsNum[$value['id']];
                    $data['note'] = '销售出库--系统生成';
                    $storageInfo = new StorageInfo();
                    if(!$storageInfo->pop($data)){
                        throw new \Exception('storageInfo error');
                    }
                }elseif ($stockType == 'dosing'){
                    $goodsToDosing = GoodsToDosing::getGoodsRelate($value['id']);
                    foreach ($goodsToDosing as $keys=>$values)
                    {
                        $data['type'] = $stockType;
                        $data['id'] = $values['dosing_id'];
                        $data['type'] = $stockType;
                        $data['pop_type'] = 3;
                        $data['buy_price'] = $value['sales_price'];
                        $data['num'] = $values['number'] * $goodsNum[$value['id']];
                        $data['note'] = '销售出库--系统生成';
                        $storageInfo = new StorageInfo();
                        if (!$storageInfo->pop($data)) {
                            throw new \Exception('storageInfo error');
                        }
                    }
                }
                $orderGoods = new OrderGoods();
                $orderGoods->order_id = $this->id;
                $orderGoods->goods_name = $value['goods_name'];
                $orderGoods->goods_id = $value['id'];
                $orderGoods->goods_name = $value['goods_name'];
                $orderGoods->shoper_id = Yii::$app->session->get('shoper_id');
                $orderGoods->store_id = Yii::$app->session->get('store_id');
                $orderGoods->price = $value['sales_price'];
                $orderGoods->spec = $value['unit'];
                $orderGoods->note = $value['note'];
                $orderGoods->num = $goodsNum[$value['id']];
                $orderGoods->give = 0;
                $orderGoods->is_give = $value['give'];
                $orderGoods->sum_price = ($orderGoods->num * $orderGoods->price);
                $orderGoods->add_time = time();
                $orderGoods->is_goods = 1;
                $orderGoods->type = $type;
                if (!$orderGoods->save()){
                    throw new \Exception('orderGoods保存失败！');
                }
            }

            $transaction->commit();
            return true;
        }catch (\Exception $exception){
            $this->addError('id', $exception->getMessage());
            $transaction->rollBack();
            return false;
        }
    }

    /**
     * 订单结算操作
     * @param $param
     * @return bool
     */
    public function endOrder($param)
    {
        $use_phone = isset($param['vip_phone']) ? $param['vip_phone'] : '';
        $money_pay = isset($param['pay'][5]['money_pay']['money_pay_num']) ? $param['pay'][5]['money_pay']['money_pay_num'] : 0;//现金支付
        $card_pay = isset($param['pay'][4]['card_pay']['card_pay_num']) ? $param['pay'][4]['card_pay']['card_pay_num'] : 0;//刷卡支付
        $ali_pay = isset($param['pay'][0]['ali_pay']['ali_pay_num']) ? $param['pay'][0]['ali_pay']['ali_pay_num'] : 0;//支付宝支付
        $wx_pay = isset($param['pay'][1]['wx_pay']['wx_pay_num']) ? $param['pay'][1]['wx_pay']['wx_pay_num'] : 0;//微信支付
        $vip_pay = isset($param['pay'][2]['vip_pay']['vip_pay_num']) ? $param['pay'][2]['vip_pay']['vip_pay_num'] : 0;//会员卡支付
        $preferential = isset($param['pay'][3]['preferential']['preferential_num']) ? $param['pay'][3]['preferential']['preferential_num'] : 0;//手动优惠
        $pay_num = $money_pay + $card_pay + $ali_pay + $wx_pay + $vip_pay + $preferential;
        /**
         * 判断台座订单是否存在
         */
        $transaction = Yii::$app->db->beginTransaction();
        try {

            $model = Table::findOne($param['table_id']);
            if ($model) {
                /**
                 * 算出订单总额
                 */
                $order_num = 0;

                $data = $model->getOrderAndGoods();
                $data['merge_order'] = $model->getMergeOrder($data['id']);
                $order_num += $data['table_amount'];
                $order_num += $data['total_amount'];
                foreach ($data['merge_order'] as $key => $value) {
                    $data['beans_amount'] += $value['beans_amount'];
                    $order_num += $value['total_amount'];
                }
                $zhuOrder = self::findOne($data['id']);
                $zhuOrder->total_amount += $order_num;
                $order_num -= $data['beans_amount'];
                /**
                 * 茶豆币操作
                 */
                $shoperBeans = Shoper::findOne(Yii::$app->session->get('shoper_id'));
                $shoperBeans->withdraw_total = $shoperBeans->withdraw_total + $data['beans_amount'];
                $shoperBeans->beans_incom = $shoperBeans->beans_incom + $data['beans_amount'];
                if(!$shoperBeans->save()){
                    throw new \Exception('茶豆币保存失败！');
                }
                /**
                 * 判断是否使用免单功能！
                 */
                if ($param['is_exempt'] == 1) {
                    $zhuOrder->status = 2;
                    $zhuOrder->table_amount = $data['table_amount'] ;
                    $zhuOrder->cash_amout = 0;
                    $zhuOrder->end_time = time();
                    $zhuOrder->discount = 0;
                    $zhuOrder->coupon_amount = 0;
                    $zhuOrder->wx_pay = 0;
                    $zhuOrder->ali_pay = 0;
                    $zhuOrder->card_pay = 0;
                    $zhuOrder->is_exempt = 1;
                    $zhuOrder->user_id = Yii::$app->session->get('tea_user_id');

                    if (!$zhuOrder->save()) {
                        var_dump($zhuOrder->getFirstErrors());
                        throw new \Exception('订单保存失败！1');
                    }
                    foreach ($data['merge_order'] as $key => $value) {
                        $fuOrder = self::findOne($value['id']);
                        $fuOrder->status = 2;
                        $fuOrder->end_time = time();
                        $fuOrder->is_exempt = 1;
                        if (!$fuOrder->save()) {
                            throw new \Exception('订单保存失败！');
                        }
                    }
                    $transaction->commit();
                    return true;
                }

                /**
                 * 判断是否使用会员卡支付支付
                 */
                if ($use_phone && $vip_pay != 0) {
                    $vip = Vip::getVipByPhone($use_phone);
                    if ($vip) {
                        if ($vip->vip_amount < $vip_pay) {
                            throw new \Exception('会员卡余额不足！');
                        }
                        /**
                         * 减少会员余额
                         */
                        $vip->vip_amount -= $vip_pay;
                        $zhuOrder->vip_user_id = $vip->id;
                        if (!$vip->save()) {
                            throw  new \Exception('会员余额减少失败！请稍后再试！');
                        }
                    } else {
                        throw new \Exception('会员不存在！');
                    }
                }
                if ($order_num <= $pay_num) {
                    $zhuOrder->status = 2;
                    $zhuOrder->table_amount = $data['table_amount'];
                    $zhuOrder->cash_amout = $money_pay;
                    $zhuOrder->end_time = time();
                    $zhuOrder->discount = $vip_pay;
                    $zhuOrder->coupon_amount = $preferential;
                    $zhuOrder->wx_pay = $wx_pay;
                    $zhuOrder->ali_pay = $ali_pay;
                    $zhuOrder->card_pay = $card_pay;
                    $zhuOrder->user_id = Yii::$app->session->get('tea_user_id');
                    if (!$zhuOrder->save()) {
                        throw new \Exception('订单保存失败！');
                    }
                    foreach ($data['merge_order'] as $key => $value) {
                        $fuOrder = self::findOne($value['id']);
                        $fuOrder->end_time = time();
                        $fuOrder->status = 2;
                        if (!$fuOrder->save()) {
                            throw new \Exception('订单保存失败！');
                        }
                    }
                    $transaction->commit();
                    return true;
                } else {
                    throw new \Exception('支付金额不足！');
                }
            } else {
                $this->addError('id', '台座不存在');
                return false;
            }
        } catch (\Exception $exception) {
            $this->addError('id', $exception->getMessage());
            $transaction->rollBack();
            return false;
        }
    }
    /**
     * 订单结算操作
     * @param $param
     * @return bool
     */
    public function endOrderBtxf($param)
    {
        $use_phone = isset($param['vip_phone']) ? $param['vip_phone'] : '';
        $money_pay = isset($param['pay'][5]['money_pay']['money_pay_num']) ? $param['pay'][5]['money_pay']['money_pay_num'] : 0;//现金支付
        $card_pay = isset($param['pay'][4]['card_pay']['card_pay_num']) ? $param['pay'][4]['card_pay']['card_pay_num'] : 0;//刷卡支付
        $ali_pay = isset($param['pay'][0]['ali_pay']['ali_pay_num']) ? $param['pay'][0]['ali_pay']['ali_pay_num'] : 0;//支付宝支付
        $wx_pay = isset($param['pay'][1]['wx_pay']['wx_pay_num']) ? $param['pay'][1]['wx_pay']['wx_pay_num'] : 0;//微信支付
        $vip_pay = isset($param['pay'][2]['vip_pay']['vip_pay_num']) ? $param['pay'][2]['vip_pay']['vip_pay_num'] : 0;//会员卡支付
        $preferential = isset($param['pay'][3]['preferential']['preferential_num']) ? $param['pay'][3]['preferential']['preferential_num'] : 0;//手动优惠
        $pay_num = $money_pay + $card_pay + $ali_pay + $wx_pay + $vip_pay + $preferential;
        /**
         * 判断台座订单是否存在
         */
        $transaction = Yii::$app->db->beginTransaction();
        try {

            $model = self::findOne($param['order_id']);
            if ($model) {
                /**
                 * 算出订单总额
                 */
                $order_num = 0;

                $data = ArrayHelper::toArray($model);
                $data['goodsList'] = $model->getGoods();
                foreach ($data['goodsList'] as $key=>$value){
                    $data['total_amount']=$value['sum_price'];
                }
                $data['merge_order'] = [];
                $order_num += $data['table_amount'];
                $order_num += $data['total_amount'];
                foreach ($data['merge_order'] as $key => $value) {
                    $data['beans_amount'] += $value['beans_amount'];
                    $order_num += $value['total_amount'];
                }
                $zhuOrder = self::findOne($data['id']);
                $order_num -= $data['beans_amount'];

                /**
                 * 茶豆币操作
                 */
                $shoperBeans = Shoper::findOne(Yii::$app->session->get('shoper_id'));
                $shoperBeans->withdraw_total = $shoperBeans->withdraw_total + $data['beans_amount'];
                $shoperBeans->beans_incom = $shoperBeans->beans_incom + $data['beans_amount'];
                if(!$shoperBeans->save()){
                    throw new \Exception('茶豆币保存失败！');
                }
                /**
                 * 判断是否使用免单功能！
                 */
                if ($param['is_exempt'] == 1) {
                    $zhuOrder->status = 2;
                    $zhuOrder->table_amount = $data['table_amount'];
                    $zhuOrder->total_amount = $data['total_amount'] + $data['table_amount'];
                    $zhuOrder->cash_amout = 0;
                    $zhuOrder->end_time = time();
                    $zhuOrder->discount = 0;
                    $zhuOrder->coupon_amount = 0;
                    $zhuOrder->wx_pay = 0;
                    $zhuOrder->ali_pay = 0;
                    $zhuOrder->card_pay = 0;
                    $zhuOrder->is_exempt = 1;
                    $zhuOrder->user_id = Yii::$app->session->get('tea_user_id');
                    if (!$zhuOrder->save()) {
                        throw new \Exception('订单保存失败！1');
                    }
                    foreach ($data['merge_order'] as $key => $value) {
                        $fuOrder = self::findOne($value['id']);
                        $fuOrder->status = 2;
                        $fuOrder->is_exempt = 1;
                        if (!$fuOrder->save()) {
                            throw new \Exception('订单保存失败！');
                        }
                    }
                    $transaction->commit();
                    return true;
                }

                /**
                 * 判断是否使用会员卡支付支付
                 */
                if ($use_phone && $vip_pay != 0) {
                    $vip = Vip::getVipByPhone($use_phone);
                    if ($vip) {
                        if ($vip->vip_amount < $vip_pay) {
                            throw new \Exception('会员卡余额不足！');
                        }
                        /**
                         * 减少会员余额
                         */
                        $vip->vip_amount -= $vip_pay;
                        $zhuOrder->vip_user_id = $vip->id;
                        if (!$vip->save()) {
                            throw  new \Exception('会员余额减少失败！请稍后再试！');
                        }
                    } else {
                        throw new \Exception('会员不存在！');
                    }
                }
                if ($order_num <= $pay_num) {
                    $zhuOrder->status = 2;
                    $zhuOrder->table_amount = $data['table_amount'];
                    $zhuOrder->total_amount = $data['total_amount'] + $data['table_amount'];
                    $zhuOrder->cash_amout = $money_pay;
                    $zhuOrder->end_time = time();
                    $zhuOrder->discount = $vip_pay;
                    $zhuOrder->coupon_amount = $preferential;
                    $zhuOrder->wx_pay = $wx_pay;
                    $zhuOrder->ali_pay = $ali_pay;
                    $zhuOrder->card_pay = $card_pay;
                    $zhuOrder->user_id = Yii::$app->session->get('tea_user_id');
                    if (!$zhuOrder->save()) {
                        throw new \Exception('订单保存失败！');
                    }
                    foreach ($data['merge_order'] as $key => $value) {
                        $fuOrder = self::findOne($value['id']);
                        $fuOrder->status = 2;
                        if (!$fuOrder->save()) {
                            throw new \Exception('订单保存失败！');
                        }
                    }
                    $transaction->commit();
                    return true;
                } else {
                    throw new \Exception('支付金额不足！');
                }
            } else {
                $this->addError('id', '台座不存在');
                return false;
            }
        } catch (\Exception $exception) {
            $this->addError('id', $exception->getMessage());
            $transaction->rollBack();
            return false;
        }
    }

    /**
     * 算出合并时间
     * @param $strat_time
     * @return float|int
     */
    public function redyTableAmount($strat_time)
    {
        $table = Table::findOne($this->table_id);
        return $table->redyTableAmount($strat_time);
    }



}
