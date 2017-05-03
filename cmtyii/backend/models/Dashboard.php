<?php
/**
 * 数据中心模块
 * User: harlen-angkemac
 * Date: 2017/5/3 - 下午5:17
 *
 */

namespace backend\models;


use yii\base\Model;

class Dashboard extends Model
{
//    public $shoper_count;
//    public $store_count;
//    public $user_count;
//
//    public $coin_sum;
//    public $in_coin_sum;
//    public $out_coin_sum;

    public function getShoperCount()
    {
        return Shoper::find()->count();
    }

    public function getStoreCount()
    {
        return SpStore::find()->count();
    }

    public function getUserCount()
    {
        return WxUser::find()->count();
    }
}