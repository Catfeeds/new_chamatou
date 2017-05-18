<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%withdraw}}".
 *
 * @property integer $Id
 * @property integer $shoper_id
 * @property string $amount
 * @property integer $status
 * @property string $note
 * @property integer $add_time
 */
class Withdraw extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%withdraw}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'status', 'add_time'], 'integer'],
            [['amount'], 'number'],
            [['note'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => Yii::t('app', 'ID'),
            'shoper_id' => Yii::t('app', '商铺名称'),
            'amount' => Yii::t('app', '提现金额'),
            'status' => Yii::t('app', '状态'),
            'note' => Yii::t('app', '备注'),
            'add_time' => Yii::t('app', '申请时间'),
        ];
    }

    public function getShoper()
    {
        return $this->hasOne(Shoper::className(), ['id' => 'shoper_id']);
    }

    public function getStore()
    {
        return $this->hasOne(SpStore::className(), ['id' => 'store_id']);
    }
}
