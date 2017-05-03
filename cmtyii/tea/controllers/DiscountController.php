<?php
/***********************************************************************
 * -  Copyright ©, 2017-2017，Lr double
 * -  File name : .php
 * -  Author : Lr double   Version: 1.0    Dete: 21:09
 * -  Description ：//用于处理茶坊端用户登录
 * -  Others :      //其他内容说明，
 * -  Function List ：//主要函数列表，每条记录包含函数名及功能简要说明
 * -  History ：//暂无修改记录
 ***********************************************************************/
namespace  tea\controllers;

use tea\models\Discount;
use Yii;

/**
 * 优惠控制器
 * Class DiscountController
 * @package tea\controllers
 */
class DiscountController extends ObjectController
{
    /**
     * 添加一个优惠
     * @return array
     */
    public function actionAdd()
    {
        if(Yii::$app->request->isPost)
        {
            $discount = new Discount();
            $data = $discount->add(Yii::$app->request->post());
            if($data)
            {
                return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
            }

            $message = $discount->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
    }
    /**
     * 修改一个优惠
     * @return array
     */
    public function actionEdit()
    {
        if(Yii::$app->request->isPost)
        {
            $discountId = Yii::$app->request->post('discount_id','');
            if($discountId == '') {
                return ['code'=>0,'msg'=>Yii::t('app', 'model')['required']];
            }
            $discount = Discount::findOne($discountId);
            if($discount){
                $data = $discount->edit(Yii::$app->request->post());
                if($data)
                {
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $discount->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','discount_id_not_exist')];
        }
    }

    /**
     * 手动优惠删除
     * @return array
     */
    public function actionDel()
    {

        if(Yii::$app->request->isPost)
        {
            $discountId = Yii::$app->request->post('discount_id','');
            if($discountId == ''){
                return ['code'=>0,'msg'=>Yii::t('app', 'model')['required']];
            }
            $model = Discount::findOne($discountId);
            if($model){
                if($model->delete()){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                var_dump($model->getFirstErrors());
            }
            return ['code'=>0,'msg'=>Yii::t('app','discount_id_not_exist')];
        }
    }

    /**
     * 获取手动优惠的价格列表、所有不带分页
     * @return array
     */
    public function actionGetList()
    {
        $discount = new Discount();
        $list = $discount->getList();
        return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$list];
    }
}