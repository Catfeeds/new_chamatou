<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/28
 * Time: 16:56
 */

namespace backend\models;


use yii\db\ActiveRecord;

class Order extends ActiveRecord
{
    public function getOrderGoods()
    {
        return $this->hasMany(OrderGoods::className(),['order_id'=>'Id'])->asArray();
   }
}