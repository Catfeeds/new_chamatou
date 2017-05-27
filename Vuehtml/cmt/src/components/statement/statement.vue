<template>
  <div>
    <div class="contview">
      <div class="contviewtab">
        <a href="javascript:void(0);" class="current" @click="navclick('')" id="nav">实时数据</a>
        <a href="javascript:void(0);" @click="navclick('2')" id="nav2">营业报表</a>
        <a href="javascript:void(0);" @click="navclick('3')" id="nav3">访客统计</a>
        <a href="javascript:void(0);" @click="navclick('4')" id="nav4">销量排行</a>
      </div>
      <!--实时数据-->
      <div class="contable white-scroll" style="display: block;" id="contable">
     
        <div class="contable_title clearfix">
          <h2>实时数据 (今天00:00 至 明天00:00)</h2>
        </div>
        <div class="busisdata r5px" >
          <div class="turnover flex">
            <div class="list flex-1 flex">
              <div class="flex-1 icon"><i></i></div>
              <div class="flex-1"><span>今日总营业额：</span><b class="redcolor">{{dataList.sum}}</b></div>
            </div>
            <div class="list flex-1 flex">
            	<div class="flex-1">
            		<el-progress type="circle" :percentage="bj.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>包间收入：</span><b>{{bj.num}}</b></div>
            </div>
            <div class="list flex-1 flex ">
              <div class="flex-1 sp">
            		<el-progress type="circle" :percentage="sp.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>商品收入：</span><b>{{sp.num}}</b></div>
            </div>
            <div class="list flex-1 flex ">
              <div class="flex-1 hy">
            		<el-progress type="circle" :percentage="hy.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>会员卡消费：</span><b>{{hy.num}}</b></div>
            </div>
            <div class="list flex-1 flex sd">
              <div class="flex-1">
            		<el-progress type="circle" :percentage="yh.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>手动优惠：</span><b>{{yh.num}}</b></div>
            </div>
          </div>
          
          <div class="turnover flex">
            <div class="list flex-1 flex">
              	<div class="flex-1">
	            		<el-progress type="circle" :percentage="zfb.bili" :width="65"></el-progress>
	            	</div>
	              <div class="flex-1"><span>支付宝收入：</span><b>{{zfb.num}}</b></div>
            </div>
            <div class="list flex-1 flex">
            	<div class="flex-1">
            		<el-progress type="circle" :percentage="wx.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>微信收入：</span><b>{{wx.num}}</b></div>
            </div>
            <div class="list flex-1 flex ">
              <div class="flex-1 sp">
            		<el-progress type="circle" :percentage="xj.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>现金收入：</span><b>{{xj.num}}</b></div>
            </div>
            <div class="list flex-1 flex ">
              <div class="flex-1 hy">
            		<el-progress type="circle" :percentage="pos.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>银行卡收入：</span><b>{{pos.num}}</b></div>
            </div>
            <div class="list flex-1 flex sd">
              <div class="flex-1">
            		<el-progress type="circle" :percentage="cd.bili" :width="65"></el-progress>
            	</div>
              <div class="flex-1"><span>茶豆币收入：</span><b>{{cd.num}}</b></div>
            </div>
          </div>
         
         
          
          <div class="reports clearfix">
            <div class="reports_rate fl">
              <h2>实时上座率</h2>
              <div class="rate_conts">
                <div class="sanzuo">
                  <p><b>散座开单率：</b><span>{{sz.bili}}</span>（使用中：<strong>{{sz.shiyongzhong}}</strong>，空闲中：<strong>{{sz.kongxian}}</strong>，共：<strong>{{sz.sum}}</strong>）</p>
                  <el-progress :text-inside="true" :stroke-width="18" :percentage="sz.bili" style="margin-left: 0"></el-progress>
                </div>
                <div class="baojian">
                  <p><b>包间开单率：</b><span>{{bJ.bili}}</span>（使用中：<strong>{{bJ.shiyongzhong}}</strong>，空闲中：<strong>{{bJ.kongxian}}</strong>，共：<strong>{{bJ.sum}}</strong>）</p>
                  <el-progress :text-inside="true" :stroke-width="18" :percentage="bJ.bili" style="margin-left: 0" status="success"></el-progress>
                </div>
                <div class="yuding">
                  <p><b>预订开单率：</b><span>{{yd.bili}}</span>（已开单：<strong>{{yd.yikai}}</strong>，今日总预约：<strong>{{yd.sum}}</strong>）</p>
                  <el-progress :text-inside="true" :stroke-width="18" :percentage="yd.bili" style="margin-left: 0" status="exception"></el-progress>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
      <!--营业报表-->
      <div class="contable white-scroll" id="contable2">
      
          <div class="contable_title clearfix">
            <h2 class="fl">日经营报表({{start_time}} 至  {{end_time}})</h2>
            <div class="jymxtime fr">
              <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleDayReportBeginTime" type="text" @click="selectDate('start')" v-model="start_time">至<input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleDayReportEndTime" type="text" @click="selectDate('end')" v-model="end_time">
              <a class="search r3px" @click="inquire()">查询</a>
            </div>
          </div>
          <div class="busisdata r5px" >
          	<!--数据-->
		        <div class="busisdata r5px" style="margin-top: 0;">
		        	
		          <div class="turnover flex">
		            <div class="list flex-1 flex">
		              <div class="flex-1 icon"><i></i></div>
		              <div class="flex-1"><span>总营业额：</span><b class="redcolor">{{statementData.sum}}</b></div>
		            </div>
		            <div class="list flex-1 flex">
		            	<div class="flex-1">
		            		<el-progress type="circle" :percentage="bj.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>包间收入：</span><b>{{bj.num}}</b></div>
		            </div>
		            <div class="list flex-1 flex ">
		              <div class="flex-1 sp">
		            		<el-progress type="circle" :percentage="sp.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>商品收入：</span><b>{{sp.num}}</b></div>
		            </div>
		            <div class="list flex-1 flex ">
		              <div class="flex-1 hy">
		            		<el-progress type="circle" :percentage="hy.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>会员卡消费：</span><b>{{hy.num}}</b></div>
		            </div>
		            <div class="list flex-1 flex sd">
		              <div class="flex-1">
		            		<el-progress type="circle" :percentage="yh.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>手动优惠：</span><b>{{yh.num}}</b></div>
		            </div>
		          </div>
		          
		          <div class="turnover flex">
		            <div class="list flex-1 flex">
		              	<div class="flex-1">
			            		<el-progress type="circle" :percentage="zfb.bili" :width="65"></el-progress>
			            	</div>
			              <div class="flex-1"><span>支付宝收入：</span><b>{{zfb.num}}</b></div>
		            </div>
		            <div class="list flex-1 flex">
		            	<div class="flex-1">
		            		<el-progress type="circle" :percentage="wx.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>微信收入：</span><b>{{wx.num}}</b></div>
		            </div>
		            <div class="list flex-1 flex ">
		              <div class="flex-1 sp">
		            		<el-progress type="circle" :percentage="xj.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>现金收入：</span><b>{{xj.num}}</b></div>
		            </div>
		            <div class="list flex-1 flex ">
		              <div class="flex-1 hy">
		            		<el-progress type="circle" :percentage="pos.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>银行卡收入：</span><b>{{pos.num}}</b></div>
		            </div>
		            <div class="list flex-1 flex sd">
		              <div class="flex-1">
		            		<el-progress type="circle" :percentage="cd.bili" :width="65"></el-progress>
		            	</div>
		              <div class="flex-1"><span>茶豆币收入：</span><b>{{cd.num}}</b></div>
		            </div>
		          </div>
		        </div>
		        <!--end-->
		        
		        <!--charts-->
            <div class="charts" id="charts" style="width: 1000px;height: 500px;"></div>
            
            <!--统计报表-->
						<div class="bsdtable">
              <h2>统计报表</h2>
              <div class="globaltable">
                <table border="0" cellpadding="0" cellspacing="0">
                  <tbody>
                  <tr>
                    <td>时间</td>
                    <td>总营业收入</td>
                    <td>包间总收入</td>
                    <td>商品总收入</td>
                    <td>会员总消费</td>
                    <td>手动总优惠</td>
                    <td>支付宝总收入</td>
                    <td>微信总收入</td>
                    <td>现金总收入</td>
                    <td>pos刷卡总收入</td>
                    <td>茶豆币总收入</td>
                  </tr>
                  <tr v-for="(sum,index) in data_List">
                    <td>{{sum.time}}</td>
                    <td>{{sum.sum}}</td>
                    <td>{{sum.vip_pay.num}}</td>
                    <td>{{sum.bjsr.num}}</td>
                    <td>{{sum.goods_sr.num}}</td>
                    <td>{{sum.preferential.num}}</td>
                    <td>{{sum.ali_pay.num}}</td>
                    <td>{{sum.wx_pay.num}}</td>
                    <td>{{sum.money_pay.num}}</td>
                    <td>{{sum.card_pay.num}}</td>
                    <td>{{sum.beans_amount.num}}</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!--end-->
          </div>
          
          <div class="feedback tst2s r5px">
      
          </div>
        </report-7-day>
      </div>

      <!--销量排行-->
      <div id="contable4" class="contable white-scroll">
          <div class="contable_title clearfix">
            <h2 class="fl">销量排行({{start_time}} 至 {{end_time}})</h2>
            <div class="jymxtime fr">
              <!--分类：<select class="ng-untouched ng-pristine ng-valid">
              <option value="0">请选择</option>
           
            </option>
            </select>-->
              添加消费商品时间：<input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailBeginTime" type="text" @click="selectDate('start')" v-model="start_time">至
              <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailEndTime" type="text" @click="selectDate('end')" v-model="end_time">
              <a class="search r3px" href="javascript:void(0)" @click="xl()">查询</a>
            </div>
          </div>
          <div class="busisdata r5px" style="border-top: none;margin-top: 0;">
            <div class="globaltable">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
              <tr class="xlsort">
                <td>排行</td>
                <td>商品名称</td>
                <td>单价</td>
                <td>销量</td>
                <td>销售总额</td>
                
              </tr>
              <tr v-for="(ph,index) in seniorityList">
                <td>{{index+1}}</td>
                <td>{{ph.goods_name}}</td>
                <td>{{ph.sum_price}}元</td>
                <td>{{ph.num}}</td>
                <td>{{(ph.num*ph.sum_price).toFixed(2)}}元</td>
              </tr>
      
              </tbody>
          
              </table>
            </div>
          </div>
          
          <div class="feedback tst2s r5px">
      
          </div>
      </div>
      <!--访客统计-->
      <div id="contable3" class="contable white-scroll">
          <div class="contable_title clearfix">
            <h2 class="fl">访客统计({{start_time}} 至 {{end_time}})</h2>
            <div class="jymxtime fr">
              <!--分类：<select class="ng-untouched ng-pristine ng-valid">
              <option value="0">请选择</option>
           
            </option>
            </select>-->
              访问时间：<input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailBeginTime" type="text" @click="selectDate('start')" v-model="start_time">至
              <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailEndTime" type="text" @click="selectDate('end')" v-model="end_time">
              <a class="search r3px" href="javascript:void(0)" @click="fk()">查询</a>
            </div>
          </div>
          <div class="busisdata r5px" style="border-top: none;margin-top: 0;">
            <div class="globaltable">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
              <tr class="xlsort">
              	<td>微信昵称</td>
                <td>手机</td>
                <td>最后访问时间</td>
                <td>累计消费金额</td>
                
              </tr>
              <tr v-for="(fk,index) in seniorityList">
              	<td>{{fk.nickname}}</td>
                <td>{{fk.phone}}</td>
                <td>{{fk.end_time}}</td>
                <td>{{fk.sum}}元</td>
              </tr>
      
              </tbody>
          
              </table>
            </div>
          </div>
          
          <div >
      				<div class="page clearfix">
	             <div class="text">共<b>{{pageNumList.pageNum}}</b>页<b>{{pageNumList.pageCount}}</b>条记录</div>
	             <div class="linklist">
	               <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
	               <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in pageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
	               <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
	             </div>
		       </div>
          </div>
      </div>
      
      
    </div>
  	
		<!--报错模板-->
    <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
  	<!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div class="bgblack "></div>
  </div>
</template>
<script>
  $(function(){
    
  })
  
  
  export default{
  	data(){
      return{
          isLoading: false,          //是否出现loading框
          iSsuccess:false,           //是否ajax请求完成
          msgShow: false,            //是否显示错误消息模态框
          msg: '',                   //错误消息提示内容
    			start_time:'',         //开单时间的开始
    			end_time:'',
    			page:1,
        	pageList:[],
       	 	pageNumList:[],//开单时间的结束
    			dataList:[],//数据
    			bj:[],//包间
    			sp:[],//商品
    			hy:[],//会员
    			yh:[],//优惠
    			zfb:[],//支付宝
    			wx:[],//微信
    			xj:[],//现金
    			pos:[],//刷卡
    			cd:[],//茶豆
    			sz:[],//散座
    			bJ:[],//包间
    			yd:[],//预定
    			sum:'',//总销售额
    			statementData:[],//报表数据
    			time:[],//时间
    			businessSum:[],//营业数据
    			wx_paySum:[],//微信数据
    			ali_paySum:[],//支付宝数据
    			vip_paySum:[],//会员数据
    			money_paySum:[],//现金数据
    			beans_amountSum:[],//茶豆币数据
    			preferentialSum:[],//优惠数据
    			card_paySum:[],//刷卡数据
    			data_List:[],//统计报表
    			seniorityList:[],//排行
    			role:[],//权限
      }
    },
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
      	var _this = this;
        var id = id;
        var bleid =  '#contable' + id;
        var nav = '#nav' + id;
        if(id==''){
        	_this.dataList=[];
      	 	_this.sz=[];
      	 	_this.bJ=[];
      	 	_this.yd=[];
        	_this.getRealTimeData();
        }
        if(id=='2'){
        	_this.statementData=[];
        	_this.getStatementData();
        }
        if(id=='3'){
        	_this.statementData=[];
        	_this.page=1;
        	_this.getCaller();
        }
        if(id=='4'){
        	_this.statementData=[];
        	_this.getSeniorityData();
        }
        $('.contable').hide();
        $('.bench').hide();
         $('.contviewtab a').siblings('.current').removeClass('current').end().removeClass('current');
        $(bleid).show();
        $(nav).addClass('current');
      },
      //时间插件
      selectDate(type){
		    var _this = this;
		    laydate({
		    	istoday:false,
          isclear:false,
		      choose: function (dates)
          {
		      	if(type=='start'){
		      		_this.start_time = dates;
		      	}else{
		      		_this.end_time = dates;
		      	}
		      },
		      
		    });
		  },
      //获取当前时间
      getDate(){
        var startTime='';
        var endTime='';
        var myDate = new Date();
        var Y = myDate.getFullYear();
        var M = myDate.getMonth() + 1;
        startTime+=Y+'-';
        endTime+=Y+'-';
        if(M < 10){
          startTime+='0'+M+'-';
          endTime+='0'+M+'-';
        }else{
          startTime+=M+'-';
          endTime+=M+'-';
        }
        startTime+='01';
        endTime+= this.getDates();
        this.start_time=startTime;
        this.end_time=endTime;
      },
      //一个月有多少天
			getDates(){
			    var curDate = new Date();
			    /* 获取当前月份 */
			    var curMonth = curDate.getMonth();
			    /*  生成实际的月份: 由于curMonth会比实际月份小1, 故需加1 */
			    curDate.setMonth(curMonth + 1);
			    /* 将日期设置为0, 这里为什么要这样设置, 我不知道原因, 这是从网上学来的 */
			    curDate.setDate(0);
			    /* 返回当月的天数 */
			    return curDate.getDate();
			},
		  //查询报表
		  inquire(){
		  	this.getStatementData();
		  },
		  //查询销量
		  xl(){
		  	this.getSeniorityData();
		  },
		  //查询访客
		  fk(){
		  	this.getCaller();
		  },
      //获取实时数据
      getRealTimeData(){
      	var _this = this;
      	 _this.ajax(_this.port.realTimeData,{},'get',function(res){
      	 		if(res.code==1){
      	 			_this.dataList=[];
      	 			_this.sz=[];
      	 			_this.bJ=[];
      	 			_this.yd=[];
      	 			_this.dataList = res.data.list;
      	 			_this.bj=_this.dataList.bjsr;
		    			_this.sp=_this.dataList.goods_sr;
		    			_this.hy=_this.dataList.vip_pay;
		    			_this.yh=_this.dataList.preferential;
		    			_this.zfb=_this.dataList.ali_pay;
		    			_this.wx=_this.dataList.wx_pay;
		    			_this.xj=_this.dataList.money_pay;
		    			_this.pos=_this.dataList.card_pay;
		    			_this.cd=_this.dataList.beans_amount;
		    			_this.sz=res.data.szl.sz;
		    			_this.bJ=res.data.szl.bj;
		    			_this.yd=res.data.szl.yd;
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
      //获取报表实时数据
      getStatementData(){
      	var _this = this;
      	 _this.ajax(_this.port.statementData,{start_time:_this.start_time,end_time:_this.end_time},'get',function(res){
      	 		if(res.code==1){
      	 			_this.statementData=[];
		    			_this.statementData=res.data.list;
		    			_this.bj=_this.statementData.bjsr;
		    			_this.sp=_this.statementData.goods_sr;
		    			_this.hy=_this.statementData.vip_pay;
		    			_this.yh=_this.statementData.preferential;
		    			_this.zfb=_this.statementData.ali_pay;
		    			_this.wx=_this.statementData.wx_pay;
		    			_this.xj=_this.statementData.money_pay;
		    			_this.pos=_this.statementData.card_pay;
		    			_this.cd=_this.statementData.beans_amount;
		    			_this.time=res.data.time;
		    			_this.businessSum=res.data.sum;
		    			_this.wx_paySum=res.data.wx_pay;//微信数据
		    			_this.ali_paySum=res.data.ali_pay;//支付宝数据
		    			_this.vip_paySum=res.data.vip_pay;//会员数据
		    			_this.money_paySum=res.data.money_pay;//现金数据
		    			_this.beans_amountSum=res.data.beans_amount;//茶豆币数据
		    			_this.preferentialSum=res.data.preferential;//优惠数据
		    			_this.card_paySum=res.data.card_pay;//刷卡数据
		    			_this.data_List=res.data.data_list;//统计报表
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
       //获取排行数据
      getSeniorityData(){
      	var _this = this;
      	 _this.ajax(_this.port.SeniorityData,{start_time:_this.start_time,end_time:_this.end_time},'get',function(res){
      	 		if(res.code==1){
      	 			_this.seniorityList=[];
      	 			_this.seniorityList=res.data;
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
			 //获取访客数据
      getCaller(){
      	var _this = this;
      	 _this.ajax(_this.port.caller,{start_time:_this.start_time,end_time:_this.end_time,page:_this.page},'get',function(res){
      	 		if(res.code==1){
      	 			_this.seniorityList=[];
      	 			_this.pageNumList=[];
      	 			_this.seniorityList=res.data.list;
      	 			_this.pageNumList =res.data;
	          	 	_this.getpage(_this.page);
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
       //分页
      changePage(page,type){
	        if(Number(page)){
	          var _this=this;
	          if(type) {
	            if (type == 'prev') {
	              if (page > 1) {
	                page--;
	                _this.page = page;
	                _this.getpage(page);
	                _this.getCaller();
	              } else {
	                return;
	              }
	            } else {
	              if (page < _this.pageNumList.pageNum) {
	                page++;
	                _this.page = page;
	                _this.getpage(page);
	                _this.getCaller();
	              } else {
	                return;
	              }
	            }
          }else{
            _this.page=page;
            _this.getpage(page);
            _this.getCaller();
          }
        }
      },
      getpage(page){
        var _this=this;
        if(_this.pageNumList.pageNum>10){
          //当前页小于6
          if(page<6){
            _this.pageList=[];
            for(let i=1;i<=7;i++){
              if(i==7){
                _this.pageList.push(0);
              }else{
                _this.pageList.push(i);
              }
            }
            _this.pageList.push(_this.pageNumList.pageNum);
            _this.page=page;
          }
          //当前页中间部分
          if(page>5 && page<_this.pageNumList.pageNum-2){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=page-2;i<=page+2;i++){
              _this.pageList.push(i);
            }
            _this.pageList.push(0,_this.pageNumList.pageNum);
            _this.page=page;
          }
          //最后几页
          if(_this.pageNumList.pageNum-2<=page && page<=_this.pageNumList.pageNum){
            _this.pageList=[];
            _this.pageList.push(1,0);
            for(let i=_this.pageNumList.pageNum-6;i<=_this.pageNumList.pageNum;i++){
              _this.pageList.push(i);
            }
            _this.page=page;
          }
        }else{
          _this.page=page;
          _this.pageList=[];
          for(let i=1;i<=_this.pageNumList.pageNum;i++){
            _this.pageList.push(i);
          }
        }
      }
    },
    mounted(){
      var str = window.location.href;
      if(str.indexOf('statement')!=-1){
        $('#navstr').html('报表');
      }
    	var _this=this;
      _this.getDate();
      $('.money').click(function(){
        $(this).addClass('active').siblings('.money').removeClass('active');
      });
      _this.getRealTimeData();
			//进度条颜色配置
			$('.yuding .el-progress-bar__inner').css({'background':'#e6ad74'});
			$('.el-progress-bar__inner').css({'transition':'all .5s'});
    },
    //组件更新后
 		updated(){
 			 //折线图显示与配置
      var chartsWidth = $('#contable2').width();
      $('#charts').css({'width':chartsWidth+'px'});
      var myChart = echarts.init(document.getElementById('charts'));
      
    	var option = {
			    title: {
			        text: '总营业额走势图',
			        subtext: '无敌大侠'
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
//			    legend: {
//			        data:['姚大侠','大侠飞']
//			    },
			    color:
			    	['#c23531','rgba(222,222,222,0)','rgba(222,222,222,0)','rgba(222,222,222,0)', 'rgba(222,222,222,0)','rgba(222,222,222,0)',  'rgba(222,222,222,0)', 'rgba(222,222,222,0)','rgba(222,222,222,0)', 'rgba(222,222,222,0)', 'rgba(222,222,222,0)']
			    ,
			    toolbox: {
			        show: true,
			        feature: {
			            dataZoom: {
			                yAxisIndex: 'none'
			            },
			            magicType: {type: ['line', 'bar']},
			            restore: {},
			            saveAsImage: {},
			        }
			    },
			    xAxis:  {
			        type: 'category',
			        boundaryGap: false,
			        data: this.time
			    },
			    yAxis: {
			        type: 'value',
			        axisLabel: {
			            formatter: '{value} 元'
			        }
			    },
			    series: [
			        {
			            name:'总营业收入',
			            type:'line',
			            data:this.businessSum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ],
			                symbolSize:[100,50]
                    
			            },
			            markLine: {
			                data: [
			                    {type: 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'微信总收入',
			            type:'line',
			            data:this.wx_paySum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            }
			        },
			         {
			            name:'支付宝总收入',
			            type:'line',
			            data:this.ali_paySum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            }
			        },
			        {
			            name:'会员消费总收入',
			            type:'line',
			            data:this.vip_paySum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            }
			        },
			        {
			            name:'现金总收入',
			            type:'line',
			            data:this.money_paySum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            }
			        },
			        {
			            name:'茶豆币总收入',
			            type:'line',
			            data:this.beans_amountSum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            }
			        },
			        {
			            name:'总优惠',
			            type:'line',
			            data:this.preferentialSum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            }
			        },
			        {
			            name:'pos刷卡总收入',
			            type:'line',
			            data:this.card_paySum,
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            }
			        }
			    ]
			};
				
				myChart.setOption(option);
			
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
  .el-progress--circle .el-progress__text {
  	top:42%;
  }
  .el-progress{
  	margin-left: 80px;
  }
  .el-progress-bar{
  	
  }
  
</style>
