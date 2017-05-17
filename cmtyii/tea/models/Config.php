<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_config}}".
 *
 * @property integer $id
 * @property string $key
 * @property string $value
 * @property integer $shoper_id
 */
class Config extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_config}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id'], 'integer'],
            [['key'], 'string', 'max' => 24],
            [['value'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'key' => 'Key',
            'value' => 'Value',
            'shoper_id' => 'Shoper ID',
        ];
    }

    /**
     * 获取一个配置
     * @param $key
     * @return mixed
     */
    public static function get($key)
    {
        $data = self::find()->where(['key'=>$key,'shoper_id'=>Yii::$app->session->get('shoper_id')])->select(['value'])->asArray()->one();
        return $data['value'];
    }
}
