<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/5/12
 * Time: 17:15
 */

namespace backend\models;


use frontend\models\User;
use yii\db\ActiveRecord;

class UserRecharge extends ActiveRecord
{
    public static function tableName()
    {
        return "{{%users_beans_log}}";
    }

    public function getUserInfo($select = [])
    {
        return $this->hasOne(User::className(),['id'=>'user_id'])->select($select)->one();
    }
}