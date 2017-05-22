<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/10
 * Time: 下午1:41
 */

namespace tea\models;

use yii\data\Pagination;
use yii\helpers\ArrayHelper;

/**
 * 报表系统控制器
 * Class Statement
 * @package tea\models
 */
class Statement
{
    /**
     * 获取最近到访
     * @param $pa
     * @return array
     */
    public function wxUserData($pa)
    {
        $start_time = isset($pa['start_time']) ? $pa['start_time'] : date('Y-m-d') . '12:00:00';
        $end_time = isset($pa['end_time']) ? $pa['end_time'] : date('Y-m-d') . '23:59:59';
        $model = Order::find()->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
            ->andWhere(['!=', 'wx_user_id', 0])
            ->andWhere(['>', 'end_time', strtotime($start_time)])
            ->andWhere(['<', 'end_time', strtotime($end_time)])->all();

        $InId = [];
        foreach ($model as $key => $value) {
            if (isset($InId[$value['wx_user_id']])) {
                break;
            } else {
                $InId[$value['wx_user_id']] = $value['wx_user_id'];
            }
        }
        $InIds = [];
        foreach ($InId as $key=>$value) {
            $InIds[] = $value;
        }
        $model = Order::find()->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
            ->andWhere(['IN', 'wx_user_id',$InId ])
            ->andWhere(['>', 'end_time', strtotime($start_time)])
            ->andWhere(['<', 'end_time', strtotime($end_time)])
            ->orderBy('wx_user_id DESC');

        $count = $model->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>\Yii::$app->params['pageSize']]);
        $model = $model->offset($pages->offset)->limit($pages->limit)->all();
        $wx_user_id = [];
        $data = [];
        foreach ($model as $key => $value) {
            if (isset($wx_user_id[$value['wx_user_id']])) {
                $data[$value['wx_user_id']]['end_time'] = $value['end_time'];
                $data[$value['wx_user_id']]['sum'] = $data[$value['wx_user_id']]['sum'] + $value['total_amount'];
            } else {
                $wx_user_id[$value['wx_user_id']] = 1;
                $wxUserModel = WxUser::findOne($value['wx_user_id']);
                $data[$value['wx_user_id']]['nickname'] = $wxUserModel['nickname'];
                $data[$value['wx_user_id']]['phone'] = $wxUserModel['phone'];
                $data[$value['wx_user_id']]['end_time'] = $value['end_time'];
                $data[$value['wx_user_id']]['sum'] = $value['total_amount'];
            }
        }
        $datas = [];
        foreach ($data as $key => $value) {
            $value['end_time'] = date('Y-m-d H:i:s',$value['end_time']);
            $datas[] = $value;
        }
        for ($i=0;$i<sizeof($datas);$i++)
        {
            for ($j=$i;$j<sizeof($datas);$j++)
            {
                if($datas[$i]['sum']<$datas[$j]['sum'])
                {
                    $temp = $datas[$i];
                    $datas[$i] = $datas[$j];
                    $datas[$j] = $temp;
                }
            }
        }
        $list['pageCount'] = $count;
        $list['pageNum'] = $pages->getPageCount();
        $list['list'] = $datas;
        return $list;
    }

    /**
     * 实时数据
     * @return mixed
     */
    public function actualData()
    {
        $start_time = date('Y-m-d') . '00:00:00';
        $end_time = date('Y-m-d') . '23:59:59';
        $list = $this->getTurnoverByTime(['start_time' => $start_time, 'end_time' => $end_time]);
        $data['list'] = $list;
        $data['szl'] = [
            'sz' => [
                'bili' => 0,
                'shiyongzhong' => 0,
                'kongxian' => 0,
                'sum' => 0,
            ],
            'bj' => [
                'bili' => 0,
                'shiyongzhong' => 0,
                'kongxian' => 0,
                'sum' => 0,
            ],
            'yd' => [
                'bili' => 0,
                'yikai' => 0,
                'sum' => 0,
            ],
        ];
        $table = new Table();
        $datas = $table->getDeskStatus('0')['data'];
        foreach ($datas as $key => $value) {
            if ($value['classification'] == 1) {
                foreach ($value['tables'] as $kkey => $vvalue) {
                    if ($vvalue['order']) {
                        $data['szl']['bj']['shiyongzhong']++;
                    } else {
                        $data['szl']['bj']['kongxian']++;
                    }
                    $data['szl']['bj']['sum']++;
                }
            } else {
                foreach ($value['tables'] as $kkey => $vvalue) {
                    if ($vvalue['order']) {
                        $data['szl']['sz']['shiyongzhong']++;
                    } else {
                        $data['szl']['sz']['kongxian']++;
                    }
                    $data['szl']['sz']['sum']++;
                }
            }
        }
        if($data['szl']['sz']['sum'] * 100 != 0){
            $data['szl']['sz']['bili'] = round($data['szl']['sz']['shiyongzhong'] / $data['szl']['sz']['sum'] * 100, 2);
        }

        if ($data['szl']['bj']['sum'] * 100 != 0){
            $data['szl']['bj']['bili'] = round($data['szl']['bj']['shiyongzhong'] / $data['szl']['bj']['sum'] * 100, 2);
        }
        $book = Book::find()->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
            ->andWhere(['>', 'add_time', strtotime($start_time)])
            ->andWhere(['<', 'add_time', strtotime($end_time)])
            ->all();
        foreach ($book as $key => $value) {
            if ($value['status'] == 1) {
                $data['szl']['yd']['yikai']++;
            }
            $data['szl']['yd']['sum']++;
        }
        if ($data['szl']['yd']['sum'] != 0) {
            $data['szl']['yd']['bili'] = round($data['szl']['yd']['yikai'] / $data['szl']['yd']['sum'] * 100, 2);
        }
        return $data;
    }

    /**
     * 营业报表
     * @return mixed
     */
    public function operatingData($pa = [])
    {
        $start_time = isset($pa['start_time']) ? $pa['start_time'] : date('Y-m-d') . '12:00:00';
        $end_time = isset($pa['end_time']) ? $pa['end_time'] : date('Y-m-d') . '23:59:59';
        $list = $this->getTurnoverByTime(['start_time' => $start_time, 'end_time' => $end_time]);
        $data['list'] = $list;
        $start_time = strtotime($start_time);
        $end_time = strtotime($end_time);
        $day_time = $end_time - $start_time;
        $day = (int)$day_time / 86400;
        for ($i = 0; $i < $day; $i++) {
            $str = "+ " . $i . ' day';
            $temp = date('Y-m-d', strtotime($str, $start_time));
            $data['time'][$i] = $temp;
            $temp = $this->getTurnoverByTime(['start_time' => $temp . ' 00:00:00', 'end_time' => $temp . '23:59:59']);
            $temp['time'] = $data['time'][$i];
            $data['sum'][] = $temp['sum'];
            $data['wx_pay'][] = $temp['wx_pay']['num'];
            $data['vip_pay'][] = $temp['vip_pay']['num'];
            $data['ali_pay'][] = $temp['ali_pay']['num'];
            $data['card_pay'][] = $temp['card_pay']['num'];
            $data['preferential'][] = $temp['preferential']['num'];
            $data['money_pay'][] = $temp['money_pay']['num'];
            $data['beans_amount'][] = $temp['beans_amount']['num'];
            $data['data_list'][] = $temp;
        }
        return $data;
    }

    /**
     * 排序商品的销售
     * @param $pa
     * @return array
     */
    public function goodsData($pa)
    {
        $start_time = isset($pa['start_time']) ? $pa['start_time'] : date('Y-m-d') . '12:00:00';
        $end_time = isset($pa['end_time']) ? $pa['end_time'] : date('Y-m-d') . '23:59:59';
        $model = OrderGoods::find()->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
            ->andWhere(['>', 'add_time', strtotime($start_time)])
            ->andWhere(['<', 'add_time', strtotime($end_time)])
            ->all();
        $goodsId = [];
        $goods_list = [];

        foreach ($model as $key => $value) {
            if (isset($goodsId[$value['goods_id']])) {
                $goods_list[$value['goods_id']]['num'] = $goods_list[$value['goods_id']]['num'] + $value['num'];
            } else {
                $goodsId[$value['goods_id']] = 1;
                $goods_list[$value['goods_id']] = ArrayHelper::toArray($value);
            }
        }

        $goods_lists = $goods_list;
        unset($goods_list);
        $goods_list = [];
        foreach ($goods_lists as $key => $value) {
            $goods_list[] = $value;
        }

        for ($i = 0; $i < sizeof($goods_list); $i++) {
            for ($j = $i; $j < sizeof($goods_list); $j++) {
                if ($goods_list[$i]['num'] < $goods_list[$j]['num']) {
                    $temp = $goods_list[$i];
                    $goods_list[$i] = $goods_list[$j];
                    $goods_list[$j] = $temp;
                }
            }
        }

        return $goods_list;

    }

    /**
     * 获取时间范围的订单数据金额详细
     * @param $pa
     * @return array
     */
    public function getTurnoverByTime($pa)
    {
        $data = [
            'sum' => 0,
            'ali_pay' => [
                'num' => 0,
                'bili' => 0,
            ],
            'wx_pay' => [
                'num' => 0,
                'bili' => 0,
            ],
            'vip_pay' => [
                'num' => 0,
                'bili' => 0,
            ],
            'preferential' => [
                'num' => 0,
                'bili' => 0,
            ],
            'card_pay' => [
                'num' => 0,
                'bili' => 0,
            ],
            'money_pay' => [
                'num' => 0,
                'bili' => 0,
            ],
            'beans_amount' => [
                'num' => 0,
                'bili' => 0,
            ],
            'bjsr' => [
                'num' => 0,
                'bili' => 0,
            ], 'goods_sr' => [
                'num' => 0,
                'bili' => 0,
            ]
        ];
        $order = Order::find()->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
            ->andWhere(['status' => 2])
            ->andWhere(['>', 'end_time', strtotime($pa['start_time'])])
            ->andWhere(['<', 'end_time', strtotime($pa['end_time'])])
            ->andWhere(['is_exempt' => 0])
            ->all();
        foreach ($order as $key => $value) {

            if ($value->merge_order_id == 0) {
                $data['sum'] = $data['sum'] + $value['total_amount'];
                $data['wx_pay']['num'] = $data['wx_pay']['num'] + $value['wx_pay'];
                $data['vip_pay']['num'] = $data['vip_pay']['num'] + $value['discount'];
                $data['card_pay']['num'] = $data['card_pay']['num'] + $value['card_pay'];
                $data['ali_pay']['num'] = $data['ali_pay']['num'] + $value['ali_pay'];
                $data['money_pay']['num'] = $data['money_pay']['num'] + $value['cash_amout'];
                $data['preferential']['num'] = $data['preferential']['num'] + $value['coupon_amount'];
                $data['beans_amount']['num'] = $data['beans_amount']['num'] + $value['beans_amount'];
                $data['goods_sr']['num'] = $data['goods_sr']['num'] + ($value['total_amount'] - $value['table_amount']);
                $data['bjsr']['num'] = $data['bjsr']['num'] + $value['table_amount'];
            } else {
                $data['goods_sr']['num'] = $data['goods_sr']['num'] - $value['table_amount'];
                $data['bjsr']['num'] = $data['bjsr']['num'] + $value['table_amount'];
            }
        }
        /**
         * 算比例
         */
        if ($data['sum'] != 0) {
            $data['wx_pay']['bili'] = round(($data['wx_pay']['num'] / $data['sum']) * 100, 2);
            $data['vip_pay']['bili'] = round(($data['vip_pay']['num'] / $data['sum']) * 100, 2);
            $data['card_pay']['bili'] = round(($data['card_pay']['num'] / $data['sum']) * 100, 2);
            $data['ali_pay']['bili'] = round(($data['ali_pay']['num'] / $data['sum']) * 100, 2);
            $data['money_pay']['bili'] = round(($data['money_pay']['num'] / $data['sum']) * 100, 2);
            $data['preferential']['bili'] = round(($data['preferential']['num'] / $data['sum']) * 100, 2);
            $data['beans_amount']['bili'] = round(($data['beans_amount']['num'] / $data['sum']) * 100, 2);
            $data['bjsr']['bili'] = round(($data['bjsr']['num'] / $data['sum']) * 100, 2);
            $data['goods_sr']['bili'] = round(($data['goods_sr']['num'] / $data['sum']) * 100, 2);
        }
        return $data;
    }
}