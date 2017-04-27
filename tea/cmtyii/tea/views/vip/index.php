<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel tea\models\Vipsearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Vips');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vip-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Vip'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'shoper_id',
            'user_id',
            'phone',
            'card_no',
            // 'username',
            // 'total_amount',
            // 'vip_amount',
            // 'password_type',
            // 'password',
            // 'sex',
            // 'birthday',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
