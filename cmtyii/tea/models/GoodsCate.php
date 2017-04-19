<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_goods_cate}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $pid
 * @property string $cate_name
 */
class GoodsCate extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_goods_cate}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'pid'], 'integer'],
            [['cate_name'], 'string', 'max' => 100],
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
            'pid' => 'Pid',
            'cate_name' => 'Cate Name',
        ];
    }
}
