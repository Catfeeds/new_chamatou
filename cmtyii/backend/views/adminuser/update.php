<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Adminuser */

$this->title = yii::t('app', 'update');
$this->params['breadcrumbs'][] = ['label' => yii::t('app', 'update'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = yii::t('app', 'update');;
?>
<div class="adminuser-update">

    <div class="col-sm-6">

        <?= $this->render('_form', [
            'model' => $model,
        ]) ?>
    </div>

</div>
