<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Salesman */

$this->title = Yii::t('app', '业务员修改', [
    'modelClass' => 'Salesman',
]) . $model->username;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Salesmen'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="salesman-update" style="background: #FFF;">
    <div class="col-sm-12" style="border-bottom: 1px solid #eeeeee;margin-bottom: 10px;">
        <div class="col-sm-6">

            <h4 style="margin-left: -25px;">业务员修改</h4>
        </div>
        <div class="col-sm-6">
            <div class="pull-right">

            </div>
        </div>
    </div>
    <hr>
    <div class="col-sm-4">
        <?= $this->render('_form', [
            'model' => $model,
        ]) ?>
    </div>
    <div class="clearfix"></div>
</div>
