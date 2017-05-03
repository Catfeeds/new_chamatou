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

//    public static function deduction($num)
//    {
//        $user = \Yii::$app->session->get('wx_user');
//        $userModel = User::findOne($user['id']);
//        if($userModel->beans < $num){
//            return
//        }
//    }
}