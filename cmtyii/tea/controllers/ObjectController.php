<?php
/***********************************************************************
 * -  Copyright ©, 2017-2017，Lr double
 * -  File name : .php
 * -  Author : Lr double   Version: 1.0    Dete: 2017-3-27 19:10:16
 * -  Description ：//Objecti操作控制器、
 * -  Others :      //其他内容说明
 * -  Function List ：//主要函数列表，每条记录包含函数名及功能简要说明
 * -  History ：//暂无修改记录
 ***********************************************************************/

namespace tea\controllers;

use tea\models\RBAC;
use tea\models\Users;
use Yii;
use yii\web\Controller;
use yii\web\Response;


class ObjectController extends Controller
{
    public $enableCsrfValidation = false;

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub
        Yii::$app->response->format = Response::FORMAT_JSON;
        Yii::$app->language = 'zh-CN';
    }


    /**
     * 判断用户是否登录、已经用户是否存在操作权限
     * @param \yii\base\Action $action
     * @return bool|Response | array
     */

    public function beforeAction($action)
    {
        /**
         * 判断是不是微信的回掉路径
         */
        $route = $action->controller->route;
        if ($route == 'pay/wx-pay-ret') {
            return true;
        }

        /* 开发模拟用户登录 */
        $user = new Users();
//        $user->login(['phone'=>'15982707139','password'=>'15982707139']);
        $user->login(['phone' => '15888888888', 'password' => 'xiaozhang']);
        /* 开发更新权限表 */
//        RBAC::initAuth();

        if ($action->id == 'login') {
            return true;
        }

        /**
         * 检查session值是否正常、不正常将跳转到登录界面
         */
        if (empty(Yii::$app->session->get('shoper_id')) &&
            empty(Yii::$app->session->get('user_id'))
        ) {
            return $this->redirect(['object/login']);
        }


        //判断是是否有权限
        if (!RBAC::validateRole($route)) {
            die(json_encode(['code' => -2, 'msg' => Yii::t('app', 'rabc_no_prieate')]));
        }
        return true;
    }

    /**
     * 返回ajax数组
     * @param $data array 数组
     * @return array 返回ajax
     */
    public function returnAjax($data)
    {
        return [
            'code' => $data['code'],
            'msg' => $data['msg'],
            'data' => empty($data['data']) ? [] : $data['data']
        ];
    }

    /*
     * 返回提示用户登录
     * */
    public function actionLogin()
    {
        return $this->returnAjax(['code' => -1, 'msg' => '请登录']);
    }
}