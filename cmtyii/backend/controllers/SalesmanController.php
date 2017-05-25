<?php

namespace backend\controllers;

use Yii;
use backend\models\Salesman;
use backend\models\search\SalesmanSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * 业务员的控制器代码
 * SalesmanController implements the CRUD actions for Salesman model.
 */
class SalesmanController extends ObjectController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * 业务员列表
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SalesmanSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * 创建一个业务员
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Salesman();
        if(Yii::$app->request->isPost){
            $post = Yii::$app->request->post();
            $post['Salesman']['add_time'] = time();
            $post['Salesman']['shop_total'] = 0;
            if ($model->load($post) && $model->save()) {
                return $this->redirect(['index']);
            }
        }else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * 更新一个业务员
     * @param $id
     * @return string|\yii\web\Response
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * 删除一个业务员
     * @param $id
     * @return \yii\web\Response
     */
    public function actionDelete($id)
    {

        $model = $this->findModel($id);
        $model->scenario ='delete';
        $model->delete();
        return $this->redirect(['index']);
    }

    /**
     * 查找一个业务员的模型
     * @param $id
     * @return static
     * @throws NotFoundHttpException
     */
    protected function findModel($id)
    {
        if (($model = Salesman::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
