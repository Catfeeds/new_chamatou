<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Salesman */

$this->title = Yii::t('app', 'update', [
    'modelClass' => 'Salesman',
]) . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Salesmen'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="salesman-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
