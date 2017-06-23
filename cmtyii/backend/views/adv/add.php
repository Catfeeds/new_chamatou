<?php
use yii\helpers\Url;
use yii\bootstrap\Html;
$this->title = '添加广告';
$this->params['breadcrumbs'][] = $this->title;
?>

<style>
    .lr_nav{
        background-color: #ffffff;
        width: 100%;
        height: 60px;
        overflow: hidden;
        margin-bottom: 15px;
    }
    .lr_nav ul li{
        float: left;
        list-style: none;
        width: 100px;
        height: 54px;
        line-height: 60px;
        font-size: 15px;
        text-align: center;
        color: #323232;
    }
    .lr_nav ul .lr_action{
        border-bottom: 4px solid #0062ae;
        color: #2f3f58;
    }
    .lr_nav ul :hover{
        border-bottom: 4px solid #0062ae;
        color: #2f3f58;
    }
    .lr_nav ul{
        padding: 0;
    }
    .wrapper form{
        width: 50%;
        padding: 15px;
    }

</style>

<div class="lr_nav">
    <ul>
        <a href="<?= Url::to(['adv/index'])?>"><li>广告列表</li></a>
        <a href="<?= Url::to(['adv/add'])?>"><li  class="lr_action ">添加广告</li></a>
    </ul>

</div>

<div class="wrapper">

    <?php $form = \yii\bootstrap\ActiveForm::begin(['options' => ['enctype'=>'multipart/form-data'],]);?>
    <div class="form-group">
        <?= $form->field($model, 'title')->textInput();?>
    </div>
    <div class="form-group" style="float: left">
        <?= $form->field($model, 'file')->widget(\kartik\file\FileInput::classname(), [
            'options' => [
                'accept' => 'image/*',
                'multiple' => true
            ],
            'pluginOptions' => [
                'maxFileCount' => 5,
                'showUpload' => false
            ]
        ]);?>
        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999;">
            * 注：上传图片尺寸为1200X450,否则影响茶坊端商城显示效果！
        </div>
    </div>
   <?
    echo \yii\helpers\Html::submitInput('提交', ['class' => 'btn btn-success', 'style' => 'margin-right:1em;']);
    \yii\bootstrap\ActiveForm::end();
    ?>
</div>