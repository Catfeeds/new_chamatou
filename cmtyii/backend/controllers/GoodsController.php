<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/27
 * Time: 13:35
 */

namespace backend\controllers;


use backend\models\Goods;
use backend\models\GoodsCat;
use backend\models\search\GoodsSearch;
use yii\console\Response;
use yii\data\Pagination;
use yii\web\Controller;
use yii\web\UploadedFile;

class GoodsController extends ObjectController
{

    /**
     * 商品列表
     * @return string
     */
    public function actionIndex()
    {
        $goodsModel = new Goods();
        //获取数据
        $data = $goodsModel->getList();
        return $this->render('index', [
            'models' => $data['models'],//数据对象
            'pager' => $data['pager'],//分页对象
            'searchModel' => $data['searchModel'],//搜索模型
            'cate' => $data['cate'],//所有的分类(数组)  提供给列表页作搜索的选择
        ]);
    }


    /**
     * 添加商品
     * @return string|\yii\web\Response
     */
    public function actionAdd()
    {
        $goodsModel = new Goods();
        if ($goodsModel->load(\Yii::$app->request->post())) {
            //将上传图片加载到模型对象上
            $goodsModel->file = UploadedFile::getInstance($goodsModel, 'file');
            //调用模型方法处理图片
            if ($goodsModel->upload()) {
                $goodsModel->add_time = time();
                //$goodsModel->content = serialize($goodsModel->content);
                if ($goodsModel->save(false)) {
                    return $this->redirect(['index']);
                }
            }
        }
        //查出商品分类  已数组形式返回到页面做下拉选择
        $cate = $goodsModel->getCat();
        //删除分类数组中第一个所有分类的元素
        return $this->render('add', [
            'model' => $goodsModel,
            'cate' => $cate,
        ]);
    }


    public function actionEdit($id)
    {
        $model = Goods::findOne($id);
        if($model->load(\Yii::$app->request->post())){
            //将上传图片加载到模型对象上
            $model->file = UploadedFile::getInstance($model, 'file');
            //调用模型方法处理图片
            if ($model->upload()) {
                if ($model->save(false)) {
                    return $this->redirect(['index']);
                }
            }
        }
        //查出商品分类  已数组形式返回到页面做下拉选择
        $cate = $model->getCat();
        //删除分类数组中第一个所有分类的元素
        return $this->render('add',[
            'model'=>$model,
            'cate' =>$cate,
        ]);
    }


    /**
     * 删除商品
     * @param $id
     * @return \yii\web\Response
     * @throws \Exception
     * @throws \Throwable
     */
    public function actionDel($id)
    {
        $model = Goods::findOne($id);
        if($model->delete()){
            \Yii::$app->session->setFlash('success','删除成功');
        }else{
            \Yii::$app->session->setFlash('error','删除失败');
        }
        return $this->redirect(['index']);
    }

    public function actionShangjia()
    {
        \Yii::$app->response->format=\yii\web\Response::FORMAT_JSON;
        $data = \Yii::$app->request->post();
        $model = new Goods();
        $re = $model->setSale($data);
        return $re;
    }


//    public function actionDetail($id)
//    {
//        $goods = Goods::findOne($id);
//        return $this->render('detail',['goods'=>$goods]);
//    }
}