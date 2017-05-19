<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/11
 * Time: 下午8:09
 */
namespace  tea\controllers;

use tea\models\Shoper;
use tea\models\Withdraw;
use Yii;

class WithdrawController extends ObjectController
{
    /**
     * 添加一个体现记录
     * @return array
     */
    public function actionAdd()
    {
        $withd = new Withdraw();
        $data = $withd->add(Yii::$app->request->post());
        if($data){
            return ['code'=>1,'msg'=>'成功！'];
        }
        $message = $withd->getFirstErrors();
        $message = reset($message);
        return ['code'=>0,'msg'=>$message];
    }

    /**
     * 获取一个提现总额
     * @return array
     */
    public function actionYl()
    {
        $data = Shoper::getBeansIncom();
        return ['code'=>1,'msg'=>'成功','data'=>['num'=>$data]];
    }

    /**
     * 获取提现列表
     * @return array
     */
    public function actionList()
    {
        $withd = new Withdraw();
        $withd = $withd->search(Yii::$app->request->get());
        return ['code'=>1,'msg'=>'成功！','data'=>$withd];
    }

}