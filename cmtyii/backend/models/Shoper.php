<?php

namespace backend\models;

use Codeception\Coverage\Subscriber\Local;
use Yii;

/**
 * This is the model class for table "{{%shoper}}".
 *
 * @property integer $id
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
 * @property integer $sp_status
 */
class Shoper extends \yii\db\ActiveRecord
{
    public $yinhuan;
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
            [['boss','phone','bank','card_no','bank_user'],'required'],
            [['credit_amount', 'credit_remain', 'beans_incom', 'total_amount', 'withdraw_total'], 'number'],
            [['withdraw_type', 'status', 'salesman_id', 'add_time', 'sp_status'], 'integer'],
            [['boss', 'bank_user'], 'string', 'max' => 10],
            [['phone'], 'number'],
            [['phone'], 'unique'],
            [['phone'], 'string', 'max' => 15,'min'=>11],
            [['contract_no', 'bank', 'card_no','pay_account'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'boss' => Yii::t('app', '负责人姓名'),
            'phone' => Yii::t('app', 'Phone'),
            'credit_amount' => Yii::t('app', 'Credit Amount'),
            'contract_no' => Yii::t('app', 'Contract No'),
            'withdraw_type' => Yii::t('app', 'Withdraw Type'),
            'bank' => Yii::t('app', 'Bank'),
            'bank_user' => Yii::t('app', 'Bank User'),
            'card_no' => Yii::t('app', 'Card No'),
            'credit_remain' => Yii::t('app', 'Credit Remain'),
            'status' => Yii::t('app', 'Shoper Status'),
            'salesman_id' => Yii::t('app', 'Salesman ID'),
            'add_time' => Yii::t('app', 'Add Time'),
            'beans_incom' => Yii::t('app', 'Beans Incom'),
            'total_amount' => Yii::t('app', 'Total Amount'),
            'withdraw_total' => Yii::t('app', 'Withdraw Total'),
            'sp_status' => Yii::t('app', 'Sp Status'),
            'withdrawType.name' =>  Yii::t('app', 'Withdraw Type'),
            'yinhuan' => Yii::t('app', '当期应还'),
            'pay_account' => Yii::t('app', 'Pay Account'),
        ];
    }
    public function getSpStatusDropDownList()
    {
        return [
            0 => '正常',
            1 => '封停'
        ];
    }

    public function getShoperStatusDropDownList()
    {
        return [
            1 => '正常',
            2 => '冻结'
        ];
    }

    public function getStore()
    {
        return $this->hasOne(SpStore::className(), ['shoper_id'=>'id']);
    }

    public function getArea($id)
    {
        $one = SpStore::find()
            ->alias('s')
            ->innerJoin('t_locations l', 's.city_id = l.id')
            ->select('l.name as city_name')
            ->where( ['s.shoper_id'=>$id])
            ->column();
       return isset($one[0]) ? $one[0] : null;

    }

    public function getSalesman()
    {
        return $this->hasOne(Salesman::className(), ['id'=> 'salesman_id']);
    }

    public function getWithdrawName()
    {
        switch($this->withdraw_type){
            case 1:
                return '支付宝';
            case 2:
                return '微信';
            case 3:
                return '银行卡';
        }
    }
}
