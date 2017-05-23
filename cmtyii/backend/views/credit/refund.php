<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\CreditConsumeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', '授信还款记录');
$this->params['breadcrumbs'][] = $this->title;
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
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'label' => '商家名字',
                'attribute' => 'shoper_id',
                'value' => 'shoper.boss',
            ],
            [
                'attribute' => 'add_time',
                'format' => ['date', 'Y-m-d H:i:s'],
                'filter' => DateRangePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'add_time',
                    'convertFormat' => true,
                    'pluginOptions' => [
                        'locale' => ['format' => 'Y-m-d'],
                    ],
                ])
            ],
            'amount',
        ],
    ]); ?>
</div>
<style>
	.credit-consume-index{
		padding-bottom: 20px;
		position: relative;
	}
	.summary{
		position: absolute;
		left: 20px;
		bottom: 0;
	}
	.table{
		border:1px solid #f4f4f4
	}
	.content-wrapper{
		background: #fff!important;
	}
</style>