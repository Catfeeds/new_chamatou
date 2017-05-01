<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\WithdrawSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Withdraws');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="withdraw-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <!--    <p>-->
    <!--        --><? //= Html::a(Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
    <!--    </p>-->
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'Id',
            [
                'attribute' => 'add_time',
                'format' => 'datetime',
                'filter' => DateRangePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'add_time',
                    'convertFormat' => true,
                    'pluginOptions' => [
                        'locale' => ['format' => 'Y-m-d'],
                    ],
                ]),
            ],
            'amount',
            [
                'attribute' => 'shoper_id',
                'value' => 'store.sp_name'
            ],
            [
                'attribute' => 'sp_phone',
                'value' => 'store.sp_phone'
            ],
            [
                'attribute' => 'bank',
                'value' => 'shoper.bank'
            ],
            [
                'attribute' => 'bank_user',
                'value' => 'shoper.bank_user'
            ],
            [
                'attribute' => 'card_no',
                'value' => 'shoper.card_no'
            ],
            [
                'attribute' => 'status',
                'value' => function ($model) {
                    switch ($model->status) {
                        case 0:
                            return '待审核';
                        case 1:
                            return '已打款';
                        case 2:
                            return '拒绝';
                    }
                },
                'filter' => [
                    0 => '待审核',
                    1 => '已打款',
                    2 => '拒绝',
                ]
            ],
            'note',


            [
                'class' => 'yii\grid\ActionColumn',
                'template' => "{via}{refuse}{delete}",
                'buttons' => [
                        'via' => function($url, $model, $key){
                            $options = [
                                'title' => Yii::t('app', '通过'),
                                'aria-label' => Yii::t('app', 'access'),
                                'data-pjax' => '0',
                            ];
                            return Html::a('<span class="glyphicon glyphicon-user"></span>', $url, $options);
                        },
                        'refuse' => function($url, $model, $key){
                            $options = [
                                'title' => Yii::t('app', '拒绝'),
                                'aria-label' => Yii::t('app', 'access'),
                                'data-pjax' => '0',
                            ];
                            return Html::a('<span class="glyphicon glyphicon-user"></span>', $url, $options);
                        }
                ]

            ],
        ],
    ]); ?>
</div>
