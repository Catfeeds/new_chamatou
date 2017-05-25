<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use common\widgets\GridViewLrdouble;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\MessageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Messages');
?>
<div class="withdraw-index" style="background-color: #FFFFFF;padding: 5px; margin-top: 15px;overflow: hidden;">
    <div class="container-fluid" style="
        margin-left: -15px;
        background-color: #FFFFFF;
        margin-right: -15px;
        min-height: 49px;
        border-bottom: 1px solid #d6d6d6;
        margin-bottom: 15px;
    ">
        <div class="col-sm-3">
            <span style="line-height: 50px; font-weight: 700;font-size: 14px;margin-right: 5px;"><?=$this->title?></span>
            <a href="javascript:void(0)" onclick="location.reload()" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-refresh"></span></a>
        </div>
        <div class="col-sm-9">
            
        </div>
    </div>
    <?= GridViewLrdouble::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'store_name',
                'format'=>'raw',
                'value'=>function($model){
                    return "<div style=' width:300px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;'>".$model['store']['sp_name']."</div>";
                }
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
                    'buttons'=>[
                        'view'=>function($url,$model){
                                return "<a href='$url' class='btn btn-xs btn-primary btn2' style='margin-right: 5px; '>查看</a>";
                        },'delete'=>function($url){
                            return "<a class=\"btn btn-danger btn-xs deleteBtn btn2 \" href='$url' data-confirm=\"你确定删除吗?\" data-method=\"post\">删除</a>";
    }
                    ],

            ],
        ],
    ]); ?>
</div>
<style media="screen">
.btn2{
    width: 40px;
    height: 20px;
    font-size: 12px;
    line-height: 20px;
}
th{
	color: #3c8dbc;
}
</style>
