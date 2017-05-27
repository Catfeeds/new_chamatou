<template>
	<div class="content-left g-left" style="padding-bottom: 200px;color: #444;">
	 	<div class="head">
			<p class="g-left">授信管理</p>
			<router-link to="/index"><div class="btn g-right">返回首页</div></router-link>
		</div>
	    <table>
			<tr>
				<td>授信额度</td>
				<td>授信余额</td>
				<td>当期应还</td>
				<td>截止还款日期</td>
				<td>备注</td>
			</tr>
			<tr>
        <td>{{detaList.credit_remain}}</td>
				<td>{{detaList.credit_amount}}</td>
				<td>{{detaList.credit_huan.toFixed(2)}}</td>
				<td>{{detaList.time}}</td>
				<td><div class="btn" style="margin: 0 auto;" @click="isShow()">还款说明</div></td>
			</tr>
	    </table>
	    <div class="tab-box">
	    	<div style="height: 40px;line-height: 40px;margin: 5px 30px 5px 0;" class="g-right clearfix">
	    		时间：
	    		 <input class="time"  type="text" @click="selectDate('start')" v-model="start_time">至
         		 <input class="time"  type="text" @click="selectDate('end')" v-model="end_time">
         		 <a class="btn" style="margin: 0 auto;display: inline-block;margin-left: 5px;" @click="grabble()">查询</a>
	    	</div>
	    	<table>
				<tr>
					<td>时间</td>
					<td>授信支付金额</td>
					<td>商品</td>
					<td>单号</td>
				</tr>
				<tr v-for="(goods,index) in infoDetaList">
					<td>{{goods.pay_time}}</td>
					<td>{{goods.credtit_amout}}</td>
					<td><div class="btn" style="margin: 0 auto;" @click="getCommodityDate(goods.Id)">查看商品详情</div></td>
					<td>{{goods.order_no}}</td>
				</tr>
		    </table>
		    <!--没有数据时显示-->
		    <div v-if="infoDetaList.length == 0" style="width: 100%;text-align: center;margin-top: 28px;font-size: 20px;color: #ccc;">
		  		该期间内没有任何记录...
			</div>
	    </div>
	    
	  <!--分页条-->
      <div class="page clearfix" v-if="pageList.length != 0">
        <div class="linklist">
          <a class="prev" href="javascript:void(0)" @click="changePage(page,'prev')">上一页</a>
          <a href="javascript:void(0)" v-for="(pages,index) in pageList"  :class="{'active' : (page==pages)}"  @click="changePage(pages)">
            {{pages==0?'...':pages}}
          </a>
          <a class="next" href="javascript:void(0)" @click="changePage(page,'next')" style="margin-left: 3px;">下一页</a>
        </div>
      </div>
      <!--分页条/end-->
	    
	    <!--loading-->
	    <v-loading v-if="isLoading"></v-loading>
	    <!--loading/end-->
	    <div v-if="iSsuccess" class="bgblacks  in"></div>
	    <!--loading-->
	    <!--弹出框-->
	    <v-msg  :msg="msg" :msgShow="msgShow" :msgType="msgType"></v-msg>
	    <!--还款说明-->
	    <div class="explain"   :class="{'explainHover': isHide }">
	    	<div class="colse" @click.stop="isShow()">x</div>
	    	这里是还款说明
	    </div>
	    <div class="zz" @click="isShow()" v-show="isHide" ></div>
	    <div class="zz" @click="isCommodity()" v-show="isHover" ></div>
	    
	    <!--商品详情-->
	    <div class="Commodity" :class="{'CommodityHover': isHover }">
	    	<div class="colse" @click="isCommodity()">x</div>
		    <table  style="color: #777;">
				<tr style="height: 30px;border: 0;font-size: 20px;">
					<td style="width: 165px;"></td>
					<td style="width: 130px;">名称</td>
					<td style="width: 120px;">规格</td>
					<td style="width: 130px;">数量</td>
					<td style="width: 120px;">价格</td>
					<td style="width: 95px;">总价</td>
				</tr>
				<tr v-for="(Commodity,index) in CommodityDate">
					<td style="width: 165px;">
						<img class="pic" :src="imgUrl+Commodity.cover" onerror="this.onerror=null; this.src='../../static/images/defalut.png'" />
					</td>
					<td style="width: 130px;">{{Commodity.goods_name}}</td>
					<td style="width: 120px;">{{Commodity.spec}}</td>
					<td style="width: 130px;">{{Commodity.num}}</td>
					<td style="width: 120px;">{{Commodity.price}}元</td>
					<td style="width: 95px;">{{(Commodity.num * Commodity.price).toFixed(2)}}元</td>
				</tr>
		    </table>
	    </div>
	</div>
</template>
<script>
    export default{
        data(){
         return {
          isLoading:false,
	      iSsuccess:false,
	      msgShow: false,
	      msg: '',
	      msgType:'',
          start_time:'2017-1-12',
          end_time:'2018-1-1',
          detaList:[],//还款数据
          infoDetaList:[],//还款记录数据
          CommodityDate:[],//商品详情
          page:1,//页数
	      pageList:[],//页数数组
	      pageNumList:[],//页数数据
	      isHide:false,//显示隐藏还款说明
	      isHover:false,//显示隐藏商品详情
         }
        },
        methods: {
          //时间插件
		  selectDate(type){
		    var _this = this;
		    laydate({
		      choose: function (dates)
          {
		      	if(type=='start'
            ){
		      		_this.start_time = dates;
		      	}else{
		      		_this.end_time = dates;
		      	}
		      },
		      isclear:false,
          istoday: false
		    });
		  },
		  //获取还款数据
		  getDeta(){
          	var _this = this;
          	this.ajax(this.port.getInfo,{},'get',function (res){
	          if(res.code==1){
	          	_this.detaList=[];
	          	_this.detaList = res.data;
	          	
	          }
	        })
          },
          //获取还款记录数据
		  getInfoDate(){
          	var _this = this;
          	this.ajax(this.port.getInfoDate,{start_time:_this.start_time,end_time:_this.end_time,page:_this.page},'get',function (res){
	          if(res.code==1){
	          	_this.infoDetaList=[];
	          	_this.infoDetaList = res.data.list;
	          	_this.pageNumList =res.data;
	          	_this.getpage(_this.page);
	          }
	        })
          },
          //获取商品详情数据
		  getCommodityDate(id){
          	var _this = this;
          	this.ajax(this.port.getInfoDate,{start_time:_this.start_time,end_time:_this.end_time,page:_this.page},'get',function (res){
	          if(res.code==1){
	          	_this.CommodityDate=[];
	          	_this.isCommodity();
	          	for(var i = 0;i<res.data.list.length;i++){
	          		if(res.data.list[i].Id==id){
	          			_this.CommodityDate=res.data.list[i].goods_info;
	        			return;
	          		}
	          	}
	          	
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
	                _this.getInfoDate();
	              } else {
	                return;
	              }
	            } else {
	              if (page < _this.pageNumList.pageNum) {
	                page++;
	                _this.page = page;
	                _this.getpage(page);
	                _this.getInfoDate();
	              } else {
	                return;
	              }
		            }
	          }else{
	            _this.page=page;
	            _this.getpage(page);
	            _this.getInfoDate();
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
      	//显示隐藏还款说明
    	isShow(){
        	this.isHide=!this.isHide;
        },
        //显示隐藏商品详情说明
    	isCommodity(){
        	this.isHover=!this.isHover;
        },
        //查询
        grabble(){
        	this.page=1;
        	this.getInfoDate();
        }
       },
        mounted(){
	    	this.getDeta();
	    	this.getInfoDate();
        }
    }
</script>
<style scoped>
  table{
  	margin: 20px 0 0 20px;
  	text-align: center;
  	overflow: hidden;
  	width: 730px;
  	background: #fff;
  }
  tr,td{
  	border: 1px solid #eee;
  }
  tr{
  	height: 40px;
  }
  .pic{
  	width: 120px;
  	height: 80px;
  	margin-top: 8px;
  }
  .tab-box{
  	width: 100%;
  	height: auto;
  	box-sizing: border-box;
  	background: #ffe5de;
  	padding-bottom: 20px;
  	margin-top: 40px;
  }
  .page{
   
    clear: both;
    margin: 0 auto;
    width: 480px;
    text-align: center;
    padding-top: 30px;
  }
  .linklist a{
    color: #777;
    text-decoration: none;
    padding: 5px 8px;
    margin: 0px 3px;
    transition: all 0.2s;
  }
  .linklist a:hover,.linklist a.active{
    color: #fff;
    text-decoration: none;
   
    background: #e63100;
    border-radius: 3px;
    transition: all 0.2s;
  }
  .time{
  	width: 128px;
  	height:20px;
  	text-align: center;
  }
  .search{
  	height: 20px;
  	line-height: 20px;
  	width: 50px;
  	display: inline-block;
  	background: #e6e6e6;
  	border-radius: 3px;
  	margin: 0 auto;
  	cursor: pointer;
  	border: 1px solid #aaa;
  	text-align: center;
  }
  .explain{
  	position: fixed;
  	width: 20px;
  	height: 20px;
  	padding: 20px;
  	border: 1px solid #eee;
  	border-radius: 5px;
  	left: 0;
  	right: 0;
  	top: 0;
  	bottom: 0;
  	margin: 108px auto;
  	z-index: 999;
  	background: #fff;
  	opacity: 0;
  	transition: all .5s;
  }
  .explainHover{
  	width: 400px;
  	height: 600px;
  	opacity: 1;
  }
  .zz{
  	position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    opacity: .5;
    background: #000;
    z-index: 998;
  }
  .Commodity{
  	background: #fff;
  	padding: 10px;
  	border: 1px solid #ccc;
  	border-radius: 5px;
  	position: absolute;
  	top: -999px;
  	left: 0;
  	right: 0;
  	margin: 0 auto;
  	width: 770px;
  	z-index: 999;
  	transition: all .5s;
  	z-index: 999;
  }
  .CommodityHover{
  	top: 158px;
  }
  .Commodity td{
  	border: 0;
  }
  .Commodity tr{
  	border-left: 0;
  	
  }
  .colse{
  	position: absolute;
  	right: 3px;
  	top: 1px;
  	color: #ee5336;
  	width: 15px;
  	height: 10px;
  	font-size: 18px;
  	cursor: pointer;
  	text-align: center;
  	z-index: 1000;
  }
</style>
