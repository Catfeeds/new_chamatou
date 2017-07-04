<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/6/14
 * Time: 20:06
 */

namespace backend\controllers;


use backend\models\Adv;
use yii\web\Response;
class AdvController extends ObjectController
{
    /**
     * 广告列表
     * @return string
     */
    public function actionIndex()
    {
        $model = Adv::find()->all();
        return $this->render('index',['model'=>$model]);
    }


    /**
     * 添加一个广告
     * @return string
     */
    public function actionAdd()
    {
        $model = new Adv();
        if($model->load(\Yii::$app->request->post())){
            if($model->addAdv()){
                $this->redirect(['index']);
            }
        }
        return $this->render('add',['model'=>$model]);
    }

    /**
     *删除一个广告
     */

    public function actionDel()
    {
        \Yii::$app->response->format = Response::FORMAT_JSON;
        $id = \Yii::$app->request->get('id');
        $model = Adv::findOne($id);
        if ($model->delete()){
            return ['code'=>1,'message'=>'删除成功'];
        }
        return ['code'=>0,'message'=>'删除失败'];
    }
}