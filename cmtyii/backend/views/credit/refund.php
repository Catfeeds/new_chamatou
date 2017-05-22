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
<div class="credit-consume-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <!--        --><? //= Html::a(Yii::t('app', 'Create Credit Consume'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
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