<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\controllers;


use tea\models\BufferTime;
use tea\models\charge\BaoDuan;
use tea\models\charge\MianFei;
use tea\models\ChargRule;
use tea\models\charge\Time;

class ChargController extends  ObjectController
{
    /**
     * 创建一个收费类型
     * @return array
     */
    public function actionAdd()
    {
        if(\Yii::$app->request->isPost)
        {
            $charg = new ChargRule();
            if ($charg->create(\Yii::$app->request->post()))
            {
                return ['code'=>1,'msg'=>"成功！"];
            }
            $message = $charg->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
        return ['code'=>0,'msg'=>'请POST提交数据！'];
    }

    /**
     * 创建一个收费类型
     * @return array
     */
    public function actionEdit()
    {
        if(\Yii::$app->request->isPost)
        {
            $charg = ChargRule::findOne(\Yii::$app->request->post('charg_id'));
            if ($charg->create(\Yii::$app->request->post()))
            {
                return ['code'=>1,'msg'=>"成功！"];
            }
            $message = $charg->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
        return ['code'=>0,'msg'=>'请POST提交数据！'];
    }

    /**
     * 获取所有计费规则
     * @return array
     */
    public function actionGetAll()
    {
        if(\Yii::$app->request->isGet)
        {
            $charg = new ChargRule();
            if ($charg->getList())
            return ['code'=>1,'msg'=>'成功！','data'=>$charg->getList()];
        }
        return ['code'=>0,'msg'=>'请GET提交数据！'];
    }

    /**
     * 删除一个规则
     * @return array
     */
    public function actionDelete()
    {
        if(\Yii::$app->request->isPost)
        {
            if($charg = ChargRule::findOne(\Yii::$app->request->post('charg_id')) )
            {
                if($charg->del()){
                    return ['code'=>1,'msg'=>'成功！'];
                }
                $message = $charg->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }

            return ['code'=>0,'msg'=>'删除不存在！'];
        }
        return ['code'=>0,'msg'=>'请POST提交数据！'];
    }

    /**
     * 获取一个计费规则
     * @return array
     */
    public function actionGetOne()
    {
        if(\Yii::$app->request->isGet)
        {
            $charg = ChargRule::findOne(\Yii::$app->request->get('charg_id'));
            $model = '';
            if($charg->type == ChargRule::TYPE_TIME){
                $model = new Time();
            }elseif ($charg->type == ChargRule::TYPE_MIANGEI){
                $model = new MianFei();
            }elseif ($charg->type == ChargRule::TYPE_BAODUAN){
                $model = new BaoDuan();
            }
            $model->LoadDbData($charg);
            $data = $model->getArray();
            return ['code'=>1,'msg'=>'成功！','data'=>$data];

        }
        return ['code'=>0,'msg'=>'请GET提交数据！'];
    }

    /**
     * 缓冲时间设置
     * @return array
     */
    public function actionBufferTime()
    {
        if (\Yii::$app->request->isGet) {
            $bufferTime = BufferTime::get();
            return ['code'=>1,'msg'=>"成功",'data'=>['bufferTime'=>$bufferTime]];
        }elseif(\Yii::$app->request->isPost){
            if (BufferTime::set(\Yii::$app->request->post('buffer_time'))) {
                return ['code'=>1,'msg'=>'成功'];
            }
            return ['code'=>0,'msg'=>'未知错误！'];
        }
    }
}