<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\b2b\controllers;

use tea\b2b\models\Order;
use tea\controllers\ObjectController;
use tea\models\Shoper;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

/**
 * Class CreditController
 * @package tea\b2b\controllers
 */
class CreditController extends ObjectController
{
    /**
     * 获取我应该还的账单
     * @return array
     */
    public function actionInfo()
    {
        $shoper = Shoper::find()->andWhere(['id' => \Yii::$app->session->get('shoper_id')])
            ->select(['credit_remain', 'credit_balance','status'])->one();
        $data = ArrayHelper::toArray($shoper);
        $day = date('d');

        if ($day > 10) {
            $m = date('m');
            if ($m == 12) {
                $m = 1;
            }else{
                $m++;
            }
        } else {
            $m = date('m');
        }
        $data['credit_huan'] = $data['credit_remain'] - $data['credit_balance'];
        $data['time'] = $m . '月10日';
        return ['code'=>1,'msg'=>'','data'=>$data];
    }

    /**
     * 获取授信消费记录
     * @return mixed
     */
    public function actionList()
    {
        $start_time = strtotime(\Yii::$app->request->get('start_time'));
        $ent_time = strtotime(\Yii::$app->request->get('end_time'));

        $order = Order::find()->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
            ->andWhere(['pay_type' => Order::PAY_TYPE_SHOUXING])
            ->andWhere(['>','pay_time',$start_time])
            ->andWhere(['<','pay_time',$ent_time]);

        $count = $order->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => \Yii::$app->params['pageSize']]);
        $data = $order->offset($pages->offset)->limit($pages->limit)->all();
        $datatemp = ArrayHelper::toArray($data);
        foreach ($data as $key => $value) {
            $datatemp[$key]['pay_time'] = date('Y-m-d H:i:s',$value['pay_time']);
            $datatemp[$key]['goods_info'] = ArrayHelper::toArray($value->getOrderGoodsAR());
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $pages->getPageCount();
        $datas['list'] = $datatemp;
        return ['code'=>1,'msg'=>'','data'=>$datas];
    }
}

























