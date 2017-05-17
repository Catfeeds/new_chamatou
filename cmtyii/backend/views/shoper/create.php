<?php

use backend\models\Salesman;
use yii\helpers\Html;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = Yii::t('app', '完善更多信息');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shoper-create">


    <div class="shoper-form">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'boss')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'phone')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'credit_amount')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'contract_no')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'withdraw_type')->dropDownList([
                1 => '支付宝',
                2 => '微信',
                3 => '银行卡'
        ]) ?>

        <?= $form->field($model, 'bank')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'bank_user')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'card_no')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'pay_account')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'status')->dropDownList([
                0 => '正常',
                1 => '封停',
        ]) ?>

        <?= $form->field($model, 'salesman_id')->dropDownList(Salesman::find()
            ->select('username')
            ->indexBy('id')
            ->column(), [
            ['prompt' => '请指定销售']
        ]) ?>

        <?= $form->field($model, 'sp_status')->dropDownList([
            0 => '正常',
            1 => '封停',
        ]) ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>

<?php
$this->registerJs(<<<JS
$(function () {

});
JS
    , \yii\web\View::POS_END);