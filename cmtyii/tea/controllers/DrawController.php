<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\controllers;

use tea\models\Draw;
use tea\models\DrawConf;

class DrawController extends ObjectController
{
    /**
     * 获取所有列表
     * @return array
     */
    public function actionList()
    {
        $model = new Draw();
        $data  =$model->getList();
        return ['code'=>1,'msg'=>'成功！','data'=>$data];
    }

    /**
     * 添加一个奖品
     * @return array
     */
    public function actionCreate()
    {
        if(\Yii::$app->request->isPost)
        {
            $draw = new Draw();
            if ($id = $draw->create(\Yii::$app->request->post())) {
                return ['code'=>1,'msg'=>'成功！'];
            }
            $message = $draw->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
    }

    /**
     * 修改一个奖品
     * @return array
     */
    public function actionEdit()
    {
        if(\Yii::$app->request->isPost)
        {
            $draw = Draw::findOne(\Yii::$app->request->post('draw_id'));
            if($draw){
                if ($id = $draw->create(\Yii::$app->request->post())) {
                    return ['code'=>1,'msg'=>'成功！'];
                }
            }
            $message = $draw->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
    }

    /**
     * 删除一个规则
     * @return array
     */
    public function actionDel()
    {
        $id = \Yii::$app->request->post('draw_id');
        $model =  Draw::findOne($id);
        if($model){
            if($model->delete())
                return ['code'=>1,'msg'=>'成功'];
            return ['code'=>0,'msg'=>'删除失败'];
        }
        return ['code'=>0,'msg'=>'Draw不存在'];
    }

    /**
     * 返回一条
     * @return array
     */
    public function actionOne()
    {
        $id = \Yii::$app->request->get('draw_id');
        $model =  Draw::findOne($id);
        return ['code'=>1,'msg'=>'成功','data'=>$model];
    }
}