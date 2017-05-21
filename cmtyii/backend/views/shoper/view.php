<?php

use backend\models\ShoperImg;
use kartik\detail\DetailView;
use yii\helpers\Html;
//use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = '商铺详情';
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shoper-view">

<!--    <h1>--><?//= Html::encode($this->title) ?><!--</h1>-->

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
        'model'      => $model,
        'mode' => DetailView::MODE_VIEW,
        'hAlign' => DetailView::ALIGN_LEFT,
        'attributes' => [
            'boss',
            'credit_amount',
            'contract_no',
            [
                'attribute' => 'withdraw_type',
                'value' => $model->withdrawName
            ],
            'pay_account',
            'bank',
            'bank_user',
            'card_no',
            'credit_remain',

            [
                'attribute' => 'status',
                'value' => $model->status === 1 ? '冻结' : '正常'
            ],
            [
                'attribute' => 'salesman_id',
                'value'     => $model->salesman ? $model->salesman->username : null,
            ],
            'beans_incom',
            'total_amount',
            'withdraw_total',
            [
                'attribute' => 'sp_status',
                'value' => $model->sp_status == 1 ? '封停' : '正常'
            ],
            [
                    'attribute' => 'add_time',
                    'format'=>'date',
                    'type'=>DetailView::INPUT_DATE,
                    'widgetOptions' => [
                        'pluginOptions'=>['format'=>'yyyy-mm-dd']
                    ],
                    'valueColOptions'=>['style'=>'width:30%']
            ],

        ],
    ]) ?>
</div>
