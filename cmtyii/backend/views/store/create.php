<?php

use kartik\file\FileInput;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $storeModel backend\models\SpStore */

$this->title = Yii::t('app', '添加商铺');
?>
<div class="sp-store-create" >
<!--    标题开始-->
    <div class="container-fluid" style="
        margin-left: -15px;
        background-color: #FFFFFF;
        margin-right: -15px;
        min-height: 49px;
        border-bottom: 1px solid #d6d6d6;
        margin-bottom: 15px;
    ">

        <span style="line-height: 50px; font-weight: 700;font-size: 14px;">添加商铺</span>

    </div>
<!--    标题结束-->

    <?= $this->render('_form', [
        'storeModel' => $storeModel,
        'shoperModel' => $shoperModel,
        'uploadModel'=>$uploadModel
    ]) ?>
</div>