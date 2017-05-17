<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\web\UploadedFile;

class Upload extends Model
{
    /**
     * @var UploadedFile|Null file attribute
     */
    public $file;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [["file"], "file", 'maxFiles'=> 10],
        ];
    }
    public function attributeLabels()
    {
        return [
          'file' => '上传图片',
        ];
    }

    public static function uploadStoreImg($store_id, $dir = null)
    {
        $upload = new Upload();
        $uploadSuccessPath = "";

        if(UploadedFile::getInstances($upload, "file")){
            $upload->file = UploadedFile::getInstances($upload, "file");
        }else{
            $upload->file = UploadedFile::getInstance($upload, "file");
        }
        $dir = "public/uploads/" . date("Ymd");
        if (!is_dir($dir)){
            mkdir($dir);
        }
        $file_ids = [];
        if ($upload->file && $upload->validate()) {
            foreach ($upload->file as $file) {
                $fileName = date("HiiHsHis") . $file->baseName . "." . $file->extension;
                $dir = "public/uploads/" . date("Ymd") . "/" . $fileName;
                $file->saveAs($dir);
                $uploadSuccessPath = "/uploads/" . date("Ymd") . "/" . $fileName;
                //保存图片
                $model = new ShoperImg();
                $model->path = $uploadSuccessPath;
                $model->store_id = $store_id;
                if($model->validate() && $model->save()){

                }
            }

        }
        return $file_ids;
    }
}