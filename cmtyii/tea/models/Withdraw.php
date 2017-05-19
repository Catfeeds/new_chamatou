<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;

/**
 * This is the model class for table "{{%withdraw}}".
 *
 * @property integer $Id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $amount
 * @property integer $status
 * @property string $note
 * @property integer $add_time
 */
class Withdraw extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%withdraw}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['amount'],'required'],
            [['shoper_id', 'status','store_id' ,'add_time'], 'integer'],
            [['amount'], 'number'],
            [['note'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'shoper_id' => 'Shoper ID',
            'amount' => 'Amount',
            'status' => 'Status',
            'note' => 'Note',
            'add_time' => 'Add Time',
        ];
    }


    /**
     * 添加一个体现申请
     * @param $pa
     * @return bool
     */
    public function add($pa)
    {
        if ($this->load($pa, '') && $this->validate()) {
            if ($this->amount > Shoper::getBeansIncom()) {
                $this->addError('id','超出现有的茶豆币！');
                return false;
            }
            $shoper = Shoper::findOne(Yii::$app->session->get('shoper_id'));
            if($shoper->beans_incom < $this->amount){
                $this->addError('id','茶豆币不足！');
                return false;
            }
            $shoper->beans_incom = $shoper->beans_incom-$this->amount;
            $shoper->save();
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            $this->add_time = time();
            $this->status = 0;
            return $this->save();
        }
    }

    /**
     * 搜索提现记录
     * @param $pa
     * @return mixed
     */
    public function search($pa)
    {
        $model = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->orderBy("Id DESC");
        if(isset($pa['start_time'])){
            $model = $model->andWhere(['>','add_time',strtotime($pa['start_time'])]);
        }

        if(isset($pa['end_time'])){
            $model = $model->andWhere(['>','add_time',strtotime($pa['end_time'])]);
        }
        $count = $model->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($pages->offset)->limit($pages->limit)->all();
        foreach ($data as $key=>$value)
        {
            $data[$key]['add_time'] = date('Y-m-d H:i:s',$value['add_time']);
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $pages->getPageCount();
        $datas['list'] = $data;
        return $datas;
    }
}
