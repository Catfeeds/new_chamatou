<template>
  <div>
    <div class="contview">
      <div class="contviewtab">
        <a href="javascript:void(0);" class="current" @click="navclick('')" id="nav">实时数据</a>
        <a href="javascript:void(0);" @click="navclick('2')" id="nav2">营业报表</a>
        <a href="javascript:void(0);" @click="navclick('3')" id="nav3">经营明细</a>
      
        <a href="javascript:void(0);" @click="navclick('4')" id="nav4">销量排行</a>
      </div>
      <!--实时数据-->
      <div class="contable white-scroll" style="display: block;" id="contable">
     
        <div class="contable_title clearfix">
          <h2>实时数据 (今天00:00 至 明天00:00)</h2>
        </div>
        <div class="busisdata r5px">
          <div class="turnover flex">
            <div class="list flex-1 flex">
              <div class="flex-1 icon"><i></i></div>
              <div class="flex-1"><span>今日总营业额：</span><b class="redcolor">0.0</b></div>
            </div>
            <div class="list flex-1 flex">
              <div class="datagraph flex-1">
                <div class="graybg">0.0%</div>
                <div class="leftbg"><p style="transform: rotate(180deg);"></p></div>
                <div class="rightbg"><p style="transform: rotate(180deg);"></p></div>
              </div>
              <div class="flex-1"><span>包间收入：</span><b>0.0</b></div>
            </div>
            <div class="list flex-1 flex">
              <div class="datagraph flex-1 cofficeborder">
                <div class="graybg">0.0%</div>
                <div class="leftbg"><p style="transform: rotate(180deg);"></p></div>
                <div class="rightbg"><p style="transform: rotate(180deg);"></p></div>
              </div>
              <div class="flex-1"><span>商品收入：</span><b>0.0</b></div>
            </div>
            <div class="list flex-1 flex">
              <div class="datagraph flex-1 blueborder">
                <div class="graybg">0.0%</div>
                <div class="leftbg"><p style="transform: rotate(180deg);"></p></div>
                <div class="rightbg"><p style="transform: rotate(180deg);"></p></div>
              </div>
              <div class="flex-1"><span>会员优惠：</span><b>0.0</b></div>
            </div>
            <div class="list flex-1 flex">
              <div class="datagraph flex-1 blueborder">
                <div class="graybg">0.0%</div>
                <div class="leftbg"><p style="transform: rotate(180deg);"></p></div>
                <div class="rightbg"><p style="transform: rotate(180deg);"></p></div>
              </div>
              <div class="flex-1"><span>手动优惠：</span><b>0.0</b></div>
            </div>
          </div>
          <div class="reports clearfix">
          
          
          
          
          
          
            <div class="reports_rate fl">
              <h2>实时上座率</h2>
              <div class="rate_conts">
                <div class="sanzuo">
                  <p><b>散座开单率：</b><span>25.0%</span>（使用中：<strong>2</strong>，空闲中：<strong>6</strong>，共：<strong>8</strong>）</p>
                  <i class="colorgray"><i class="colorcoffice" style="width: 25%;"></i></i>
                </div>
                <div class="baojian">
                  <p><b>包间开单率：</b><span>22.2%</span>（使用中：<strong>2</strong>，空闲中：<strong>7</strong>，共：<strong>9</strong>）</p>
                  <i class="colorgray"><i class="colorblue" style="width: 22.2%;"></i></i>
                </div>
                <div class="yuding">
                  <p><b>预订开单率：</b><span>0.0%</span>（已开单：<strong>0</strong>，今日总预约：<strong>0</strong>）</p>
                  <i class="colorgray"><i class="colorgreen" style="width: 0%;"></i></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </report-realtime>
    </div>
      <!--营业报表-->
      <div class="contable white-scroll" id="contable2">
      
          <div class="contable_title clearfix">
            <h2 class="fl">日经营报表(2017-03-04 00:00 至 2017-03-12 00:00)</h2>
            <div class="jymxtime fr">
              <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleDayReportBeginTime" type="text">至<input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleDayReportEndTime" type="text">
              <a class="search r3px">查询</a>
              <a class="search r3px">导出</a>
        
            </div>
          </div>
          <div class="busisdata r5px">
            <div class="turnover flex">
              <div class="list flex-1 flex">
                <div class="flex-1 icon"><i></i></div>
                <div class="flex-1"><span>总营业收入：</span><b class="redcolor">30.0</b></div>
              </div>
              <div class="list flex-1 flex">
                <div class="datagraph flex-1">
                  <div class="graybg">0.0%</div>
                  <div class="leftbg"><p style="transform: rotate(180deg);"></p></div>
                  <div class="rightbg"><p style="transform: rotate(180deg);"></p></div>
                </div>
                <div class="flex-1"><span>包间总收入：</span><b>0.0</b></div>
              </div>
              <div class="list flex-1 flex">
                <div class="datagraph flex-1 cofficeborder">
                  <div class="graybg">100.0%</div>
                  <div class="leftbg"><p style="transform: rotate(360deg);"></p></div>
                  <div class="rightbg"><p style="transform: rotate(360deg);"></p></div>
                </div>
                <div class="flex-1"><span>商品总收入：</span><b>30.0</b></div>
              </div>
              <div class="list flex-1 flex">
                <div class="datagraph flex-1 blueborder">
                  <div class="graybg">0.0%</div>
                  <div class="leftbg"><p style="transform: rotate(180deg);"></p></div>
                  <div class="rightbg"><p style="transform: rotate(180deg);"></p></div>
                </div>
                <div class="flex-1"><span>会员总优惠：</span><b>0.0</b></div>
              </div>
              <div class="list flex-1 flex">
                <div class="datagraph flex-1 blueborder">
                  <div class="graybg">0.0%</div>
                  <div class="leftbg"><p style="transform: rotate(180deg);"></p></div>
                  <div class="rightbg"><p style="transform: rotate(180deg);"></p></div>
                </div>
                <div class="flex-1"><span>手动总优惠：</span><b>0.0</b></div>
              </div>
            </div>
            <div class="charts">
              <h2></h2>
              <div id="day7Chart" data-highcharts-chart="2"><div class="highcharts-container" id="highcharts-8" style="position: relative; overflow: hidden; width: 1690px; height: 400px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><svg version="1.1" style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;" xmlns="http://www.w3.org/2000/svg" width="1690" height="400"><desc>Created with Highcharts 4.2.5</desc><defs><clipPath id="highcharts-9"><rect x="0" y="0" width="1524" height="306"></rect></clipPath></defs><rect x="0" y="0" width="1690" height="400" fill="#FFFFFF" class=" highcharts-background"></rect><path fill="none" d="M 69 359.5 L 1593 359.5" stroke="#808080" stroke-width="1"></path><g class="highcharts-grid"></g><g class="highcharts-grid"><path fill="none" d="M 69 359.5 L 1593 359.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 315.5 L 1593 315.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 272.5 L 1593 272.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 228.5 L 1593 228.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 184.5 L 1593 184.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 140.5 L 1593 140.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 97.5 L 1593 97.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 53.5 L 1593 53.5" stroke="#D8D8D8" stroke-width="1" opacity="1"></path></g><g class="highcharts-axis"><path fill="none" d="M 286.5 359 L 286.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 503.5 359 L 503.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 721.5 359 L 721.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 939.5 359 L 939.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 1157.5 359 L 1157.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 1374.5 359 L 1374.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 1593.5 359 L 1593.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 68.5 359 L 68.5 369" stroke="#C0D0E0" stroke-width="1" opacity="1"></path><path fill="none" d="M 69 359.5 L 1593 359.5" stroke="#C0D0E0" stroke-width="1"></path></g><g class="highcharts-axis"><text x="28.421875" text-anchor="middle" transform="translate(0,0) rotate(270 28.421875 206)" class=" highcharts-yaxis-title" style="color:#707070;fill:#707070;" y="206">金额(元)</text></g><g class="highcharts-series-group"><path fill="#7cb5ec" fill-opacity="0.25" d="M 395 349 C 408.32 349 408.32 369 395 369 C 381.68 369 381.68 349 395 349 Z"></path><g class="highcharts-series highcharts-series-0" transform="translate(69,53) scale(1 1)" clip-path="url(https://pc.mjzhcl.com/report#highcharts-9)"><path fill="none" d="M 108.85714285714 306 L 326.57142857143 306 L 544.28571428571 43.71428571428572 L 762 306 L 979.71428571429 306 L 1197.4285714286 306 L 1415.1428571429 306" stroke="#7cb5ec" stroke-width="3" stroke-linejoin="round" stroke-linecap="round"></path><path fill="none" d="M 98.85714285714 306 L 108.85714285714 306 L 326.57142857143 306 L 544.28571428571 43.71428571428572 L 762 306 L 979.71428571429 306 L 1197.4285714286 306 L 1415.1428571429 306 L 1425.1428571429 306" stroke-linejoin="round" visibility="visible" stroke="rgba(192,192,192,0.0001)" stroke-width="22" class=" highcharts-tracker" style=""></path></g><g class="highcharts-markers highcharts-series-0 highcharts-tracker" transform="translate(69,53) scale(1 1)" clip-path="url(https://pc.mjzhcl.com/report#highcharts-10)" style=""><path fill="#7cb5ec" d="M 1415 302 C 1420.328 302 1420.328 310 1415 310 C 1409.672 310 1409.672 302 1415 302 Z"></path><path fill="#7cb5ec" d="M 1197 302 C 1202.328 302 1202.328 310 1197 310 C 1191.672 310 1191.672 302 1197 302 Z"></path><path fill="#7cb5ec" d="M 979 302 C 984.328 302 984.328 310 979 310 C 973.672 310 973.672 302 979 302 Z"></path><path fill="#7cb5ec" d="M 762 302 C 767.328 302 767.328 310 762 310 C 756.672 310 756.672 302 762 302 Z"></path><path fill="#7cb5ec" d="M 544 39.71428571428572 C 549.328 39.71428571428572 549.328 47.71428571428572 544 47.71428571428572 C 538.672 47.71428571428572 538.672 39.71428571428572 544 39.71428571428572 Z"></path><path fill="#7cb5ec" d="M 326 300 C 333.992 300 333.992 312 326 312 C 318.008 312 318.008 300 326 300 Z" stroke-width="1" stroke="#FFFFFF"></path><path fill="#7cb5ec" d="M 108 302 C 113.328 302 113.328 310 108 310 C 102.672 310 102.672 302 108 302 Z" stroke-width="1"></path></g></g><text x="825" text-anchor="middle" class="highcharts-title" style="color:#333333;font-size:18px;fill:#333333;width:1626px;" y="24"><tspan>总营业额走势图</tspan></text><text x="825" text-anchor="middle" class="highcharts-subtitle" style="color:#555555;fill:#555555;width:1626px;" y="52"></text><g class="highcharts-legend" transform="translate(1605,183)"><g><g><g class="highcharts-legend-item" transform="translate(8,3)"><path fill="none" d="M 0 11 L 16 11" stroke="#7cb5ec" stroke-width="2"></path><path fill="#7cb5ec" d="M 8 7 C 13.328 7 13.328 15 8 15 C 2.6719999999999997 15 2.6719999999999997 7 8 7 Z"></path><text x="21" style="color:#333333;font-size:12px;font-weight:bold;cursor:pointer;fill:#333333;" text-anchor="start" y="15">销售额</text></g></g></g></g><g class="highcharts-axis-labels highcharts-xaxis-labels"><text x="177.85714285714286" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:216px;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="378" opacity="1">2017-03-04</text><text x="395.57142857142856" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:216px;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="378" opacity="1">2017-03-05</text><text x="613.2857142857143" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:216px;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="378" opacity="1">2017-03-06</text><text x="831" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:216px;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="378" opacity="1">2017-03-07</text><text x="1048.7142857142858" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:216px;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="378" opacity="1">2017-03-08</text><text x="1266.4285714285716" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:216px;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="378" opacity="1">2017-03-09</text><text x="1484.142857142857" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:216px;text-overflow:clip;" text-anchor="middle" transform="translate(0,0)" y="378" opacity="1">2017-03-10</text></g><g class="highcharts-axis-labels highcharts-yaxis-labels"><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="361" opacity="1">0</text><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="317" opacity="1">5</text><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="274" opacity="1">10</text><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="230" opacity="1">15</text><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="186" opacity="1">20</text><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="142" opacity="1">25</text><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="99" opacity="1">30</text><text x="54" style="color:#606060;cursor:default;font-size:11px;fill:#606060;width:548px;text-overflow:clip;" text-anchor="end" transform="translate(0,0)" y="55" opacity="1">35</text></g><g class="highcharts-tooltip" style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;" transform="translate(335,234)" opacity="1" visibility="visible"><path fill="none" d="M 3.5 0.5 L 119.5 0.5 C 122.5 0.5 122.5 0.5 122.5 3.5 L 122.5 106.5 C 122.5 109.5 122.5 109.5 119.5 109.5 L 66.5 109.5 60.5 115.5 54.5 109.5 3.5 109.5 C 0.5 109.5 0.5 109.5 0.5 106.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.049999999999999996" stroke-width="5" transform="translate(1, 1)"></path><path fill="none" d="M 3.5 0.5 L 119.5 0.5 C 122.5 0.5 122.5 0.5 122.5 3.5 L 122.5 106.5 C 122.5 109.5 122.5 109.5 119.5 109.5 L 66.5 109.5 60.5 115.5 54.5 109.5 3.5 109.5 C 0.5 109.5 0.5 109.5 0.5 106.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.09999999999999999" stroke-width="3" transform="translate(1, 1)"></path><path fill="none" d="M 3.5 0.5 L 119.5 0.5 C 122.5 0.5 122.5 0.5 122.5 3.5 L 122.5 106.5 C 122.5 109.5 122.5 109.5 119.5 109.5 L 66.5 109.5 60.5 115.5 54.5 109.5 3.5 109.5 C 0.5 109.5 0.5 109.5 0.5 106.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" isShadow="true" stroke="black" stroke-opacity="0.15" stroke-width="1" transform="translate(1, 1)"></path><path fill="rgba(249, 249, 249, .85)" d="M 3.5 0.5 L 119.5 0.5 C 122.5 0.5 122.5 0.5 122.5 3.5 L 122.5 106.5 C 122.5 109.5 122.5 109.5 119.5 109.5 L 66.5 109.5 60.5 115.5 54.5 109.5 3.5 109.5 C 0.5 109.5 0.5 109.5 0.5 106.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5" stroke="#7cb5ec" stroke-width="1"></path><text x="8" style="font-size:12px;color:#333333;fill:#333333;" y="20"><tspan style="font-weight:bold">2017-03-05</tspan><tspan style="font-weight:bold" x="8" dy="15">总营业收入:0.0元</tspan><tspan style="font-weight:bold" x="8" dy="15">包间总收入：0.0元</tspan><tspan style="font-weight:bold" x="8" dy="15">商品总收入：0.0元</tspan><tspan style="font-weight:bold" x="8" dy="15">会员总优惠：0.0元</tspan><tspan style="font-weight:bold" x="8" dy="15">手动总优惠：0.0元</tspan></text></g><text x="1680" text-anchor="end" style="cursor:pointer;color:#909090;font-size:9px;fill:#909090;" y="395">Highcharts.com</text></svg></div></div>
            </div>
            <div class="bsdtable">
              <h2>统计报表</h2>
              <div class="globaltable">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>时间</td><td>总营业收入</td><td>包间总收入</td><td>商品总收入</td><td>会员总优惠</td><td>手动总优惠</td>
                  </tr>
                  <tr>
                    <td>2017-03-04</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                  </tr><tr>
                    <td>2017-03-05</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                  </tr><tr>
                    <td>2017-03-06</td>
                    <td>30.0</td>
                    <td>0.0</td>
                    <td>30.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                  </tr><tr>
                    <td>2017-03-07</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                  </tr><tr>
                    <td>2017-03-08</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                  </tr><tr>
                    <td>2017-03-09</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                  </tr><tr>
                    <td>2017-03-10</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                    <td>0.0</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
          <div class="feedback tst2s r5px">
      
          </div>
        </report-7-day>
      </div>
      <!--经营明细-->
      <div class="bench white-scroll member" id="contable3">
        
        <div class="jymxtime" style="text-align: right;">
          <a class="search r3px">导出</a>
        </div>
        <div class="globaltable r5px">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
              <td>结账单编号</td>
              <td width="20%">结账时间</td>
              <td>消费时长</td>
              <td>房间名称</td>
              <td>商品消费</td>
              <td>包间费用</td>
              <td width="10%">会员优惠</td>
              <td width="8%">手动优惠</td>
              <td>实付款</td>
              <td width="10%">是否免单</td>
              <td>会员姓名</td>
              <td>结账员工</td>
              <td>操作</td>
            </tr>
            <tr class="table_search">
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="iptCheckOutTimeBegin" style="width: 120px;" type="text">
                -
                <input class="calendar ng-untouched ng-pristine ng-valid hasDatepicker" id="iptCheckOutTimeEnd" style="width: 120px;" type="text">
              </td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>--</td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                <input type="text" class="ng-untouched ng-pristine ng-valid">
              </td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid">
                  <option value="0">全部</option>
                  <option value="1">是</option>
                  <option value="2">否</option>
                </select>
              </td>
              <td>--</td>
              <td>
                <select class="ng-untouched ng-pristine ng-valid">
                  <option value="0">请选择员工</option>
                  <option value="20170301346421">
                  琳琳
                </option>
                </select>
              </td>
              <td>
                <a class="search r3px" href="javascript:void(0)"></a>
              </td>
            </tr>
            </tbody> <tbody>
      
          <tr>
            <td>20170306365811</td>
            <td>2017-03-06 10:09:41</td>
            <td>
              0小时0分钟
            </td>
            <td>吧台消费</td>
            <td>30.0元</td>
            <td>0.0元</td>
            <td>0.0元</td>
            <td>0.0元</td>
            <td>30.0元</td>
            <td>否</td>
            <td>--</td>
            <td>琳琳</td>
            <td>-</td>
          </tr>
          <tr>
            <td colspan="13">
              <div></div>
              <div>
              <div class="page clearfix">
                <div class="text">共<b>1</b>页<b>1</b>条记录</div>
                <div class="linklist">
                  <a class="prev" href="javascript:void(0)">&nbsp;</a>
                  <a href="javascript:void(0)" class="current">1</a>
                  
                  
                  
                  
                  <a class="next" href="javascript:void(0)">&nbsp;</a>
                </div>
              </div>
              
            </div>
            </td>
          </tr>
          </tbody>
          </table>
        </div>
      </div>
      <!--销量排行-->
      <div id="contable4" class="contable white-scroll">
       
          <div class="contable_title clearfix">
            <h2 class="fl">销量排行(2017-03-04 00:00 至 2017-03-11 00:00)</h2>
            <div class="jymxtime fr">
              分类：<select class="ng-untouched ng-pristine ng-valid">
              <option value="0">请选择</option>
              <option value="20170301346591">
              保健/养生
            </option><option value="20170301346582">
              小商品
            </option><option value="20170301346581">
              饮料/酒水
            </option><option value="20170301346571">
              香烟
            </option><option value="20170301346561">
              简餐
            </option><option value="20170301346551">
              茶水/咖啡
            </option>
            </select>
          
              添加消费商品时间：<input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailBeginTime" type="text">至
              <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailEndTime" type="text">
              <a class="search r3px" href="javascript:void(0)">查询</a>
              <a class="search r3px">导出</a>
            </div>
          </div>
          <div class="busisdata r5px" style="border-top: none;">
            <div class="globaltable">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
              <tr class="xlsort">
                <td width="10%">排行</td>
                <td width="25%">商品名称</td>
                <td width="25%">分类名称</td>
                <td width="20%"><a href="javasciprt:void 0">销量<i class="desc"></i></a></td>
                <td width="20%"><a href="javasciprt:void 0">销售总额<i></i></a></td>
              </tr>
          
              <tr>
                <td>1</td>
                <td>拿铁</td>
                <td>茶水/咖啡</td>
                <td>1杯</td>
                <td>38.0元</td>
              </tr><tr>
                <td>2</td>
                <td>卡布奇诺</td>
                <td>茶水/咖啡</td>
                <td>1杯</td>
                <td>38.0元</td>
              </tr><tr>
                <td>3</td>
                <td>普洱</td>
                <td>茶水/咖啡</td>
                <td>1泡</td>
                <td>88.0元</td>
              </tr><tr>
                <td>4</td>
                <td>毛峰</td>
                <td>茶水/咖啡</td>
                <td>1杯</td>
                <td>0.0元</td>
              </tr><tr>
                <td>5</td>
                <td>铁观音</td>
                <td>茶水/咖啡</td>
                <td>1壶</td>
                <td>88.0元</td>
              </tr><tr>
                <td>6</td>
                <td>面条</td>
                <td>简餐</td>
                <td>1份</td>
                <td>20.0元</td>
              </tr><tr>
                <td>7</td>
                <td>可乐</td>
                <td>饮料/酒水</td>
                <td>1听</td>
                <td>10.0元</td>
              </tr>
              </tbody>
          
              </table>
            </div>
          </div>
          
          <div class="feedback tst2s r5px">
      
          </div>
        </report-statistics-product>
      </div>
      
    </div>
  
  
  
    <div class="bgblack "></div>
  </div>
</template>
<script>
  $(function(){
    
  })
  
  
  export default{
    methods: {
//            弹出框显示隐藏
      popup (id){
        var id = '#'+id;
        $(id).addClass('in');
        $('.bgblack').addClass('in');
      },
      close(id){
        var id = '#'+id;
        $(id).removeClass('in');
        $('.bgblack').removeClass('in');
      },
//          是否启动密码
      chelick(){
        $('.password').show();
      },
      chelickHide(){
        $('.password').hide();
      },
//          导航切换
      navclick(id){
        var id = id;
        var bleid =  '#contable' + id;
        var nav = '#nav' + id;
        $('.contable').hide();
        $('.bench').hide();
        $('#nav').siblings('.current').removeClass('current').end().removeClass('current');
        $(bleid).show();
        $(nav).addClass('current');
      }
    },
    mounted(){
      $('.money').click(function(){
        $(this).addClass('active').siblings('.money').removeClass('active');
      })
    }
  }

</script>
<style scoped>
  .contable{
    display: none;
  }
  .bench{
    display:none;
    top:50px;
  }
</style>
