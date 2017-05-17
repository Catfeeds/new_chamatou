<?php

use backend\models\Shoper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = Yii::t('app', '添加/绑定-商户');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="store-bind-shoper">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="bind-shoper-form-bind">
        <?php $form = ActiveForm::begin(); ?>
        <?php

        $one = Shoper::find()
            ->select('boss,id')
            ->indexBy('id')
            ->column();

        ?>
       <?= $form->field($storeBindForm, 'shoper_id')->dropDownList(
            Shoper::find()
                ->select('boss,id')
                ->indexBy('id')
                ->column(),
            [
                    'prompt' => '选择商铺',
            ]
        ) ?>

        <?= $form->field($storeBindForm, 'store_id')->hiddenInput()->label(false) ?>

        <div class="form-group">
            <?= Html::submitButton(Yii::t('app', 'Bind'), ['class' => 'btn btn-primary']) ?>
        </div>

        <?php  ActiveForm::end(); ?>
    </div>

</div>