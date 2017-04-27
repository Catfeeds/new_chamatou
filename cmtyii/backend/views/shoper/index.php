<?php

use backend\models\WithdawType;
use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\ShoperSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Shopers');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shoper-index">

    <!--    <h1>--><? //= Html::encode($this->title) ?><!--</h1>-->
    <?php //echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Shoper'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel'  => $searchModel,
        'columns'      => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            [
                'attribute' => 'sp_name',
                'value'     => 'store.sp_name',
            ],
            [
                'attribute' => 'area',
                'value'     => function ($model) {
                    return $model->getArea($model->id);
                },
            ],
            'phone',
            'credit_amount',
            'contract_no',
            [
                'attribute' => 'withdraw_type',
                'value'     => function ($model) {
                    switch ($model->withdraw_type) {
                        case 1:
                            return '支付宝';
                            break;
                        case 2:
                            return '微信';
                            break;
                        case 3:
                            return '银行卡';
                            break;

                    }
                },
                'filter'    => [
                    1 => '支付宝',
                    2 => '微信',
                    3 => '银行卡',
                ],
            ],
            'bank',
            'bank_user',
            'card_no',
            'credit_remain',
            [
                'attribute' => 'status',
                'value'     => function ($model) {
                    if ($model->status) {
                        return '冻结';
                    }
                    return '正常';
                },
                'filter'    => [
                    0 => '正常',
                    1 => '冻结',
                ],
            ],
            'salesman_id',
            [
                'attribute' => 'add_time',
                //'format' => ['date', 'Y-m-d H:i']
                'value'     => function ($model) {
                    return date('Y-m-d H:i', $model->add_time);
                },
                'filter'    => DateRangePicker::widget([
                    'model'         => $searchModel,
                    'attribute'     => 'add_time',
                    'convertFormat' => true,
                    'pluginOptions' => [
                        'locale' => ['format' => 'Y-m-d'],
                    ],
                ]),
            ],
            'beans_incom',
            'total_amount',
            'withdraw_total',
            [
                'attribute' => 'sp_status',
                'value'     => 'spstatus',
                'filter'    => $searchModel->getSpStatusDropDownList(),
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
