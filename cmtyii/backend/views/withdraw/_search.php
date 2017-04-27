<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\WithdrawSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="withdraw-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'Id') ?>

    <?= $form->field($model, 'shoper_id') ?>

    <?= $form->field($model, 'amount') ?>

    <?= $form->field($model, 'status') ?>

    <?= $form->field($model, 'note') ?>

    <?php // echo $form->field($model, 'add_time') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
