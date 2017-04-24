<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Adminuser */

$this->title = '管理员详情';
$this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="adminuser-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('更新', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '确定删除管理员?',
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
