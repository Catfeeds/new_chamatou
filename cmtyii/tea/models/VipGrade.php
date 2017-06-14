<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_vip_grade}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $name
 * @property string $discount
 */
class VipGrade extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_vip_grade}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id'], 'integer'],
            [['discount'], 'number'],
            [['name'], 'string', 'max' => 64],
            [['shoper_id','store_id','discount','name'],'required','on'=>['create','edit']],
            [['name'],'validateName','on'=>['create','edit']]
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
            'name' => '会员等级名称',
            'discount' => '会员折扣',
        ];
    }
    /**
     * 判断会员等级名称是否存在
     * @param $at
     * @param $param
     * @return bool
     */
    public function validateName($at,$param)
    {
        if(!$this->hasErrors())
        {
            $model = self::find()->andWhere(['shoper_id'=>$this->shoper_id])
                    ->andWhere(['store_id'=>$this->store_id])
                    ->andWhere(['name'=>$this->name])
                    ->select(['id']);
            if($this->scenario == 'edit') {
                $model->andWhere(['!=','id',$this->id]);
            }
            $model = $model->one();
            if($model) {
                $this->addError($at,'会员等级名称存在！');
                return false;
            }
            return true;
        }
        return false;
    }


    /**
     * 创建一个会员等级
     * @param $param
     * @return bool
     */
    public function create($param)
    {
        $this->scenario = 'create';
        $param['shoper_id'] = Yii::$app->session->get('shoper_id');
        $param['store_id'] = Yii::$app->session->get('store_id');
        if($this->load($param,'') && $this->validate())
        {
            return $this->save();
        }
        return false;
    }

    /**
     * 修改一个会员等级
     * @param $param
     * @return bool
     */
    public function edit($param)
    {
        $this->scenario = 'edit';
        $param['shoper_id'] = Yii::$app->session->get('shoper_id');
        $param['store_id'] = Yii::$app->session->get('store_id');
        if($this->load($param,'') && $this->validate())
        {
            return $this->save();
        }
        return false;
    }

    /**
     * 删除一个会员等级
     * @return false|int
     */
    public function del()
    {
        $this->scenario = 'del';
        if(Vip::find()->andWhere(['grade_id'=>$this->id])->select(['id'])->one()){
            $this->addError('id','会员等级不能删除！因为会员等级有会员绑定！');
            return false;
        }
        return $this->delete();
    }

    /**
     * 获取一个会员等级名称
     * @param $gradId
     * @return mixed
     */
    public  static function getGradeName($gradId)
    {
        if(!$name = self::findOne($gradId)){
            return '无会员等级';
        }
        return $name['name'];
    }

    /**
     * 获取所有会员等级
     * @return array|\yii\db\ActiveRecord[]
     */
    public  function getList()
    {
        $model = self::find()
                ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                ->asArray()->all();
        return $model;
    }

    /**
     * 获取会员折扣
     * @param $gradId
     * @return int
     */
    public static function getDiscount($gradId)
    {
        if(!$name = self::findOne($gradId)){
            return 0;
        }
        return $name['discount'];
    }
}
