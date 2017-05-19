<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_vip_pay}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $vip_id
 * @property integer $amount
 * @property integer $add_time
 * @property int $paly_type
 * @property string $zs
 * @property int $pay_up_amount
 */
class VipPay extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_vip_pay}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'vip_id', 'amount', 'add_time','tea_user_id'], 'integer'],
            [['amount'], 'number'],
            [['amount'], 'match','pattern'=>'/^[1-9]\d*(\.\d+)?$/'],
            [['zs'], 'match','pattern'=>'/^[0-9]\d*(\.\d+)?$/'],
            [['vip_id','amount','add_time','paly_type','pay_up_amount'],'required'],
            [['paly_type'],'in','range'=>[1,2,3,4]],
            [['paly_on'],'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'shoper_id' => 'Shoper ID',
            'vip_id' => 'Vip User ID',
            'amount' => 'Amount',
            'add_time' => 'Add Time',
            'xjpay' => 'Xjpay',
            'pospay' => 'Pospay',
            'wxpay' => 'Wxpay',
            'alipay' => 'Alipay',
            'zs' => '赠送金额',
        ];
    }
}
