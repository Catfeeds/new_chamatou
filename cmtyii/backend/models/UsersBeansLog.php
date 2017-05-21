<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%users_beans_log}}".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $num
 * @property integer $add_time
 * @property integer $type
 * @property integer $method
 */
class UsersBeansLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%users_beans_log}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id'], 'required'],
            [['user_id', 'add_time', 'type', 'method'], 'integer'],
            [['num'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'num' => 'Num',
            'add_time' => 'Add Time',
            'type' => 'Type',
            'method' => 'Method',
        ];
    }
}
