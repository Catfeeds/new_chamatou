<?php

namespace tea\models;

use tea\models\Goods;
use Yii;

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
 * @property string $sp_beans_amount
 * @property integer $start_time
 * @property integer $end_time
 * @property double $discount
 * @property string $coupon_amount
 * @property string $merge_order_id
 * @property integer $person
 * @property string $notes
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
            [['shoper_id', 'wx_user_id', 'vip_user_id', 'table_id', 'status', 'start_time', 'end_time', 'person','merge_order_id','staff_id'], 'integer'],
            [['table_amount', 'total_amount', 'beans_amount', 'discount', 'coupon_amount'], 'number'],
            [['table_name', 'cash_amout', ], 'string', 'max' => 255],
            [['notes'], 'string', 'max' => 120],
            [['shoper_id','start_time','table_id','status'],'required'],
            ['shoper_id','validateTableuse','on'=>['add']],
        ];
    }

    /**
     * 判断台座是否可以操作
     * @param $attribute
     * @param $params
     * @return bool
     */
    public function validateTableuse($attribute, $params)
    {
        if(!$this->hasErrors())
        {
            $tableModel = Table::findOne($this->table_id);
            if(!$tableModel)
                return $this->addError($attribute,Yii::t('app','book_table_null'));
            if($tableModel->getOrderAR())
                return $this->addError($attribute,Yii::t('app','book_table_not_null'));

            $cate_name = $tableModel->getTableType(['cate_name']);
            $this->table_name = reset($cate_name).'--'.$tableModel->table_name;
        }
    }

    /**
     * 获取订单的商品
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getGoods($select = [])
    {
        return $this->hasMany(OrderGoods::className(),['order_id'=>'id'])->select($select)->asArray()->all();
    }

    public function getStore($select = [])
    {
        return $this->hasOne(Store::className(),['id'=>'store_id'])->select($select)->asArray()->all();
    }

    /**
     * 获取商品的价格和
     */
    public function getGoodsSumPrice()
    {
        $data       = $this->getGoods();
        $sumPrice   = 0;
        foreach ($data as $key=>$value)
            $sumPrice+=$value['sum_price'];
        return $sumPrice;
    }

    /**
     * 获取订单的商品
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getGoodsAR($select = [])
    {
        return $this->hasMany(OrderGoods::className(),['order_id'=>'id'])->select($select)->all();
    }

    /**
     * 订单生成方法
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $data['shoper_id']  = Yii::$app->session->get('shoper_id');
        $data['start_time'] = time();
        $data['status']     = 1;
        $this->scenario = 'add';
        if($this->load($data,'') && $this->save())
        {
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
        $goodsID = [];
        $goodsNum= [];
        foreach ($data as $key=>$value)
        {
            $goodsID[]              = $value['id'];
            $goodsNum[$value['id']] = $value['count'];
        }

        $goodsList = Goods::find()->where(['and','shoper_id ='.Yii::$app->session->get('shoper_id'),['in','id',$goodsID]])->all();

        foreach ($goodsList as $key => $value)
        {
            $orderGoods = new OrderGoods();
            $orderGoods->order_id   = $this->id;
            $orderGoods->goods_name = $value['goods_name'];
            $orderGoods->goods_id   = $value['id'];
            $orderGoods->goods_name = $value['goods_name'];
            $orderGoods->price      = $value['sales_price'];
            $orderGoods->spec       = $value['unit'];
            $orderGoods->note       = $value['note'];
            $orderGoods->num        = $goodsNum[$value['id']];
            $orderGoods->give       = 0;
            $orderGoods->is_give    = $value['give'];
            $orderGoods->sum_price  = ($orderGoods->num*$orderGoods->price);
            $orderGoods->add_time   = time();
            $orderGoods->is_goods   = 1;
            $orderGoods->save();
        }
        return true;
    }

}
