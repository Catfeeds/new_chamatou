<?php

use kartik\file\FileInput;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\SpStore */

$this->title = Yii::t('app', '更新店铺信息 ');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Sp Stores'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="sp-store-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="sp-store-form">

        <?php $form = ActiveForm::begin([
            'options' => ['enctype'=>'multipart/form-data'],
        ]); ?>

        <?= $form->field($model, 'sp_name')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model,'provinces_id')->dropDownList($model->getLocations(0),
            [
                'prompt'=>'--请选择省--',
                'onchange'=>'
            $.post("'.yii::$app->urlManager->createUrl('/tools/address').'&typeid=1&pid="+$(this).val(),function(data){
                $("select#storeform-city_id").html(data);
            });',
            ])
        ?>

        <?= $form->field($model, 'city_id')->dropDownList($model->getLocations($model->provinces_id),
            [
                'prompt'=>'--请选择市--',
                'onchange'=>'
            $.post("'.yii::$app->urlManager->createUrl('/tools/address').'&typeid=2&pid="+$(this).val(),function(data){
                $("select#storeform-area_id").html(data);
            });',
            ])
        ?>

        <?= $form->field($model, 'area_id')->dropDownList($model->getLocations($model->city_id),['prompt'=>'--请选择区--',]) ?>

        <?= $form->field($model, 'add_detail')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'sp_phone')->textInput(['maxlength' => true]) ?>

        <!--门店信息-上传图片-->
        <?= $form->field($uploadModel, 'file[]')->widget(FileInput::classname(), [
            'options' => [
                'accept' => 'image/*',
                'multiple' => true
            ],
            'pluginOptions' => [
                'maxFileCount' => 3,
                'showUpload' => false
            ]
        ]) ?>

        <?= $form->field($model, 'intro')->textInput(['maxlength' => true]) ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>
