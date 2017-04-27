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
use backend\models\GoodsSearch;
use yii\data\Pagination;
use yii\web\Controller;
use yii\web\UploadedFile;

class GoodsController extends  Controller
{

    public function actionIndex()
    {
        $goodsModel = new Goods();
        $data = $goodsModel->getList();
        return $this->render('index',[
            'models'=>$data['models'],
            'pager'=>$data['pager'],
            'searchModel'=>$data['searchModel'],
            'cate' => $data['cate'],
        ]);
    }
    

    /**
     * 添加商品
     * @return string|\yii\web\Response
     */
    public function actionAdd()
    {
        $goodsModel = new Goods();
        if($goodsModel->load(\Yii::$app->request->post())){
            $goodsModel->file = UploadedFile::getInstance($goodsModel,'file');
            if($goodsModel->upload()){
                $goodsModel->add_time = time();
                if($goodsModel->save(false)){
                  return $this->redirect(['index']);
                }
            }
        }
        $model = new GoodsCat();
        $cate = $model->arrCat();
        array_shift($cate);
        return $this->render('add',[
            'model'=> $goodsModel,
            'cate' => $cate,
        ]);
    }
}