<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\CreditConsume */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Credit Consumes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="credit-consume-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
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
            [
                    'attribute' => 'store_id',
                    'value' => $model->getStore()->sp_name,
            ],
            [
                    'attribute' =>  'order_id',
                    'value' => 'order.order_no'
            ],
            [
                    'attribute'  => 'shoper_id',
                    'value' =>  'shoper.boss'
            ],
            'add_time:datetime',
            'amount',
            [
                    'attribute' => 'status',
                    'value' => $model->status === 1 ? '已还款' : '未还款'
            ],
        ],
    ]) ?>

</div>
