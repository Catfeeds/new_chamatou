<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/6/14
 * Time: 20:39
 */

namespace backend\models;


use yii\db\ActiveRecord;
use yii\web\UploadedFile;

class Adv extends ActiveRecord
{
    public $file;
    public function rules()
    {
        return [
            [["file"], "file", 'maxFiles'=> 10],
            [['title'],'required'],
            ['photo','safe']
        ];
    }
    public function attributeLabels()
    {
        return [
            'file' => '广告图片',
            'title' => '广告标题',
        ];
    }

    public function addAdv()
    {
        $this->file = UploadedFile::getInstance($this,'file');
        $dir = "upload/adv";
        if (!is_dir($dir)){
            mkdir($dir);
        }
        //self::delImg($goods_id);
        $fileName = date("YmdHis").rand(0000,9999) ."." . $this->file->extension;
        $dir = "upload/adv" . "/" . $fileName;
        $this->file->saveAs($dir);
        $uploadSuccessPath = "/upload/adv" . "/" . $fileName;
        //保存图片
        $this->photo = $uploadSuccessPath;
        if($this->save(false)){
            return true;
        }
        return false;
    }
}