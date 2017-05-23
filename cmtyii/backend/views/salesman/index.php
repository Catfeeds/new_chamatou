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

    <div class="withdraw-index" style="background-color: #FFFFFF;padding: 5px; margin-top: 15px;overflow: hidden;">
    <div class="container-fluid" style="
        margin-left: -15px;
        background-color: #FFFFFF;
        margin-right: -15px;
        min-height: 49px;
        border-bottom: 1px solid #d6d6d6;
        margin-bottom: 15px;
    ">
        <div class="col-sm-6">
            <span style="line-height: 50px; font-weight: 700;font-size: 14px;margin-right: 5px;"><?=$this->title?></span>
            <a href="javascript:void(0)" onclick="location.reload()" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-refresh"></span></a>
        </div>
        <div class="col-sm-6">
            <div class="pull-right">
                <?= Html::a(Yii::t('app', 'Create'), ['create'], ['class' => 'btn btn-success']) ?>
            </div>
        </div>
    </div>
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
            [
                'attribute'=>'shop_total',
                'value'=>function($model){
                    return \frontend\models\Store::find()->andWhere(['salesman_id'=>$model->id])->count();
                }
            ],
            [
                    'class' => 'yii\grid\ActionColumn',
                    'header'=>'操作',
                    'template' => "{chakan}{update}{delete}",
                    'buttons'=>[
                                'chakan'=>function($url,$model){
                                    $arr['add_time']='';
                                    $arr['sp_name']='';
                                    $arr['address']='';
                                    $arr['sp_phone']='';
                                    $arr['salesman_id']=$model->id;
                                    $url = \yii\helpers\Url::toRoute(['store/index','SpStorerSearch'=>$arr]);
                                    return "<a href='$url' class='btn btn-primary btn-xs' style='margin-right: 5px; '>查看店铺列表</a>";
                                },
                                'update'=>function($url,$model){
                                    return "<a href='$url' class='btn btn-primary btn-xs' style='margin-right: 5px; '>修改</a>";
                                },
                                'delete'=>function($url,$model){
                                    $model->shop_total = \frontend\models\Store::find()->andWhere(['salesman_id'=>$model->id])->count();
                                    if($model->shop_total <= 0){
                                        return "<a class=\"btn btn-default btn-xs \" href='$url' data-confirm=\"你确定删除吗?\" data-method=\"post\">删除</a>";
                                    }
                                }
                    ]

            ],
        ],
    ]); ?>
</div>
<style>
	th{
	color: #3c8dbc;
}
</style>