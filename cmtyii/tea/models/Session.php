<?php
/***********************************************************************
 * -  Copyright ©, 2017-2017，Lr double
 * -  File name : .php
 * -  Author : Lr double   Version: 1.0    Dete: 10:06
 * -  Description ：//用于处理，包含以下函数：
 * -  Others :      //其他内容说明，当前方法有缓存实现、直接操作数据库、请删除项目
 * -  Function List ：//主要函数列表，每条记录包含函数名及功能简要说明
 * -  History ：//暂无修改记录
 ***********************************************************************/
namespace tea\models;

use Yii;
use yii\base\Model;

/**
 * Class Session
 * @package tea\models
 */
class Session extends Model
{
    /**
     * 用户登录成功、设置session
     * @param array $user 用户基本数据
     */
    public function teaLogin($user = [])
    {
        Yii::$app->session->set('tea_user_id',$user['tea_user_id']);
        Yii::$app->session->set('shoper_id',$user['shoper_id']);
        Yii::$app->session->set('store_id',$user['store_id']);

    }

    /**
     * 用户退出登录操作的session
     */
    public function teaLogout()
    {
        Yii::$app->session->removeAll();
    }
}