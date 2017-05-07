<?php
/**
 * Created by PhpStorm.
 * User: harlen-z97
 * Date: 2017/5/8
 * Time: 上午12:34
 */

namespace backend\models\form;


use backend\models\Shoper;
use backend\models\SpUsers;

class ShoperForm extends Shoper
{

    public function createShoper()
    {
        if(!$this->validate()){
            return false;
        }

        $this->createShoperAdmin();
        return $this->save();
    }

    public function createShoperAdmin()
    {
        $spUser = new SpUsers();
        $spUser->user = 'admin';
        $spUser->phone = $this->phone;
        $spUser->add_time = time();
        $spUser->password = md5('123456');
        $spUser->is_admin = 1;
        $spUser->status = 0;
        return $spUser->save();
    }
}