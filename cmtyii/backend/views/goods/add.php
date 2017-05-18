<?php
use backend\assets\AppAsset;
use yii\helpers\Url;
use yii\bootstrap\Html;
$this->title = '添加商品';
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
    .lr_nav ul{
        padding: 0;
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
</style>
    <div class="lr_nav">
        <ul>
            <a href="<?= Url::to(['goods/index'])?>"><li>商品列表</li></a>
            <a href="<?= Url::to(['category/add'])?>"><li>新增分类</li></a>
            <a href="<?= Url::to(['goods/add'])?>"><li   class="lr_action ">新增商品</li></a>
        </ul>
    
    </div>

<section class="wrapper">
    <!-- page start-->
    <div class="row">
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                </header>
                <div class="panel-body">
                    <?php
                    $form = \yii\bootstrap\ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]);
                    echo $form->field($model, 'goods_name')->textInput();
                    echo $form->field($model, 'file')->fileInput()->label('商品图片');
                    if(!$model->isNewRecord){
                     echo \yii\helpers\Html::img($model->cover,['width'=>'60px']);
                    }
                    echo $form->field($model, 'price')->textInput();
                    echo $form->field($model, 'store')->textInput();
                    echo $form->field($model, 'spec')->textInput();
                    echo $form->field($model, 'cat_id')->dropDownList($cate);
                    echo $form->field($model, 'content')->widget(\yii\redactor\widgets\Redactor::className(),[
                        'clientOptions' => [
                            'imageManagerJson' => ['/redactor/upload/image-json'],
                            'imageUpload' => ['/redactor/upload/image'],
                            'fileUpload' => ['/redactor/upload/file'],
                            'lang' => 'zh_cn',
                            'plugins' => ['clips', 'fontcolor','imagemanager']
                        ]
                    ]);
                    echo \yii\helpers\Html::submitInput('提交', ['class' => 'btn btn-success', 'style' => 'margin-right:1em;']);
                    \yii\bootstrap\ActiveForm::end();
                    ?>
                </div>
            </section>
        </div>
    </div>
</section>


    
