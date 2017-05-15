<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/27
 * Time: 13:36
 */

namespace backend\models;


use backend\models\search\GoodsSearch;
use yii\data\Pagination;
use yii\db\ActiveRecord;
use yii\helpers\FileHelper;

class Goods extends ActiveRecord
{

    public $file;

    public function rules()
    {
        return [
            [['goods_name', 'cover', 'store', 'price', 'spec', 'add_time', 'cat_id','content'], 'required'],
            ['price', 'number'],
            [['store'], 'integer'],
            ['cat_id', 'compare', 'compareValue' => 0, 'operator' => '>','message'=>'请选择分类'],
            [['file'], 'file', 'extensions' => 'png,jpg,gif,jpeg'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'goods_name' => '商品名称',
            'cover' => '商品图片',
            'content' => '商品介绍',
            'store' => '库存',
            'price' => '单价',
            'spec' => '单位',
            'cat_id' => '所属分类'
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
        if ($this->file) {
            $fileDir = FileHelper::createDirectory('./upload/' . date('Ymd', time()),0777);
            if($fileDir){
                $fileName ='/upload/' . date('Ymd', time()) .'/' .date('Ymd', time()). rand(100, 999) . '.' . $this->file->extension;
                if ($this->file->saveAs(\Yii::getAlias('@webroot') . $fileName, false)) {
                    $this->cover = $fileName;
                    return true;
                }else{
                    return false;
                }
            }
            //var_dump($fileName);die;
        }
        return true;
    }

    /**
     * 根据条件分页获取商品
     * @return array
     */
    public function getList()
    {
        $cates = $this->getCat();
        //实例化搜索类
        $searchModel = new GoodsSearch();
        $query = Goods::find()->orderBy('Id desc');
        //获取搜索数据
        $data = \Yii::$app->request->get($searchModel->formName());
        //将搜索数据加载到搜索模型
        if ($data) {
            foreach ($data as $k => $v) {
                $searchModel->$k = $v;
            }
            //拼接搜索条件
            if ($searchModel->goods_name) {
                $query->andWhere(['like', 'goods_name', $searchModel->goods_name]);
            }
            if ($searchModel->cat_id) {
                $query->andWhere(['=', 'cat_id', $searchModel->cat_id]);
            }
            if(!empty($searchModel->status)){
                $query->andWhere(['=','status',$searchModel->status]);
            }
        }
        //统计总条数
        $count = $query->count();
        $pageSize = \Yii::$app->params['pageSize'];
        //实例化分页类
        $pager = new Pagination(['totalCount' => $count, 'pageSize' => $pageSize]);
        $models = $query->offset($pager->offset)->limit($pager->limit)->all();
        return [
            'models' => $models,
            'pager' => $pager,
            'cate' => $cates,
            'searchModel' => $searchModel,
        ];
    }

    /**
     * 处理上下架逻辑
     * @param $data
     */
    public function setSale($data)
    {
        $status = $data['status']==1 ? 2 : 1;
        $model = Goods::findOne($data['id']);
        $model->status = $status;
        if($model->save(false)){
            $data = [
                'status' => 1,
                'msg'    => '操作成功!',
            ];
        }else{
            $data = [
                'status'  => 0,
                'msg'     => '操作失败!'
            ];
        }

        return $data;
    }
}