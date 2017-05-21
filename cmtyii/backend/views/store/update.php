<?php

use kartik\file\FileInput;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\SpStore */

$this->title = Yii::t('app', '更新店铺信息 ');
?>
<div class="sp-store-update" >
    <!--    标题开始-->
    <div class="container-fluid" style="
        margin-left: -15px;
        background-color: #FFFFFF;
        margin-right: -15px;
        min-height: 49px;
        border-bottom: 1px solid #d6d6d6;
        margin-bottom: 15px;
    ">

        <span style="line-height: 50px; font-weight: 700;font-size: 14px;">更新店铺信息</span>

    </div>
    <!--    标题结束-->

    <?= $this->render('_form', [
        'storeModel' => $storeModel,
        'shoperModel' => $shoperModel,
        'uploadModel'=>$uploadModel
    ]) ?>
</div>