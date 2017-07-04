<?php

namespace tea\controllers;


use tea\models\UsersForm;
use tea\models\VipGrade;
use tea\models\VipPay;
use Yii;
use tea\models\Vip;
use yii\data\Pagination;
use tea\models\Config;
use yii\helpers\ArrayHelper;

/**
 * VipController implements the CRUD actions for Vip model.
 */
class VipController extends ObjectController
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
            $model = new Vip();
            if($model->add(Yii::$app->request->post()))
            {
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            }
            $msg = $model->getFirstErrors();
            return ['code' => 0, 'msg' => reset($msg)];
        }
    }

    /**
     * 会员删除
     * @return array
     */
    public function actionDelete()
    {
        if(Yii::$app->request->isPost)
        {
            $model = new Vip();
            if($model->del(Yii::$app->request->post()))
            {
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            }
            $msg = $model->getFirstErrors();
            return ['code' => 0, 'msg' => reset($msg)];
        }
    }
    /**
     * 获取会员列表
     * @return array
     */
    public function actionListVip()
    {
        $model = Vip::find()->where('shoper_id = :shoper_id',[':shoper_id'=>Yii::$app->session->get('shoper_id')]);
        $dataCount = $model->count();
        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)
            ->select([])->asArray()->all();
        foreach ($data as $key => $value)
        {
            # 格式化时间
            $data[$key]['birthday'] = date('Y-m-d',$value['birthday']);
            if($value['sex'] == 1)
                $data[$key]['sex'] = '男';
            elseif ($value['sex'] == 2)
                $data[$key]['sex'] = '女';
            $data[$key]['user_id'] = UsersForm::getUserNameById($value['user_id']);
            $data[$key]['grade_id'] = VipGrade::getGradeName($value['grade_id']);
        }

        return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>[
            'dateList'=>$data,'page'=>['pageCount'=>$page->getPageCount(),'dataCount'=>$dataCount]]];
    }

    /**
     * 会员卡搜索
     * @return array
     */
    public function actionSearch()
    {
        if(Yii::$app->request->get())
        {
            $model = new Vip();
            $post = Yii::$app->request->get();
            $data = $model->search($post);
            return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    /**
     * 会员充值功能实现
     * @return array
     */
    public function actionPay()
    {
        if(Yii::$app->request->isGet)
        {
            $data = Vip::find()->where(['shoper_id'=>Yii::$app->session->get('shoper_id'),
                'id'=>Yii::$app->request->get('vip_id')])->asArray()->one();
            $ret['list']         =  $data;
            $ret['list']['birthday'] =  date('Y-m-d',$data['birthday']);
            $ret['list']['user_id']  = UsersForm::getUserNameById($data['user_id']);
            $ret['list']['grade_id']  = VipGrade::getGradeName($data['grade_id']);
            return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>$ret];
        }
        else
        {
            $post = Yii::$app->request->post();
            $model = new Vip();
            $paly_list = $model->pay($post);
            if($paly_list) {
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>$paly_list];
            }
            $msg = $model->getFirstErrors();
            return ['code' => 0, 'msg' => reset($msg)];
        }
    }

    /**
     * 充值数据查询
     * @return array
     */
    public function actionPayList()
    {
        if(Yii::$app->request->isGet)
        {
            $model = new Vip();
            $data = $model->payList(Yii::$app->request->get());
            return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    /**
     * 充值记录打印功能
     * @return array
     */
    public function actionPrint()
    {
        if(Yii::$app->request->isGet)
        {
            $pay    = VipPay::findOne(Yii::$app->request->get('print_id'));
            if($pay)
            {
                $vip    = Vip::findOne($pay->vip_id);
                $pay->add_time = date('Y-m-d H:i:s',$pay->add_time);
                $data   = ArrayHelper::toArray($pay);
                $data['username'] = $vip->username;
                $data['phone']    = $vip->phone;
                $data['card_no']  = $vip->card_no;
                $data['sum']      = number_format($data['amount'] + $data['zs'] + $data['pay_up_amount'],2);
                $data['tea_user_id'] = UsersForm::getUserNameById($data['tea_user_id']);
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>$data];
            }
            return ['code' => 0, 'msg' => Yii::t('app', 'global')['false']];
        }
    }

    /**
     * 会员消费
     * @return array
     */
    public function actionConsume()
    {
        $consume = new Vip();
        $data = $consume->consume(Yii::$app->request->get());
        return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],'data'=>$data];
    }

    /**
     * 创建会员等级
     * @return array
     */
    public function actionAddGrade()
    {
        if(Yii::$app->request->isPost)
        {
            $vipGrade = new VipGrade();
            if($vipGrade->create(Yii::$app->request->post())){
                return ['code'=>1,'msg'=>"成功"];
            }
            $message = $vipGrade->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
        return ['code'=>0,'请POST提交数据！'];
    }

    /**
     * 修改会员等级
     * @return array
     */
    public function actionEditGrade()
    {
        if(Yii::$app->request->isPost)
        {
            $vipGrade = VipGrade::findOne(Yii::$app->request->post('grade_id'));
            if($vipGrade->edit(Yii::$app->request->post())){
                return ['code'=>1,'msg'=>"成功"];
            }
            $message = $vipGrade->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
        return ['code'=>0,'请POST提交数据！'];
    }

    /**
     * 删除会员等级
     * @return array
     */
    public function actionDelGrade()
    {
        if(Yii::$app->request->isPost)
        {
            $vipGrade = VipGrade::findOne(Yii::$app->request->post('grade_id'));
            if($vipGrade->del()){
                return ['code'=>1,'msg'=>"成功"];
            }
            $message = $vipGrade->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
        return ['code'=>0,'请POST提交数据！'];
    }

    /**
     * 获取一个等级
     * @return array
     */
    public function actionGetOne()
    {
        if(Yii::$app->request->isGet)
        {
            $vipGrade = VipGrade::findOne(Yii::$app->request->get('grade_id'));
            return ['code'=>1,'msg'=>'成功!','data'=>$vipGrade];
        }
        return ['code'=>0,'请Get提交数据！'];
    }

    /**
     * 获取一个等级
     * @return array
     */
    public function actionGetAll()
    {
        if(Yii::$app->request->isGet)
        {
            $vipGrade = new VipGrade();
            return ['code'=>1,'msg'=>'成功!','data'=>$vipGrade->getList()];
        }
        return ['code'=>0,'请Get提交数据！'];
    }
}
