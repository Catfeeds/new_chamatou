<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\models;

use phpDocumentor\Reflection\DocBlock\Tags\Var_;
use Yii;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

/**
 * 消费单模型
 * Class Spending
 * @package tea\models
 */
class Spending
{

    /**
     * 搜索消费单
     * @param $param
     * @return mixed
     */
    public function search($param)
    {
        $param['type'] = isset($param['type']) ? empty($param['type']) ? '' : $param['type'] : '';
        $param['start_time'] = isset($param['start_time']) ? empty($param['start_time']) ? '' : $param['start_time'] : '';
        $param['end_time'] = isset($param['end_time']) ? empty($param['end_time']) ? '' : $param['end_time'] : '';
        $param['staff'] = isset($param['staff']) ? empty($param['staff']) ? '' : $param['staff'] : '';
        $model = Order::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')]);

        if ($param['type'] == 1) {
            $model = $model->andWhere(['status' => 1]);
        } elseif ($param['type'] == 2) {
            $model = $model->andWhere(['status' => 2]);
        } elseif ($param['type'] == 3) {
            $model = $model->andWhere(['status' => 1])->andWhere(['!=', 'merge_order_id', 0]);
        }

        if ($param['start_time'] != '') {
            $model = $model->andWhere(['>','start_time',strtotime($param['start_time'])]);
        }
        if ($param['end_time'] != '') {
            $model = $model->andWhere(['<','start_time' ,strtotime($param['end_time'])]);
        }
        if ($param['staff'] != '') {
            $model = $model->andWhere(['staff_id' => $param['staff']]);
        }

        $count = $model->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);

        $data = $model->limit($pages->limit)->offset($pages->offset)->orderBy('end_time DESC')->all();
        $datas['list'] = ArrayHelper::toArray($data);
        foreach ($data as $key=>$value)
        {
            $goodsList = $value->getGoods();
            $datas['list'][$key]['start_time'] =date("Y-m-d H:i:s",$value['start_time']);
            $datas['list'][$key]['end_time'] =date("Y-m-d H:i:s",$value['end_time']);
            $datas['list'][$key]['goods_price_sum'] = 0;
            $datas['list'][$key]['consume_time'] = Time::ToHour($value['start_time'],$value['end_time']);
            $datas['list'][$key]['staff_id'] = UsersForm::getUserNameById($value['staff_id']);
            foreach ($goodsList as $keys=>$values){
                $datas['list'][$key]['goods_price_sum'] = $datas['list'][$key]['goods_price_sum']+$values['sum_price'];
            }
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $pages->getPageCount();
        return $datas;
    }


}
