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
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($data as $v): ?>
                    <tr>
                        <td><?= $v['id'] ?></td>
                        <td><?= $v['cate_name'] ?></td>
                        <td>
<<<<<<< HEAD
                            <?= Html::a('编辑', ['edit', 'id' => $v['id']], ['class' => 'btn btn-xs btn-info btn2']); ?>
                            <a style="margin-left: 10px;" data-href="<?= Url::to(['del', 'id' => $v['id']]) ?>" data-target="#delModal"
                               data-toggle="modal" class="btn btn-danger btn-xs deleteBtn btn2">删除</a>
=======
                            <?= Html::a('编辑', ['edit', 'id' => $v['id']], ['class' => 'btn btn-xs btn-info']); ?>
                            <a href='#' onclick="alertWarning('删除分类?','请确认你的操作？','<?= Url::to(['del','id'=>$v['id']])?>')" class='btn btn-xs btn-default' style='margin-right: 5px;'>删除</a>
>>>>>>> 5f6d5ad2824ae90011faf3fb6102e657a516ace6
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
<<<<<<< HEAD
<?php
$this->registerJs('
    $(function () {
         $(".deleteBtn").click(function(){
            $(\'#deleteTrue\').attr(\'href\',$(this).attr(\'data-href\'));
        })
    });
', \yii\web\View::POS_END);
?>
<style media="screen">
.btn2{
    width: 40px;
    height: 20px;
    font-size: 12px;
    line-height: 20px;
}
</style>
=======


>>>>>>> 5f6d5ad2824ae90011faf3fb6102e657a516ace6
