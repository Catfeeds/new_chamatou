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
    public static $spNames = [];//定义一个静态数组持久保存查出的店铺名称
    public function getPic($select = [])
    {
        return $this->hasMany(StoreImg::className(),['store_id'=>'id'])->select($select)->asArray()->all();
    }


    /**
     * 根据店铺ID查询店铺名
     * @param $store_id
     * @return mixed
     */
    public static function getSpName($store_id)
    {
        $sp_names = self::$spNames;
        if(isset($sp_names[$store_id])){
            return $sp_names[$store_id];
        }
        $store = self::findOne($store_id);
        self::$spNames[$store_id] =  $store->sp_name;
        return self::$spNames[$store_id];

    }
}