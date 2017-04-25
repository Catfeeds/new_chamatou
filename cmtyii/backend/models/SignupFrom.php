<?php
namespace backend\models;

use yii\base\Model;
use backend\models\Adminuser;

class SignupForm extends Model
{
    public $username;
    public $real_name;
    public $phone;
    public $password;
    public $password_repeat;
    public $email;
    public $status;

    public function rules()
    {
        return [
            ['username', 'filter', 'filter'=> 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass'=>'\backend\models\Adminuser', 'message'=>'用户名已存在'],
            ['username', 'string', 'min'=>2, 'max'=> 255],

            ['email', 'filter', 'filter'=> 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass'=> '\backend\models\Adminuser', 'message'=>'邮箱已经存在'],

        ];
    }
}