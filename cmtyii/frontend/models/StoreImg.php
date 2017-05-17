<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/6
 * Time: 15:13
 */

namespace frontend\models;


use yii\db\ActiveRecord;

class StoreImg extends ActiveRecord
{
    public static function tableName()
    {
        return "{{%shoper_img}}";
    }
}