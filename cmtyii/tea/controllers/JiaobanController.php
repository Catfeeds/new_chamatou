<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\controllers;

use tea\models\Jiaoban;
use tea\models\JiaobanConf;
use Yii;

/**
 * 交班代码
 * Class JiaobanController
 * @package tea\controllers
 */
class JiaobanController extends ObjectController
{
    /**
     * 交班预留金额设置
     * @return array
     */
    public function actionIndex()
    {
        if (Yii::$app->request->isGet) {
            $jiaobanModel = JiaobanConf::Get();
            return ['code' => 1, 'msg' => '成功！', 'data' => $jiaobanModel];

        } elseif (Yii::$app->request->isPost) {
            $jiaobanModel = JiaobanConf::Set(Yii::$app->request->post());
            return ['code' => 1, 'msg' => '成功！', 'data' => $jiaobanModel];
        }
    }

    /**
     * 交班页面初始化
     * @return array
     */
    public function  actionInit()
    {
        $jiaoBan = new Jiaoban();
        $data = $jiaoBan->initView();
        return ['code'=>1,'msg'=>'成功！','data'=>$data];
    }

    /**
     * 交班保存！
     * @return array
     */
    public function actionSave()
    {
        $jianBan = new Jiaoban();
        if($jianBan->add(Yii::$app->request->post())){
            return ['code'=>1,'msg'=>'成功！'];
        }
        $message = $jianBan->getFirstErrors();
        $message = reset($message);
        return ['code'=>0,'msg'=>$message];
    }

    /**
     * 交班记录
     * @return array
     */
    public function actionList()
    {
        $jiaoBan = new Jiaoban();
        $data = $jiaoBan->search(Yii::$app->request->get());
        return ['code'=>1,'msg'=>'成功！','data'=>$data];
    }
}