<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;

$this->title = '商品列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .table-bordered{
        border-color:#ddd !important;
    }
    .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {

        border: 1px solid #ddd !important;
        vertical-align: middle !important;
        text-align: center !important;
    }
    .btn{
       width: 60px;height:35px;font-size: 14px;padding: 0;line-height: 35px;margin-right: 5px;
     }
    select{
        width: 150px !important;
    }
</style>
<style>
    .lr_nav{
        background-color: #ffffff;
        width: 100%;
        height: 60px;
        overflow: hidden;
        margin-bottom: 15px;
    }
    .lr_nav ul{
        padding: 0;
    }
    .lr_nav ul li{
        float: left;
        list-style: none;
        width: 100px;
        height: 54px;
        line-height: 60px;
        font-size: 15px;
        text-align: center;
        color: #323232;
    }
    .lr_nav ul .lr_action{
        border-bottom: 4px solid #0062ae;
        color: #2f3f58;
    }
    .lr_nav ul :hover{
        border-bottom: 4px solid #0062ae;
        color: #2f3f58;
    }

</style>

    <div class="lr_nav">
        <ul>
            <a href="<?= Url::to(['goods/index'])?>"><li class="lr_action ">商品列表</li></a>
            <a href="<?= Url::to(['category/add'])?>"><li >新增分类</li></a>
            <a href="<?= Url::to(['goods/add'])?>"><li >新增商品</li></a>
        </ul>
        <div style="float: right">
            <?php
        $form = ActiveForm::begin([
            'layout' => 'inline',
            'method' => 'get',
            'action' => Url::to(['index']),
            'options' => [
            'style' => 'margin-bottom:1em'
            ],
            ]); ?>

            <span style="color:#999">商品名称：</span><?php echo $form->field($searchModel, 'goods_name')->textInput(['placeholder' => '商品名称']); ?>
            <span style="color:#999;margin-left: 10px;">商品分类：</span><?php echo $form->field($searchModel, 'cat_id')->dropDownList($cate); ?>
            <span style="color:#999;margin-left: 10px;">是否上架：</span><?php echo $form->field($searchModel, 'status')->dropDownList(['0'=>'全部','1'=>'上架','2'=>'下架']); ?>
            <?php echo Html::submitInput('搜索', ['class' => 'btn btn-primary']); ?>
            <?php ActiveForm::end(); ?>
        </div>
    </div>




<div class="adv-table">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>图片</th>
            <th>商品名称</th>
            <th>品类</th>
            <th>单价</th>
            <th>单位</th>
            <th>上下架</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($models as $v): ?>
            <tr>
                <td>
                    <img src="<?= $v->cover ?>" width="80px" height="60px" class="pic" style="cursor: pointer;">
                </td>
                <td><?= $v->goods_name ?></td>
                <td><?= $v->cate->cate_name ?></td>
                <td><?= $v->price ?>元</td>
                <td><?= $v->spec ?></td>
                <td class="is_sx" data="<?= $v->Id ?>" status="<?= $v->status ?>" style="cursor: pointer;">
                    <i class="glyphicon glyphicon-hand-right"></i><?= ($v->status == 1) ? '上架' : '下架' ?>
                </td>

                <td>
                    <?= Html::a('编辑', ['edit', 'id' => $v->Id], ['class' => 'btn btn-xs btn-primary btn2']); ?>

                    <a href='#' onclick="alertWarning('删除商品?','请确认你的操作？','<?= Url::to(['del', 'id' => $v->Id])?>')" class='btn btn-xs btn-danger btn2'  style='margin-right: 5px;'>删除</a>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
    <?php
    echo LinkPager::widget([
        'pagination' => $pager,
        'firstPageLabel' => '首页',
        'lastPageLabel'  => '尾页',
        'nextPageLabel'  => '下一页',
        'prevPageLabel' => '上一页',
        'maxButtonCount' => 5,
    ]); ?>

<!--<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">-->
<!--    <div class="modal-dialog" role="document">-->
<!--        <div class="modal-content">-->
<!--            <div class="modal-header">-->
<!--                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span-->
<!--                            aria-hidden="true">&times;</span></button>-->
<!--                <h4 class="modal-title" id="myModalLabel">提示：Notice!</h4>-->
<!--            </div>-->
<!--            <div class="modal-body">-->
<!--                亲！你确认要删除吗？你确定不后悔?-->
<!--            </div>-->
<!--            <div class="modal-footer">-->
<!--                <button type="button" class="btn btn-default" data-dismiss="modal">让我想想</button>-->
<!--                <a href="" id="deleteTrue" class="btn btn-primary">确认删除</a>-->
<!--            </div>-->
<!--        </div>-->
<!--    </div>-->
<!--</div>-->
<?php
\backend\assets\AppAsset::addScript($this, '/ext/layer/layer.js');
$this->registerJs('
    
    $(function () {
        //点击商品上下架
       $(".is_sx").click(function(){
            var id = $(this).attr("data");
            var status = $(this).attr("status");
            $.ajax({
                type : "post",
                url  : "/index.php?r=goods/shangjia",
                data : {"id":id,"status":status},
                success:function(data){
                    if(data.status){
                        layer.msg(data.msg,{icon:6,
                            time:0,btn: [\'确定\'],
                            yes: function(index){
                             layer.close(index);
                            window.location.reload(true)
                            }
                        });
                    }else{
                        layer.msg(data.msg,{icon:6,time:1000});
                    }
                }
            })
       })
       //查看图片
       $(".pic").click(function(){
            layer.open({
            type: 2,
            title: false,
            closeBtn: 0,
            area: [\'800px\', \'500px\'],
            skin: \'layui-layer-nobg\', //没有背景色
            shadeClose: true,
            content: $(this).attr("src")
        });
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
