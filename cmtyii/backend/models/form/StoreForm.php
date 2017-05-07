<?php
/**
 * Created by PhpStorm.
 * User: harlen-z97
 * Date: 2017/5/7
 * Time: 下午10:33
 */

namespace backend\models\form;


use backend\models\Locations;
use backend\models\ShoperImg;
use backend\models\SpStore;
use backend\models\Upload;
use yii\web\UploadedFile;

class StoreForm extends SpStore
{
    public function getLocations($parent_id)
    {
        return Locations::find()
            ->select('name,id')
            ->where(['parent_id'=>$parent_id])
            ->indexBy('id')
            ->column();
    }

    public function addStore()
    {
        if(!$this->validate()){
            return false;
        }
        $this->save();
        Upload::uploadStoreImg($this->id);
        return $this ? $this : null;
    }
}