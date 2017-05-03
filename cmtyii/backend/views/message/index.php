<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\MessageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Messages');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="message-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            [
                'attribute' => 'shoper_id',
                'value' => 'storeName.sp_name',
            ],
            [
                'attribute' => 'type',
                'value' => function ($model) {
                    switch ($model->type) {
                        case 1:
                            return '培训支持';
                        case 2:
                            return '活动申请';
                        case 3:
                            return '活动申请';
                    }
                },
                'filter' => [
                    1 => '技术支持',
                    2 => '活动申请',
                    3 => '活动申请',
                ]
            ],
            'title',
            [
                'attribute' => 'content',
                'format' => 'ntext',
                'value' => function ($model) {
                    return mb_substr($model->content, 0, 12, 'utf-8');
                }
            ],
            'phone',
            'username',
            [
                'attribute' => 'add_time',
                'format' => 'date',
                'filter' => DateRangePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'add_time',
                    'convertFormat' => true,
                    'pluginOptions' => [
                        'locale' => ['format' => 'Y-m-d'],
                    ]
                ])
            ],
            [
                    'label' => '留言状态',
                    'attribute' => 'status',
                    'value' => function($model){
                        return $model->status ? '已读' : '未读';
                    },
                    'filter' => [
                            0 => '未读',
                            1 => '已读',
                    ]
            ],


            [
                    'class' => 'yii\grid\ActionColumn',
                    'template' => "{view}{delete}",
            ],
        ],
    ]); ?>
</div>
