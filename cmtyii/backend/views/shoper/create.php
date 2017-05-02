<?php

use kartik\file\FileInput;
use yii\helpers\Html;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = Yii::t('app', 'Create Shoper');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shoper-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="shoper-form">

        <?php $form = ActiveForm::begin([
            'options' => ['enctype'=>'multipart/form-data'],
        ]); ?>
        <!--基础信息-店铺名称-->
        <?= $form->field($model, 'store_sp_name')->textInput(['maxlength' => true]) ?>
        <!--基础信息-负责人电话-->
        <?= $form->field($model, 'shoper_boss')->textInput(['maxlength' => true]) ?>
        <!--基础信息-门店电话-->
        <?= $form->field($model, 'store_sp_phone')->textInput(['maxlength' => true]) ?>
        <!--基础信息-地址-->
        <?= $form->field($model,'store_provinces_id')->dropDownList($model->getCityList(0),
            [
                'prompt'=>'--请选择省--',
                'onchange'=>'
            $(".form-group.field-createshoperform-store_area_id").hide();
            $.post("'.yii::$app->urlManager->createUrl('/tools/address').'&typeid=1&pid="+$(this).val(),function(data){
                $("select#createshoperform-store_city_id").html(data);
            });',
            ]) ?>

        <?= $form->field($model, 'store_city_id')->dropDownList($model->getCityList($model->store_city_id),
            [
                'prompt'=>'--请选择市--',
                'onchange'=>'
            $(".form-group.field-createshoperform-store_area_id").show();
            $.post("'.yii::$app->urlManager->createUrl('/tools/address').'&typeid=2&pid="+$(this).val(),function(data){
                $("select#createshoperform-store_area_id").html(data);
            });',
            ]) ?>

        <?= $form->field($model, 'store_area_id')->dropDownList($model->getCityList($model->store_area_id),['prompt'=>'--请选择区--',]) ?>
        <!--基础信息-详情地址-->
        <?= $form->field($model, 'store_add_detail')->textInput(['maxlength' => true]) ?>
        <!--基础信息-负责人电话-->
        <?= $form->field($model, 'shoper_phone')->textInput(['maxlength' => true]) ?>
        <!--基础信息-支付级别-->
        <?= $form->field($model, 'shoper_credit_type')->dropDownList([
            '1' => '授信',
            '0' => '在线支付',
        ]) ?>
        <?= $form->field($model, 'shoper_credit_amount')->textInput(['maxlength' => true]) ?>

        <!--基础信息-合同号-->
        <?= $form->field($model, 'shoper_contract_no')->textInput(['maxlength' => true]) ?>


        <!--门店信息-店铺简介-->
        <?= $form->field($model, 'store_intro')->textInput(['maxlength' => true]) ?>
        <!--门店信息-上传图片-->
        <?= $form->field($uploadModel, 'file[]')->widget(FileInput::classname(), [
            'options' => ['multiple' => true],
        ]) ?>


        <!--账号信息-账户信息-->
        <?= $form->field($model, 'shoper_withdraw_type')->dropDownList(['1'=> '支付宝', '2' => '微信', '3'=>'银行卡']) ?>

        <?= $form->field($model, 'shoper_card_no')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'shoper_bank')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'shoper_bank_user')->textInput(['maxlength' => true]) ?>


        <?= $form->field($model, 'shoper_pay_account')->textInput(['maxlength' => true]) ?>




        <div class="form-group">
            <?= Html::submitButton(Yii::t('app', 'Create') , ['class' =>'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>

