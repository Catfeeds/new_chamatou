<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Adminuser */

$this->title = yii::t('app', 'view');
$this->params['breadcrumbs'][] = ['label' => yii::t('app', 'adminuser_manage'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="adminuser-view">

<!--    <h1>--><?//= Html::encode($this->title) ?><!--</h1>-->

    <p>
        <?= Html::a(yii::t('app', '修改'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(yii::t('app', '删除'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => yii::t('app', 'delete_msg'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'username',
            'real_name',
            'phone',
            [
                    'attribute'=>'email',
                    'value' => $model->email
            ],
            'status',
            [
                    'attribute'=>'created_at',
                    'value'=> date("Y-m-d H:i", $model->created_at)
            ],
            [
                    'attribute' => 'updated_at',
                    'value'=>date('Y-m-d H:i', $model->updated_at)
            ],
        ],
    ]) ?>

</div>
