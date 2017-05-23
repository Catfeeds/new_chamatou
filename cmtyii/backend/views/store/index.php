<?php

use backend\models\Shoper;
use backend\models\SpStore;
use kartik\daterange\DateRangePicker;
use kartik\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\SpStorerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', '门店管理');
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="sp-store-index">
    <!--    标题开始-->
    <div class="container-fluid" style="
        margin-left: -15px;
        background-color: #FFFFFF;
        margin-right: -15px;
        min-height: 49px;
        border-bottom: 1px solid #d6d6d6;
        margin-bottom: 15px;
    ">
        <div class="col-sm-3">
            <span style="line-height: 50px; font-weight: 700;font-size: 14px;margin-right: 5px;">店铺列表</span>
            <a href="javascript:void(0)" onclick="location.reload()" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-refresh"></span></a>
        </div>
        <div class="col-sm-9">
            <p class="pull-right" style="margin-top: 5px;"><?= Html::a(Yii::t('app', '添加新门店'), ['create'], ['class' => 'btn btn-success']) ?></p>
        </div>
    </div>
    <!--    标题结束-->
    <div class="" style="background-color: #ffffff;border: 1px solid #d6d6d6;">
        <?= \common\widgets\GridViewLrdouble::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                    'attribute' => 'add_time',
                    'format' => ['datetime'],
                    'filter'    => DateRangePicker::widget([
                        'model'         => $searchModel,
                        'attribute'     => 'add_time',
                        'convertFormat' => true,
                        'pluginOptions' => [
                            'locale' => ['format' => 'Y-m-d'],
                        ],
                    ]),

            ],
            'sp_name',
            'address',
            'sp_phone',
            [
                'label' => '授信总额',
                'attribute' => 'credit_remain',
                'value' => 'shoper.credit_remain'
            ],
            [
                'label' => '授信余额',
                'attribute' => 'credit_amount',
                'value' => 'shoper.credit_amount'
            ],
            [
                'label' => '授信状态',
                'attribute' => 'shoper.status',
                'format'=>'raw',
                'value' => function($model){
                    if($model['shoper']['status'] == 0){
                        return '<span class="badge" style="background-color: #9dd23a">正常</span>';
                    }else{
                        return '<span class="badge" style="background-color: #dd4b39">逾期</span>';
                    }
                }
            ],
            [
                'label' => '店铺状态',
                'attribute' => 'shoper.sp_status',
                'format'=>'raw',
                'value' => function($model){
                    if($model['shoper']['sp_status'] == 0){
                        return '<span class="badge" style="background-color: #9dd23a">正常</span>';
                    }else{
                        return '<span class="badge" style="background-color: #dd4b39">封停</span>';
                    }
                }
            ],
            [

                'label' => '销售',
                'attribute' => 'salesman_id',
                'value' => 'salesman.username',
                'filter'=>\backend\models\Salesman::getFilter(),

            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template'=>'{spstatus}{shouxinhuankuan}{update}',
                'buttons'=>
                    [
                        'spstatus'=>function($url,$model){
                            $url = Url::toRoute(['store/spstatus','shoper_id'=>$model['shoper']['id']]);
                            if($model['shoper']['sp_status'] == 0){
                                return "<a href='#' onclick=\"alertWarning('账号封停操作?','确认你的操作无误？','$url')\" class='btn btn-xs btn-default' style='margin-right: 5px;'>封停</a>";
                            }else{
                                return "<a href='#' onclick=\"alertWarning('账号封停开启操作?','确认你的操作无误？','$url')\" class='btn btn-xs btn-default' style='margin-right: 5px;'>开启</a>";
                            }

                        },
                        'shouxinhuankuan' => function($url, $model, $key)
                        {
                            $url = Url::toRoute(['store/shouxinhuankuan','shoper_id'=>$model['shoper']['id']]);
                            $whjinger = $model['shoper']['credit_remain'] - $model['shoper']['credit_amount'];
                            return "<a href='#' onclick=\"alertInput('还款表单','本期最低还款金额为:$whjinger','$url',true)\" class='btn btn-xs btn-default' style='margin-right: 5px;'>还款</a>";
                        },
                        'update'=>function($url,$model,$key){
                            return "<a href='$url' class='btn btn-xs btn-default' style='margin-right: 5px;'>编辑</a>";
                        }
                    ],
            ],
        ],
    ]); ?>
    </div>
</div>
<style>
	.grid-view .form-control{
		height: 35px!important;
	}
	.badge{
		font-weight: 500;
	}
</style>