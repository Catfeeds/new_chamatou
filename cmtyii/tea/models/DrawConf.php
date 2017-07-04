<?php

namespace tea\models;

use function GuzzleHttp\Promise\exception_for;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%sp_draw_conf}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $prize
 * @property integer $number
 * @property integer $status
 */
class DrawConf extends \yii\db\ActiveRecord
{
    /**
     * 开启状态
     */
    const STATUS_TRUE = 1;

    /**
     * 关闭状态
     */
    const STATUS_FALSE = 0;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_draw_conf}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'shoper_id', 'store_id', 'status','number'], 'integer'],
            [['prize'],'safe'],
            [['status'],'in','range'=>[0,1]],
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
            'status' => 'Status',
        ];
    }

    /**
     * 设置状态
     * @param string $status
     * @return bool|string
     */
    public function setStatus($status = '')
    {
        if($status == ''){
            if($this->status == self::STATUS_TRUE)
                $this->status = self::STATUS_FALSE;
            else
                $this->status = self::STATUS_TRUE;
            return true;
        }
        return $this->status = $status;
    }

    /**
     * 添加一个规则
     * @param $param
     * @return bool
     */
    public function create($param)
    {
        $this->prize  = serialize($param['prize']);
        if ($this->load($param, '') && $this->validate())
        {
            $this->prize     = serialize($param['prize']);
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id  = Yii::$app->session->get('store_id');
            return $this->save();
        }
        return false;
    }

    /**
     * 获取我的配置信息
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function getInfo()
    {
        return DrawConf::find()
               ->andWhere(['shoper_id' => \Yii::$app->session->get('shoper_id')])
               ->andWhere(['store_id' => \Yii::$app->session->get('store_id')])
               ->one();
    }

    /**
     * 获取大转盘信息
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function getDaZhuanBanInfo()
    {
        $drawConf = DrawConf::getInfo();
        $list = [];
        if ($drawConf) {
            $drawConf['prize'] = unserialize($drawConf['prize']);
            $drawConf = ArrayHelper::toArray($drawConf);
            foreach ($drawConf['prize'] as $key => $value) {
                $temp = Draw::findOne($value['key']);
                $list[$key] = $value;
                $drawConf['prize'][$key] = $temp->name;
            }
            \Yii::$app->session->set('drawList', $list);
            unset($list);
            unset($temp);
        } else {
            $drawConf['status'] = 0;
        }
        return $drawConf;
    }
}
