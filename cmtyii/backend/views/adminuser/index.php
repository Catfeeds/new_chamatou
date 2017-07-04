<?php

use backend\models\Adminuser;
use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;
use dosamigos\datepicker\DatePicker;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\AdminuserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '管理员管理';
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
            <?= Html::a(yii::t('app', '添加管理员'), ['create'], ['class' => 'btn btn-success']) ?>
        </div>
    </div>
        
    <?= \common\widgets\GridViewLrdouble::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'username',
            'real_name',
            'phone',
            'email:email',
            [
                'attribute' => 'status',
                'filter' => [
                    Adminuser::STATUS_DELETED=> yii::t('app', '删除'),
                    Adminuser::STATUS_ACTIVE=> yii::t('app', '正常'),
                ],
                'value' => 'statusMsg'

            ],
            [
                'attribute' => 'created_at',
                'format' => ['date', 'php:Y-m-d H:i'],
                'filter' => DateRangePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'created_at',
                    'convertFormat'=>true,
                    'pluginOptions'=>[
                        'locale'=>['format' => 'Y-m-d'],
                    ]
                ])
            ],
            [
                'attribute' => 'updated_at',
                'format' => ['date', 'php:Y-m-d H:i'],
                'filter' => DateRangePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'updated_at',
                    'convertFormat'=>true,
                    'pluginOptions'=>[
                        'locale'=>['format' => 'Y-m-d'],
                    ]
                ])
            ],

            ['class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {delete}',
                'buttons' => [
                    'resetpwd' => function ($url, $model, $key) {
                        $options = [
                            'title' => Yii::t('app', 'reset_pwd'),
                            'aria-label' => Yii::t('app', 'reset_pwd'),
                            'data-pjax' => '0',
                        ];
                        $url = \yii\helpers\Url::to(['admin/user/reset-password']);
                        return Html::a('<span class="glyphicon glyphicon-lock"></span>',$url , $options);
                    },

                ],
            ],
        ],
    ]); ?>
</div>
<style>
	.col-sm-9 a{
		margin-top: 6px;
		 float: right;
	}
	td a{
		margin: 0 3px;
	}
</style>