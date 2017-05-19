<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%tea_beans_config}}".
 *
 * @property integer $Id
 * @property integer $scale
 */
class TeaBeansConfig extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%tea_beans_config}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['scale'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'scale' => 'Scale',
        ];
    }

    /**
     * 获取比例
     * @return int
     */
    public static function getBili()
    {
        $data = TeaBeansConfig::findOne(1);
        return $data->scale;
    }
}
