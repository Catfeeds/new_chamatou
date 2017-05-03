<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/3
 * Time: 18:21
 */

namespace frontend\models;


use yii\db\ActiveRecord;

class Consumption extends ActiveRecord
{
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
        if($this->save()){
            return true;
        }
        return false;
    }
}