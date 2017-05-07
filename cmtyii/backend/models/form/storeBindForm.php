<?php
/**
 * Created by PhpStorm.
 * User: harlen-z97
 * Date: 2017/5/8
 * Time: 上午1:27
 */

namespace backend\models\form;


use backend\models\Shoper;
use backend\models\ShoperImg;
use backend\models\SpStore;
use backend\models\SpUsers;
use yii\base\Model;

class storeBindForm extends Model
{
    public $store_id;
    public $shoper_id;

    public function rules()
    {
        return [
            [['shoper_id'], 'integer']
        ];
    }

    public function getShoperList()
    {
        return Shoper::find()
            ->all();
    }

    public function bind()
    {
        if(!$this->validate()){
            return false;
        }

        SpStore::updateAll(['shoper_id'=>$this->shoper_id], ['id'=>$this->store_id]);
        SpUsers::updateAll(['shoper_id'=>$this->shoper_id], ['store_id'=>$this->store_id]);
        ShoperImg::updateAll(['shoper_id'=>$this->shoper_id], ['store_id'=>$this->store_id]);

        return true;
    }

}