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
    .content {
       color:#777;
    }

    ul {
        list-style-type: none;
    }

    .contents-header, .contents-list ul {
        overflow: hidden;
        width: 100%;
        padding: 0;
        margin:0;
        /*border-bottom: 1px solid #f1f1f1;*/
    }

    .contents-header li, .contents-list ul li {
        width: 20%;
        float: left;
        display: block;
        height: 50px;
        line-height: 50px;
        text-align: center;
        color: #666;
        font-size: 16px;
    }

    .contents-list ul li {
        height: 100px;
        line-height: 100px;
        background: ghostwhite;
    }

    .contents-list ul {
        /*box-shadow: 0px 1px 5px #666;*/
        /*-webkit-box-shadow: 0px 1px 5px #666;*/
        /*-moz-box-shadow: 0px 1px 5px #666;*/
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
        height: 50px;
        line-height: 50px;
        background: ghostwhite;
        color: #777;
       border-top: 1px solid #ccc;
        text-indent: 20px;
    }
    .order-status li {
        float: left;
        font-size: 20px;
        margin-right: 40px;
    }
    .contents-list{
        border:1px solid #ccc;
        margin-bottom: 15px;
        box-shadow: 0px 0px 5px #ccc;
        -webkit-box-shadow: 0px 0px 5px #ccc;
        -moz-box-shadow: 0px 0px 5px #ccc;
    }
    .order-detail p{margin: 0}
    .exports{
        display: inline-block;
        float: right;
        color:#fff;
        margin-right: 20px;
        padding:0;
        border:1px solid #00acd6;
        background-color: #00c0ef;
        width: 80px;height:35px;line-height: 35px;
        text-align: center;
        text-indent: 0;
        border-radius: 5px;
        font-size: 14px;
        margin-top: 7px;
    }
    .fahuo{
        display: inline-block;
        float: right;
        color:#fff;
        margin-right: 20px;
        padding:0;
        border:1px solid #3b8dbc;
        background-color: #3b8dbc;
        width: 80px;height:35px;line-height: 35px;
        text-align: center;
        text-indent: 0;
        border-radius: 5px;
        font-size: 14px;
        margin-top: 7px;
    }
    .contents-list li{color:#777}
    .exports:hover{
        color: #ccc;
    }
</style>
<style>
    .lr_nav{
        background-color: #ffffff;
        width: 100%;
        height: 60px;
        overflow: hidden;
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
        <a href="<?= Url::to(['index'])?>"><li class="navs ">全部</li></a>
        <a href="<?= Url::to(['index','status'=>1])?>"><li class="navs">待付款</li></a>
        <a href="<?= Url::to(['index','status'=>2])?>"><li class="navs">待发货</li></a>
        <a href="<?= Url::to(['index','status'=>3])?>"><li class="navs">待收货</li></a>
        <a href="<?= Url::to(['index','status'=>4])?>"><li class="navs">已完成</li></a>
    </ul>
</div>
<div class="contents">
    <ul class="contents-header" style="background: #ccc;">
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
                    <li style="color:#777"><?= $v['goods_name'] ?></li>
                    <li style="color:#777"><?= $v['price'] ?></li>
                    <li style="color:#777"><?= $v['num'] ?></li>
                    <li style="color:#777"><?= $v['price'] * $v['num'] ?></li>
                </ul>
            <?php endforeach; ?>
            <div class="order-detail">
                <p style="float: left">总额:<strong style="font-size:16px;"><?= $order->total_amount ?></strong>元</p>
                <p style="float:left">茶豆币抵扣数:<strong style="font-size:16px;"><?= $order->beans_amount?></strong></p>
                <a href="<?= Url::to(['excel','id'=>$order->Id])?>" style="" class="exports">导出</a>
                <?php if($order->status == 2):?>
                <button class="fahuo" data-href="<?= Url::to(['sed']) ?>" id="data-sed" data-target="#sedModal"
                        data-id=<?= $order->Id?> data-toggle="modal" style="">确认发货</button>
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
        </div>
        
    
    <?php endforeach; ?>
</div>
<div>
    <?= \yii\widgets\LinkPager::widget([
        'pagination' => $pager,
        'firstPageLabel' => '首页',
        'lastPageLabel'  => '尾页',
        'nextPageLabel'  => '下一页',
        'prevPageLabel' => '上一页',
        'maxButtonCount' => 5,
    ])?>
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
            var index=0;
            var Url = window.location.href;
            if(Url.indexOf("status")!=-1){
                index=Number(Url.split("&")[1].split("=")[1]);
            }
            $(".navs").eq(index).addClass("lr_action");
            $(".navs").eq(index).parent().siblings().children(".navs").removeClass("lr_action");
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