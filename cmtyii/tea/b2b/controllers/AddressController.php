<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\b2b\controllers;

use tea\b2b\models\Address;
use tea\controllers\ObjectController;
use tea\models\Locations;
use Yii;
use yii\web\Response;

/**
 * 收货地址管理操作
 * Class AddressController
 * @package tea\b2b\controllers
 */
class AddressController extends ObjectController
{
    /**
     * 获取所有收货地址
     * @return array
     */
    public function actionList()
    {
        $model = new Address();
        $data  = $model->getList();
        return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
    }

    /**
     * 获取一个地址的详情
     * @return array
     */
    public function actionOne()
    {
        if (Yii::$app->request->isGet) {

            $model = Address::findOne(Yii::$app->request->get('address_id'));
            if($model){
                return [
                    'code' => 1,
                    'msg' => Yii::t('app', 'global')['true'],
                    'data'=>$model
                ];
            }
            $message = Yii::t('app','b2b_address_exist');
            return ['code' => 0, 'msg' => $message];
        }
    }

    /**
     * 添加收货地址
     * @return array
     */
    public function actionAdd()
    {
        if (Yii::$app->request->isPost) {
            $model = new Address();
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

    /**
     * 修改收货地址
     * @return array
     */
    public function actionEdit()
    {
        if (Yii::$app->request->isPost) {

            $model = Address::findOne(Yii::$app->request->post('address_id'));
            if($model){
                $ret = $model->edit(Yii::$app->request->post());
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
            $message = Yii::t('app','b2b_address_exist');
            return ['code' => 0, 'msg' => $message];
        }
    }

    /**
     * 修改默认收货地址
     * @return array
     */
    public function actionEditDefault()
    {
        if (Yii::$app->request->isPost) {

            $model = Address::findOne(Yii::$app->request->post('address_id'));
            if($model){
                $ret = $model->editDefault();
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
            $message = Yii::t('app','b2b_address_exist');
            return ['code' => 0, 'msg' => $message];
        }
    }

    /**
     * 删除一个地址
     * @return array
     */
    public function actionDel()
    {
        if (Yii::$app->request->isPost) {

            $model = Address::findOne(Yii::$app->request->post('address_id'));
            if($model){
                $ret = $model->delete();
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
            $message = Yii::t('app','b2b_address_exist');
            return ['code' => 0, 'msg' => $message];
        }
    }

    /**
     * 获取城市地址
     * @return array
     */
    public function actionLocations()
    {
        $data = Locations::getList();
        $myFile = fopen("location.json", "w");
        $datas = json_encode($data);
        fwrite($myFile,$datas);
        return [
            'code' => 1,
            'msg' => Yii::t('app', 'global')['true'],
            'data'=>$data,
        ];
    }
}