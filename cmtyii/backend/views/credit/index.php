<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\CreditConsumeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', '授信订单');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="credit-consume-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
<!--        --><?//= Html::a(Yii::t('app', 'Create Credit Consume'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                    'attribute' => 'store_id',
                    'value' => 'store.sp_name'
            ],
            [
                    'attribute' => 'order_id',
                    'value' => 'order.order_no'
            ],
            [
                    'attribute' => 'shoper_id',
                    'value'=> 'shoper.boss',
            ],
            [
                    'attribute' => 'add_time',
                    'format' => ['date', 'Y-m-d H:i'],
                    'filter'    => DateRangePicker::widget([
                        'model'         => $searchModel,
                        'attribute'     => 'add_time',
                        'convertFormat' => true,
                        'pluginOptions' => [
                            'locale' => ['format' => 'Y-m-d'],
                        ],
                    ]),
            ],
             'amount',
             [
                     'attribute' => 'status',
                     'value' => function ($model, $key, $index, $grid)
                     {
                        return $model->status  === 1 ? '已还款' : '未还款';
                     }
             ],

            ['class' => 'yii\grid\ActionColumn', 'template' => "{view}{delete}"],
        ],
    ]); ?>
</div>
