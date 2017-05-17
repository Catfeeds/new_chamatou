<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%sp_users}}".
 *
 * @property integer $id
 * @property integer $store_id
 * @property integer $shoper_id
 * @property string $user
 * @property string $phone
 * @property integer $add_time
 * @property string $password
 * @property integer $is_admin
 * @property integer $status
 */
class SpUsers extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_users}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['store_id', 'shoper_id', 'add_time', 'is_admin', 'status'], 'integer'],
            [['add_time'], 'required'],
            [['user'], 'string', 'max' => 12],
            [['phone'], 'string', 'max' => 15],
            [['password'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'store_id' => Yii::t('app', 'Store ID'),
            'shoper_id' => Yii::t('app', 'Shoper ID'),
            'user' => Yii::t('app', 'User'),
            'phone' => Yii::t('app', 'Phone'),
            'add_time' => Yii::t('app', 'Add Time'),
            'password' => Yii::t('app', 'Password'),
            'is_admin' => Yii::t('app', 'Is Admin'),
            'status' => Yii::t('app', 'Status'),
        ];
    }
}
