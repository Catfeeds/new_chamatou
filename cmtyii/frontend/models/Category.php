<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/3
 * Time: 10:23
 */

namespace frontend\models;


use yii\db\ActiveRecord;

class Category extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%sp_goods_cate}}';
    }
}