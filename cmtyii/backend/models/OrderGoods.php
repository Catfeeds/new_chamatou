<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/28
 * Time: 17:02
 */

namespace backend\models;


use yii\db\ActiveRecord;

class OrderGoods extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%order_goods}}';
    }
}