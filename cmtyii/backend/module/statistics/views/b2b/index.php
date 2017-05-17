<?php
$this->title = '';
?>
<script src="js/echarts.min.js"></script>
<div class="container-fluid" style="margin: 0px; padding: 0px; margin-top: -30px;">
    <div class="lr_nav">
        <ul>
            <a href="<?php echo \yii\helpers\Url::toRoute(['store/index'])?>"><li>商家统计</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['user/index'])?>"><li>用户报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['b2b/index'])?>"><li class="lr_action">商城报表</li></a>
            <a href="<?php echo \yii\helpers\Url::to(['cdb/index'])?>"><li>茶豆报表</li></a>
        </ul>
    </div>
    <div class="col-sm-12" style="margin-top: 10px; padding-top: 10px; background-color: #ffffff">
        <div class="col-sm-12" style="padding-bottom:12px;border-bottom: 1px solid #cccccc">
            <div class="col-sm-6">
                用户统计
            </div>
            <div class="col-sm-6 ">
                <div class="pull-right">
                    <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                    时间
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
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;">912596</span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">商户合计总数</span>
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
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;">0</span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">本月新增</span>
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
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;">120</span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">本周新增</span>
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
                            <span style="font-size: 48px; color: #ffffff; display: block;text-align: right;">120</span>
                            <span style="font-size: 16px; color: #ffffff; display: block;">逾期总数</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="background-color: #ffffff;margin-top:190px;padding-top: 20px;overflow-x: scroll;width: 100%; border-top: 1px solid #eeeeee; ">
            <div id="main" style="min-width:980px;  height:600px;"></div>
            <div class="col-sm-12" style="padding-bottom:12px;border-bottom: 1px solid #cccccc">
                <div class="col-sm-6">
                    <h5>期间增加的商家列表</h5>
                </div>
                <div class="col-sm-6 ">
                </div>
            </div>
            <table class="table ">
                <tr>
                    <th style="text-align: center">编号</th>
                    <th style="text-align: center">名称</th>
                    <th style="text-align: center">添加时间</th>
                    <th style="text-align: center">联系人</th>
                    <th style="text-align: center">联系电话</th>
                    <th style="text-align: center">授信金额</th>
                    <th style="text-align: center">茶豆币余额</th>
                </tr>
                <tr>
                    <td style="text-align: center">1</td>
                    <td style="text-align: center">懒人茶楼</td>
                    <td style="text-align: center">2015-12-12 12:45:59</td>
                    <td style="text-align: center">曹双</td>
                    <td style="text-align: center">15982707139</td>
                    <td style="text-align: center">￥393.96</td>
                    <td style="text-align: center">393</td>
                </tr><tr>
                    <td style="text-align: center">1</td>
                    <td style="text-align: center">懒人茶楼</td>
                    <td style="text-align: center">2015-12-12 12:45:59</td>
                    <td style="text-align: center">曹双</td>
                    <td style="text-align: center">15982707139</td>
                    <td style="text-align: center">￥393.96</td>
                    <td style="text-align: center">393</td>
                </tr><tr>
                    <td style="text-align: center">1</td>
                    <td style="text-align: center">懒人茶楼</td>
                    <td style="text-align: center">2015-12-12 12:45:59</td>
                    <td style="text-align: center">曹双</td>
                    <td style="text-align: center">15982707139</td>
                    <td style="text-align: center">￥393.96</td>
                    <td style="text-align: center">393</td>
                </tr>
            </table>
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
            subtext: 'lrdouble'
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
                data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
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
                data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                markPoint : {
                    data : [
                        {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
                        {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name : '平均值'}
                    ]
                }
            }
        ]
    };
    myChart.setOption(option);
</script>
