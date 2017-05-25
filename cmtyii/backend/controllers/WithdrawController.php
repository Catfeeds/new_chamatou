<?php

namespace backend\controllers;

use backend\models\Shoper;
use Yii;
use backend\models\Withdraw;
use backend\models\search\WithdrawSearch;
use yii\data\Pagination;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * 提现控制
 * WithdrawController implements the CRUD actions for Withdraw model.
 */
class WithdrawController extends ObjectController
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
     * 显示列表
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new WithdrawSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * 查看一个详细
     * @param $id
     * @return string
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * 创建|新建|提现
     * @return string|Response
     */
    public function actionCreate()
    {
        $model = new Withdraw();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->Id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * 更新修改操作
     * @param $id
     * @return string|Response
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->Id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * 删除操作
     * @param $id
     * @return Response
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * 查找提现模型
     * @param $id
     * @return static
     * @throws NotFoundHttpException
     */
    protected function findModel($id)
    {
        if (($model = Withdraw::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * 通过提现
     * @param $id
     * @return array
     */
    public function actionVia($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = $this->findModel($id);
        //TODO:: 判断用户账户是否充足，并进行扣款
        $model->status = 1;
        $model->note = Yii::$app->request->get('inputValue');
        if($model->save()){
            return ['code'=>1,'message'=>'记录成功！'];
        }
        $message = $model->getFirstErrors();
        $message = reset($message);
        return ['code'=>0,'message'=>$message];
    }

    /**
     * 拒绝提现
     * @param $id
     * @return array
     */
    public function actionRefuse($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = $this->findModel($id);
        //TODO:: 判断用户账户是否充足，并进行退款,还有个备注的提交
        $model->status = 2;
        $model->note  = Yii::$app->request->get('inputValue');
        $shoper = Shoper::findOne($model->shoper_id);
        $shoper->withdraw_total = $model->amount + $shoper->withdraw_total;
        $tran = Yii::$app->db->beginTransaction();
        if($model->save() && $shoper->save()){
            $tran->commit();
            return ['code'=>1,'message'=>'记录成功！'];
        }
        $tran->rollBack();
        $message = $model->getFirstErrors();
        $message = reset($message);
        return ['code'=>0,'message'=>$message];
    }

    /**
     * 查看备注
     * @return string
     */
    public function actionNote()
    {
        $this->layout = false;
        $model = $this->findModel(Yii::$app->request->get('id'));
        return $this->render('note',['model'=>$model]);
    }
}
