<?php

use backend\models\Salesman;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\SpStore */

$this->title = $model->sp_name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', '门店管理'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sp-store-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data'  => [
                'confirm' => Yii::t('app', yii::t('app', 'delete msg')),
                'method'  => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model'      => $model,
        'attributes' => [
            'sp_name',
            'address',
            'sp_phone',
            [
                'attribute' => 'cover',
                'format'    => 'raw',
                'value'     => function ($model) {
                    $one = $model->getImgs();
                    $html = '';
                    if (isset($one)) {
                        foreach ($one as $o) {
                            $html .= Html::img($o);
                        }
                    }
                    return $html;
                },
            ],
            'intro',
            [
                    'attribute' => 'add_time',
                    'format' => 'date'
            ],
        ],
    ]) ?>

    <?= DetailView::widget([
        'model'      => $shoperModel,
        'attributes' => [
            'boss',
            'credit_amount',
            'contract_no',
            [
                'attribute' => 'withdraw_type',
                'value'     => function ($model) {
                    switch ($model->withdraw_type) {
                        case 1:
                            return '支付宝';
                        case 2:
                            return '微信';
                        case 3:
                            return '银行卡';
                    }
                },
            ],
            'pay_account',
            'bank',
            'bank_user',
            'card_no',
            'credit_remain',
            'credit_balance',
            [
                'attribute' => 'status',
                'value'     => function ($shoperModel) {
                    if ($shoperModel->status === 1) {
                        return '冻结';
                    } else {
                        return '正常';
                    }
                },
            ],
            [
                'attribute' => 'salesman_id',
                'value'     => $shoperModel->salesman ? $shoperModel->salesman->username : null,
            ],
            'beans_incom',
            'total_amount',
            'withdraw_total',
            [
                    'attribute' => 'sp_status',
                    'value' => $shoperModel->sp_status == 1 ? '封停' : '正常'
            ],

        ],
    ]) ?>
</div>
