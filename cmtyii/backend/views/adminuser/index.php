<?php

use backend\models\Adminuser;
use kartik\daterange\DateRangePicker;
use yii\helpers\Html;
use yii\grid\GridView;
use dosamigos\datepicker\DatePicker;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\AdminuserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '管理员管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="adminuser-index">

<!--    <h1>--><?//= Html::encode($this->title) ?><!--</h1>-->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(yii::t('app', 'create'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'username',
            'real_name',
            'phone',
//            'auth_key',
//             'password_hash',
//             'password_reset_token',
            'email:email',
            [
                'attribute' => 'status',
                'filter' => [
                    Adminuser::STATUS_DELETED=> yii::t('app', 'status_deleted'),
                    Adminuser::STATUS_ACTIVE=> yii::t('app', 'status_active'),
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
                'template' => '{view} {update} {delete} {resetpwd} {privilege}',
                'buttons' => [
                    'resetpwd' => function ($url, $model, $key) {
                        $options = [
                            'title' => Yii::t('app', 'reset_pwd'),
                            'aria-label' => Yii::t('app', 'reset_pwd'),
                            'data-pjax' => '0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-lock"></span>', $url, $options);
                    },

                    'privilege' => function ($url, $model, $key) {
                        $options = [
                            'title' => Yii::t('app', 'access'),
                            'aria-label' => Yii::t('app', 'access'),
                            'data-pjax' => '0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-user"></span>', $url, $options);
                    },

                ],
            ],
        ],
    ]); ?>
</div>
