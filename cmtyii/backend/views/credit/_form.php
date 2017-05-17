<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CreditConsume */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="credit-consume-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'store_id')->textInput() ?>

    <?= $form->field($model, 'order_id')->textInput() ?>

    <?= $form->field($model, 'shoper_id')->textInput() ?>

    <?= $form->field($model, 'add_time')->textInput() ?>

    <?= $form->field($model, 'amount')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
