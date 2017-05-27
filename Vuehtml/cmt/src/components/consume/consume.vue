<template>
  <div>

    <div class="contview">
      <div class="contviewtab">
        <a href="javascript:void(0);" class="current" @click="navclick('','')" id="nav">全部</a>
        <a href="javascript:void(0);" class="" @click="navclick('2','1')" id="nav2">消费中</a>
        <a href="javascript:void(0);" class="" @click="navclick('3','3')" id="nav3">合并中</a>
        <!-- <a href="javascript:void(0);" class="" @click="navclick('4')" id="nav4">挂单</a>
        <a href="javascript:void(0);" class="" @click="navclick('5')" id="nav5">已取消</a> -->
        <a href="javascript:void(0);" class="" @click="navclick('6','2')" id="nav6">已结账</a>
      </div>
      <div class="contable_title clearfix" style="padding:0px 40px;margin-top: 10px">
        <div class="jymxtime fr">开单时间：
          <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailBeginTime" type="text" @click="startTime()" v-model="start_time" >至
          <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailEndTime" type="text" @click="endTime()" v-model="end_time" >
          服务生：<select class="ng-untouched ng-pristine ng-valid" v-model="staff" @change="waiterCut()">
            <option value="" >请选择员工</option>
            <option :value="yg.id" v-for="(yg,index) in staffList" >{{yg.user}}</option>
          </select>
          <a class="search r3px" href="javascript:void(0)" @click="waiterCut()">查询</a></div>
      </div>
      <!--全部-->
      <div class="bench white-scroll r5px member" style="padding-top: 0px;margin-top: 50px;display: block" id="globaltable">
        <div class="globaltable white-scroll">
        	<!--报错模板-->
    			<v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
          <tr>
            <td width="15%">开单时间</td>
            <td>消费时长</td>
            <td>状态</td>
            <td>房间名称</td>
            <td>类型</td>
            <td>包间消费</td>
            <td>商品消费</td>

            <td>优惠价</td>
            <td>订单总价</td>
            <td>现金支付</td>
            <td>茶豆币支付</td>
            <td>操作</td>
          </tr>
          <tr @click="popup('detaDraw',consum.id)" v-for="(consum,index) in detaList">
            <td>{{consum.start_time}}</td>
          	<td>{{consum.consume_time}}</span></td>
            <td>
            	<span v-if="consum.status==1">消费中</span>
            	<span style="color: #28b193 ;" v-if="consum.status==2">已结账</span>
            </td>
            <td>{{consum.table_name}}</td>
            <td>
            	<span style="color: #28b193 ;"   v-if="consum.merge_order_id==0 || consum.merge_order_id==''">主菜单</span>
            	<span style="color: #f9962d;"   v-if="consum.merge_order_id!=0 && consum.merge_order_id!=''">子菜单</span>
            </td>
            <td>
            	<span v-if="consum.table_amount=='' || consum.table_amount==null">-</span>
            	<span v-if="consum.table_amount!='' && consum.table_amount!=null">{{consum.table_amount}}</span>
            	
            </td>
            <td>
            	<span v-if="consum.goods_price_sum=='' || consum.goods_price_sum==null">-</span>
            	<span v-if="consum.goods_price_sum!='' && consum.goods_price_sum!=null">{{consum.goods_price_sum}}</span>
            </td>
       
            <td>
            	<span v-if="consum.coupon_amount=='' || consum.coupon_amount==null">-</span>
            	<span v-if="consum.coupon_amount!='' && consum.coupon_amount!=null">{{consum.coupon_amount}}</span>
            </td>
            <td>
            	<span v-if="consum.total_amount=='' || consum.total_amount==null">-</span>
            	<span v-if="consum.total_amount!='' && consum.total_amount!=null">{{consum.total_amount}}</span>
            </td>
            <td>
            	<span v-if="consum.cash_amout=='' || consum.cash_amout==null">-</span>
            	<span v-if="consum.cash_amout!='' && consum.cash_amout!=null">{{consum.cash_amout}}</span>
            </td>
            <td>
            	<span v-if="consum.beans_amount=='' || consum.beans_amount==null">-</span>
            	<span v-if="consum.beans_amount!='' && consum.beans_amount!=null">{{consum.beans_amount}}</span>
            </td>
            <td>
            	<a v-if="consum.status==2" @click.stop="getOneConsume(consum.id,'print')">打印</a>
            	<a v-if="consum.status!=2"></a>
            </td>
          </tr>
          </tbody>
            <tbody><tr>
              <td colspan="12">
                <div></div>
                <div>
		              <div class="page clearfix">
		                 <div class="text">共<b>{{pageNumList.pageNum}}</b>页<b>{{pageNumList.pageCount}}</b>条记录</div>
		                 <div class="linklist">
		                   <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev');">&nbsp;</a>
		                   <a href="javascript:void(0)" :class="{'current' : (page==pages)}" v-for="(pages,index) in pageList"   @click="changePage(pages);" >{{pages==0?'...':pages}}</a>
		                   <a class="next" href="javascript:void(0)" @click="changePage(page,'next');">&nbsp;</a>
		                 </div>
		              </div>

              </div>
              </td>
            </tr>
            </tbody></table>
        </div>
      </div>
     

    </div>


<!--详情弹出框-->
<div class="drawerdetail flex flex-v" id="detaDraw">
	<!--报错模板-->
	<v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
  <div class="dwdtl_name clearfix">
      <span class="fl">{{oneDetaList.table_name}}</span>
    <a class="close fr" href="javascript:void(0);" @click="close('detaDraw')"></a>
  </div>
  <div class="dwdtl-scroll white-scroll flex-1">
    <div class="theinfo">
      <table border="0" cellpadding="0" cellspacing="0">
        <tbody>
	        <tr>
	          <td>开单时间：</td>
	          <td>{{oneDetaList.start_time}}</td>
	          <td>累计时长：</td>
	          <td>
	            {{oneDetaList.consume_time}}
	          </td>
	        </tr>
	        <tr>
	          <td>顾客人数：</td>
	          <td>{{oneDetaList.person}}</td>
	          <td>服 务 生 ：</td>
	          <td>{{oneDetaList.staff_id}}</td>
	        </tr>
	        <tr>
	          <td>是否免单：</td>
	          <td>
	          	<span v-if="oneDetaList.is_exempt==0">否</span>
	          	<span v-if="oneDetaList.is_exempt==1">是</span>
	          </td>
	        </tr>
	        <tr>
	          <td>商品总额：</td>
	          <td>
	          	<span v-if="oneDetaList.goods_price_sum=='' || oneDetaList.goods_price_sum==null">--</span>
            	<span v-if="oneDetaList.goods_price_sum!='' && oneDetaList.goods_price_sum!=null">{{oneDetaList.goods_price_sum}}元</span>
	          </td>
	          <td>包 间 费 ：</td>
	          <td>
	          	<span v-if="oneDetaList.status!=2">0.00元</span>
            	<span v-if="oneDetaList.status==2">{{oneDetaList.table_amount}}元</span>
	          </td>
	        </tr>
	        <tr>
	          <td>消费总额：</td>
	          <td>
	          	<span v-if="oneDetaList.total_amount=='' || oneDetaList.total_amount==null">--</span>
            	<span v-if="oneDetaList.total_amount!='' && oneDetaList.total_amount!=null">{{oneDetaList.total_amount}}元</span>
	          </td>
	        </tr>
	        <tr>
	          <td>实 付 款 ：</td>
	          <td>
	          	<span v-if="oneDetaList.is_exempt==0">{{oneDetaList.sfk}}元</span>
	          	<span v-if="oneDetaList.is_exempt==1">0元</span>
	          </td>
	        </tr>
      	</tbody>
      </table>
    </div>
    <div></div>
    
    
    
    <div class="theinfo_tbl">
      <h3>商品消费清单</h3>
      <div class="globaltable member r5px">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
          	<tr>
	            <td>名称</td>
	            <td>单价</td>
	            <td>数量</td>
	            <td>金额</td>
	            <td>时间</td>
	          </tr>
			  <tr v-if="oneGoodsList.length!=0" v-for="(goods,index) in oneGoodsList">
	            <td >{{goods.goods_name}}</td>
	            <td>{{goods.price}}元</td>
	            <td>{{goods.num + goods.spec}}</td>
	            <td>{{goods.sum_price}}元</td>
	            <td>{{goods.add_time}}</td>
	          </tr>
	          <tr v-if="oneGoodsList.length==0">
	            <td >--</td>
	            <td>--</td>
	            <td>--</td>
	            <td>--</td>
	            <td>--</td>
	          </tr>
        	</tbody>
        </table>
      </div>
    </div>
    
    <div class="theinfo_tbl">
      <h3>包间费清单</h3>
      <div class="globaltable r5px">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
          	<tr>
	            <td>包间名</td>
	            <td>开始时间</td>
	            <td>入座时长</td>
	            <td>包间费</td>
	          </tr>
	          <tr>
	            <td>{{oneDetaList.table_name}}</td>
	            <td>{{oneDetaList.start_time}}</td>
	            <td>{{oneDetaList.consume_time}}</td>
	            <td>
	            	<span v-if="oneDetaList.status!=2">0.00元</span>
            		<span v-if="oneDetaList.status==2">{{oneDetaList.table_amount}}元</span>
	            </td>
	          </tr>
        	</tbody>
        </table>
      </div>
    </div>
    <!--主菜单信息  子菜单显示-->
    <div class="theinfo_tbl" v-if="fatherList.length!=0">
      <h3>主账单信息</h3>
      <div class="globaltable r5px">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
		          <tr>
		            <td>包间名</td>
		            <td>实付款</td>
		            <td>操作</td>
		          </tr>
		          <tr v-for="(father,idnex) in fatherList">
		            <td>{{father.table_name}}</td>
		            <td>{{father.total_amount}}元</td>
		            <td><a href="javascript:void(0);" @click="popup('detaDraw',father.id)">查看详情</a></td>
		          </tr>
       		</tbody>
        </table>
      </div>
    </div>
    <!--子菜单信息 主账单显示-->
    <div class="theinfo_tbl" v-if="mergeList.length!=0">
      <h3>子账单信息</h3>
      <div class="globaltable r5px">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
          	<tr>
	            <td>包间名</td>
	            <td>消费总额</td>
	            <td>操作</td>
	          </tr>
	          <tr v-for="(merge,idnex) in mergeList">
	            <td>{{merge.table_name}}</td>
	            <td>{{merge.total_amount}}元</td>
	            <td><a href="javascript:void(0);" @click="popup('detaDraw',merge.id)">查看详情</a></td>
	          </tr>
        	</tbody>
        </table>
      </div>
    </div>
    
    
    <div class="theinfo_tbl" v-if="oneDetaList.status==2">
      <h3>付款信息</h3>
      <div class="globaltable r5px">
        <table border="0" cellpadding="0" cellspacing="0">
          <tbody>
	          <tr>
	            <td>支付方式</td>
	            <td>金额</td>
	          </tr>
	          <tr>
	            <td>茶豆币</td>
	            <td>
	            	<span v-if="oneDetaList.beans_amount=='' || oneDetaList.beans_amount==null">--</span>
            		<span v-if="oneDetaList.beans_amount!='' && oneDetaList.beans_amount!=null">{{oneDetaList.beans_amount}}元</span>
	            </td>
	          </tr>
	          <tr>
	            <td>现金</td>
	            <td>
	            	<span v-if="oneDetaList.cash_amout=='' || oneDetaList.cash_amout==null">--</span>
            		<span v-if="oneDetaList.cash_amout!='' && oneDetaList.cash_amout!=null">{{oneDetaList.cash_amout}}元</span>
	            </td>
	          </tr>
	          <tr>
	            <td>微信</td>
	            <td>
	            	<span v-if="oneDetaList.wx_pay=='' || oneDetaList.wx_pay==null">--</span>
            		<span v-if="oneDetaList.wx_pay!='' && oneDetaList.wx_pay!=null">{{oneDetaList.wx_pay}}元</span>
	            </td>
	          </tr>
	          <tr>
	            <td>支付宝</td>
	            <td>
	            	<span v-if="oneDetaList.ali_pay=='' || oneDetaList.ali_pay==null">--</span>
            		<span v-if="oneDetaList.ali_pay!='' && oneDetaList.ali_pay!=null">{{oneDetaList.ali_pay}}元</span>
	            </td>
	          </tr>
	          <tr>
	            <td>pos刷卡</td>
	            <td>
	            	<span v-if="oneDetaList.card_pay=='' || oneDetaList.card_pay==null">--</span>
            		<span v-if="oneDetaList.card_pay!='' && oneDetaList.card_pay!=null">{{oneDetaList.card_pay}}元</span>
	            </td>
	          </tr>
	          <tr>
	            <td>会员卡支付</td>
	            <td>
	            	<span v-if="oneDetaList.discount=='' || oneDetaList.discount==null">--</span>
            		<span v-if="oneDetaList.discount!='' && oneDetaList.discount!=null">{{oneDetaList.discount}}元</span>
	            </td>
	          </tr>
        	</tbody>
        </table>
      </div>
    </div>
  </div>
  <div class="dwdtl_btn">
  <a class="btnred fr paybill" href="javascript:void(0)" @click="close('detaDraw')">确定</a>
  </div>
  
  
</div>
  
  
    <!--充值打印-->
    <div style="opacity: 0">
      <div   class="asdasd" id="divCustomerRechargePrint"   >
        <div style="padding: 15px;margin: 0;" >
          <h2 style="display:block; text-align:center; height:24px; overflow:hidden; margin:0; padding:0; line-height:24px;font-size: 16px;">消费明细单</h2>
          <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed;padding-bottom:15px; width:100%;margin-top: 10px;">
            <tbody>
            <tr>
              <td>房间类型：</td>
              <td  style="width: 150px;">{{oneDetaList.id}}</td>
            </tr>
            <tr>
              <td>包间名称：</td>
              <td>{{oneDetaList.table_name}}</td>
            </tr>
            <tr>
              <td>开单时间：</td>
              <td>{{oneDetaList.start_time}}</td>
            </tr>
            <tr>
              <td>结账时间：</td>
              <td>{{oneDetaList.end_time}}</td>
            </tr>
            <tr>
              <td>服务员：</td>
              <td>{{oneDetaList.staff_id}}</td>
            </tr>
            <!--<tr>
              <td>收银员：</td>
              <td>{{oneDetaList.staff_id}}元</td>
            </tr>
            <tr>
              <td>门店地址：</td>
              <td>{{oneDetaList.staff_id}}元</td>
            </tr>
            <tr>
              <td>联系电话：</td>
              <td>{{oneDetaList.staff_id}}元</td>
            </tr>-->
            </tbody></table>
          <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px solid; padding-bottom:15px; width:100%; margin-top: 10px;">
            <tbody>
            <tr style="border-bottom: #ccc 1px solid; font-weight: bold;">
              <td>名称</td>
              <td>单价</td>
              <td>数量</td>
            </tr>
            <tr style="border-bottom: #ccc 1px solid;" v-for="(goods,index) in oneGoodsList">
              <td>{{goods.goods_name}}</td>
              <td>{{goods.price}}元</td>
              <td>{{goods.num+goods.spec}}</td>
            </tr>
            </tbody>
          </table>
          <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:#666 1px dashed; padding-bottom:15px; width:100%;margin-top: 10px;">
            <tbody>
            <tr>
              <td>商品总额：</td>
              <td style="width: 150px;">
                <span v-if="oneDetaList.goods_price_sum=='' || oneDetaList.goods_price_sum==null">--</span>
                <span v-if="oneDetaList.goods_price_sum!='' && oneDetaList.goods_price_sum!=null">{{oneDetaList.goods_price_sum}}元</span>
              </td>
            </tr>
            <tr style="height: 50px;">
              <td>包间费：</td>
              <td>
                <span v-if="oneDetaList.table_amount=='' || oneDetaList.table_amount==null">--</span>
                <span v-if="oneDetaList.table_amount!='' && oneDetaList.table_amount!=null">{{oneDetaList.table_amount}}元</span>
              </td>
            </tr>
            <tr style="height: 50px;">
              <td>应付款：</td>
              <td>
                <span v-if="oneDetaList.total_amount=='' || oneDetaList.total_amount==null">--</span>
                <span v-if="oneDetaList.total_amount!='' && oneDetaList.total_amount!=null">{{oneDetaList.total_amount}}元</span>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <!--充值打印/end-->
    <!--遮罩-->
    <div>
      <div class="bgblack "></div>
    </div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
    <!--弹出层区、end-->
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
    			start_time:'2017-1-1',         //开单时间的开始
    			end_time:'2018-1-1',           //开单时间的结束
    			staff:'',									 //员工
    			staffList:[],//员工数组
    			detaList:[],//消费单数据
    			page:1,
        	pageList:[],
       	 	pageNumList:[],
       	 	type:'',
       	 	oneDetaList:[],//单个消费单数据
       	 	oneGoodsList:[],//单个消费单商品数据
       	 	mergeList:[],//主菜单显示，子菜单数组
       	 	fatherList:[],//子菜单显示，主菜单数组
      }
    },
    methods: {
//            弹出框显示隐藏
      popup (id,consumId){
        var id = '#'+id;
        $(id).addClass('in');
       // $('.bgblack').addClass('in');
        if(consumId){
        	this.getOneConsume(consumId);
        }
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
//      时间插件(开始时间)
      startTime(elem){
        var _this = this;
        laydate({
          elem: elem,
          istoday:false,
          isclear:false,
          choose: function (dates) {
            _this.start_time = dates;
          },
		      isclear:false
        });
      },
//      时间插件（结束时间 ）
      endTime(elem){
        var _this = this;
        laydate({
          elem: elem,
          istoday:false,
          isclear:false,
          choose: function (dates) {
            _this.end_time = dates;
          },
		      isclear:false
        });
      },
//          导航切换
      navclick(id,type){
        var id = id;
        //var bleid =  '#globaltable' + id;
        var nav = '#nav' + id;
        this.type=type;
        this.getConsume();
        //$('.bench').hide();
         $('.contviewtab a').siblings('.current').removeClass('current').end().removeClass('current');
        //$(bleid).show();
        $(nav).addClass('current');
      },
      //获取员工数据
      getStaff(){
      	 var _this = this;
      	 _this.ajax(_this.port.getStaff,{},'get',function(res){
      	 		if(res.code==1){
      	 			_this.staffList=[];
      	 			_this.staffList = res.data;
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
      //获取消费单数据
      getConsume(){
      	 var _this = this;
      	 _this.ajax(_this.port.getConsume,{type:_this.type,start_time:_this.start_time,end_time:_this.end_time,staff:_this.staff,page:_this.page},'get',function(res){
      	 		if(res.code==1){
      	 			 _this.detaList=[];
      	 			 _this.pageNumLIst=[];
          	   		 _this.pageNumList =res.data;
	          	     _this.getpage(_this.page);
      	 			 _this.detaList = res.data.list;
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
      //获取单个消费单数据
      getOneConsume(Id,type){
      	 var _this = this;
      	 _this.ajax(_this.port.getOneConsume,{id:Id},'get',function(res){
      	 		if(res.code==1){
      	 			 _this.oneDetaList=[];
      	 			 _this.oneGoodsList=[];
      	 			 _this.mergeList=[];
      	 			 _this.fatherList=[];
          	   		 _this.oneDetaList =res.data;
      	 			 _this.oneGoodsList = res.data['goods_list'];
      	 			 _this.mergeList=res.data['merge_order'];
      	 			 _this.fatherList=res.data['father_order'];
      	 			 if(type=='print'){
			          		_this.pr();
			            }else{
			             $('#ee').addClass('in');
			          }
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      	  
      },
      //打印
      pr(){
      	setTimeout(function(){
          $('#divCustomerRechargePrint').printArea();
        },500)
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
      //服务生切换
      waiterCut(){
      	 this.page=1;
      	 this.getConsume();
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
	                _this.getConsume();
	              } else {
	                return;
	              }
	            } else {
	              if (page < _this.pageNumList.pageNum) {
	                page++;
	                _this.page = page;
	                _this.getpage(page);
	                _this.getConsume();
	              } else {
	                return;
	              }
	            }
          }else{
            _this.page=page;
            _this.getpage(page);
            _this.getConsume();
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
      },
    },
    mounted(){
      var str = window.location.href;
      if(str.indexOf('consume')!=-1){
        $('#navstr').html('消费单');
      }
      $('.money').click(function(){
        $(this).addClass('active').siblings('.money').removeClass('active');
      });
      this.getStaff();
      this.getConsume();
      this.getDate();
    }
  }

</script>

<style scoped>
  .bench{
    display:none;
    top:50px;
    
  }

</style>
