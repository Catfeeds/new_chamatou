<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_credit_consume}}".
 *
 * @property integer $id
 * @property integer $order_id
 * @property integer $store_id
 * @property integer $shoper_id
 * @property integer $add_time
 * @property string $amount
 * @property integer $status
 */
class CreditConsume extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_credit_consume}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_id', 'store_id', 'shoper_id', 'add_time', 'status'], 'integer'],
            [['amount'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'order_id' => 'Order ID',
            'store_id' => 'Store ID',
            'shoper_id' => 'Shoper ID',
            'add_time' => 'Add Time',
            'amount' => 'Amount',
            'status' => 'Status',
        ];
    }
}
