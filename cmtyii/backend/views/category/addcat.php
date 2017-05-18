<?php
use yii\helpers\Url;
use yii\bootstrap\Html;
$this->title = '添加分类';
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
            <a href="<?= Url::to(['goods/index'])?>"><li>商品列表</li></a>
            <a href="<?= Url::to(['category/add'])?>"><li  class="lr_action ">新增分类</li></a>
            <a href="<?= Url::to(['goods/add'])?>"><li >新增商品</li></a>
        </ul>
   
    </div>

<div class="wrapper">
    <?php
    $form = \yii\bootstrap\ActiveForm::begin();
    echo $form->field($model, 'cate_name')->textInput();
    echo \yii\helpers\Html::submitInput('提交', ['class' => 'btn btn-success', 'style' => 'margin-right:1em;']);
    \yii\bootstrap\ActiveForm::end();
    ?>
</div>

