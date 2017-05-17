<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\CreditConsume */

$this->title = Yii::t('app', 'Create Credit Consume');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Credit Consumes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="credit-consume-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
