<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Salesman */

$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Salesmen'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="salesman-view">
    <div class="C_msgBox">
        <h3 class="C_titleBox">
            <?= $this->title ?>
            <div style="float: right;padding-right: 10px;">
                <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-default',
                    'data' => [
                        'confirm' => Yii::t('app', Yii::t('app', 'Delete Msg')),
                        'method' => 'post',
                    ],
                ]) ?>
                <a href="javascript:history.go(-1)" class="btn btn-default">返回</a>
            </div>
        </h3>

        <div class="C_Row">
        <span>
            <i class="global_borLeft"></i>
            留言主要
        </span>
            <span>

            <?php echo $model->title ?>
        </span>
        </div>
        <div class="C_Row">
        <span>
            <i class="global_borLeft"></i>
            商铺
        </span>
            <span>
            <?= $model->storeName->sp_name ?>
        </span>
        </div>
        <div class="C_Row">
        <span>
            <i class="global_borLeft"></i>
            留言类型
        </span>
            <span>

            <?php
            switch ($model->type) {
                case 1:
                    echo '培训支持';
                    break;
                case 2:
                    echo '活动申请';
                    break;
                case 3:
                    echo '广告设计';
                    break;
            }
            ?>
        </span>
        </div>
        <div class="C_Row">
        <span>
            <i class="global_borLeft"></i>
            联系电话
        </span>
            <span>
            <?= $model->phone ?>
        </span>
        </div>
        <div class="C_Row">
            <span>
                <i class="global_borLeft"></i>
                添加时间
            </span>
            <span>
                <?= date('Y-m-d H:i:s', $model->add_time) ?>
            </span>
        </div>
        <div class="C_Row">
            <span>
                <i class="global_borLeft"></i>
                状态
            </span>
            <span>
                <?php echo $model->status ? '已读' : '未读' ?>
            </span>
        </div>
        <div class="C_Row">
            <span>
                <i class="global_borLeft"></i>
                留言主题内容
            </span>
            <span>
                <?php echo $model->content ?>
            </span>
        </div>
    </div>

</div>
