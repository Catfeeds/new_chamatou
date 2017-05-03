<?php

use backend\models\Salesman;
use backend\models\WithdawType;
use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
//use yii\grid\GridView;
use kartik\grid\GridView;
use kartik\editable\Editable;

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
        'export' => false,
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
                    $one = $model->getArea($model->id);
                },
            ],
            [
                'attribute' => 'phone',
                'class'=>'kartik\grid\EditableColumn',
                'editableOptions'=>[
                    'asPopover' => false,
                ],

            ],
            'credit_remain',
            [
                    'attribute' => 'yinhuan',
                    'class'=>'kartik\grid\EditableColumn',
            ],
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
            [
                'attribute' => 'sp_status',
                'value'     => 'spstatus',
                'filter'    => $searchModel->getSpStatusDropDownList(),
            ],
            [
                    'attribute' => 'salesman_id',
                    'value' =>  function($model){
                        $one = Salesman::find()
                                ->select(['username'])
                                ->where(['id' => $model->salesman_id])
                                ->one();
                        return isset($one->username) ? $one->username : null;
                    },
                    'filter' => Salesman::find()
                                ->select(['username', 'id'])
                                ->column(),
                    'class'=>'kartik\grid\EditableColumn',

            ],
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
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
