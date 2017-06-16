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

    /**
     * 上传图片类
     * @param $param
     * @param null $dir
     * @return array
     */
    public static function uploadStoreImg($param, $dir = null)
    {

        $upload = new Upload();
        $uploadSuccessPath = "";

        if(UploadedFile::getInstances($upload, "file")){
            $upload->file = UploadedFile::getInstances($upload, "file");
        }else{
            $upload->file = UploadedFile::getInstance($upload, "file");
        }
        $dir = Yii::$app->getBasePath()."/web/public/uploads/" . date("Ymd");
        if (!is_dir($dir)){

            mkdir($dir,0777,true);
        }
        $file_ids = [];
        if ($upload->file && $upload->validate()) {
            self::delImg($param);
            foreach ($upload->file as $file) {
                $fileName = date("HiiHsHis") . $file->baseName . "." . $file->extension;
                $dir = "public/uploads/" . date("Ymd") . "/" . $fileName;
                $file->saveAs($dir);
                $uploadSuccessPath = "/uploads/" . date("Ymd") . "/" . $fileName;
                //保存图片
                $model = new ShoperImg();
                $model->path = $uploadSuccessPath;
                $model->store_id = $param['storeId'];
                $model->shoper_id = $param['shoperId'];
                if($model->validate() && $model->save()){

                }
            }

        }
        return $file_ids;
    }

    /**
     * 获取店铺文件
     * @param $storeId
     * @return array|\yii\db\ActiveRecord[]
     */
    public static function getStoreImg($storeId)
    {
        $storeImage =  ShoperImg::find()->andWhere(['store_id'=>$storeId])->select(['path'])->all();
        $imagesArray = [];
        foreach ($storeImage as $key=>$images)
        {
            $imagesArray[] = Yii::$app->request->hostInfo.'/public/'.$images['path'];
        }
        return $imagesArray;
    }
    /**
     * 删除图片
     * 方法有点小问题！需要开启事务
     * @param $param
     */
    public static function delImg($param)
    {
        if(is_array($param)){
            $Model = ShoperImg::find()->andWhere(['store_id'=>$param['storeId']])->andWhere(['shoper_id'=>$param['shoperId']])->all();
        }else{
            $Model = GoodsImg::find()->where(['goods_id'=>$param])->all();
        }
        foreach ($Model as $key=>$value){
            $value->delete();
        }
    }

    /**
     * 处理商品相册图片上传
     * @param $param  商品id
     * @return array
     */
    public static function uploadGoodsImg($goods_id)
    {
        $upload = new Upload();
        $uploadSuccessPath = "";

        if(UploadedFile::getInstances($upload, "file")){
            $upload->file = UploadedFile::getInstances($upload, "file");
        }else{
            $upload->file = UploadedFile::getInstance($upload, "file");
        }
        if(!($upload->file)){
            return true;
        }
        $dir = "upload/" . date("Ymd");
        if (!is_dir($dir)){
            mkdir($dir);
        }
        $file_ids = [];
        if ($upload->file && $upload->validate()) {
            self::delImg($goods_id);
            foreach ($upload->file as $file) {
                $fileName = date("HiiHsHis") . $file->baseName . "." . $file->extension;
                $dir = "upload/" . date("Ymd") . "/" . $fileName;
                $file->saveAs($dir);
                $uploadSuccessPath = "/upload/" . date("Ymd") . "/" . $fileName;
                //保存图片
                $model = new GoodsImg();
                $model->path = $uploadSuccessPath;
                $model->goods_id = $goods_id;
                if($model->validate() && $model->save()){

                }
            }

        }
        return $file_ids;
    }
}