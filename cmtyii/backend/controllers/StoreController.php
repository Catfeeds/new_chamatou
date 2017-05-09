<?php

namespace backend\controllers;

use backend\models\form\ShoperForm;
use backend\models\form\storeBindForm;
use backend\models\form\StoreForm;
use backend\models\Shoper;
use backend\models\Upload;
use Yii;
use backend\models\SpStore;
use backend\models\search\SpStorerSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StoreController implements the CRUD actions for SpStore model.
 */
class StoreController extends Controller
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
     * Lists all SpStore models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SpStorerSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SpStore model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
            'shoperModel' => $this->findShoperModel($id)
        ]);
    }

    /**
     * Creates a new SpStore model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new StoreForm();
        $uploadModel = new Upload();

        if ($model->load(Yii::$app->request->post()) && $model->addStore()) {
            return $this->redirect(['shoper/create', 'store_id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'uploadModel' => $uploadModel
            ]);
        }
    }

    /**
     * Updates an existing SpStore model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = StoreForm::store($id);
        $uploadModel = new Upload();

        if ($model->load(Yii::$app->request->post()) && $model->updateStore()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'uploadModel' => $uploadModel
            ]);
        }
    }

    /**
     * Deletes an existing SpStore model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the SpStore model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SpStore the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SpStore::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    protected function findShoperModel($id)
    {
        $model = $this->findModel($id);
        if (($model = Shoper::findOne(['id'=>$model->shoper_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionBindShoper($id)
    {
        $storeBindForm = new storeBindForm();
        $storeBindForm->store_id = $id;
        $model = new ShoperForm();

        if(Yii::$app->request->post('storeBindForm') ){
             if($storeBindForm->load(Yii::$app->request->post()) &&  $storeBindForm->bind()){
                 return $this->redirect(['index']);
             }
        }
        if ($model->load(Yii::$app->request->post())) {

        } else {
            return $this->render('bind_shoper', [
                'model' => $model,
                'storeBindForm' => $storeBindForm,
                'store_id' => $id
            ]);
        }

    }
}
