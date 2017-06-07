<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace frontend\controllers;

use tea\models\Draw;
use tea\models\DrawCard;
use tea\models\DrawConf;
use yii\web\Controller;


class DrawController extends BaseController
{
    /**
     * 获取推荐码列表
     * @return array
     */
    public function actionIndex()
    {
        $model = new DrawCard();
        $data = $model->search(\Yii::$app->request->get());
        return ['code'=>1,'msg'=>'成功','data'=>$data];
    }

    /**
     * 领取操作
     * @return array
     */
    public function actionEndCard()
    {
        $model = DrawCard::findOne(\Yii::$app->request->get('draw_card_id'));
        if($model)
        {
            $model->end_time = time();
            $model->status = 1;
            if($model->save()){
                return ['code'=>1,'msg'=>'成功'];
            }
            $message = $model->getFirstErrors();
            $message = reset($message);
            return ['code'=>1,'msg'=>$message];
        }
        return ['code'=>0,'msg'=>'不存在'];
    }

    public function actionTest1()
    {
        return ['code'=>1,'msg'=>'成功','data'=>DrawConf::getDaZhuanBanInfo()];
    }
    public function actionTest2()
    {
        $model = new DrawCard();
        $data = $model->getChouJiangResult();
        return ['code'=>1,'msg'=>'成功','data'=>$data['name'],'type'=>$data['type']];
    }

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
            $drawConf = DrawConf::getInfo();
            if($drawConf){
                $drawConf->prize = unserialize($drawConf->prize);
                foreach ($drawConf['prize'] as $key=>$val)
                {
                    if($val == $model->id){
                        return ['code'=>0,'msg'=>'参与活动的奖品不予删除！'];
                    }
                }
            }
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

    /**
     * 创建一个规则
     * @return array
     */
    public function actionCreateConf()
    {
        if(\Yii::$app->request->isPost)
        {
            $drawConf = DrawConf::getInfo();
            if(!$drawConf)
                $drawConf = new DrawConf();
            if ($id = $drawConf->create(\Yii::$app->request->post())){
                return ['code'=>1,'msg'=>'成功'];
            }
            $message = $drawConf->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
        return ['code'=>0,'msg'=>"请POST提交"];
    }

    /**
     * 获取一个奖品配置
     * @return array
     */
    public function actionOneConf()
    {
        $drawConf = $drawConf = DrawConf::getInfo();
        if($drawConf)
            $drawConf->prize = unserialize($drawConf->prize);
        return ['code'=>1,'msg'=>'成功','data'=>$drawConf];
    }

    /**
     * 获取当前用户的中奖纪录
     * @return array
     */
    public function actionWiningList()
    {
        $model = new \frontend\models\DrawCard();
        $data = $model->winList();
        return ['code'=>1,'msg'=>'成功','data'=>$data];
    }
}