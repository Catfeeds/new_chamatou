<template>
  <div>
  <div class="contview">
    <div class="contviewtab">
      <a href="javascript:void(0);" class="information">茶豆总额：<strong style="font-size:18px;">{{sum.num}}</strong></a>
    </div>
    <div>
      <div class="bench white-scroll newmessage" style="top: 45px">
        <ul>
          <li class="flex r5px" >
            <p class="flex-1">提现规则:</p><span><a  href="javascript:void(0)" class="search r3px" style="margin-top: 0;" @click="popup('scrap',0)">提现</a></span>
          </li>
        </ul>
         <!--提现列表-->
      <div id="contable3" class="contable white-scroll" style="margin-top: 50px;">
          <div class="contable_title clearfix">
            <h2 class="fl">提现列表({{start_time}} 至 {{end_time}})</h2>
            <div class="jymxtime fr">
              <!--分类：<select class="ng-untouched ng-pristine ng-valid">
              <option value="0">请选择</option>
           
            </option>
            </select>-->
              提现时间：<input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailBeginTime" type="text" @click="selectDate('start')" v-model="start_time">至
              <input class="calendar hasDatepicker ng-untouched ng-pristine ng-valid" id="saleReportDetailEndTime" type="text" @click="selectDate('end')" v-model="end_time">
              <a class="search r3px" href="javascript:void(0)" @click="cx()">查询</a>
            </div>
          </div>
          <div class="busisdata r5px" style="border-top: none;margin-top: 0;">
            <div class="globaltable">
              <table border="0" cellpadding="0" cellspacing="0">
                <tbody>
              <tr class="xlsort">
              	<td>提现时间</td>
                <td>提现金额</td>
                <td>状态</td>
                <td>拒绝原因</td>
              </tr>
              <tr v-for="(gd,index) in withdrawList">
              	<td>{{gd.add_time}}</td>
                <td>{{gd.amount}}元</td>
                <td>
                	<span v-if="gd.status==0" :class="{'yellow' : gd.status==0}">待审核</span>
                	<span v-if="gd.status==1" :class="{'chartreuse' : gd.status==1}">已打款</span>
                	<span v-if="gd.status==2" :class="{'red' : gd.status==2}">拒绝</span>
                </td>
                <td  v-if="gd.note!=null">
                  <el-tooltip :content="gd.note" placement="right-start" effect="light">
                    <el-button>查看详情</el-button>
                  </el-tooltip>
                </td>
                <td v-if="gd.note==null"></td>
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
    </div>
  </div>
    <!--提现弹出框-->
    <div class="viewsmall form_cont r10px   adddeskclassify" id="scrap" style="z-index: 99999999;">
      <div class="form_cap clearfix">
        <span class="fl">提现</span>
        <a class="close fr" @click="close('scrap')" href="javascript:void(0);"></a>
      </div>
      <div class="form_detail">
        <!--报错模板-->
        <v-msg  :msg="msg" :msgShow="msgShow"></v-msg>
        <div class="form_table">
          <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
              <td>提现金额：</td>
              <td>
                <input name="classifyname" v-model="amount" type="text" class="ng-untouched ng-pristine ng-valid"   placeholder="输入提现金额"/>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="form_btn">
          <a class="btngreen baocun" href="javascript:void(0);" @click="withdraw()">确定</a>
        </div>
      </div>
    </div>
    <!--/end-->
    <!--遮罩-->
    <div>
      <div class="bgblack "></div>
    </div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
  </div>
</template>
<script>
  export default{
  	data(){
  		return {
  				isLoading: false,          //是否出现loading框
          iSsuccess:false,           //是否ajax请求完成
          msgShow: false,            //是否显示错误消息模态框
          msg: '',                   //错误消息提示内容
    			start_time:'2017-1-1',         //开单时间的开始
    			end_time:'2018-1-1',           //开单时间的结束
    			page:1,
        	pageList:[],
       	 	pageNumList:[],
       	 	sum:'',//可提现金额
       	 	amount:'',//提现金额
       	 	withdrawList:[],//提现列表
      }
    },
    methods:{
      //获取可提现金额数据
      getSum(){
      	 var _this = this;
    	   _this.ajax(_this.port.getwithdraw,{},'get',function(res){
      	 		if(res.code==1){
      	 				_this.sum='';
      	 				_this.sum=res.data;
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
      //提交申请提现
      withdraw(){
      	var _this = this;
      	if (!/^(([1-9]{1}\d{0,9}\.\d{1,2})|([1-9]{1}\d{0,9}|([0]{1}\.\d{1,2})))$/.test(_this.amount)) {
          _this.msgHint('请输入正确的金额');
          return;
        }
    	   _this.ajax(_this.port.withdraw,{amount:_this.amount},'post',function(res){
      	 		if(res.code==1){
      	 				_this.close('scrap');
      	 				_this.getSum();
      	 				_this.msgHint(res.msg);
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
      },
      //获取提现列表
      getwithdrawList(){
      	 var _this = this;
    	   _this.ajax(_this.port.getwithdrawList,{page:_this.page},'get',function(res){
      	 		if(res.code==1){
      	 				_this.withdrawList=[];
      	 				_this.pageList=[];
      	 				_this.pageNumLIst=[];
          	   	_this.pageNumList =res.data;
	          	 	_this.getpage(_this.page);
      	 				_this.withdrawList=res.data.list;
      	 		}else{
      	 			 _this.msgHint(res.msg);
      	 		}
      	 })
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
        endTime+='15';
        this.start_time=startTime;
        this.end_time=endTime;
      },
      //查找
      cx(){
      	this.getwithdrawList();
      },
      //弹出框显示隐藏
      popup (id,open,depositId,type){
        var id = '#'+id;
        $(id).addClass('in');
        var open =open;
        if(open!=1){
          $('.bgblack').eq(0).addClass('in');
        }
      },
      close(id){
      	var _this = this;
        var id = '#'+id;
        $(id).removeClass('in');
        $('.bgblack').removeClass('in');
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
	                _this.getwithdrawList(page);
	              } else {
	                return;
	              }
	            } else {
	              if (page < _this.pageNumList.pageNum) {
	                page++;
	                _this.page = page;
	                _this.getwithdrawList(page);
	              } else {
	                return;
	              }
	            }
          }else{
            _this.page=page;
            _this.getwithdrawList(page);
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
      if(str.indexOf('shouxin')!=-1){
        $('#navstr').html('提现');
      }
  		this. getSum();
  		this.getwithdrawList();
  		this.getDate();
    }
  }
</script>

<style scoped>
	.red{
		color:red;
	}
	.yellow{
		color: blue;
	}
	.chartreuse{
		color:lightgreen;
	}
  
</style>
