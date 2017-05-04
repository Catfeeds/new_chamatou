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

    public function consumption($num)
    {
        $user = \Yii::$app->session->get('wx_user');
        $this->add_time = time();
        $this->user_id = 1;
        $this->num = $num;
        $tr = \Yii::$app->db->beginTransaction();
        try {
            //扣除用户的茶豆币
            $res = User::deduction($this->num);
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