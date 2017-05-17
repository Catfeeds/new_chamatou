<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_goods_to_dosing}}".
 *
 * @property integer $id
 * @property integer $goods_id
 * @property integer $dosing_id
 * @property integer $number
 */
class GoodsToDosing extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_goods_to_dosing}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['goods_id'], 'required'],
            [['goods_id', 'dosing_id', 'number'], 'integer'],
            [['goods_id','dosing_id','number'],'required'],
            [['dosing_id'],'validateDosing','on'=>['add']]
        ];
    }

    public function validateDosing($attribute,$params)
    {
        if(!$this->hasErrors())
        {
            $data  = Dosing::findOne($this->dosing_id);
            if(!$data){
                return $this->addError($attribute,Yii::t('app','dosing_unit_not_exist').$this->dosing_id);
            }
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'goods_id' => 'Goods ID',
            'dosing_id' => 'Dosing ID',
            'number' => 'Number',
        ];
    }

    /**
     * 添加一个商品关联关系
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $this->scenario = 'add';
        if($this->load($data,'') && $this->validate())
        {
            return $this->save();
        }
    }

    /**
     * 通过商品ID删除关联关系
     * @param $goods_id
     * @return bool
     */
    public function delByGoodsId($goods_id)
    {
        $data = self::find()->andWhere(['goods_id'=>$goods_id])->all();
        if($data)
        {
            foreach ($data as $key=>$val){
                if(!$val->delete()){
                    return false;
                }
            }
        }
        return true;
    }

    /**
     * 获取库存
     * @param $goods_id
     * @return array|bool|null
     */
    public static function getGoodsStock($goods_id)
    {
        $data = self::find()->andWhere(['goods_id'=>$goods_id])->all();
        if($data)
        {
            $stock = [];
            foreach ($data as $key=>$val){
                $dosing  = Dosing::find()->andWhere(['id'=>$val['dosing_id']])->select(['stock'])->one();
                $stock[] = $dosing->stock/$val['number'];
            }
            sort($stock);
            return $stock[0];
        }
        return '-';
    }
}
