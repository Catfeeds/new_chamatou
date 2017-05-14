<?php

use backend\models\Salesman;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Salesman */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="salesman-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'salesman_id')->dropDownList(Salesman::find()
        ->select('username')
        ->indexBy('id')
        ->column(), [
            ['prompt' => '请指定销售']
        ]
    ) ?>

    <?= $form->field($model, 'store_name')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Update'), ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
