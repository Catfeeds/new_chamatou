<?php

namespace backend\controllers;

use backend\models\form\ShoperForm;
use backend\models\form\ShoperSalesmanForm;
use backend\models\form\StoreBindForm;
use backend\models\form\StoreForm;
use backend\models\Shoper;
use backend\models\SpUsers;
use backend\models\Upload;
use Yii;
use backend\models\SpStore;
use backend\models\search\SpStorerSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * StoreController implements the CRUD actions for SpStore model.
 */
class StoreController extends Controller
{


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
        $storeModel = new StoreForm();
        $shoperModel = new ShoperForm();
        $uploadModel = new Upload();

        /**
         * 开启数据保存的事务
         */
        $transaction = Yii::$app->db->beginTransaction();
        try{
            if ($shoperModel->load(Yii::$app->request->post())) {
                if($shoperRet = $shoperModel->createShoper()){
                    $post = Yii::$app->request->post();
                    $post['StoreForm']['shoper_id'] = $shoperRet['id'];
                    $post['StoreForm']['salesman_id'] = $shoperRet['salesman_id'];
                    if ($storeModel->load($post) && $storeId = $storeModel->addStore()) {
                        $user['shoperId'] = $shoperRet['id'];
                        $user['storeId'] = $storeId['id'];
                        $user['user'] = $shoperRet['boss'];
                        $user['phone'] = $shoperRet['phone'];
                        if($data = SpUsers::addUser($user)){
                            $transaction->commit();
                            return $this->redirect(['store/index']);
                        }
                    }
                    throw new \Exception('store表保存失败！');
                }
                throw new \Exception('shoper表保存失败！');
            }
            throw new \Exception('');
        }catch (\Exception $exception){
            var_dump($exception->getMessage());
            $transaction->rollBack();
            return $this->render('create', [
                'storeModel' => $storeModel,
                'shoperModel'=>$shoperModel,
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
        $storeModel = StoreForm::store($id);
        $shoperModel = ShoperForm::findOne($storeModel->shoper_id);
        $uploadModel = new Upload();

        /**
         * 开启数据保存的事务
         */
        $transaction = Yii::$app->db->beginTransaction();
        try{
            if ($shoperModel->load(Yii::$app->request->post())) {
                if($shoperRet = $shoperModel->updateShoper()){
                    $post = Yii::$app->request->post();
                    $post['StoreForm']['shoper_id'] = $shoperRet['id'];
                    $post['StoreForm']['salesman_id'] = $shoperRet['salesman_id'];
                    if ($storeModel->load($post) && $storeModel->addStore()) {
                        $spUser = SpUsers::find()->andWhere(['shoper_id'=>$shoperRet['id']])->andWhere(['is_admin'=>1])->one();
                        $spUser->phone = $shoperRet['phone'];
                        if($spUser->save()){
                            $transaction->commit();
                            return $this->redirect(['store/index']);
                        }
                        return $this->redirect(['store/index']);
                    }
                    throw new \Exception('store表保存失败！');
                }
                throw new \Exception('shoper表保存失败！');
            }
            throw new \Exception('');
        }catch (\Exception $exception){
            $transaction->rollBack();
            return $this->render('update', [
                'storeModel' => $storeModel,
                'shoperModel'=>$shoperModel,
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

    /**
     * 查找店铺主表信息
     * @param $id
     * @return SpStore|static
     * @throws NotFoundHttpException
     */
    protected function findShoperModel($id)
    {
        $model = $this->findModel($id);
        if (($model = Shoper::findOne(['id'=>$model->shoper_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.'.$id);
        }
    }


    /**
     * 账号开启与封停操作
     * @return array
     */
    public function actionSpstatus()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = Shoper::findOne(Yii::$app->request->get('shoper_id'));
        if($model){
            if($model->sp_status == 0){
                $model->sp_status = 1;
                return $model->save() ? ['code'=>1,'message'=>'封停成功!']:['code'=>0,'message'=>'封停失败！'];
            }else{
                $model->sp_status = 0;
                return $model->save() ? ['code'=>1,'message'=>'开启成功!']:['code'=>0,'message'=>'开启失败！'];
            }
        }
    }

    public function actionShouxinhuankuan()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = Shoper::findOne(Yii::$app->request->get('shoper_id'));
        $inputValue = Yii::$app->request->get('inputValue');
        if($model){
            $yhjiner = $model->credit_remain - $model->credit_amount;
            if($inputValue == 0)
            {
                    return ['code'=>0,'message'=>'还款金额不足！'];
            }
            if($inputValue < $yhjiner || $inputValue <= 0)
            {
                return ['code'=>0,'message'=>'还款金额不足！'];
            }
            $model->credit_amount = $model->credit_amount + $yhjiner;
            $model->status = 0;
            return $model->save() ? ['code'=>1,'message'=>'还款成功!']:['code'=>0,'message'=>'还款失败！'];
        }
    }
}
