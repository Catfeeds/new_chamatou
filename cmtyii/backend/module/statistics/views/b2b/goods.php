<?php
$this->title = '';
?>
<script src="/js/echarts.min.js"></script>
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="/js/bootstrap-daterangepicker-master/moment.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/bootstrap-daterangepicker-master/daterangepicker.js"></script>
<link rel="stylesheet" href="/js/bootstrap-daterangepicker-master/daterangepicker.css">
<div class="container-fluid" style="margin: 0px; padding: 0px;">
    <div class="lr_nav">
        <ul>
            <a href="<?php echo \yii\helpers\Url::toRoute(['store/index'])?>"><li>商家统计</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['user/index'])?>"><li>用户报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/index'])?>"><li>商城报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['cdb/index'])?>"><li>茶豆报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/goods','sort'=>1])?>"><li class="lr_action">商品销量</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/store-buy','sort'=>1])?>"><li >茶楼采购</li></a>
        </ul>
    </div>
    <div class="col-sm-12" style="margin-top: 10px; padding-top: 10px; background-color: #ffffff">
        <div class="col-sm-12" style="padding-bottom:5px;border-bottom: 1px solid #cccccc">
            <div class="col-sm-4" style="line-height: 40px;">
                <h4>商品销量统计</h4>
            </div>
            <div class="col-sm-8">
                <div class="pull-right">
                    <div class="btn-group" role="group" aria-label="...">
                        <a href="<?=\yii\helpers\Url::to(['b2b/goods','sort'=>1])?>" type="button" class="btn btn-default btn-sm <?php if(Yii::$app->request->get('sort','') == 1){echo "active";}?> ">销量由高到底</a>
                        <a href="<?=\yii\helpers\Url::to(['b2b/goods','sort'=>2])?>" type="button" class="btn btn-default btn-sm <?php if(Yii::$app->request->get('sort','') == 2){echo "active";}?>" >销量由低到高</a>
                        <a href="<?=\yii\helpers\Url::to(['b2b/goods','sort'=>3])?>" type="button" class="btn btn-default btn-sm <?php if(Yii::$app->request->get('sort','') == 3){echo "active";}?>" >价格由高到低</a>
                        <a href="<?=\yii\helpers\Url::to(['b2b/goods','sort'=>4])?>" type="button" class="btn btn-default btn-sm <?php if(Yii::$app->request->get('sort','') == 4){echo "active";}?>" >价格由低到高</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" style="background-color: #ffffff">
        <table class="table table-bordered table-hover">
            <tr>
                <th style="text-align: center;width: 50px;">编号</th>
                <th style="text-align: center">商品名称</th>
                <th style="text-align: center;width: 150px;">上架时间</th>
                <th style="text-align: center;width: 120px;">剩余库存</th>
                <th style="text-align: center;width: 120px;">总销量</th>
                <th style="text-align: center;width: 120px;">总销售额</th>
            </tr>
            <?php for($i = 0;$i<sizeof($output['list']);$i++):?>
                <tr>
                    <td style="text-align: center"><?=$i+1?></td>
                    <td style="text-align: center;width: 350px;"><?=$output['list'][$i]['goods_name']?></td>
                    <td style="text-align: center"><?=date('Y-m-d H:i:s',$output['list'][$i]['add_time'])?></td>
                    <td style="text-align: center"><?=$output['list'][$i]['store']?></td>
                    <td style="text-align: center"><?=$output['list'][$i]['sum_sell']?> </td>
                    <td style="text-align: center"><?=sprintf('%.2f',$output['list'][$i]['sum_price'])?> </td>
                </tr>
            <?php endfor;?>
        </table>
        <hr>
        <div class="pull-right" >
            <?php echo \yii\widgets\LinkPager::widget([ 'pagination' => $output['pages'],
                'options' => [
                    'class' => 'pagination pagination-sm m-t-none m-b-none',
                    'style'=>'margin-top:-10px;margin-bottom:10px;',
                    ]
            ]) ?>
        </div>
    </div>
</div>
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
