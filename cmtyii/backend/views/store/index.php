<?php

use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\SpStorerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', '门店管理');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sp-store-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', '添加门店'), ['create'], ['class' => 'btn btn-success']) ?>

        <?= Html::a(Yii::t('app', '添加商铺'), ['shoper/create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                    'attribute' => 'add_time',
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
            'sp_name',
            'address',
            [
                'label' => '省',
                'attribute' => 'province_name',
                'value' => 'province.name',
            ],
            [
                'label' => '市',
                'attribute' => 'city_name',
                'value' => 'city.name'
            ],
            [
                'label' => '区',
                'attribute' => 'area_name',
                'value' => 'area.name'
            ],
            'add_detail',
            'sp_phone',
//            'cover',
            'intro',
//            [
//                    'label' => '销售人员',
//                    'attribute' => 'salesman_name',
//                    'value' => 'salesman.username'
//            ],

            [
                'class' => 'yii\grid\ActionColumn',
                'template'=>'{shoper}{view} {update} {delete} {bind-shoper}',
                'buttons'=>
                    [
                        'bind-shoper'=>function($url,$model,$key)
                        {
                            $options=[
                                'title'=>Yii::t('yii', '绑定'),
                                'aria-label'=>Yii::t('yii','绑定'),
                                'data-method'=>'post',
                                'data-pjax'=>'0',
                            ];
                            return Html::a('<span class="glyphicon glyphicon-check"></span>',$url,$options);

                        },
                        'shoper'=> function($url, $model, $key)
                        {
                            if(!isset($model->shoper_id)){
                                return '';
                            }
                            $options=[
                                'title'=>Yii::t('yii', '商户管理'),
                                'aria-label'=>Yii::t('yii','商户管理'),
                                'data-method'=>'post',
                                'data-pjax'=>'0',
                            ];
                            $url = Url::toRoute(['shoper/view', 'id'=> $model->shoper_id]);
                            return Html::a('<span class="">商铺</span>',$url,$options);
                        }
                    ],
            ],
        ],
    ]); ?>
</div>
