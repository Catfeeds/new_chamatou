<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace  tea\controllers;

use tea\models\RBAC;
use tea\models\UsersForm;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * 用户控制器
 * Class UsersController
 * @package tea\controllers
 */
class UsersController extends  ObjectController
{
    /**
     * 添加一个管理员
     * @return array
     */
    public function actionAdd()
    {
        if(Yii::$app->request->isPost)
        {
            $model = new UsersForm();
            $data  = $model->add(Yii::$app->request->post());
            if($data) {
                return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
            }

            $message = $model->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
    }

    /**
     * 编辑一个管理员
     * @return array
     */
    public function actionEdit()
    {
        if (Yii::$app->request->isPost)
        {
            $users = UsersForm::findOne(Yii::$app->request->post('users_id'));
            if($users)
            {
                $addRet = $users->edit(Yii::$app->request->post());
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }

                $message = $users->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','管理员不存在！')];
        }
    }

    /**
     * 删除一个管理员
     * @return array
     */
    public function actionDel()
    {
        if (Yii::$app->request->isPost)
        {
            $users = UsersForm::findOne(Yii::$app->request->post('users_id'));
            if($users)
            {
                $addRet = $users->del();
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $users->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','管理员不存在！')];
        }
    }

    /**
     * 获取所有管理员列表
     * @return array
     */
    public function actionGetList()
    {
        if(Yii::$app->request->isGet)
        {
            $uses = new UsersForm();
            $uses = ArrayHelper::toArray($uses->getList());
            foreach ($uses as $key=>$value)
            {
                $uses[$key]['role_name'] = RBAC::getUserRoleNameByUserId($value['id']);
            }
            return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$uses];
        }
    }

    /**
     * 获取所有角色
     * @return array
     */
    public function actionGetRole(){
        $data = RBAC::getRoleNameAll();
        return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$data];
    }

    /**
     * 获取一个用户的详细信息
     * @return array
     */
    public function actionOne()
    {
        if (Yii::$app->request->isGet)
        {
            $users = UsersForm::findOne(Yii::$app->request->get('users_id'));
            if($users)
            {
                $addRet = ArrayHelper::toArray($users);
                $addRet['role_name'] = RBAC::getUserRoleNameByUserId($addRet['id']);
                $addRet['add_time'] = date('Y-m-d H:i:s',$addRet['add_time']);
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$addRet];
                }
                $message = $users->getFirstErrors();
                $message = reset($message);
                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','管理员不存在！')];
        }
    }
}