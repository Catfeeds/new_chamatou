<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Message */

$this->title = '留言详情:'. $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Messages'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="message-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', Yii::t('app','Delete Msg')),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'title',
            [
                'attribute' => 'shoper_id',
                'value' => $model->storeName->sp_name,
                'captionOptions' =>['class' => 'bg-red']
            ],
            [
                'attribute' => 'type',
                'value' => function ($model) {
                    switch ($model->type) {
                        case 1:
                            return '培训支持';
                        case 2:
                            return '活动申请';
                        case 3:
                            return '广告设计';
                    }
                }
            ],
            'phone',
            'username',
            'add_time:datetime',
            [
                'attribute' => 'message_status',
                'value' => function($model){
                    return $model->status ? '已读' : '未读';
                }
            ],
            'content:ntext',
        ],
    ]) ?>

</div>
