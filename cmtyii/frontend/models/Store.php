<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/6
 * Time: 15:11
 */

namespace frontend\models;


class Store extends \tea\models\Store
{
    public function getPic($select = [])
    {
        return $this->hasMany(StoreImg::className(),['store_id'=>'id'])->select($select)->asArray()->all();
    }
}