<?php

namespace tea\models;

use phpDocumentor\Reflection\Types\This;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%sp_goods_cate}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $pid
 * @property string $cate_name
 */
class GoodsCate extends \yii\db\ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_goods_cate}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cate_name'],'required','on'=>['addCategory','editCategory']],
            [['shoper_id', 'pid'], 'integer'],
            [['cate_name'], 'string', 'max' => 100],
            [['cate_name'],'validateCateName','on'=>['addCategory','editCategory']],
            [['cate_name'],'validateUseIng','on'=>['delCategory']],
        ];
    }

    /**
     * 验证分类是否存在
     * @param $atr
     * @param $par
     */
    public function validateCateName($atr,$par)
    {
        if(!$this->hasErrors())
        {
            $data = self::find()->andWhere(['cate_name'=>$this->cate_name])
                        ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                        ->andWhere(['store_id'=>Yii::$app->session->get('store_id')]);

            if($this->scenario == 'editCategory'){
                $data = $data->andWhere(['!=','id',$this->id]);
            }

            $data = $data->select(['id'])->one();

            if($data){
                return $this->addError($atr,Yii::t('app','goods_cate_name_exist'));
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
            if($this->getGoodsArray()) {
                return $this->addError($atr,Yii::t('app','goods_cate_name_use_ing'));
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
            'shoper_id' => 'Shoper ID',
            'pid' => 'Pid',
            'cate_name' => 'Cate Name'
        ];
    }

    /**
     * 关联查询所有商品数据 ,返回ActiveRecord
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getGoodsAR($select = [])
    {
        if(empty($select)) {
            $select = ['id','cate_id','goods_name','stock','warning_store',
                        'sales_price','spec','note','status','unit','give'];
        }
        return $this->hasMany(Goods::className(),['cate_id'=>'id'])->select($select)->all();
    }

    /**
     * 关联查询所有商品数据，返回数组
     * @param array $select
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getGoodsArray($select = [])
    {

        if(empty($select)) {
            $select = ['id','cate_id','goods_name','stock','warning_store',
                        'sales_price','spec','note','status','unit','give'];
        }
        return $this->hasMany(Goods::className(),['cate_id'=>'id'])->select($select)->asArray()->all();
    }

    /**
     * 获取当前登录用户的所有商品分类
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getAll($select = [])
    {
        if($select == []){
            $select =['id','cate_name'];
        }

        $list = self::find()
                    ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                    ->select($select)
                    ->all();

        return $list;
    }

    /**
     * 获取当前登录用户的所有商品分类
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getAlls($select = [])
    {
        $data =$this->getAll($select);
        $list = $this->setCateGoodsNum($data);
        return $list;
    }

    /**
     * 获取分类下有多少个商品
     * $cate_id == 0时，$cate_id =
     * @param int $cate_id
     * @return int|string
     */
    public function getGoodsNum($cate_id = 0)
    {
        if($cate_id == 0) {
            $cate_id = $this->id;
        }

        $goodsModel = Goods::find()->where(['cate_id'=>$cate_id]);
        $goodsNum   = $goodsModel->count();
        return $goodsNum;
    }

    /**
     * 编辑并添加分类的商品个数
     * @param $data
     * @return array
     */
    public function setCateGoodsNum($data)
    {
        if(empty($data)){
            return $data;
        }

        $data = ArrayHelper::toArray($data);
        foreach ($data as $key=>$value){
            $data[$key]['goods_num'] = $this->getGoodsNum($value['id']);
        }

        return $data;
    }

    /**
     * 获取所有商品分类及其分类下的商品
     * @return array
     */
    public function getAllCateAndGoods()
    {
        $cateAll = $this->getAll();
        $cateAllArray = ArrayHelper::toArray($cateAll);
        foreach ($cateAll as $key=>$value){
            $cateAllArray[$key]['goods_list'] = $value->getGoodsArray();
        }
        $cateAllArray = $this->setCateGoodsNum($cateAllArray);
        return $cateAllArray;
    }

    /**
     * 添加一个商品分类
     * @param array $data
     * @return bool
     */
    public function addCategory($data = [])
    {
        $this->scenario = 'addCategory';
        if($this->load($data,'') && $this->validate())
        {
            $this->pid = 0;
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            return $this->save();
        }
    }
    /**
     * 修改一个商品分类
     * @param array $data
     * @return bool
     */
    public function editCategory($data = [])
    {
        $this->scenario = 'editCategory';
        if($this->load($data,'') && $this->validate())
        {
            $this->pid = 0;
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            return $this->save();
        }
    }

    /**
     * 删除商品分类
     * @return false|int
     */
    public function delCategory()
    {
        $this->scenario = 'delCategory';
        if($this->validate())
        {
            return $this->delete();
        }
    }
}
