<?php
/**
 * User: harlen-angkemac
 * Date: 2017/4/27 - 上午10:27
 *
 */

namespace backend\controllers;

use backend\models\Locations;
use yii\bootstrap\Html;
use yii\web\Controller;

class PublicController extends Controller
{
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
}