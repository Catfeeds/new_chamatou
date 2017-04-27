<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/27
 * Time: 13:36
 */

namespace backend\models;


use yii\data\Pagination;
use yii\db\ActiveRecord;

class Goods extends ActiveRecord
{

    public $file;
    public function rules()
    {
        return [
            [['goods_name','cover','content','store','price','spec','add_time','cat_id'],'required'],
            ['price','number'],
            [['store'],'integer'],
            [['file'],'file','skipOnEmpty' => false, 'extensions' => 'png,jpg,gif,jpeg'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'goods_name'  =>  '商品名称',
            'cover'       =>  '商品图片',
            'content'     =>  '商品介绍',
            'store'       =>  '库存',
            'price'       =>  '单价',
            'spec'        =>  '规格',
            'cat_id'      =>  '所属分类'
        ];
    }

    /**
     * 定义商品和分类的关联关系
     * @return \yii\db\ActiveQuery
     */
    public function getCate()
    {
        return $this->hasOne(GoodsCat::className(), ['id' => 'cat_id']);
    }

    /**
     * 获取重构后的分类数组
     * @return array
     */
    public function getCat()
    {
        $catModel = new GoodsCat();
        $cates = $catModel->arrCat();
        return $cates;
    }

    /**
     * 处理商品上传图片
     * @return bool
     */
    public function upload()
    {
        if($this->file){
            $fileName = '/upload/goods'.date('Ymd',time()).rand(100,999).'.'.$this->file->extension;
            if($this->file->saveAs(\Yii::getAlias('@webroot').$fileName,false)){
                $this->cover = $fileName;
                return true;
            }
        }
        return false;
    }


    public function getList()
    {
        $cates = $this->getCat();
        //实例化搜索类
        $searchModel = new GoodsSearch();
        $query = Goods::find()->where(['status'=>0]);
        //获取搜索数据
        $data = \Yii::$app->request->get($searchModel->formName());
        //将搜索数据加载到搜索模型
        if($data){
            foreach ($data as $k=>$v){
                $searchModel->$k = $v;
            }
            //拼接搜索条件
            if($searchModel->goods_name){
                $query->andWhere(['like', 'goods_name', $searchModel->goods_name]);
            }
            if($searchModel->cat_id){
                $query->andWhere(['=','cat_id',$searchModel->cat_id]);
            }
        }
        //统计总条数
        $count = $query->count();
        $pageSize = \Yii::$app->params['pageSize'];
        //实例化分页类
        $pager = new Pagination(['totalCount'=>$count,'pageSize'=>$pageSize]);
        $models = $query->offset($pager->offset)->limit($pager->limit)->all();
        return [
            'models' => $models,
            'pager'  => $pager,
            'cate'   => $cates,
            'searchModel' => $searchModel,
        ];
    }
}