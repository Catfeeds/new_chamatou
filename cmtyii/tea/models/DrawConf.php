<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_draw_conf}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $status
 */
class DrawConf extends \yii\db\ActiveRecord
{
    /**
     * 开启状态
     */
    const STATUS_TRUE = 1;

    /**
     * 关闭状态
     */
    const STATUS_FALSE = 0;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_draw_conf}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'shoper_id', 'store_id', 'status'], 'integer'],
            [['status'],'in','range'=>[0,1]],
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
            'status' => 'Status',
        ];
    }

    /**
     * 设置状态
     * @param string $status
     * @return bool|string
     */
    public function setStatus($status = '')
    {
        if($status == ''){
            if($this->status == self::STATUS_TRUE)
                $this->status = self::STATUS_FALSE;
            else
                $this->status = self::STATUS_TRUE;
            return true;
        }
        return $this->status = $status;
    }
}
