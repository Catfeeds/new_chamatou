<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/26
 * Time: 18:41
 */

namespace backend\controllers;


use backend\models\GoodsCat;
use tea\models\Goods;
use yii\web\Controller;
class CategoryController extends Controller
{

    /**
     * 添加分类
     * @return string|\yii\web\Response
     */
    public function actionAdd()
    {
        $model = new GoodsCat();
        if($model->load(\Yii::$app->request->post())){
            if($model->save()){
                return $this->redirect(['category/index']);
            }
        }
        return $this->render('addcat',[
            'model'=>$model
        ]);
    }

    /**
     * 分类列表
     * @return string
     */
    public function actionIndex()
    {
        $goodsModel = new GoodsCat();
        $cates = $goodsModel->getCate();
        //var_dump($cates);die;
        return $this->render('index',['data'=>$cates]);
    }

    /**
     * 修改分类信息
     * @param $id 分类id
     * @return string|\yii\web\Response
     */
    public function actionEdit($id)
    {
        $model = GoodsCat::findOne($id);
        if($model->load(\Yii::$app->request->post()) && $model->save()){
            return $this->redirect(['index']);
        }
        return $this->render('addcat',['model'=>$model]);
    }


    /**
     * 删除分类
     * @param $id
     * @return \yii\web\Response
     * @throws \Exception
     * @throws \Throwable
     */
    public function actionDel($id)
    {
        $model = GoodsCat::findOne($id);
        if($model->delete()){
            \Yii::$app->session->setFlash('success','删除成功');
        }else{
            \Yii::$app->session->setFlash('error','删除失败');
        }
        return $this->redirect(['index']);


    }
}