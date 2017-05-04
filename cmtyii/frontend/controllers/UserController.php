<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/3
 * Time: 14:04
 */

namespace frontend\controllers;


use frontend\common\SendSms;
use frontend\models\BeansConfig;
use frontend\models\Consumption;
use frontend\models\User;
use frontend\models\UserVip;
use gmars\sms\Sms;
use tea\models\Order;
use tea\models\OrderGoods;
use tea\models\Vip;

class UserController extends BaseController
{
    public $user;
    public $user_id = 1;

    public function beforeAction($action)
    {
        $this->user = \Yii::$app->session->get('wx_user');
        return true;
    }
    /**
     * 用户茶豆币充值
     * @return array
     */
    public function actionRecharge()
    {
        $beans = BeansConfig::find()->asArray()->one();
        //查出茶豆币的兑换比例

        $userModel = User::findOne($this->user_id);
            $userModel->beans += (\Yii::$app->request->post('money')*$beans["scale"]);
            if($userModel->save()){
                return ['status'=>1,'msg'=>'充值成功'];
            }else{
                return ['status'=>0,'msg'=>'充值失败'];
            }
    }

    /**
     * 获取用户茶豆币余额
     * @return array
     */
    public function actionGetbeans()
    {
        $user = User::findOne($this->user_id);
        if($user){
            return ['status'=>1,'beans'=>$user->beans];
        }
        return ['status'=>0,'msg'=>'获取用户信息错误'];
    }

    /**
     * 获取茶豆币兑换比例
     * @return array
     */
    public function actionGetconfig()
    {
        $beans = BeansConfig::find()->asArray()->one();
        if(!$beans){
            $data = ['status'=>0,'data'=>''];
        }else{
            $data = ['status'=>1,'data'=>$beans['scale']];
        }
        return $data;
    }

    //获取订单详情
    public function actionOrderdetail()
    {
        $order_id = \Yii::$app->request->get('order_id');
        $goods = OrderGoods::find()->where("order_id = {$order_id}")->asArray()->all();
        $orderM = Order::findOne($order_id);//查询该笔订单
        if(!$goods){
            return ['status'=>0,'data'=>[]];
        }
        //调用模型中自定义的方法 将数组中重复的商品数量累加
        $goods = User::setGoods($goods);
        $count = count($goods);//统计总的商品种数
        return [
            'status'=>1,'allNum'=>$count,
            'order_status'=>$orderM->status,
            'order_no' => $orderM->start_time,
            'allPic'=>$orderM->total_amount,
            'data'=>$goods];
    }

    //订单列表
    public function actionOrderlist()
    {
        $order_list = Order::find()->orderBy('start_time desc')->where("wx_user_id = {$this->user_id}")->all();
        $data = [];
        foreach ($order_list as $value){
            $store_info = $value->getStore(['sp_name']);
            $goods_info = $value->getGoods(['goods_name',]);
            //$store_img = \Yii::$app->db->createCommand("select * from t_shoper_img where shoper_id = :shoper_id and store_id = :store_id",
              //  [':shoper_id']);
            //var_dump($store_info);die;
            $data[] = [
                'order_id' =>$value->id,
                'order_status' =>$value->status,
                'shop_name' => $store_info[0]['sp_name'],
                'shop_pic'=>2,
                'total_amount'=>$value->total_amount,
                'order_time' => date('Y-m-d H:i:s',$value->start_time),
                'order_no' => $value->start_time,
                'goods'=>$goods_info,
            ];
        }
        if(!$order_list){
            $result = ['status'=>0,'msg'=>'你还没有任何消费哦!赶紧去试试吧!'];
        }else{
            $result = ['status'=>1,'data'=>$data];
        }
        return $result;
    }


    /**
     * 获取用户会员卡的数量
     * @return array
     */
    public function actionVip()
    {
        $vip_count = Vip::find()->where("user_id = $this->user_id")->count();
        return ['vip_num'=>$vip_count];
    }

    /**
     * 用户会员卡列表
     * @return array
     */
    public function actionViplist()
    {
        $vip_list = UserVip::find()
            ->where("user_id = $this->user_id")
            ->select(['card_no','vip_amount','shoper_id'])
            ->all();
       if(!$vip_list){
           return ['status'=>0,'msg'=>'你还没有会员卡哦'];
       }
        $data = [];
        foreach ($vip_list as $value){
            $shoper = $value->getStore(['boss']);
            $data[] = [
                'shoper_name' => $shoper['boss'],
                'vip_total' => $value->vip_amount,
                'card_no'   => $value->card_no,
            ];
        }
        return ['status'=>1,'data'=>$data];
    }

    /**
     * 获取用户茶豆币消费信息
     * @return array
     */
    public function actionBeanscons()
    {
        $cons_list = Consumption::find()
            ->where("user_id = $this->user_id and type = 0")
            ->select(['id','num','add_time'])
            ->asArray()->all();
        if(!$cons_list){
            return ['status'=>0,'msg'=>'暂无消费记录'];
        }
        foreach ($cons_list as &$value){
            $value['add_time'] = date("Y-m-d H:i:s",$value['add_time']);
        }
        $result = ['status'=>1,'data'=>$cons_list];
        return $result;
    }

    /**
     * 用户充值记录
     * @return array
     */
    public function actionGetrecharge()
    {
        $recharge_list = Consumption::find()
            ->where("user_id = $this->user_id and type = 1")
            ->select(['id','num','add_time'])
            ->asArray()->all();
        foreach ($recharge_list as &$value){
            $value['add_time'] = date("Y-m-d H:i:s",$value['add_time']);
        }
        if(!$recharge_list){
            $result = ['status'=>0,'msg'=>'暂无消费记录'];
        }else{
            $result = ['status'=>1,'data'=>$recharge_list];
        }
        return $result;
    }

    /**
     * 发送短信验证码
     * @return array
     */
    public function actionBingphone()
    {
        $phone = \Yii::$app->request->get('phone');
        $code = rand(1000,9999);
        if(SendSms::send($phone,$code)){
            \Yii::$app->cache->set('sms_code',$code,300);
            return ['status'=>1,'data'=>$code];
        }else{
            return ['status'=>0,'msg'=>'发送失败了'];
        }
    }

    public function actionVerify()
    {
        $data = \Yii::$app->request->post();
        $code = \Yii::$app->cache->get('sms_code');
        if(!$code){
            return ['status'=>0,'msg'=>'验证码已过期,请重新获取!'];
        }
        if($data['code'] != $code){
            return ['status'=>0,'msg'=>'验证码错误!'];
        }
        return ['status'=>1,'msg'=>'验证成功'];
    }
}