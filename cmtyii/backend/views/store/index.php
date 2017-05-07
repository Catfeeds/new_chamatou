<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\SpStorerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', '店铺管理');
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
            'sp_name',
            'address',
            [
                'attribute' => 'provinces_id',
                'value' => 'province.name',
            ],
            [
                'attribute' => 'city_id',
                'value' => 'city.name'
            ],
            [
                'attribute' => 'area_id',
                'value' => 'area.name'
            ],
            'add_detail',
            'sp_phone',
//            'cover',
            'intro',

            [
                'class' => 'yii\grid\ActionColumn',
                'template'=>'{view} {update} {delete} {bind-shoper}',
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
                    ],
            ],
        ],
    ]); ?>
</div>
