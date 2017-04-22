<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Shop */

$this->title = '添加商铺';
$this->params['breadcrumbs'][] = ['label' => '商铺管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shop-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
