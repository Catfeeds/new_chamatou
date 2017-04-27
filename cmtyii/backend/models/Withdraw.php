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
            'shoper_id' => Yii::t('app', 'Shoper ID'),
            'amount' => Yii::t('app', 'Amount'),
            'status' => Yii::t('app', 'Status'),
            'note' => Yii::t('app', 'Note'),
            'add_time' => Yii::t('app', 'Add Time'),
        ];
    }

    public function getShoper()
    {
        return $this->hasOne(Shoper::className(), ['shoper_id' => 'id']);
    }
}
