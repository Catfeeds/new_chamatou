<?php

namespace tea\models;

use frontend\models\DrawRecord;
use Yii;
use yii\data\Pagination;

/**
 * This is the model class for table "{{%sp_draw_card}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $user_id
 * @property string $name
 * @property integer $sn
 * @property integer $status
 * @property integer $add_time
 * @property integer $end_time
 * @property integer $type
 * @property integer $number
 * @property integer $draw_id
 */
class DrawCard extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_draw_card}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'shoper_id', 'store_id','type','user_id', 'sn', 'status', 'add_time', 'end_time'], 'integer'],
            [['name'], 'string', 'max' => 120],
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
            'user_id' => 'User ID',
            'name' => 'Name',
            'sn' => 'Sn',
            'status' => 'Status',
        ];
    }

    /**
     * 搜索中奖列表
     * @param $param
     * @return mixed
     */
    public function search($param)
    {
        $model = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')]);
        if (isset($param['keyword']) && !empty($param['keyword'])) {
            $model->andWhere(['sn' => $param['keyword']]);
        }

        $count = $model->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);
        $list = $model->limit($pages->limit)->offset($pages->offset)->all();
        foreach ($list as $key => $value) {
            $list[$key]['add_time'] = date('Y-m-d H:i:s', $value['add_time']);
            $list[$key]['end_time'] = date('Y-m-d H:i:s', $value['end_time']);

        }
        $data['pageCount'] = $count;
        $data['pageNum'] = $pages->getPageCount();
        $data['list'] = $list;
        return $data;
    }

    /**
     * 获取抽奖的结构
     */
    public function getChouJiangResult()
    {
        $user = \Yii::$app->session->get('wx_user');
        //奖品获取
        DrawConf::getDaZhuanBanInfo();
        $prize = $proArr = Yii::$app->session->get('drawList');
        if (empty($prize))
            return $this->addError('id', '非法访问');


        /**
         * 检查是不是必中用户、判断是不是茶豆币、判断奖品是不是今日最大值、判断奖品数量余额是否足够、
         */
        foreach ($prize as $key => $value) {

            $drawModel = Draw::findOne($value['key']);

            /**
             * 检查是不是茶豆币
             */
            if ($drawModel->type == 1)
            {
                $beansIncom = Shoper::getBeansIncom();
                if ($beansIncom < $drawModel->number)
                {
                    $proArr[$key] = 0;
                }
                continue;
            }
            /**
             * 指定用户中奖
             */
            if($drawModel->winning_phone == $user['phone']){
                $proArr[$key] = 100;
                continue;
            }

            /**
             * 判断是不是谢谢惠顾
             */
            if($drawModel->type == 5){
                $proArr[$key] = $value['odds'];
                continue;
            }
            /**
             * 检查数量是否还存在
             */
            if ( $drawModel->prize_surplus_number == $drawModel->prize_sum_number )
            {
                $proArr[$key] = 0;
                continue;
            }

            /**
             * 判断每日最大出奖数量
             */
            $dayMaxPrizeNumber = DrawCard::find()->andWhere(['draw_id'=>$drawModel->id])
                ->andWhere(['>','add_time',time()])
                ->andWhere(['<','add_time',strtotime(date('Y-m-d').'00:00:00')])
                ->count();
            if( $drawModel->day_max_prize_number <= $dayMaxPrizeNumber)
            {
                $proArr[$key] = 0;
                continue;
            }

            $proArr[$key] = $value['odds'];
        }

        $key        = $this->get_rand($proArr);
        $drawModel  = Draw::findOne($prize[$key]['key']);
        if ($drawModel->type !== 5)
        {

            if ($drawModel->type == 1)
            {
                $this->addDrawCard([
                    'name'      => $drawModel->name . '--' . $drawModel->number.'个',
                    'status'    => 1,
                    'end_time'  => time(),
                    'type'      => $drawModel->type,
                    'number'    => $drawModel->number,
                    'user_id'   => $user['id'],
                    'draw_id'   => $drawModel->id,
                ]);
            }
            elseif($drawModel->type == 2)
            {
                $this->addDrawCard([
                    'name'      => $drawModel->name . '--' . $drawModel->number.'折',
                    'status'    => 0,
                    'type'      => $drawModel->type,
                    'number'    => $drawModel->number,
                    'user_id'   => $user['id'],
                    'draw_id'   => $drawModel->id,
                ]);
            }
            elseif($drawModel->type == 3)
            {
                $this->addDrawCard([
                    'name'      => $drawModel->name . '--' . $drawModel->number.'元',
                    'status'    => 0,
                    'type'      => $drawModel->type,
                    'number'    => $drawModel->number,
                    'user_id'   => $user['id'],
                    'draw_id'   => $drawModel->id,
                ]);
            }
            else
            {
                $this->addDrawCard([
                    'name'      => $drawModel->name . 'x' . $drawModel->number,
                    'status'    => 0,
                    'type'      => $drawModel->type,
                    'number'    => $drawModel->number,
                    'user_id'   => $user['id'],
                    'draw_id'   => $drawModel->id,
                ]);
            }
            $drawModel->prize_surplus_number += 1;
            $drawModel->save();
        }
        Yii::$app->session->remove('drawList');

        (new DrawRecord)->add();
        return ['name'=>$drawModel->name,'type'=>$drawModel->type];
    }

    /**
     * 添加抽奖奖项
     * @param $param
     * @return bool
     */
    private function addDrawCard($param)
    {
        $this->shoper_id = Yii::$app->session->get('shoper_id');
        $this->store_id  = Yii::$app->session->get('store_id');
        $this->user_id   = $param['user_id'];
        $this->name      = $param['name'];
        $this->sn        = time().mt_rand(0,99);
        $this->status    = $param['status'];
        $this->add_time  = time();
        $this->end_time  = isset($param['end_time']) ? $param['end_time'] : '';
        $this->type      = $param['type'];
        $this->number    = $param['number'];
        $this->draw_id   = $param['draw_id'];
        return $this->save();
    }

    /**
     * 获取总奖的数量
     * @param $proArr
     * @return int|string
     */
    function get_rand($proArr)
    {
        $result = '';
        $proSum = array_sum($proArr);
        foreach ($proArr as $key => $proCur)
        {
            if($proSum == 0)
                break;
            $randNum = mt_rand(1, $proSum);
            if ($randNum <= $proCur)
            {
                $result = $key;
                break;
            }
            else
            {
                $proSum -= $proCur;
            }
        }

        unset ($proArr);
        return $result;
    }


}
