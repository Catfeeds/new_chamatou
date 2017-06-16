<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_buffer_time}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $time
 */
class BufferTime extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_buffer_time}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'shoper_id', 'store_id', 'time'], 'integer'],
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
            'time' => '缓冲时间',
        ];
    }

    /**
     * 获取缓冲时间
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function get()
    {
        $bufferModel = self::getModel();
        return isset($bufferModel['time']) ? $bufferModel['time'] : 0;
    }

    /**
     * 设置时间
     * @param $time
     * @return bool
     */
    public static function set($time)
    {
        $bufferModel = self::getModel();
        if($bufferModel) {
            $bufferModel->time = $time;
            return $bufferModel->save();
        }
        $bufferModel            = new BufferTime();
        $bufferModel->shoper_id = Yii::$app->session->get('shoper_id');
        $bufferModel->store_id  = Yii::$app->session->get('store_id');
        $bufferModel->time      = $time;
        return $bufferModel->save();
    }

    /**
     * 获取这个模型的实例
     * @return array|null|\yii\db\ActiveRecord
     */
    private static function getModel()
    {
        return self::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                    ->one();
    }
}
