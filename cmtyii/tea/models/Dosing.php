<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;

/**
 * This is the model class for table "{{%sp_dosing}}".
 *
 * @property integer $id
 * @property string $name
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $number
 * @property string $unit
 * @property string $time
 * @property string $stock
 * @property string $stock_warning
 */
class Dosing extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_dosing}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id','stock','time','stock_warning'], 'integer'],
            [['name'], 'string', 'max' => 64],
            [['number'], 'string', 'max' => 32],
            [['unit'], 'string', 'max' => 255],
            [['name','unit'],'required','on'=>['add','edit']],
            [['number'],'validateNumber','on'=>['add','edit']],
            [['unit'],'validateUnitExist','on'=>['add','edit']],
            [['name'],'validateName','on'=>['add','edit']],
            [['name'],'validateDel','on'=>['del']],
        ];
    }

    public function validateDel($atr,$par)
    {
        if(!$this->hasErrors()){
            $data = GoodsToDosing::find()->where(['dosing_id'=>$this->id])->select(['id'])->one();
            if($data){
                return $this->addError($atr,Yii::t('app','dosing_use_ing'));
            }
        }
    }


    /**
     * 判断编号是否存在
     * @param $atr
     * @param $par
     */
    public function validateNumber($atr,$par)
    {
        if(!$this->hasErrors()){
            $data = self::find()
                ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                ->andWhere(['number'=>$this->name]);

            if($this->scenario == 'edit'){
                $data = $data->andWhere(['!=','id',$this->id]);
            }

            $data = $data->select(['id'])->one();
            if($data){
                return $this->addError($atr,Yii::t('app','dosing_number_exist'));
            }
        }
    }

    /**
     * 判断单位是否存在
     * @param $atr
     * @param $par
     */
    public function validateUnitExist($atr,$par)
    {
        if(!$this->hasErrors()){
             $data = Unit::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                 ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                 ->andWhere(['name'=>$this->unit])
                 ->select(['id'])->one();

             if(empty($data)){
                 return $this->addError($atr,Yii::t('app','dosing_unit_not_exist'));
             }
        }
    }

    /**
     * 判断原料是否重复
     * @param $atr
     * @param $par
     */
    public function validateName($atr,$par)
    {
        if(!$this->hasErrors()){
            $data = self::find()
                    ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                    ->andWhere(['name'=>$this->name]);


            if($this->scenario == 'edit'){
                $data = $data->andWhere(['!=','id',$this->id]);
            }

            $data = $data->select(['id'])->one();
            if($data){
                return $this->addError($atr,Yii::t('app','dosing_name_exist'));
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
            'number' => '编号',
            'unit' => 'Unit Name',
            'time' => 'Time',
        ];
    }

    /**
     * 添加一个原料分类
     * @param array $data
     * @return bool
     */
    public function add($data = [])
    {
        $this->scenario = 'add';
        if($this->load($data,'') && $this->validate())
        {
            $this->time  = time();
            $this->stock = 0;
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            return $this->save();
        }
    }

    /**
     * 修改一个原料分类
     * @param array $data
     * @return bool
     */
    public function edit($data = [])
    {
        $this->scenario = 'edit';
        if($this->load($data,'') && $this->validate())
        {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            return $this->save();
        }
    }

    /**
     * 获取所有的原料数据
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getAll($select = [])
    {
        if(empty($select)){
            $select = ['id','name','unit','stock_warning','number'];
        }

        $lsit = self::find()
                ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                ->select($select)
                ->all();
        return $lsit;
    }

    /**
     * 获取所有的原料数带分页版本
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getAllPage($select = [])
    {
        if(empty($select)){
            $select = ['id','name','unit','stock_warning','number'];
        }

        $list = self::find()
                ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                ->select($select);
        $count = $list->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>Yii::$app->params['pageSize']]);
        $list  = $list->offset($pages->offset)->limit($pages->limit)->all();
        $data['pageNum'] = $pages->getPageCount();
        $data['count']   = $count;
        $data['list']    = $list;
        return $data;
    }

    /**
     * 删除
     * @return false|int
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
     * 根据Dosing_id来获取一个原料的名称
     * @param $dosing_id
     * @return mixed|string
     */
    public static function getDosingNameById($dosing_id)
    {
        $data = self::find()->where(['id'=>$dosing_id])->select(['name'])->one();
        if($data){
            return $data->name;
        }
        return '';
    }

    /**
     * 修改库存数量
     * @param $number
     * @return bool
     */
    public function setStockNum($number)
    {
        if ($number == '') {
            $this->addError('id', Yii::t('app', 'model')['required']);
            return false;
        }

        if($number < 0){
            $temp = abs($number);
            if( $temp > $this->stock ) {
                $msg = $this->name . Yii::t('app', 'stock_min_stock');
                $this->addError('id', $msg);
                return false;
            }
        }
        $this->stock = $this->stock+$number;
        return $this->save();
    }

}
