<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_order_goods}}".
 *
 * @property integer $id
 * @property integer $order_id
 * @property integer $goods_id
 * @property string $goods_name
 * @property string $price
 * @property string $spec
 * @property string $note
 * @property integer $num
 * @property string $unit
 * @property integer $give
 * @property integer $is_give
 * @property string $sum_price
 * @property string $add_time
 * @property integer $is_goods
 * @property integer $store_id
 * @property integer $shoper_id
 * @property integer $type
 * @property integer $vip_grade
 * @property integer $discount_money
 * @property integer $discount
 * @property integer $is_discount
 */
class OrderGoods extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_order_goods}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_id','store_id','shoper_id', 'goods_id', 'num', 'give', 'type','is_give', 'add_time', 'is_goods'], 'integer'],
            [['price', 'sum_price'], 'number'],
            [['goods_name', 'spec', 'note'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'order_id' => Yii::t('app', 'Order ID'),
            'goods_id' => Yii::t('app', 'Goods ID'),
            'goods_name' => Yii::t('app', 'Goods Name'),
            'price' => Yii::t('app', 'Price'),
            'spec' => Yii::t('app', 'Spec'),
            'note' => Yii::t('app', 'Note'),
            'num' => Yii::t('app', 'Num'),
            'unit' => Yii::t('app', 'Unit'),
            'give' => Yii::t('app', 'Give'),
            'is_give' => Yii::t('app', 'Is Give'),
            'sum_price' => Yii::t('app', 'Sum Price'),
            'add_time' => Yii::t('app', 'Add Time'),
            'is_goods' => Yii::t('app', 'Is Goods'),
        ];
    }
}
