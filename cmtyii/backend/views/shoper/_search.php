<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ShoperSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="shoper-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'boss') ?>

    <?= $form->field($model, 'phone') ?>

    <?= $form->field($model, 'credit_amount') ?>

    <?= $form->field($model, 'contract_no') ?>

    <?php // echo $form->field($model, 'withdraw_type') ?>

    <?php // echo $form->field($model, 'bank') ?>

    <?php // echo $form->field($model, 'bank_user') ?>

    <?php // echo $form->field($model, 'card_no') ?>

    <?php // echo $form->field($model, 'credit_remain') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'salesman_id') ?>

    <?php // echo $form->field($model, 'add_time') ?>

    <?php // echo $form->field($model, 'beans_incom') ?>

    <?php // echo $form->field($model, 'total_amount') ?>

    <?php // echo $form->field($model, 'withdraw_total') ?>

    <?php // echo $form->field($model, 'sp_status') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
