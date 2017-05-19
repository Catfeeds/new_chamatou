<?php

namespace tea\controllers;

use tea\models\Message;
use Yii;
use yii\data\Pagination;


/**
 * VipController implements the CRUD actions for Vip model.
 */
class MessageController extends ObjectController
{
    /**
     * Creates a new Vip model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->request->isPost)
        {
            $model = new Message();
            if($model->add(Yii::$app->request->post()))
            {
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            }
            $msg = $model->getFirstErrors();
            return ['code' => 0, 'msg' => reset($msg)];
        }
    }

    /**
     * 获取全部留言内容、采用分页
     * @return array
     */
    public function actionListMessage()
    {
        $model = Message::find()->where('shoper_id = :shoper_id  and store_id = :store_id',
            [':shoper_id' => Yii::$app->session->get('shoper_id'),':store_id' => Yii::$app->session->get('store_id')]);
        $dataCount = $model->count();
        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)
            ->select(['id', 'add_time', 'type', 'content', 'phone', 'title', 'username'])->asArray()->all();
        foreach ($data as $key => $value)
        {
            # 格式化时间 与格式化培训
            $data[$key]['add_time'] = date('Y-m-d H:i:s', $value['add_time']);
            if ($value['type'] == 1) {
                $data[$key]['type'] = Yii::t('app','message_peixunzhichi');
            } elseif ($value['type'] == 2) {
                $data[$key]['type'] = Yii::t('app','message_huodongshenqing');
            } else {
                $data[$key]['type'] = Yii::t('app','message_guanggaosheji');
            }
        }

        return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>[
                'dateList'=>$data,'page'=>['pageCount'=>$page->getPageCount(),'dataCount'=>$dataCount]]];
    }

    /**
     * 获取一条留言内容
     * @return array
     */
    public function actionMessage()
    {
        $data =  Message::find()->where('shoper_id =:shoper_id and id =:id and store_id = :store_id',
                    [':shoper_id'=>Yii::$app->session->get('shoper_id'),':id'=>Yii::$app->request->get('message_id'),':store_id' => Yii::$app->session->get('store_id')])
                ->select(['id','add_time','type','content','phone','title','username'])->asArray()->one();

        # 格式化时间 与格式化培训
        $data['add_time'] = date('Y-m-d H:i:s',$data['add_time']);
        if($data['type'] == 1){
            $data['type'] = Yii::t('app','message_peixunzhichi');
        }elseif ($data['type'] == 2){
            $data['type'] = Yii::t('app','message_huodongshenqing');
        }else{
            $data['type'] = Yii::t('app','message_guanggaosheji');
        }

        return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>$data];
    }
}
