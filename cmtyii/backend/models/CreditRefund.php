<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%sp_credit_refund}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property string $amount
 * @property integer $add_time
 */
class CreditRefund extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_credit_refund}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'add_time'], 'integer'],
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
            'shoper_id' => Yii::t('app', '商家id'),
            'amount' => Yii::t('app', '还款金额'),
            'add_time' => Yii::t('app', '还款时间'),
        ];
    }
}
