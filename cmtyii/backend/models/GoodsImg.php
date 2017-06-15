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


    /**
     * 获取一个商品的图片
     * @param $goods_id
     * @return array|ActiveRecord[]
     */
    public static function getGoodsImg($goods_id)
    {
         return self::find()->where(['goods_id'=>$goods_id])->select(['path'])->asArray()->all();
    }
}