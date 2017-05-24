<?php
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = '分类列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .table-bordered{
        border-color:#ddd !important;
    }
    .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {

        border: 1px solid #ddd !important;
        text-align: center;
    }
    .panel-heading{
    	height: 38px;
    }
</style>
    <div class="wrapper">
        <header class="panel-heading">
        <span class="tools pull-right">
           <?= Html::a(yii::t('app', 'Create'), ['add'], ['class' => 'btn btn-success']) ?>
        </span>
        </header>
        <div class="tools pull-right">
        </div>
        <hr/>
        <div class="adv-table">
            <table class="table table-striped table-bordered">
                <thead>
                <tr>
                    <th>分类ID</th>
                    <th>分类名称</th>
                    <th style="width:208px">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($data as $v): ?>
                    <tr>
                        <td><?= $v['id'] ?></td>
                        <td><?= $v['cate_name'] ?></td>
                        <td>
                            <?= Html::a('编辑', ['edit', 'id' => $v['id']], ['class' => 'btn btn-xs btn-primary']); ?>
                            <a href='#' onclick="alertWarning('删除分类?','请确认你的操作？','<?= Url::to(['del','id'=>$v['id']])?>')" class='btn btn-xs btn-danger btn2'  style='margin-right: 5px;'>删除</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

<style media="screen">
.btn2{
     margin: 0 5px;
}

</style>
