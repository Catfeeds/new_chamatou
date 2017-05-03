<?php

use backend\models\ShoperImg;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Shoper */

$this->title = '商铺详情';
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shopers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="shoper-view">

<!--    <h1>--><?//= Html::encode($this->title) ?><!--</h1>-->

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'boss',
            'phone',
            'credit_amount',
            'contract_no',
            'withdraw_type',
            'bank',
            'bank_user',
            'card_no',
            'credit_remain',
            'status',
            'salesman_id',
            'add_time:datetime',
            'beans_incom',
            'total_amount',
            'withdraw_total',
            [
                    'attribute' => 'sp_status',
                    'value' => $model->getSpstatus(),
            ],

        ],
    ]) ?>


    <?= DetailView::widget([
        'model' => $storeModel,
        'attributes' => [
            'sp_name',
            'address',
            'lat',
            'lot',
            'provinces_id',
            'city_id',
            'area_id',
            'add_detail',
            'sp_phone',
            [
                    'attribute' => 'cover',
                    'label' => '图片',
                    'format' => 'raw',
                    'value' => function($model){
                        $imgs = ShoperImg::find()
                            ->where(['store_id'=>$model->id])
                            ->select('path')->all();
                        $html = '';

                        foreach($imgs as $img){
                            $html .= Html::img('public'.$img['path'], ['width'=> '400px', 'height'=> '400px']);
                        }
                        return $html;
                    }
            ],
            'intro',
        ],
    ]) ?>
</div>
