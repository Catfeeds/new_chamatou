<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%salesman}}".
 *
 * @property integer $id
 * @property string $username
 * @property string $phone
 * @property integer $shop_total
 * @property integer $addtime
 */
class Salesman extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%salesman}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shop_total', 'add_time'], 'integer'],
            [['add_time'], 'required'],
            [['username'], 'string', 'max' => 10],
            [['phone'], 'string', 'max' => 15],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Username'),
            'phone' => Yii::t('app', 'Phone'),
            'shop_total' => Yii::t('app', 'Shop Total'),
            'add_time' => Yii::t('app', 'Add Time'),
        ];
    }
}
