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
    public $user_id;

    public function beforeAction($action)
    {
        $user = \Yii::$app->session->get('wx_user');
        $this->user = $user;
        $this->user_id = $user['id'];
        return true;
    }
    /**
     * 用户茶豆币充值
     * @return array
     */
//    public function actionRecharge()
//    {
//        //查出茶豆币的兑换比例
//        $beans = BeansConfig::find()->asArray()->one();
//        $re_beans = (\Yii::$app->request->post('money')*$beans["scale"]);
//        $userModel = User::findOne($this->user_id);
//        $userModel->beans += $re_beans;
//        if($userModel->save()){
//            //用户充值成功保存充值记录
//            $re = User::recharge($re_beans,$this->user_id);
//            if($re){
//                return ['status'=>1,'msg'=>'充值成功'];
//            }
//        }
//        return ['status'=>0,'msg'=>'充值失败'];
//
//    }

    /**
     * 获取用户茶豆币余额
     * @return array
     */
    public function actionGetbeans()
    {
        $user = User::findOne($this->user_id);
        if($user){
            return [
                'status'=>1,
                'beans'=>$user->beans ? $user->beans : 0,
                'userPic'=>$user->photo,
                'userName'=>$user->nickname,
                'phone'  => $user->phone,
            ];
        }
        return ['status'=>0,'msg'=>'获取用户信息失败','beans'=>0];
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
        $res = User::setGoods($goods);
        //计算出当前订单中商品的总价
        $total_amount = 0;
        foreach ($res['goods'] as $v){
            $total_amount += $v['num'] * $v['price'];
        }
        //取出台桌号码  供继续点单的时候使用
        $table_name = $orderM->table_name;
        $start = strpos($table_name,'-');
        $table_no = substr($table_name,$start+2);
        return [
            'status'=>1,
            'allNum'=>$res['count'],
            'order_status'=>$orderM->status,
            'order_no' => $orderM->start_time,
            //已完成订单可能包含包间费用 所以用订单自带的总额  进行中的订单没有该总额  所以返回该订单中商品的总价
            'allPic'=>$orderM->status == 2 ? $orderM->total_amount : $total_amount,
            'data'=>$res['goods'],
            'table_no' => $table_no,
            'tableName' => $table_name,
            'beans' =>  $orderM->beans_amount,
            'store_id'=>$orderM->store_id,
            'shoper_id' => $orderM->shoper_id,
        ];
    }

    //订单列表
    public function actionOrderlist()
    {
        $order_list = Order::find()->orderBy('start_time desc')->where("wx_user_id = {$this->user_id}")->all();
        $data = [];
        foreach ($order_list as $value){
            $store_info = $value->getStore(['sp_name']);
            $goods_info = $value->getGoods(['goods_name','add_time']);
            //获取茶楼的店铺图片
            $store_img = \Yii::$app->db->createCommand("select path from t_shoper_img where shoper_id = :shoper_id and store_id = :store_id",
                [':shoper_id'=>1,'store_id'=>29])->queryOne();
            $data[] = [
                'order_id' =>$value->id,
                'order_status' =>$value->status,
                'shop_name' => $store_info['sp_name'],
                'shop_pic'=>$store_img['path'],
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
        $user = \Yii::$app->session->get('wx_user');
        if($user['phone'] == ""){
            return ['status'=>1,'vip_num'=>0];
        }
        $vip_count = Vip::find()->where("phone = {$user['phone']}")->count();
        return ['status'=>1,'vip_num'=>$vip_count];
    }

    /**
     * 用户会员卡列表
     * @return array
     */
    public function actionViplist()
    {
        $user = \Yii::$app->session->get('wx_user');
        $vip_list = UserVip::find()
            ->where("phone = {$user['phone']}")
            ->select(['card_no','vip_amount','shoper_id'])
            ->all();
       if(!$vip_list){
           return ['status'=>0,'msg'=>'你还没有会员卡哦'];
       }
        $data = [];
        foreach ($vip_list as $value){
            $shoper = $value->getStore(['sp_name']);
            $data[] = [
                'shoper_name' => $shoper['sp_name'],
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
        //var_dump($recharge_list);die;
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
        $ip =  $code = \Yii::$app->cache->get('user_ip');

        if(!empty($ip)){
           return ['status'=>0,'msg'=>'过于频繁!请稍候再试!'];
        }
        \Yii::$app->cache->set('user_ip',\Yii::$app->request->userIP,120);
        $phone = \Yii::$app->request->get('phone');
        $userPhone = User::find()->where(['phone'=>$phone])->all();
        if ($userPhone){
            return ['status'=>0,'msg'=>'该手机号已经绑定'];
        }
        $code = rand(1000,9999);
        if(SendSms::send($phone,$code)){
            \Yii::$app->cache->set('sms_code',$code,60);
            \Yii::$app->cache->set('sms_phone',$phone,60);
            return ['status'=>1,'data'=>$code];
        }else{
            return ['status'=>0,'msg'=>'发送失败了'];
        }
    }

    /**
     * 验证手机验证码
     * @return array
     */
    public function actionVerify()
    {
        $data = \Yii::$app->request->post();
        $code = \Yii::$app->cache->get('sms_code');
        $phone = \Yii::$app->cache->get('sms_phone');
        if(!$code){
            return ['status'=>0,'msg'=>'验证码已过期,请重新获取!'];
        }
        if($data['code'] != $code){
            return ['status'=>0,'msg'=>'验证码错误!'];
        }
        if($data['phone'] != $phone){
            return ['status'=>0,'msg'=>'该手机号和验证手机号不同'];
        }
        $userModel = User::findOne($this->user_id);
        $userModel->phone = $data['phone'];
        if($userModel->save(false)){
            return ['status'=>1,'msg'=>'验证成功'];
        }
        return ['status'=>0,'msg'=>'绑定手机失败,请稍后再试'];
    }
}