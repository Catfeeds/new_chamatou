<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/5
 * Time: 13:03
 */

namespace frontend\controllers;

use frontend\common\Common;
use frontend\models\User;
use tea\models\Store;

class IndexController extends BaseController
{
    public function init()
    {
        parent::init();
    }

    //用户访问就去请求授权接口
    public function actionIndex()
    {
        return \Yii::$app->wechat->authorizeRequired()->send();
    }

    //授权回调页面
    public function actionCallback()
    {
        $user = \Yii::$app->wechat->app->oauth->user();
        $openid = $user->getId();
        //获取用户信息
        $userinfo = User::find()->where("openid = '$openid'")->asArray()->one();
        //没有用户信息执行保存信息
        if(!$userinfo){
            $userModel = new User();//实例化用户对象
            $userModel->openid = $user->getId();//将用户openid复制给对象
            $userModel->photo = $user->getAvatar();//赋值头像地址
            $userModel->nickname = $user->getNickname();//赋值昵称
            $userModel->add_time = time();//赋值添加时间
            if(!$userModel->save(false)){
                echo "<script>alert('出错啦!!!')</script>";
                exit;
            }
            //保存成功后获取用户信息
            $userinfo = User::find()->where("openid = '$openid'")->asArray()->one();
        }
        //将用户信息保存到session中
        \Yii::$app->session->set('wx_user',$userinfo);
        \Yii::$app->session->set('openid',$userinfo['openid']);
        //跳转到用户首页
        header("Location: http://127.0.0.1.tunnel.qydev.com/wx");
    }


    /**
     * 首页附近茶楼列表  目前只推荐省类的茶楼
     * @return array
     */
    public function actionTea()
    {
        $data = \Yii::$app->request->get();
        //$data = ['lat'=>45.47560430450,'lon'=>122.45367732552];
        $teas = Store::find()
            ->where(['like','address',"{$data['address']}"])
            ->select(['id','sp_name','address','lat','lon'])
            ->asArray()->all();
       // var_dump($teas);die;
        if(!$teas){
            return ['status'=>0,'msg'=>'你所在的省份没有发现茶楼'];
        }
        foreach ($teas as $k=>$v){
            $pic = \Yii::$app->db->createCommand("select path from t_shoper_img where store_id = :store_id",
                ['store_id'=>$v['id']])->queryOne();
            $teas[$k]['teaPic'] = $pic['path'];
        }
        $addLat = ['lat'=>$data['lat'],'lon'=>$data['lon']];
        $model = new Common();
        $tea = $model->distance($addLat,$teas);
        return ['status'=>1,'data'=>$tea];

    }

    /**
     * 茶楼详情
     */
    public function actionTeadetail()
    {
        $store_id = \Yii::$app->request->get('id');
        $store = \frontend\models\Store::findOne($store_id);
        if($store){
            $pic = $store->getPic(['path']);
            $pic2 = [];
            foreach ($pic as $value){
                $pic2[] = $value['path'];
            }
            $data = [
                'status'=>1,
                'data'=>[
                    'sp_name'=>$store->sp_name,
                    'address'=>$store->address,
                    'sp_phone'=>$store->sp_phone,
                    'intro'=>$store->intro,
                    'pic' => $pic2,
                    'lat' => $store->lat,
                    'lon' => $store->lon,
                ]
            ];
        }else{
            $data = ['status'=>0,'msg'=>'获取详情失败'];
        }
        return $data;
    }

}