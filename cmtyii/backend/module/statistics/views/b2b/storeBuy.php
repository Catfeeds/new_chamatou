<?php
$this->title = '';
?>
<script src="/js/echarts.min.js"></script>
<script src="/js/jq.js"></script>
<script src="/js/bootstrap-daterangepicker-master/moment.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootstrap-daterangepicker-master/daterangepicker.js"></script>
<link rel="stylesheet" href="/js/bootstrap-daterangepicker-master/daterangepicker.css">
<div class="container-fluid" style="margin: 0px; padding: 0px; ">
    <div class="lr_nav">
        <ul>
            <a href="<?php echo \yii\helpers\Url::toRoute(['store/index'])?>"><li>商家统计</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['user/index'])?>"><li>用户报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/index'])?>"><li>商城报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['cdb/index'])?>"><li>茶豆报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/goods','sort'=>1])?>"><li>商品销量</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/store-buy','sort'=>1])?>"><li  class="lr_action" >茶楼采购</li></a>
        </ul>
    </div>
    <div class="col-sm-12" style="margin-top: 10px; padding-top: 10px; background-color: #ffffff">
        <div class="col-sm-12" style="padding-bottom:5px;border-bottom: 1px solid #cccccc">
            <div class="col-sm-4" style="line-height: 40px;">
                <h4>茶楼采购</h4>
            </div>
            <div class="col-sm-8">
                <div class="pull-right">
                        <?php
                            $form = \yii\widgets\ActiveForm::begin([
                                    'id'=>'lr_form',
                                    'action'=>\yii\helpers\Url::to(['b2b/store-buy']),
                                    'method'=>'get',
                                    'options'=>[
                                            'class'=>'form-inline pull-right'
                                    ]
                            ]);
                        ?>
                            <input type="text" name="name" value="<?=Yii::$app->request->get('name')?>" class="form-control" style="height: 30px;margin-right: -5px;" placeholder="请输入业务员">
                            <input type="hidden" id="sort" name="sort" value="<?= Yii::$app->request->get('sort',1)?>">
                            <input type="submit" class="btn btn-sm btn-default">
                            <div class="btn-group  input-group" role="group" aria-label="...">
                                <button onclick="return goTo(1)"  type="button" class="btn btn-default btn-sm <?php if(Yii::$app->request->get('sort','') == 1){echo "active";}?> ">采购由高到底</button>
                                <button onclick="return goTo(2)"  type="button" class="btn btn-default btn-sm <?php if(Yii::$app->request->get('sort','') == 2){echo "active";}?>" >采购由低到高</button>
                            </div>
                        <?php \yii\widgets\ActiveForm::end()?>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" style="background-color: #ffffff">
        <?php if(isset($output['type']) && $output['type'] == true):?>
            <div style="height: 300px;">
                <h4 style="text-align: center;line-height: 300px;">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: #ff5f00;font-size: 34px;position: relative;top:8px;"></span>
                    <span>对不起你输入的销售员不存在！</span>
                </h4>
            </div>

        <?php else:?>
            <table class="table table-bordered table-hover">
                <tr>
                    <th style="text-align: center;width: 50px;">编号</th>
                    <th style="text-align: center">店铺名称</th>
                    <th style="text-align: center">联系人</th>
                    <th style="text-align: center">联系电话</th>
                    <th style="text-align: center;width: 150px;">添加时间</th>
                    <th style="text-align: center;width: 120px;">采购总金额</th>
                    <th style="text-align: center;width: 80px;">业务员</th>
                </tr>
                <?php for($i = 0;$i<sizeof($output['list']);$i++):?>
                    <tr>
                        <td style="text-align: center"><?=$i+1?></td>
                        <td style="text-align: center;width: 350px;"><?=$output['list'][$i]['sp_name']?></td>
                        <td style="text-align: center;width: 350px;"><?=$output['list'][$i]['boss']?></td>
                        <td style="text-align: center;width: 350px;"><?=$output['list'][$i]['phone']?></td>
                        <td style="text-align: center"><?=date('Y-m-d H:i:s',$output['list'][$i]['add_time'])?></td>
                        <td style="text-align: center"><?=sprintf('%.2f',$output['list'][$i]['b2b_sum_price'])?></td>
                        <td style="text-align: center;width: 80px;"><?=$output['list'][$i]['salesman_id']?></td>
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
        <?php endif;?>
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
<script>
    function goTo(sort){
        $('#sort').val(sort);
        $('#lr_form').submit();
    }
</script>