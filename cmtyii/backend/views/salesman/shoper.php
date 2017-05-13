<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Salesman */

$this->title = Yii::t('app', '设置销售');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Salesmen'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="salesman-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_shoper_form', [
        'model' => $model,
    ]) ?>

</div>
