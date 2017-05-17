<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/3
 * Time: 18:21
 */

namespace frontend\models;


use yii\db\ActiveRecord;
use yii\db\Exception;

class Consumption extends ActiveRecord
{
    public $error;
    public static function tableName()
    {
        return '{{%users_beans_log}}';
    }

    public function rules()
    {
        return [
            [['add_time','user_id','num'],'required'],
            [['add_time','user_id','num'],'number'],
        ];
    }

    /**
     * 用户点单时使用茶豆币抵用  扣除茶豆币并记录
     * 使用事务  当操作出错时用户的操作无效
     * @param $num
     * @return bool
     */
    public function consumption($num,$user_id)
    {
        $user = \Yii::$app->session->get('wx_user');
        $this->add_time = time();
        $this->user_id = $user_id;
        $this->num = $num;
        $tr = \Yii::$app->db->beginTransaction();
        try {
            //扣除用户的茶豆币
            $res = User::deduction($this->num,$user_id);
            if($res !== true){
               throw new \Exception('用户茶豆币扣除失败');
            }
            //执行保存用户茶豆币的消费记录
            if(!$this->save()){
                throw new \Exception($this->getFirstError());
            }
            $tr->commit();
            return true;
        } catch(\Exception $e){
            $tr->rollBack();
            return false;
        }
    }
}