<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%shoper_img}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $path
 */
class ShoperImg extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%shoper_img}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'path'], 'required'],
            [['shoper_id', 'store_id'], 'integer'],
            [['path'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'shoper_id' => Yii::t('app', 'Shoper ID'),
            'store_id' => Yii::t('app', 'Store ID'),
            'path' => Yii::t('app', 'Path'),
        ];
    }
}
