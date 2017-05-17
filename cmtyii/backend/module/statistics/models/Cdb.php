<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/17
 * Time: 上午10:36
 */
namespace backend\module\statistics\models;

use backend\models\Shoper;
use backend\models\UsersBeansLog;

class Cdb{
    /**
     * 累计充值额
     * @var int
     */
    public static $paySumNum = 0;

    /**
     * 商户累计提现
     * @var int
     */
    public static $storeWithdraw = 0;

    /**
     * 用户茶豆币总余额
     * @var int
     */
    public static $userCdbSumNum = 0;

    /**
     * 用户累计充值额
     * @return int
     */
    public static function getPaySumNum ()
    {
        $temp = UsersBeansLog::find()->andWhere(['type'=>1])->select(['num'])->all();
        foreach ($temp as $key=>$value)
        {
            self::$paySumNum += $value['num'];
        }
        return self::$paySumNum;
    }

    /**
     * 商家代提现金额
     * @return int
     */
    public static function getStoreWithdraw()
    {
        $temp = Shoper::find()->select(['withdraw_total'])->all();
        foreach ($temp as $key=>$value)
        {
            self::$storeWithdraw += $value['withdraw_total'];
        }
        return self::$storeWithdraw;
    }

    /**
     * 获取用户茶豆币余额
     * @return int
     */
    public static function getCdbSumNum()
    {
        self::$userCdbSumNum = User::getOverdueUserSum();
        return self::$userCdbSumNum;
    }

}