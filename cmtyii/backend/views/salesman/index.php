<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\SalesmanSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Salesmen');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="salesman-index" style="background-color: #FFFFFF;padding: 5px; margin-top: 15px;">
    <div class="col-sm-12" style="border-bottom: 1px solid #eeeeee;margin-bottom: 10px;">
        <div class="col-sm-6">
            <h4 style="margin-left: -25px;"><?=$this->title?></h4>
        </div>
        <div class="col-sm-6">
            <div class="pull-right">
                <?= Html::a(Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
            </div>
        </div>
    </div>

    <p>

    </p>
    <?= \common\widgets\GridViewLrdouble::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'add_time',
                'format' => 'datetime',
                'filter' => DateRangePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'add_time',
                    'convertFormat'=>true,
                    'pluginOptions'=>[
                        'locale'=>['format' => 'Y-m-d'],
                    ]
                ])
            ],
            'username',
            'phone',
            'shop_total',
            [
                    'class' => 'yii\grid\ActionColumn',
                    'header'=>'操作',
                    'template' => "{update}{delete}",
                    'buttons'=>[
                                'update'=>function($url,$model){
                                    return "<a href='$url' class='btn btn-default btn-xs' style='margin-right: 5px; '>修改</a>";
                                },
                                'delete'=>function($url,$model){
                                    if($model->shop_total <= 0){
                                        return "<a class=\"btn btn-default btn-xs \" href='$url' data-confirm=\"你确定删除吗?\" data-method=\"post\">删除</a>";
                                    }
                                }
                    ]

            ],
        ],
    ]); ?>
</div>
