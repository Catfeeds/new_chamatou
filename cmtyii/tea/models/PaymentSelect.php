<?php

namespace tea\models;

use Yii;

/**
 * 支付选择
 * This is the model class for table "{{%sp_payment_select}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $type
 */
class PaymentSelect extends \yii\db\ActiveRecord
{
    // 三个选三
    const TYPE_SAN = 3;

    //三选二
    const TYPE_ER = 2;

    //三选一
    const TYPE_noe = 1;


    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_payment_select}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id'], 'required'],
            [['shoper_id', 'store_id', 'type'], 'integer'],
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
            'store_id' => 'Store ID',
            'type' => 'Type',
        ];
    }

    /**
     * 设置type的值
     * @param $type
     * @return bool
     */
    public static function set($type)
    {
        $paymentSelect = self::getInstance();
        if($paymentSelect){
            $paymentSelect->type = $type;
            return $paymentSelect->save();
        }
        $paymentSelect = new PaymentSelect();
        $paymentSelect->shoper_id = Yii::$app->session->get('shoper_id');
        $paymentSelect->store_id = Yii::$app->session->get('store_id');
        $paymentSelect->type = $type;
        return $paymentSelect->save();
    }

    /**
     * 获取type的值
     * @return int|mixed
     */
    public static function get()
    {
        $paymentSelect  = self::getInstance();
        if($paymentSelect)
        {
            return $paymentSelect->type;
        }

        return self::TYPE_SAN;
    }

    /**
     * 内部使用获取实例
     * @return array|null|\yii\db\ActiveRecord
     */
    private static function getInstance()
    {
        return self::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                    ->one();
    }
}
