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
                            <?= Html::a('编辑', ['edit', 'id' => $v['id']], ['class' => 'btn btn-xs btn-info']); ?>
                            <a data-href="<?= Url::to(['del', 'id' => $v['id']]) ?>" data-target="#delModal"
                               data-toggle="modal" class="btn btn-danger btn-xs deleteBtn">删除</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">提示：Notice!</h4>
                    </div>
                    <div class="modal-body">
                        亲！你确认要删除吗？你确定不后悔?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">再想想
                        </button>
                        <a href="" id="deleteTrue" class="btn btn-primary">从不后悔</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php
$this->registerJs('
    $(function () {
         $(".deleteBtn").click(function(){
            $(\'#deleteTrue\').attr(\'href\',$(this).attr(\'data-href\'));
        })
    });
', \yii\web\View::POS_END);
