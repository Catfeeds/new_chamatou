<?php
/**
 * User: harlen-angkemac
 * Date: 2017/4/27 - 上午10:27
 *
 */

namespace backend\controllers;

use backend\models\Locations;
use backend\models\Upload;
use Yii;
use yii\bootstrap\Html;
use yii\web\Controller;
use yii\web\UploadedFile;

/**
 * 工具控制器
 * Class ToolsController
 * @package backend\controllers
 */
class ToolsController extends Controller
{
    /**
     * 地址三级联动
     * @param $pid
     * @param int $typeid
     */
    public function actionAddress($pid, $typeid = 0)
    {
        $model = Locations::getCityList($pid);
        $aa = "--请选择区--";
        if($typeid == 1){$aa="--请选择市--";}else if($typeid == 2 && $model){$aa="--请选择区--";}

        echo Html::tag('option',$aa, ['value'=>'empty']) ;

        foreach($model as $value=>$name)
        {
            echo Html::tag('option',Html::encode($name),array('value'=>$value));
        }
    }
    /**
     *  文件上传
     *  我们这里上传成功后把图片的地址进行返回
     */
    public function actionUpload()
    {
        $model = new Upload();
        $uploadSuccessPath = "";
        if (Yii::$app->request->isPost) {
            $model->file = UploadedFile::getInstance($model, "file");
            //文件上传存放的目录
            $dir = "../../public/uploads/".date("Ymd");
            if (!is_dir($dir))
                mkdir($dir);
            if ($model->validate()) {
                //文件名
                $fileName = date("HiiHsHis").$model->file->baseName . "." . $model->file->extension;
                $dir = $dir."/". $fileName;
                $model->file->saveAs($dir);
                $uploadSuccessPath = "/uploads/".date("Ymd")."/".$fileName;
            }
        }
        return $this->render("upload", [
            "model" => $model,
            "uploadSuccessPath" => $uploadSuccessPath,
        ]);
    }
}