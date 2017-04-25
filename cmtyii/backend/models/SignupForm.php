<?php

namespace backend\models;

use yii\base\Model;
use backend\models\Adminuser;

class SignupForm extends Model
{
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;

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
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\backend\models\Adminuser', 'message' => '用户名已存在'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['real_name', 'filter', 'filter' => 'trim'],
            ['real_name', 'required'],
            ['real_name', 'string', 'min' => 2, 'max' => 255],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\backend\models\Adminuser', 'message' => '邮箱已经存在'],

            ['phone', 'filter', 'filter' => 'trim'],
            ['phone', 'required'],
            //['phone', 'number', 'length', 'max' => 11],
            ['phone', 'unique', 'targetClass' => '\backend\models\Adminuser', 'message' => '手机号已经存在'],

            ['status', 'required'],
            ['status', 'number'],


        ];
    }

    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'real_name' => '真实姓名',
            'email' => 'Email',
            'phone' => '电话',
            'status' => '状态',
        ];
    }

    public function signup()
    {

        if (!$this->validate()) {
            return null;
        }

        $user = new Adminuser();
        $user->username = $this->username;
        $user->real_name = $this->real_name;
        $user->phone = $this->phone;
        $user->email = $this->email;
        $user->status = $this->status;

        $user->setPassword('123456');
        $user->generateAuthKey();
        return $user->save() ? $user : null;
    }
}