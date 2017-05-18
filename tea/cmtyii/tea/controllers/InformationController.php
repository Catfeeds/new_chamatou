<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/11
 * Time: 上午10:04
 */

namespace tea\controllers;

use tea\models\Information;
use Yii;

/**
 * 消息队列控制器
 * Class InformationController
 * @package tea\controllers
 */
class InformationController extends ObjectController
{
    /**
     * 获取未读消息
     * @return array
     */
    public function actionUnread()
    {

        $information = new Information();
        $data = $information->getUnreadList();
        return ['code' => 1, 'msg' => '成功！', 'data' => $data];
    }

    /**
     * 获取以读消息
     * @return array
     */
    public function actionRead()
    {
        $information = new Information();
        $data = $information->getReadList();
        return ['code' => 1, 'msg' => '成功！', 'data' => $data];
    }

    /**
     * 获取总条数
     * @return array
     */
    public function actionCount()
    {
        $information = new Information();
        $data = $information->getCount();
        return ['code' => 1, 'msg' => '成功！', 'data' => $data];
    }

    public function actionMessageBox()
    {
        $information = new Information();
        $data = $information->getMessageBox();
        return ['code' => 1, 'msg' => '成功！', 'data' => $data];
    }
}