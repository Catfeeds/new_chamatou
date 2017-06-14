<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/6/14
 * Time: 16:55
 */

namespace backend\models;


use yii\db\ActiveRecord;

class GoodsImg extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%goods_img}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['path'], 'required'],
            [['goods_id'], 'integer'],
            [['path'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => \Yii::t('app', 'ID'),
            'goods_id' => '商品id',
            'path' => \Yii::t('app', 'Path'),
        ];
    }
}