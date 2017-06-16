<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_draw}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $probability
 * @property string $name
 * @property integer $type
 * @property integer $number
 */
class Draw extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_draw}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'probability', 'type'], 'integer'],
            [['number'],'number'],
            [['name'], 'string', 'max' => 32],
            [['type'],'in','range'=>[1,2,3,4,5,6]]
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
            'probability' => 'Probability',
            'name' => 'Name',
            'type' => 'Type',
        ];
    }

    /**
     * 创建一个奖品
     * @param $param
     * @return bool
     */
    public function create($param)
    {

        if ($this->load($param, '') && $this->validate()) {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            if($this->number >= 10){
                $this->addError('number','折扣不能大于10');
                return false;
            }

            if($this->number < 0.1){
                $this->addError('number','折扣不小于等于10！');
                return false;
            }
            return $this->save();
        }
    }

    /**
     * 修改一个奖品
     * @param $param
     * @return bool
     */
    public function edit($param)
    {
        if ($this->load($param, '') && $this->validate()) {
            return $this->save();
        }
    }

    /**
     * 获取所有规则
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getList()
    {
        $data = self::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                ->asArray()
                ->all();
        return $data;
    }

}
