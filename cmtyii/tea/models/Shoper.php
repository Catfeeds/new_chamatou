<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%shoper}}".
 *
 * @property integer $Id
 * @property integer $shop_id
 * @property string $boss
 * @property string $phone
 * @property string $credit_amount
 * @property string $contract_no
 * @property integer $withdraw_type
 * @property string $bank
 * @property string $bank_user
 * @property string $card_no
 * @property string $credit_remain
 * @property integer $status
 * @property integer $salesman_id
 * @property integer $add_time
 * @property string $beans_incom
 * @property string $total_amount
 * @property string $withdraw_total
 * @property string $b2b_sum_price
 */
class Shoper extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%shoper}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['withdraw_type', 'status', 'salesman_id', 'add_time'], 'integer'],
            [['credit_amount', 'credit_remain', 'beans_incom', 'total_amount', 'withdraw_total'], 'number'],
            [['boss', 'bank_user'], 'string', 'max' => 10],
            [['phone'], 'string', 'max' => 15],
            [['contract_no', 'bank', 'card_no'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => Yii::t('app', 'ID'),
            'shop_id' => Yii::t('app', 'Shop ID'),
            'boss' => Yii::t('app', 'Boss'),
            'phone' => Yii::t('app', 'Phone'),
            'credit_amount' => Yii::t('app', 'Credit Amount'),
            'contract_no' => Yii::t('app', 'Contract No'),
            'withdraw_type' => Yii::t('app', 'Withdraw Type'),
            'bank' => Yii::t('app', 'Bank'),
            'bank_user' => Yii::t('app', 'Bank User'),
            'card_no' => Yii::t('app', 'Card No'),
            'credit_remain' => Yii::t('app', 'Credit Remain'),
            'status' => Yii::t('app', 'Status'),
            'salesman_id' => Yii::t('app', 'Salesman ID'),
            'add_time' => Yii::t('app', 'Add Time'),
            'beans_incom' => Yii::t('app', 'Beans Incom'),
            'total_amount' => Yii::t('app', 'Total Amount'),
            'withdraw_total' => Yii::t('app', 'Withdraw Total'),
        ];
    }

    /**
     * 获取商家茶豆币
     * @return mixed
     */
    public static  function getBeansIncom()
    {
        $data = self::find()->andWhere(['id'=>Yii::$app->session->get('shoper_id')])
                    ->select(['withdraw_total'])
                    ->one();
        return $data['withdraw_total'];
    }
}
