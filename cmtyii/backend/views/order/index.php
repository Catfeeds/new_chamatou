<?php
use yii\helpers\Url;
use yii\bootstrap\Html;

$this->title = '订单列表';
$this->params['breadcrumbs'][] = $this->title;
?>

<!--<div>-->
<!--    <li style="float: left">商品图片</li>-->
<!--    <li style="float: left">单价</li>-->
<!--    <li style="float: left">数量</li>-->
<!--    <li >总计</li>-->
<!--</div>-->
<!--        --><?php //foreach ($data as $v): ?>
<!--            <div>fsdf</div>-->
<!--            --><?php //foreach ($v->orderGoods as $goods):?>
<!--                <div>fgdfd</div>-->
<!--            --><?php //endforeach;?>
<!---->
<!--        --><?php //endforeach; ?>
<style>
    .contents {
    }

    ul {
        list-style-type: none;
    }

    .contents-header, .contents-list ul {
        overflow: hidden;
        width: 100%;
        margin-bottom: 5px;
        padding: 0
    }

    .contents-header li, .contents-list ul li {
        width: 20%;
        float: left;
        display: block;
        height: 50px;
        line-height: 60px;
        text-align: center;
        color: #222;
        font-size: 16px;
    }

    .contents-list ul li {
        height: 100px;
        line-height: 100px;
        background: ghostwhite;
    }

    .contents-list ul {
        margin-bottom: 15px;
        box-shadow: 0px 1px 5px #666;
        -webkit-box-shadow: 0px 1px 5px #666;
        -moz-box-shadow: 0px 1px 5px #666;
        padding: 0
    }

    .contents-list ul li .list-img {
        width: 80%;
        margin: auto
    }

    .contents-list ul li .list-img img {
        width: 100%;
        height: auto;
    }

    .order-detail {
        width: 100%;
        height: 40px;
        line-height: 40px;
        background: ghostwhite;
        color: #222;
        margin-bottom: 5px;
        text-indent: 20px;
    }
    .order-status li {
        float: left;
        font-size: 20px;
        margin-right: 40px;
    }
</style>
<div>
    <ul class="order-status">
        <li><a href="<?= Url::to(['index'])?>">全部</a></li>
        <li><a href="<?= Url::to(['index','status'=>1])?>">待付款</a></li>
        <li><a href="<?= Url::to(['index','status'=>2])?>">待发货</a></li>
        <li><a href="<?= Url::to(['index','status'=>3])?>">待收货</a></li>
        <li><a href="<?= Url::to(['index','status'=>4])?>">已完成</a></li>
    </ul>
</div>
    <hr style="border-bottom:1px solid #000;"/>
<div class="contents">
    <ul class="contents-header">
        <li></li>
        <li>名称</li>
        <li>单价</li>
        <li>数量</li>
        <li>合计</li>
    </ul>
    <?php if(count($data)<1):?>
        <div class="text-center m-t-lg clearfix wrapper-lg animated fadeInRightBig" id="galleryLoading">
            <h1><i class="fa fa-warning" style="color: red;font-size: 40px"></i></h1>
            <h4 class="text-muted">对不起、未能找到"对应状态"相关的任何订单</h4>
            <p class="m-t-lg"></p>
        </div>
    <?php endif;?>
    <?php foreach ($data as $order): ?>
        <div class="contents-list">
            <div class="order-detail">
                <p style="float: left;width: 25%">订单编号:<?= $order->order_no?></p>
                <p style="float: left;width: 25%">收货地址:<?= $order->address?></p>
                <p style="float: left;width: 25%">电话号码:<?= $order->phone?></p>
                <?php if($order->status > 2):?>
                <p style="float: right;margin-right: 20px">物流单号:<?= $order->express_no;?></p>
                <?php endif;?>
            </div>
            <?php foreach ($order->orderGoods as $v): ?>
                <ul>
                    <li>
                        <div class='list-img'><img src="<?= $v['cover'] ?>" style="width: 120px;height=100px"/></div>
                    </li>
                    <li><?= $v['goods_name'] ?></li>
                    <li><?= $v['price'] ?></li>
                    <li><?= $v['num'] ?></li>
                    <li><?= $v['price'] * $v['num'] ?></li>
                </ul>
            <?php endforeach; ?>
        </div>
        <div class="order-detail">
            <p style="float: left">总额:<?= $order->total_amount ?>元</p>
            <p style="float:left">茶豆币抵扣数:<?= $order->beans_amount?></p>
            <a href="<?= Url::to(['excel','id'=>$order->Id])?>" style="float: right;margin-right: 20px;margin-top: 9px;text-align: right" class="btn btn-xs btn-info">导出</a>
            <?php if($order->status == 2):?>
            <button class="btn btn-xs btn-primary" data-href="<?= Url::to(['sed']) ?>" id="data-sed" data-target="#sedModal"
                    data-id=<?= $order->Id?> data-toggle="modal" style="float: right;margin-right: 20px;margin-top: 9px">确认发货</button>
            <?php endif;?>
            <?php if($order->status == 1):?>
                <p style="float: right;margin-right: 20px">待付款</p>
            <?php endif;?>
            <?php if($order->status == 3):?>
                <p style="float: right;margin-right: 20px">待收货</p>
            <?php endif;?>
            <?php if($order->status == 4):?>
                <p style="float: right;margin-right: 20px">已完成</p>
            <?php endif;?>
        </div>
        <hr style="border-bottom:1px dashed #cccccc;"/>
    <?php endforeach; ?>
</div>
<div>
    <?= \yii\widgets\LinkPager::widget(['pagination'=>$pager])?>
</div>
<div class="modal fade" id="sedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
<!--            <div class="modal-header">-->
<!--                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span-->
<!--                            aria-hidden="true">&times;</span></button>-->
<!--<!--                <h4 class="modal-title" id="myModalLabel">物流编号</h4>-->
<!--            </div>-->
            <div class="modal-body">
                物流编号:<input type="text" style="width: 100%" id="express_no">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <a href="" id="sed" class="btn btn-primary">确认</a>
            </div>
        </div>
    </div>
</div>
<?php
\backend\assets\AppAsset::addScript($this, '/ext/layer/layer.js');
    $this->registerJs('
        $(function(){
            $("#sed").click(function(){
                var url = $("#data-sed").attr("data-href");
                var data = $("#express_no").val();
                var order_id = $("#data-sed").attr("data-id")
                if(data == ""){
                    layer.msg("请输入订单编号",{time:1000});
                    return false;
                }
                var reg = /^\d+$/;
                if(!reg.test(data)){
                    layer.msg("请输入正确的订单编号",{time:1000});
                    return false;
                }
                $.ajax({
                    type : "get",
                    url  :  url,
                    data : {\'express_no\':data,"order_id":order_id},
                    dataType:"json",
                    success:function(re){
                        layer.msg(re.msg,{time:2000})
                        return true;
                    }
                })
            })
            
            $(".excel").click(function(){
                var data = $(this).attr("data-id");
                var url  = $(this).attr("data-url");
                $.ajax({
                    type : "get",
                    url  : url,
                    data : {"id":data},
                    dataType : "json",
                    success : function(re){
                        
                    }
                })
            })
        })
    ',\yii\web\View::POS_END);
?>