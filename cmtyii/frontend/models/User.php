<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/3
 * Time: 14:12
 */

namespace frontend\models;


use yii\db\ActiveRecord;

class User extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%wx_user}}';
    }

    public function rules()
    {
        return [
            ['beans','required'],
            ['beans','number'],
        ];
    }

    /**
     * 扣除和记录用户茶豆币消费
     * @param $num
     * @return bool|string
     */
    public static function deduction($num,$user_id)
    {
        $user = \Yii::$app->session->get('wx_user');
        $userModel = User::findOne($user_id);
        if($userModel->beans < $num){
            return '茶豆币余额不足!';
        }
        $userModel->beans -= $num;
        if(!$userModel->save()){
            return '茶豆币扣除失败!';
        }
        return true;
    }


    /**
     * 判断商品数组中是否有重复的商品记录
     * 如果重复就将里面的数量相加 并删除多余的记录
     *
     */
    public static function setGoods($goods)
    {
        $goods_id = [];
        $count = 0;
        foreach ($goods as $key=>$value)
        {
            if (isset($goods_id[$value['goods_id']])){
                unset($goods[$key]);
            }else{
                $goods_id[$value['goods_id']] = $value['num'];
                foreach ($goods as $key2=>$vlue2)
                {
                    if($vlue2['goods_id'] == $value['goods_id'] && $vlue2['id'] != $value['id'])
                    {
                        $goods_id[$value['goods_id']] = $goods_id[$value['goods_id']]+$vlue2['num'];
                        $goods[$key]['num'] = $goods[$key]['num'] + $vlue2['num'];
                    }
                }
                $count += $goods[$key]['num'];
            }
        }
        return ['goods'=>$goods,'count'=>$count];
    }

    /**
     * 保存用户充值记录
     * @param $beans
     * @param $user_id
     * @return bool
     */
    public static function recharge($beans,$user_id)
    {
       $model = new Consumption();
       $model->user_id = $user_id;
       $model->num = $beans;
       $model->type = 1;
       $model->method = 1;
       $model->add_time = time();
       if($model->save()){
           return true;
       }
       return false;
    }

    public static function chekUser($user)
    {

        var_dump($user->getId());
    }
}