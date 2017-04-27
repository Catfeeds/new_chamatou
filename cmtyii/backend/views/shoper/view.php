<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shoper-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'boss',
            'phone',
            'credit_amount',
            'contract_no',
            'withdraw_type',
            'bank',
            'bank_user',
            'card_no',
            'credit_remain',
            'status',
            'salesman_id',
            'add_time:datetime',
            'beans_incom',
            'total_amount',
            'withdraw_total',
            [
                    'attribute' => 'sp_status',
                    'value' => $model->getSpstatusMsg()
            ]
        ],
    ]) ?>

</div>
