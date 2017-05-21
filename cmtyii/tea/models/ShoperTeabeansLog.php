<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%shoper_tea_beans_log}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $num
 * @property integer $add_time
 * @property integer $type
 * @property integer $method
 */
class ShoperTeabeansLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%shoper_tea_beans_log}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id'], 'required'],
            [['shoper_id', 'store_id', 'add_time', 'type', 'method'], 'integer'],
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
            'shoper_id' => 'Shoper ID',
            'store_id' => 'Store ID',
            'num' => 'Num',
            'add_time' => 'Add Time',
            'type' => 'Type',
            'method' => 'Method',
        ];
    }
}
