<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/3
 * Time: 上午9:48
 */

namespace tea\b2b\controllers;

use tea\b2b\models\Cart;
use tea\controllers\ObjectController;
use Yii;

class CartController extends ObjectController
{
    /**
     * 获取用户购物车列表
     * @return array
     */
    public function actionList()
    {
        $cartModel = new Cart();
        $list = $cartModel->getList();
        return [
            'code' => 1,
            'msg' => Yii::t('app', 'global')['true'],
            'data' => $list
        ];
    }

    /**
     * 删除一个购物车中的商品
     * @return array
     */
    public function actionDel()
    {
        $model = new  Cart();
        $ret = $model->del(Yii::$app->request->get('cart_id'));

        if ($ret) {
            return [
                'code' => 1,
                'msg' => Yii::t('app', 'global')['true']
            ];
        } else {
            $message = $model->getFirstErrors();
            $message = reset($message);
            return ['code' => 0, 'msg' => $message];
        }
    }

    /**
     * 修改一个商品库存操作
     * @return array
     */
    public function actionEditCartNum()
    {
        $model = new  Cart();
        $ret = $model->editCartNum(Yii::$app->request->post());

        if ($ret) {
            return [
                'code' => 1,
                'msg' => Yii::t('app', 'global')['true']
            ];
        } else {
            $message = $model->getFirstErrors();
            $message = reset($message);
            return ['code' => 0, 'msg' => $message];
        }
    }

    /**
     * 添加爱一个购物车中的商品
     * @return array
     */
    public function actionAdd()
    {
        $model = new  Cart();
        $ret = $model->add(Yii::$app->request->post());

        if ($ret) {
            return [
                'code' => 1,
                'msg' => Yii::t('app', 'global')['true']
            ];
        } else {
            $message = $model->getFirstErrors();
            $message = reset($message);
            return ['code' => 0, 'msg' => $message];
        }
    }
}