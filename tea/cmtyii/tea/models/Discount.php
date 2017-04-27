<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_discount}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $min_money
 * @property string $max_money
 * @property string $discount_money
 * @property integer $time
 * @property integer $manage_id
 */
class Discount extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_discount}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'min_money', 'max_money', 'discount_money'], 'required','on'=>['add']],
            [['min_money', 'max_money', 'discount_money'], 'required','on'=>['edit']],
            [['shoper_id', 'store_id', 'time', 'manage_id'], 'integer'],
            [['min_money', 'max_money', 'discount_money'], 'number'],
        ];
    }

    /**
     * 获取优惠的列表
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getList()
    {
        $data = self::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                    ->select(['id','min_money','max_money','discount_money'])
                    ->all();
        return $data;
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
            'min_money' => 'Min Money',
            'max_money' => 'Max Money',
            'discount_money' => 'Discount Money',
            'time' => 'Time',
            'manage_id' => 'Manage ID',
        ];
    }

    /**
     * 添加一个计费规则
     * @param $data
     * @return bool
     */
    public function add($data )
    {
        $this->scenario = 'add';
        $data['shoper_id'] = Yii::$app->session->get('shoper_id');
        $data['store_id']  = Yii::$app->session->get('store_id');
        $data['time']      = time();
        if($this->load($data,'') && $this->validate())
        {
            $this->manage_id = Yii::$app->session->get('tea_user_id');
            return $this->save();
        }
    }

    /**
     * 修改
     * @param $data
     * @return bool
     */
    public function edit($data)
    {
        $this->scenario = 'edit';
        if($this->load($data,'') && $this->validate()){
            return $this->save();
        }
    }
}
