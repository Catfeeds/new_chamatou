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
    .contents{}
    ul{list-style-type: none;}
    .contents-header ,.contents-list ul {overflow: hidden;width:100%;margin-bottom: 5px;padding: 0}
    .contents-header  li ,.contents-list  ul li{width:20%;float: left;display: block;height:50px;line-height: 60px;text-align: center;color: #222; font-size: 16px;}
    .contents-list  ul li{
        height:100px;
        line-height: 100px;background: ghostwhite;
    }
    .contents-list ul{margin-bottom: 15px;
        box-shadow:  0px 1px 6px #666;
        -webkit-box-shadow:  0px 1px 6px #666;
        -moz-box-shadow:  0px 1px 6px #666;
        padding: 0}
    .contents-list ul li .list-img{width:80%;margin: auto }
    .contents-list ul li  .list-img img{width: 100%;height: auto;}
    .order-detail{width: 100%;height: 40px;line-height: 40px;background: ghostwhite;color: #222;margin-bottom: 5px;text-indent: 20px;}

</style>
<div class="contents">
    <ul class="contents-header">
        <li></li>
        <li>名称</li>
        <li>单价</li>
        <li>数量</li>
        <li>合计</li>
    </ul>
    <?php foreach ($data as $goods):?>
    <div class="contents-list">
        <div class="order-detail"><p style="float: left">订单编号:yw1543443434343434343</p><p style="float: right;margin-right: 20px">订单编号:yw1543443434343434343</p></div>
        <?php foreach ($goods->orderGoods as $v):?>
        <ul >
            <li><div class='list-img'><img src="<?= $v['cover']?>" style="width: 120px;height=100px"/></div></li>
            <li><?= $v['goods_name']?></li>
            <li><?= $v['price']?></li>
            <li><?= $v['num']?></li>
            <li><?= $v['price']*$v['num']?></li>
        </ul>
        <?php endforeach;?>
    </div>
        <div class="order-detail"><p style="float: left">总额:<?= $goods->total_amount?></p><p style="float: right;margin-right: 20px">fgdfs</p></div>
    <?php endforeach;?>

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
