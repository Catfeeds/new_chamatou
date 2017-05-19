<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\b2b\models;

use tea\models\CreditConsume;
use tea\models\Request;
use tea\models\Shoper;
use tea\models\ShoperTeabeansLog;
use tea\models\TeaBeansConfig;
use Yii;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%order}}".
 *
 * @property integer $Id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $order_no
 * @property integer $add_time
 * @property integer $status
 * @property string $username
 * @property string $address
 * @property string $phone
 * @property integer $pay_time
 * @property integer $send_time
 * @property integer $get_time
 * @property string $express_no
 * @property integer $express_id
 * @property string $total_amount
 * @property string $credtit_amout
 * @property string $cash_amout
 * @property string $beans_amount
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * 代支付
     */
    const STATUS_DAIZHIFU = 1;
    /**
     * 代发货
     */
    const STATUS_DAIFAHUO = 2;
    /**
     * 代收货
     */
    const STATUS_DAISOUHUO = 3;
    /**
     * 已完成
     */
    const STATUS_YIWANCHENG = 4;

    /**
     * 微信支付
     */
    const PAY_TYPE_WXPAY = 1;

    /**
     * 授信支付
     */
    const PAY_TYPE_SHOUXING = 2;

    /**
     * 茶豆币
     */
    const PAY_TYPE_CHADOUBI = 3;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'add_time', 'status', 'pay_time', 'send_time', 'get_time', 'express_id'], 'integer'],
            [['total_amount', 'credtit_amout', 'beans_amount', 'cash_amout'], 'number'],
            [['order_no', 'express_no'], 'string', 'max' => 32],
            [['username'], 'string', 'max' => 10],
            [['address',], 'string', 'max' => 255],
            [['phone'], 'string', 'max' => 15],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'store_id' => 'store_id',
            'shoper_id' => 'Shoper ID',
            'order_no' => 'Order No',
            'add_time' => 'Add Time',
            'status' => 'Status',
            'username' => 'Username',
            'address' => 'Address',
            'phone' => 'Phone',
            'pay_time' => 'Pay Time',
            'send_time' => 'Send Time',
            'get_time' => 'Get Time',
            'express_no' => 'Express No',
            'express_id' => 'Express ID',
            'total_amount' => 'Total Amount',
            'credtit_amout' => 'Credtit Amout',
            'cash_amout' => 'Cash Amout',
            'beans_amount' => 'Beans Amount',
        ];
    }

    /**
     * 获取订单的星期
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getOrderGoodsAR($select = [])
    {
        return $this->hasMany(OrderGoods::className(), ['order_id' => 'Id'])->select($select)->all();
    }

    /**
     *
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $data['cdb'] = $data['pay'][0]['num'];
        if ($data['pay'][1]['shouxin'] == 1) {
            $data['pay_type'] = Order::PAY_TYPE_SHOUXING;
        } elseif ($data['pay'][2]['zaixian'] == 1) {
            $data['pay_type'] = Order::PAY_TYPE_WXPAY;
        } else {
            $data['pay_type'] = Order::PAY_TYPE_CHADOUBI;
        }
        $transaction = Yii::$app->db->beginTransaction();
        try {
            /**
             * 判断茶豆币是否足够
             */
            $shoper = Shoper::findOne(Yii::$app->session->get('shoper_id'));
            if ($shoper->withdraw_total < $data['cdb']) {
                throw new \Exception(Yii::t('app', 'withdraw_total_not'));
            }
            /**
             * 获取订单列表
             */
            $cart_list = new Cart();
            $cart_list = $cart_list->getSaveOrderList($data['cart_id']);
            if (!$cart_list) {
                throw new \Exception('参数发生错误！请别重新提交');
            }
            $address = Address::findOne($data['address_id']);
            if (!$address) {
                throw new \Exception('收货地址不正确');
            }

            /*
             * 1。算出订单的总价格
             * 2。减少商品的库存
             * 3。删除购物车的值
             * */
            $goods_price = 0;
            foreach ($cart_list as $key => $value) {
                $count = $value['goods_num'] * $value['goods_info']['price'];
                $goods_price += $count;


                /* 减去库存 */
                $goodsNoeModel = Goods::findOne($value['goods_info']['Id']);

                if ($goodsNoeModel->status == Goods::STATUS_UNDERCARRIAGE) {
                    throw  new \Exception($goodsNoeModel->goods_name . '已下架!');
                }

                $goodsNoeModel->store -= $value['goods_num'];
                $goodsNoeModel->sum_sell += $value['goods_num'];
                $goodsNoeModel->sum_price = (int)$goodsNoeModel->sum_price + $count;
                if ($goodsNoeModel->store < 0) {
                    throw  new \Exception($goodsNoeModel->goods_name . '库存不足!');
                }
                if (!$goodsNoeModel->save()) {
                    throw  new \Exception($goodsNoeModel->goods_name . '库存操作失败!');
                }
                /* 删除购物车中的值 */
                $cartOneModel = Cart::findOne($value['Id']);
                if (!$cartOneModel->del()) {
                    $message = $cartOneModel->getFirstErrors();
                    $message = reset($message);
                    throw  new \Exception($message);
                }
            }
            /**
             * 算出茶豆币比例
             */
            $cbili = TeaBeansConfig::getBili();
            $cdb_price = ($data['cdb'] * $cbili);
            /**
             * 算出茶豆币使用了多少
             */
            $goods_price_surplus = $goods_price - $cdb_price;
            $goods_price_surplus = sprintf('%.2f', $goods_price_surplus);
            $wx_goods_price_surplus = $goods_price_surplus * 100;

            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            $this->order_no = ('TEA' . time() . rand(0, 999999) . $this->shoper_id);
            $this->add_time = time();
            $this->status = Order::STATUS_DAIFAHUO;
            $this->username = $address->username;
            $this->address = $address->province . $address->city . $address->district . $address->address;
            $this->phone = $address->phone;
            $this->pay_time = time();
            $this->total_amount = $goods_price;

            /**
             * 更新商家表中的累计购买金额
             */

            $shoperB2b = Shoper::findOne(Yii::$app->session->get('shoper_id'));
            $shoperB2b->b2b_sum_price = (int)$shoperB2b->b2b_sum_price + $goods_price;
            if(!$shoperB2b->save()){
                throw  new \Exception('累计购买金额保存数据失败！');
            }
            /**
             * 全部使用茶豆币支付
             */
            if ($goods_price_surplus == 0) {
                $this->credtit_amout = 0;
                $this->cash_amout = 0;
                $this->beans_amount = $data['cdb'];
                $this->pay_time = time();
                $this->pay_type = Order::PAY_TYPE_CHADOUBI;

            } elseif ($data['pay_type'] == Order::PAY_TYPE_SHOUXING) {
                /**
                 * 使用授信加茶豆币支付
                 */
                if ($shoper->status == 1) {
                    throw  new \Exception('授信被冻结！');
                } elseif ($shoper->credit_balance < $goods_price_surplus) {
                    throw  new \Exception('授信余额不足');
                } else {
                    $this->credtit_amout = $goods_price_surplus;
                    $this->cash_amout = 0;
                    $this->beans_amount = $data['cdb'];
                    $this->pay_time = time();
                    $this->pay_type = Order::PAY_TYPE_SHOUXING;

                    $shoper->credit_balance -= $goods_price_surplus;

                }
            } elseif ($data['pay_type'] == Order::PAY_TYPE_WXPAY) {

                /**
                 * 使用授信加在线支付
                 */
                $wxPayConf = Yii::$app->params['wxPay'];
                $wxParam['appid'] = $wxPayConf['appid'];
                $wxParam['mch_id'] = $wxPayConf['mch_id'];
                $wxParam['nonce_str'] = md5($wxPayConf['appid']);
                $wxParam['body'] = '茶码头订单:' . $this->order_no;
                $wxParam['out_trade_no'] = $this->order_no;
                $wxParam['total_fee'] = $wx_goods_price_surplus;
                $wxParam['spbill_create_ip'] = $wxPayConf['spbill_create_ip'];
                $wxParam['notify_url'] = $wxPayConf['notify_url'];
                $wxParam['trade_type'] = $wxPayConf['trade_type'];

                /**
                 * 算出sing
                 */
                ksort($wxParam);
                $stringA = urldecode(http_build_query($wxParam));
                $stringSignTemp = "$stringA&key=" . $wxPayConf['api_key'];
                $wxParam['sign'] = strtoupper(md5($stringSignTemp));
                $wxRet = Request::request_post($wxPayConf['pay_url'], $wxParam);
                /**
                 * 解析返回的XML
                 */
                libxml_disable_entity_loader(true);
                $xmlstring = simplexml_load_string($wxRet, 'SimpleXMLElement', LIBXML_NOCDATA);
                $val = json_decode(json_encode($xmlstring), true);
                /**
                 *判断是否正确
                 */
                if (isset($val['code_url'])) {
                    Yii::$app->session->setFlash('wx_pay_url', $val['code_url']);
                    $this->credtit_amout = 0;
                    $this->cash_amout = $goods_price_surplus;
                    $this->beans_amount = $data['cdb'];
                    $this->pay_time = time();
                    $this->pay_type = Order::PAY_TYPE_WXPAY;
                    $this->status = Order::STATUS_DAIZHIFU;
                } else {
                    throw new \Exception('微信支付拉取失败！');
                }

            }

            if (!$this->save()) {
                throw new \Exception('订单生成失败');
            }

            /**
             * 判断是否使用茶豆币支付么，支付生成消费单
             */

            if ($data['cdb'] != 0) {
                $shoperTeaBeansLog = new ShoperTeabeansLog();
                $shoperTeaBeansLog->shoper_id = Yii::$app->session->get('shoper_id');
                $shoperTeaBeansLog->store_id = Yii::$app->session->get('store_id');
                $shoperTeaBeansLog->num = $data['cdb'];
                $shoperTeaBeansLog->add_time = time();
                $shoperTeaBeansLog->type = 1;
                $shoperTeaBeansLog->method = 0;
                if (!$shoperTeaBeansLog->save()) {
                    throw  new \Exception('订单生成失败0x123690');
                }
                /* 减少茶豆币*/
                $shoper->withdraw_total -= $data['cdb'];
            }

            /*保存到订单表中去*/
            foreach ($cart_list as $key => $value) {
                $orderGoods = new OrderGoods();
                $orderGoods->order_id = $this->Id;
                $orderGoods->goods_id = $value['goods_info']['Id'];
                $orderGoods->goods_name = $value['goods_info']['goods_name'];
                $orderGoods->price = $value['goods_info']['price'];
                $orderGoods->note = '';
                $orderGoods->num = $value['goods_num'];
                $orderGoods->cover = $value['goods_info']['cover'];
                $orderGoods->spec = $value['goods_info']['spec'];
                if (!$orderGoods->save()) {
                    throw new \Exception('订单生成失败0x12963');
                }
            }
            if (!$shoper->save()) {
                throw  new \Exception('订单生成失败0x123691');
            }
            $transaction->commit();
            if ($data['pay_type'] == Order::PAY_TYPE_WXPAY) {
                $retData['wx_pay_url'] = Yii::$app->session->getFlash('wx_pay_url', 'true');
                $retData['order_id'] = $this->Id;
                return $retData;
            }
            return true;
        } catch (\Exception $exception) {
            $transaction->rollBack();
            $this->addError('id', $exception->getMessage());
        }
    }

    /**
     * 返回所有订单数量
     * @return int|string
     */
    public static function getCount()
    {
        $model = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')]);
        $count = $model->count();
        return $count;
    }


    /**
     * 返回订单列表
     * @param array $data
     * @return mixed
     */
    public function search($data = [])
    {
        $data['status'] = isset($data['status']) ? $data['status'] : '';
        $orderModel = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')]);
        if (!empty($data['status'])) {
            $orderModel = $orderModel->andWhere(['status' => $data['status']]);
        }
        $count = $orderModel->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);
        $list = $orderModel->offset($pages->offset)->limit($pages->limit)->orderBy('add_time DESC')->all();
        $data = ArrayHelper::toArray($list);
        foreach ($list as $key => $value) {
            $data[$key]['goods_list'] = ArrayHelper::toArray($value->getOrderGoodsAR());
            $data[$key]['add_time'] = date('Y-m-d H:i:s', $data[$key]['add_time']);
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $pages->getPageCount();
        $datas['list'] = $data;
        return $datas;
    }

    /**
     * 获取最近购买的商品
     * @return array
     */
    public function getZuiJinGouMai()
    {
        $orders = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->limit(7)
            ->orderBy('add_time DESC')
            ->select(['Id'])
            ->all();
        $In = [];
        foreach ($orders as $key => $value) {
            $In[] = $value['Id'];
        }
        $goodsList = [];
        foreach ($In as $key=>$value){
            $info = sizeof($goodsList);
            if($info < 7){
                $goodsList = ArrayHelper::merge($goodsList, OrderGoods::find()->andWhere(['order_id'=>$value])->asArray()->all());
            }
        }
        return $goodsList;
    }
}
