<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/12
 * Time: 17:14
 */

namespace backend\controllers;
use backend\models\search\RecordSearch;
use backend\models\search\UserSearch;
use backend\models\UserRecharge;
use frontend\models\User;
use yii\data\Pagination;
use yii\web\Controller;

/**
 * 用户控制器
 * Class UsersController
 * @package backend\controllers
 */
class UsersController extends ObjectController
{
    /**
     * 所有用户的充值记录
     * @return string
     */
    public function actionUsersrecharge($id = '')
    {
        $searchModel = new RecordSearch();
        $query = UserRecharge::find()->where(['type'=>1])->orderBy('add_time desc');
        if($id != ''){
            $query->andWhere(['user_id'=>$id]);
        }
        $data = \Yii::$app->request->get($searchModel->formName());
        if($data){
            foreach ($data as $k => $v) {
                $searchModel->$k = $v;
            }
            $start = strtotime($searchModel->start);
            $end = strtotime($searchModel->end);
            if($searchModel->start && $searchModel->end){
                $query->andWhere(['between','add_time',$start,$end]);
            }
            if($searchModel->start && empty($searchModel->end)){
                $query->andWhere(['>','add_time',$start]);
            }
            if(empty($searchModel->start) && $searchModel->end){
                $query->andWhere(['<','add_time',$end]);
            }
        }
        $count = $query->count();
        $size = \Yii::$app->params['pageSize'];
        $pager = new Pagination(['totalCount'=>$count,'pageSize'=>$size]);
        $models = $query->offset($pager->offset)->limit($pager->limit)->all();
        return $this->render('index',[
            'models' => $models,
            'pager'  => $pager,
            'searchModel' => $searchModel,
            'title'  => '用户充值记录',
        ]);
    }

    /**
     * 用户消费记录
     * @return string
     */
    public function actionUsersreduce($id = '')
    {
        $searchModel = new RecordSearch();
        $query = UserRecharge::find()->where(['type'=>0])->orderBy('add_time desc');
        if($id != ''){
            $query->andWhere(['user_id'=>$id]);
        }
        $data = \Yii::$app->request->get($searchModel->formName());
        if($data){
            foreach ($data as $k => $v) {
                $searchModel->$k = $v;
            }
            $start = strtotime($searchModel->start);
            $end = strtotime($searchModel->end);
            if($searchModel->start && $searchModel->end){
                $query->andWhere(['between','add_time',$start,$end]);
            }
            if($searchModel->start && empty($searchModel->end)){
                $query->andWhere(['>','add_time',$start]);
            }
            if(empty($searchModel->start) && $searchModel->end){
                $query->andWhere(['<','add_time',$end]);
            }
        }
        $count = $query->count();
        $size = \Yii::$app->params['pageSize'];
        $pager = new Pagination(['totalCount'=>$count,'pageSize'=>$size]);
        $models = $query->offset($pager->offset)->limit($pager->limit)->all();
        return $this->render('index',[
            'models' => $models,
            'pager'  => $pager,
            'searchModel' => $searchModel,
            'title'  => '用户消费记录',
        ]);
    }

    /**
     *微信用户列表
     * @return string
     */
    public function actionUserslist()
    {
        $searchModel = new UserSearch();
        $query = User::find()->orderBy('add_time desc');
        $data = \Yii::$app->request->get($searchModel->formName());
        if($data){
            foreach ($data as $k=>$v){
                $searchModel->$k = $v;
            }
            if($searchModel->username){
                $query->andWhere(['like','nickname',$searchModel->username]);
            }
            if($searchModel->phone){
                $query->andWhere(['like','phone',$searchModel->phone]);
            }
        }
        $count = $query->count();
        $size = \Yii::$app->params['pageSize'];
        $pager = new Pagination(['totalCount'=>$count,'pageSize'=>$size]);
        $models = $query->offset($pager->offset)->limit($pager->limit)->all();
        return $this->render('list',[
            'models' => $models,
            'pager' =>$pager,
            'searchModel' => $searchModel
        ]);
    }
}