<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;

/**
 * This is the model class for table "{{%sp_jiaoban}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $start_time
 * @property integer $end_time
 * @property integer $add_time
 * @property integer $auth_user_id
 * @property integer $jieban_user_id
 * @property string $start_amount
 * @property string $end_amount
 * @property string $up_amount
 * @property string $remain_amount
 * @property string $current_amount
 * @property string $cash_total
 * @property string $online_total
 * @property string $beans_total
 * @property string $note
 */
class Jiaoban extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_jiaoban}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'start_time', 'end_time', 'auth_user_id', 'jieban_user_id'], 'integer'],
            [['start_amount', 'end_amount', 'up_amount', 'remain_amount', 'current_amount', 'cash_total', 'online_total', 'beans_total'], 'number'],
            [['note'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'shoper_id' => 'Shoper ID',
            'store_id' => 'Store ID',
            'start_time' => 'Start Time',
            'end_time' => 'End Time',
            'auth_user_id' => 'Auth User ID',
            'jieban_user_id' => 'Jieban User ID',
            'start_amount' => 'Start Amount',
            'end_amount' => 'End Amount',
            'up_amount' => 'Up Amount',
            'remain_amount' => 'Remain Amount',
            'current_amount' => 'Current Amount',
            'cash_total' => 'Cash Total',
            'online_total' => 'Online Total',
            'beans_total' => 'Beans Total',
            'note' => 'Note',
        ];
    }

    /**
     * 交班搜索交班
     * @param $pa
     * @return mixed
     */
    public function search($pa)
    {
        $model = self::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')]);
        if(isset($pa['auth_user_id']) && !empty($pa['auth_user_id'])){
            $model = $model->andWhere(['auth_user_id'=>$pa['auth_user_id']]);
        }

        if(isset($pa['jieban_user_id']) && !empty($pa['jieban_user_id'])){
            $model = $model->andWhere(['jieban_user_id'=>$pa['jieban_user_id']]);
        }

        if(isset($pa['start_time']) && !empty($pa['start_time'])){
            $model = $model->andWhere(['>','end_time',strtotime($pa['start_time'])]);
        }

        if (isset($pa['end_time']) && !empty($pa['end_time'])) {
            $model = $model->andWhere(['<', 'end_time' , strtotime($pa['end_time'])]);
        }

        $count = $model->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>Yii::$app->params['pageSize']]);
        $list = $model->offset($pages->offset)->limit($pages->limit)->all();
        foreach ($list as $key=>$value)
        {
            $list[$key]['start_time'] = date('Y-m-d H:i:s',$value['start_time']);
            $list[$key]['end_time'] = date('Y-m-d H:i:s',$value['end_time']);
            $list[$key]['auth_user_id'] = UsersForm::getUserNameById($value['auth_user_id']);
            $list[$key]['add_time'] = date('Y-m-d H:i:s',$value['add_time']);
            $list[$key]['jieban_user_id'] = UsersForm::getUserNameById($value['jieban_user_id']);
        }
        $data['list'] = $list;
        $data['pageNum'] = $pages->getPageCount();
        $data['pageCount'] = $count;
        return $data;
    }

    /**
     * 获取时间范围的订单数据金额详细
     * @param $pa
     * @return array
     */
    public function getTurnoverByTime($pa)
    {
        $data = [
            'sum'=>0,
            'ali_pay' => 0,
            'wx_pay' => 0,
            'vip_pay' => 0,
            'preferential' => 0,
            'card_pay' => 0,
            'money_pay' => 0,
            'beans_amount' => 0
        ];
        $order = Order::find()->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
            ->andWhere(['status' => 2])
            ->andWhere(['>', 'end_time', strtotime($pa['start_time'])])
            ->andWhere(['<', 'end_time', strtotime($pa['end_time'])])
            ->andWhere(['merge_order_id'=>0])
            ->andWhere(['is_exempt' => 0])
            ->all();
        foreach ($order as $key => $value) {
            $data['sum'] = $data['sum'] + $value['total_amount'];
            $data['wx_pay'] = $data['wx_pay'] + $value['wx_pay'];
            $data['vip_pay'] = $data['vip_pay'] + $value['discount'];
            $data['card_pay'] = $data['card_pay'] + $value['card_pay'];
            $data['ali_pay'] = $data['ali_pay'] + $value['ali_pay'];
            $data['money_pay'] = $data['money_pay'] + $value['cash_amout'];
            $data['preferential'] = $data['preferential'] + $value['coupon_amount'];
            $data['beans_amount'] = $data['beans_amount'] + $value['beans_amount'];
        }
        return $data;
    }

    /**
     * 会员充值记录
     * @param $pa
     * @return array
     */
    public function getVipPayByTime($pa)
    {
        $data = [
            'sum'=>0,
            'ali_pay' => 0,
            'wx_pay' => 0,
            'card_pay' => 0,
            'money_pay' => 0,
            'zs' => 0
        ];
        $order = VipPay::find()->andWhere(['tea_user_id' => \Yii::$app->session->get('tea_user_id')])
            ->andWhere(['>', 'add_time', strtotime($pa['start_time'])])
            ->andWhere(['<', 'add_time', strtotime($pa['end_time'])])->all();
        foreach ($order as $key => $value) {
            if($value->paly_type ==1){
                $data['money_pay'] = $data['money_pay'] + $value['amount'];
            }elseif ($value->paly_type == 2){
                $data['card_pay'] = $data['card_pay'] + $value['amount'];
            }elseif ($value->paly_type == 3){
                $data['wx_pay'] = $data['wx_pay'] + $value['amount'];
            }elseif ($value->paly_type == 4){
                $data['ali_pay'] = $data['ali_pay'] + $value['amount'];
            }
            $data['sum'] = $data['sum'] + $value['amount'];
            $data['sum'] = $data['sum'] + $value['zs'];
            $data['zs'] = $data['zs'] + $value['zs'];
        }
        return $data;
    }

    /**
     * 交班第一个界面显示初始化
     * @return array
     */
    public function initView($datas = '')
    {
        if (empty($datas)) {
            $datas['start_time'] = Yii::$app->request->get('start_time');
            $datas['end_time'] = Yii::$app->request->get('end_time');
        }
        $data['business'] = $this->getTurnoverByTime(['start_time'=>$datas['start_time'],'end_time'=>$datas['end_time']]);
        $data['vip'] = $this->getVipPayByTime(['start_time'=>$datas['start_time'],'end_time'=>$datas['end_time']]);
        $data['sum'] = $data['business']['sum'] + $data['vip']['sum'];
        $data['money_pay'] = $data['business']['money_pay'] + $data['vip']['money_pay'];
        $data['user'] = UsersForm::getUserNameById(Yii::$app->session->get('tea_user_id'));
        return $data;
    }

    /**
     * 交班记录
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $init = $this->initView($data);
        $liucheng = JiaobanConf::Get();
        $this->shoper_id = Yii::$app->session->get('shoper_id');
        $this->store_id = Yii::$app->session->get('store_id');
        $this->start_time = strtotime($data['start_time']);
        $this->end_time = strtotime($data['end_time']);
        $this->auth_user_id = Yii::$app->session->get('tea_user_id');
        $this->jieban_user_id = $data['auth_user_id'];
        $this->add_time = time();
        $this->up_amount = $init['money_pay'];
        $this->current_amount = $init['sum'];
        $this->remain_amount = $liucheng['value'];
        $this->note = $data['note'];
        return $this->save();
    }
}
