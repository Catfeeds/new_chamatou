<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\controllers;

use tea\models\Statement;
use Yii;

/**
 * 报表数据
 * Class StatementController
 * @package tea\controllers
 */
class StatementController extends \tea\controllers\ObjectController
{
    /**
     * 实时数据
     * @return array
     */
    public function actionActualData()
    {
        $actuaData = new Statement();
        return ['code' => 1, 'msg' => '成功', 'data' => $actuaData->actualData()];
    }

    /**
     * 营业报表
     * @return array
     */
    public function actionOperatingData()
    {
        $operatingData = new Statement();
        return ['code' => 1, 'msg' => '成功', 'data' => $operatingData->operatingData(Yii::$app->request->get())];
    }

    /**
     * 商品列表
     * @return array
     */
    public function actionGoods()
    {
        $goodsData = new Statement();
        return ['code' => 1, 'msg' => '成功', 'data' => $goodsData->goodsData(Yii::$app->request->get())];
    }

    /**
     * 访客记录
     * @return array
     */
    public function actionWxUser()
    {
        $wxUserData = new Statement();
        return ['code' => 1, 'msg' => '成功', 'data' => $wxUserData->wxUserData(Yii::$app->request->get())];
    }
}