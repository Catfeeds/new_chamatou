<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use common\widgets\GridViewLrdouble;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\MessageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Messages');
?>
<div class="message-index" style="background-color: #FFFFFF;padding: 5px; margin-top: 15px;">
    <div class="col-sm-12" style="border-bottom: 1px solid #eeeeee;margin-bottom: 10px;">
        <h4><?=$this->title?></h4>
    </div>
    <?= GridViewLrdouble::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'store_name',
                'value' => 'storeName.sp_name',
            ],
            [
                'attribute' => 'add_time',
                'format' => 'datetime',
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
