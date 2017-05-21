<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Salesman */

$this->title = Yii::t('app', 'Create');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Salesmen'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="salesman-create" style="background: #FFF;">
    <div class="col-sm-12" style="border-bottom: 1px solid #eeeeee;margin-bottom: 10px;">
        <div class="col-sm-6">

            <h4 style="margin-left: -25px;">业务员添加</h4>
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
