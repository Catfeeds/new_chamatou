<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model tea\models\Vip */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vip-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'shoper_id')->textInput() ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'phone')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'card_no')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'total_amount')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vip_amount')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'password_type')->textInput() ?>

    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sex')->textInput() ?>

    <?= $form->field($model, 'birthday')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
