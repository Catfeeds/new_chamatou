<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\search\CreditConsumeSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="credit-consume-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'store_id') ?>

    <?= $form->field($model, 'order_id') ?>

    <?= $form->field($model, 'shoper_id') ?>

    <?= $form->field($model, 'add_time') ?>

    <?php // echo $form->field($model, 'amount') ?>

    <?php // echo $form->field($model, 'status') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
