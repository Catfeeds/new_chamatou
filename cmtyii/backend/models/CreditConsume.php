<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%sp_credit_consume}}".
 *
 * @property integer $id
 * @property integer $store_id
 * @property integer $order_id
 * @property integer $shoper_id
 * @property integer $add_time
 * @property string $amount
 * @property integer $status
 */
class CreditConsume extends \yii\db\ActiveRecord
{

    public $credit_status;

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
            [['store_id', 'order_id', 'shoper_id', 'add_time', 'status'], 'integer'],
            [['amount'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'store_id' => Yii::t('app', '店铺'),
            'order_id' => Yii::t('app', '订单'),
            'shoper_id' => Yii::t('app', '商家'),
            'add_time' => Yii::t('app', '消费时间'),
            'amount' => Yii::t('app', '消费金额'),
            'status' => Yii::t('app', '状态'),
        ];
    }

    public function getCredit()
    {
        return 1;
    }

    public function getStore()
    {
        return $this->hasOne(SpStore::className(), ['id' => 'store_id']);
    }

    public function getShoper()
    {
        return $this->hasOne(Shoper::className(), ['id'=> 'shoper_id']);
    }

    public function getOrder()
    {
        return $this->hasOne(Order::className(), ['id'=> 'order_id']);
    }
}
