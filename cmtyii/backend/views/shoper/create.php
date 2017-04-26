<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = Yii::t('app', 'Create Shoper');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shoper-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
