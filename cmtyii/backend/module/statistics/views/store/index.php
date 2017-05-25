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
            <a href="<?php echo \yii\helpers\Url::toRoute(['store/index'])?>"><li class="lr_action">商家统计</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['user/index'])?>"><li>用户报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/index'])?>"><li>商城报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['cdb/index'])?>"><li>茶豆报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/goods','sort'=>1])?>"><li>商品销量</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/store-buy','sort'=>1])?>"><li>茶楼采购</li></a>
        </ul>
    </div>
    <div class="col-sm-12" style="margin-top: 10px; padding-top: 10px; background-color: #ffffff">
        <div class="col-sm-12" style="padding-bottom:5px;border-bottom: 1px solid #cccccc">
            <div class="col-sm-6" style="line-height: 40px;">
                <h4>商家统计</h4>
            </div>
            <div class="col-sm-6 ">
                <div class="pull-right">
                    <div class="form-inline">
                        <div class="form-group has-feedback">
                            <?php
                                yii\widgets\ActiveForm::begin([
                                        'id'=>'lr_form',
                                        'action'=>\yii\helpers\Url::to(['store/index']),
                                        'options'=>[
                                            'class'=>'input-group',
                                        ],
                                        'method'=>'get'

                                ]);
                            ?>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                </span>
                                <input type="text" style="width: 200px;" class="form-control" id="time" name="time" aria-describedby="inputGroupSuccess3Status">
                            <?php
                            \yii\widgets\ActiveForm::end();
                            ?>
                            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12" style="margin-top: 5px;">
            <div class="col-sm-3" style="padding: 5px 20px;">

                <div style="background-image:url('/images/img_b_1.png');background-size:100% 130px;height: 130px; padding-top: 20px; background-color: #65b7ff;text-align: right;border-radius: 5px;padding-left: 25px;padding-right: 25px;">
                    <div class="col-sm-4 col-xs-4 hidden-xs" style="margin-top: 20px;">
                        <img src="images/sum.png" alt="" width="60px">
                    </div>
                    <div class="col-sm-8">
                        <div class="pull-right">
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;"><?=$output['number']['store']?></span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">商家总数量</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style="padding: 5px 20px;">

                <div style="background-image:url('/images/img_b_2.png');background-size:100% 130px;height: 130px; padding-top: 20px; background-color: #e48085;text-align: right;border-radius: 5px;padding-right: 35px;">
                    <div class="col-sm-4 col-xs-4 hidden-xs" style="margin-top: 20px;">
                        <img src="images/up.png" alt="" width="60px">
                    </div>
                    <div class="col-sm-8">
                        <div class="pull-right">
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;"><?=$output['number']['monthStore']?></span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">本月商家新增总数</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style="padding: 5px 20px;">

                <div style="background-image:url('/images/img_b_3.png');background-size:100% 130px;height: 130px; padding-top: 20px; background-color: #e48085;text-align: right;border-radius: 5px;padding-right: 35px;">
                    <div class="col-sm-4 col-xs-4 hidden-xs" style="margin-top: 20px;">
                        <img src="images/up_1.png" alt="" width="60px">
                    </div>
                    <div class="col-sm-8">
                        <div class="pull-right">
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;"><?=$output['number']['weekStore']?></span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">本周商家新增总数</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style="padding: 5px 20px;">

                <div style="background-image:url('/images/img_b_4.png');background-size:100% 130px;height: 130px; padding-top: 20px; background-color: #e48085;text-align: right;border-radius: 5px;padding-right: 35px;">
                    <div class="col-sm-4 col-xs-4 hidden-xs" style="margin-top: 20px;">
                        <img src="images/yq.png" alt="" width="60px">
                    </div>
                    <div class="col-sm-8">
                        <div class="pull-right">
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;"><?=$output['number']['overdueStore']?></span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">逾期商家数量</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="background-color: #ffffff;margin-top:190px;padding-top: 20px;overflow-x: scroll;width: 100%; border-top: 1px solid #eeeeee; ">
            <div id="main" style="min-width:980px;  height:600px;"></div>
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
<script>
    var myChart = echarts.init(document.getElementById('main'));
    var  option = {

        color: ['#3398DB'],
        title : {
            text: '茶码头商户增长报表图',
            subtext: '<?=$output['time']['startTime']?>--<?=$output['time']['endTime']?>'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['增长值'],
            top:10,
        },
        grid:{

            left:80,
            right:80,
        },
        toolbox: {
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : [<?php foreach ($output['statistics']['timeList'] as $value){ echo "'".$value."',";}?>]
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'增长值',
                type:'line',
                data:[<?php foreach ($output['statistics']['dataList'] as $value){ echo $value.",";}?>]
            }
        ]
    };
    myChart.setOption(option);

    $('#time').daterangepicker({
        locale:{
            format: 'YYYY-MM-DD',
            applyLabel: '确定',
            cancelLabel: '取消',
            fromLabel: '开始',
            toLabel: '结束',
            customRangeLabel: '自定义',
            daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
            monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        },
        format: 'YYYY-MM-DD',
        startDate: '<?=$output['time']['startTime']?>',
        endDate: '<?=$output['time']['endTime']?>',
        alwaysShowCalendars: true,
        opens: "left",
        ranges: {
            '今日': [moment(), moment()],
            '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            '本月': [moment().startOf('month'), moment().endOf('month')],
            '最近七天': [moment().subtract(6, 'days'), moment()],
            '最近三十天': [moment().subtract(29, 'days'), moment()],
            '最近六十天': [moment().subtract(59, 'days'), moment()],
            '最近九十月': [moment().subtract(3,'month'), moment()],
        }
    }, function (start, end, label) {

        $('#lr_form').submit();
    });
</script>

