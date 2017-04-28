<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;

$this->title = '商品列表';
$this->params['breadcrumbs'][] = $this->title;
?>

<header class="panel-heading">
    商品列表
    <span class="tools">
                <span class="tools">
                   <?= Html::a('新增分类', ['category/add'], ['class' => 'btn btn-link']) ?>
                </span>
                <span class="tools">
                    <?= Html::a('新增商品', ['goods/add'], ['class' => 'btn btn-link']) ?>
                </span>
        <?php
        $form = ActiveForm::begin([
            'layout' => 'inline',
            'method' => 'get',
            'action' => Url::to(['index']),
            'options' => [
                'style' => 'margin-bottom:1em'
            ],
        ]); ?>

        <?php echo $form->field($searchModel, 'goods_name')->textInput(['placeholder' => '商品名称']); ?>
        <?php echo $form->field($searchModel, 'cat_id')->dropDownList($cate); ?>
        <?php echo $form->field($searchModel, 'status')->dropDownList(['0'=>'全部','1'=>'上架','2'=>'下架']); ?>
        <?php echo Html::submitInput('搜索', ['class' => 'btn btn-primary']); ?>
        <?php ActiveForm::end(); ?>

    </span>
</header>
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
                    <img src="<?= $v->cover ?>" width="40px" height="30px" class="pic" style="cursor: pointer;">
                </td>
                <td><?= $v->goods_name ?></td>
                <td><?= $v->cate->cate_name ?></td>
                <td><?= $v->price ?>元</td>
                <td><?= $v->spec ?></td>
                <td class="is_sx" data="<?= $v->Id ?>" status="<?= $v->status ?>" style="cursor: pointer;">
                    <i class="glyphicon glyphicon-hand-right"></i><?= ($v->status == 1) ? '上架' : '下架' ?>
                </td>
                <td>
                    <?= Html::a('编辑', ['edit', 'id' => $v->Id], ['class' => 'btn btn-xs btn-info']); ?>
                    <a data-href="<?= Url::to(['del', 'id' => $v->Id]) ?>" data-target="#delModal"
                       data-toggle="modal" class="btn btn-danger btn-xs deleteBtn">删除</a>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <?php
    echo LinkPager::widget([
        'pagination' => $pager,
    ]); ?>
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
                <button type="button" class="btn btn-default" data-dismiss="modal">让我想想</button>
                <a href="" id="deleteTrue" class="btn btn-primary">确认删除</a>
            </div>
        </div>
    </div>
</div>
<?php
\backend\assets\AppAsset::addScript($this, '/ext/layer/layer.js');
$this->registerJs('
    //删除商品
    $(function () {
         $(".deleteBtn").click(function(){
            $(\'#deleteTrue\').attr(\'href\',$(this).attr(\'data-href\'));
        })
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
<script>

</script>
