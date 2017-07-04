<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_unit}}".
 *
 * @property integer $id
 * @property string $name
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $time
 */
class Unit extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_unit}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id'], 'integer'],
            [['name'], 'string', 'max' => 6],
            [['name'],'validateExistName','on'=>['add','edit']],
            [['name'],'validateUseIng','on'=>['del']],
            [['time'],'safe'],
        ];
    }

    /**
     * 判断单元是是否存在
     * @param $atr
     * @param $par
     */
    public function validateExistName($atr,$par)
    {
        if(!$this->hasErrors())
        {
            $data = self::find()->andWhere(['name'=>$this->name])
                    ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')]);

            if($this->scenario == 'edit'){
                $data = $data->andWhere(['!=','id',$this->id]);
            }
            $data = $data->select(['id'])->one();

            if($data) {
                return $this->addError($atr,Yii::t('app','unit_name_exist'));
            }
        }
    }

    /**
     * 判断能不能删除
     * @param $atr
     * @param $par
     */
    public function validateUseIng($atr,$par)
    {
        if(!$this->hasErrors())
        {
            $data = Goods::find()->where(['unit'=>$this->name])
                    ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                    ->one();
            if($data) {
                return $this->addError($atr,Yii::t('app','unit_name_use_ing'));
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
            'name' => 'Name',
            'shoper_id' => 'Shoper ID',
            'store_id' => 'Store ID',
        ];
    }

    /**
     * 添加一个单元
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $this->scenario = 'add';
        if($this->load($data,'') && $this->validate())
        {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id  = Yii::$app->session->get('store_id');
            $this->time      = time();
            return $this->save();
        }
    }


    /**
     * 修改一个单元
     * @param $data
     * @return bool
     */
    public function edit($data)
    {
        $this->scenario = 'edit';
        if($this->load($data,'') && $this->validate())
        {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id  = Yii::$app->session->get('store_id');
            return $this->save();
        }
    }
    /**
     * 删除一个单元
     * @return bool
     */
    public function del()
    {
        $this->scenario = 'del';
        if($this->validate())
        {
            return $this->delete();
        }
    }

    /**
     * 返回所有使用中的单位
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getAll($select = [])
    {
        if($select == []){
            $select =['id','name'];
        }
        $list = self::find()
            ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
            ->select($select)
            ->asArray()
            ->all();
        return $list;
    }
}
