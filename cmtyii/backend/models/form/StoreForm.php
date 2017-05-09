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
    public $old_img;

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

        $lat_lon = Locations::address2ll($this->add_detail, $this->city_id, $this->provinces_id);

        $this->address = Locations::byIdAddress($this->provinces_id, $this->city_id, $this->area_id, $this->add_detail);
        $this->lat = $lat_lon['lat'];
        $this->lon = $lat_lon['lon'];

        $this->save();
        Upload::uploadStoreImg($this->id);
        return $this ? $this : null;
    }

    public function updateStore()
    {
        if(!$this->validate()){
            return false;
        }


        $lat_lon = Locations::address2ll($this->add_detail, $this->city_id, $this->provinces_id);

        $this->address = Locations::byIdAddress($this->provinces_id, $this->city_id, $this->area_id, $this->add_detail);
        $this->lat = $lat_lon['lat'];
        $this->lon = $lat_lon['lon'];


        $this->save();
        //TODO:: 有上传文件，再增加文件
        Upload::uploadStoreImg($this->id);
        return $this ? $this : null;
    }

    public static function store($id)
    {
        $model = StoreForm::findOne($id);
        $model->old_img = ShoperImg::find()->where(['store_id'=>$id])->indexBy('id')->select('path,id')->column();
        return $model;
    }
}