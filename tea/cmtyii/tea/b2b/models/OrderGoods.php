<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\b2b\models;

use Yii;

/**
 * This is the model class for table "{{%order_goods}}".
 *
 * @property integer $Id
 * @property integer $order_id
 * @property integer $goods_id
 * @property string $goods_name
 * @property string $cover
 * @property string $price
 * @property string $spec
 * @property string $note
 * @property integer $num
 */
class OrderGoods extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order_goods}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_id', 'goods_id', 'num'], 'integer'],
            [['price'], 'number'],
            [['goods_name', 'cover', 'spec', 'note'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'order_id' => 'Order ID',
            'goods_id' => 'Goods ID',
            'goods_name' => 'Goods Name',
            'cover' => 'Cover',
            'price' => 'Price',
            'spec' => 'Spec',
            'note' => 'Note',
            'num' => 'Num',
        ];
    }

}
