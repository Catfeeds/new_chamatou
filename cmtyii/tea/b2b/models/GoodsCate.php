<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\b2b\models;

use Yii;

/**
 * This is the model class for table "{{%goods_cate}}".
 *
 * @property integer $id
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
        return '{{%goods_cate}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid'], 'integer'],
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
            'pid' => 'Pid',
            'cate_name' => 'Cate Name',
        ];
    }

    /**
     * 获取所有的分类列表
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getList(){
        $data = self::find()
                    ->select(['id','cate_name'])
                    ->all();
        return $data;
    }
}
