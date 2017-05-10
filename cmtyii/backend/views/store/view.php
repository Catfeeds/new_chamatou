<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\SpStore */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Sp Stores'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sp-store-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', yii::t('app', 'delete msg')),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'shoper_id',
            'sp_name',
            'address',
            'sp_phone',
            [
                    'attribute' =>'cover',
                    'format' => 'raw',
                    'value' => function($model){
                        $one = $model->getImgs();
                        $html = '';
                        if(isset($one)){
                            foreach($one as $o){
                                $html .= Html::img($o);
                            }
                        }
                        return $html;
                    }
            ],
            'intro',
        ],
    ]) ?>

    <?= DetailView::widget([
        'model' => $shoperModel,
        'attributes' => [
            'boss',


        ]
    ]) ?>
</div>
