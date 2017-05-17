<?php

use kartik\file\FileInput;
use yii\helpers\Html;use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = '更新店铺';
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="shoper-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="shoper-form">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'boss')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'phone')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'credit_amount')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'contract_no')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'withdraw_type')->textInput() ?>

        <?= $form->field($model, 'bank')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'bank_user')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'card_no')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'credit_remain')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'status')->textInput() ?>

        <?= $form->field($model, 'salesman_id')->textInput() ?>

        <?= $form->field($model, 'add_time')->textInput() ?>

        <?= $form->field($model, 'beans_incom')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'total_amount')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'withdraw_total')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'sp_status')->textInput() ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>
