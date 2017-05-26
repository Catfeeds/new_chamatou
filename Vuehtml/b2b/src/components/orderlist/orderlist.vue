<template>
  <div class="content-left g-left" style="padding-bottom: 200px;">
		<div class="head">
			<p class="g-left">订单管理 > {{status}}</p>
			<router-link to="/index"><div class="btn g-right">返回首页</div></router-link>
		</div>
    <ul class="nav">
    	<li class="g-left active">待支付</li>
    	<li class="g-left">待发货</li>
    	<li class="g-left">待收货</li>
    	<li class="g-left">已完成</li>
    </ul>
		<table v-for="(goods,index) in goodsList">
			<tr style="height: 40px;border: 0;font-size: 16px;color: #fff;background: #F2987F;">
				<td style="width: 185px;"></td>
				<td style="width: 170px;">商品名称</td>
				<td style="width: 140px;">单价</td>
				<td style="width: 140px;">数量</td>
				<td style="width: 140px;">合计</td>
			</tr>
			<!--遍历模板-->
			<tr style="height: 55px;font-size: 12px;color: #e83200;background: #fff;">
				<td>
					<div class="btn" style="margin: 0 auto;" v-if="type==1" @click="gotoPay(goods.Id)">去支付</div>
					<div class="btn" style="margin: 0 auto;" v-if="type==3" @click="ConfirmGoods(goods.Id)">确认收货</div>
				</td>
				<td style="width: 220px;"><p class="text">订单编号：{{goods.order_no}}</p></td>
				<td style="width: 80px;"><p class="text">在线支付</p></td>
				<td style="width: 220px;"><p class="text" v-show="type==3||type==4">物流编号：{{goods.express_no}}</p></td>
				<td style="width: 282px;"><p class="text">下单时间：{{goods.add_time}}</p></td>
			</tr>
			<tr v-for="(goodss,index) in goods.goods_list">
				<td>
					<img class="pic" :src="imgUrl+goodss.cover" onerror="this.onerror=null; this.src='../../static/images/defalut.png'">
				</td>
				<td>{{goodss.goods_name}}</td>
				<td>{{goodss.price}}元</td>
				<td>{{goodss.num}}{{goodss.spec}}</td>
				<td>{{(goodss.num * goodss.price).toFixed(2)}}元</td>
			</tr>
			<tr style="height: 50px;background: #eee;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td class="active-text">实际金额：￥<span class="num">{{goods.total_amount}}元</span></td>
			</tr>
			<!--end-->
	  </table>
	  <!--没有更多数据时显示-->
	  <div v-if="goodsList.length == 0" style="width: 100%;text-align: center;margin-top: 68px;font-size: 20px;color: #ccc;">
	  		没有相关订单数据...
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
    <!--付款二维码-->
		<div class="login-mask " v-show="dialog">
      <p id="login-close" class="g-position-absolute" @click="closeDialog()">X</p>
      <div id="share-erweima"   >
        <img src=""/>
        <p class="text-center" style="font-size: 12px;;">打开微信，点击底部的“发现”</p>
        <p class="text-center" style="font-size:12px;"> 使用“扫一扫”即可将网页分享至朋友圈。</p>
      </div>
    </div>
</div>
</template>
<script>
  $(function(){
				
  })

  export default{
    data(){
      return{
        status:'待支付',
        isLoading:false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        msgType:'',
        type:1,//状态值
        goodsList:[],//订单数据
        page:1,
        pageList:[],
        pageNumList:[],
        dialog:false,
        oderId:'',//支付id
        timer:'',//支付判断轮循
      }
    },
    methods: {
    	//请求列表数据
   			getIndent(){
   				var _this = this;
          	this.ajax(this.port.getIndent,{status:_this.type,page:_this.page},'get',function (res){
          	  
	          if(res.code==1){
	          	_this.goodsList=[];
          	  _this.pageNumLIst=[];
	          	_this.goodsList = res.data.list;
	          	 _this.pageNumList =res.data;
	          	_this.getpage(_this.page);
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
	                _this.getIndent();
	              } else {
	                return;
	              }
	            } else {
	              if (page < _this.pageNumList.pageNum) {
	                page++;
	                _this.page = page;
	                _this.getpage(page);
	                _this.getIndent();
	              } else {
	                return;
	              }
	            }
          }else{
            _this.page=page;
            _this.getpage(page);
            _this.getIndent();
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
      //再次支付
      gotoPay(id){
        var _this=this;
        _this.oderId=id;
        this.ajax(this.port.againPay,{order_id:_this.oderId},'get',function (res) {
        	if(res.code==1){
            	_this.dialog=true;
              var img_src = 'http://paysdk.weixin.qq.com/example/qrcode.php?data=' + res.data.wx_pay_url;
              $("#share-erweima img").attr('src', img_src);
              _this.monitorOderStatus();
          }else{
        		_this.msgHint('error',res.msg)
          }
        })
      },
      //监听支付状态
      monitorOderStatus(){
      	var _this=this;
      	_this.timer = setInterval(function(){
	        _this.ajax(_this.port.getOderStatus,{order_id:_this.oderId},'get',function (res) {
	        	if(res.code==1){
	        		_this.dialog=false;
	        		_this.msgHint('success','支付成功');
	        		clearInterval(_this.timer);
	        		_this.getIndent();//数据初始化
	        	}
	        })
      	},1000)
      },
      //关闭二维码跳转到订单页面
      closeDialog(){
      	this.dialog=false;
      	clearInterval(this.timer);
      },
      //确认收货
      ConfirmGoods(id){
      	var _this=this;
      	_this.oderId=id;
      	_this.ajax(_this.port.ConfirmGoods,{order_id:_this.oderId},'get',function (res) {
        	if(res.code==1){
        		_this.msgHint('success','确认收货成功');
        		_this.getIndent();//数据初始化
        	}else{
        		_this.msgHint('error','确认收货失败');
        	}
        })
      }
    },

		mounted(){
			  var _this =this;
			  //列表切换样式
				$('li').each(function(){
						$(this).click(function(){
							$(this).addClass('active').siblings().removeClass('active');
							 _this.status = $(this).html();
							 _this.type = $(this).index() + 1;
							 _this.page = 1;
							 _this.getIndent();
						})
				})
				_this.getIndent();//数据初始化
		}
  }
  	//图片加载失败显示
	 $('img').error(function(){
		    $(this).attr('src',"defalut.png");
		})
</script>

<style scoped>
   .nav{
   	width:625px;
   	height: 60px;
   	line-height: 60px;
   	margin: 0 auto;
   	display: -webkit-flex;
    display: flex;
    justify-content: space-around;
   }
   .nav li{
   	 border-bottom: 3px solid #fff;
   	 height: 42px;
   	 cursor: pointer;
   	 font-size: 16px;
   }
	.nav li:hover{
		color: #f2987f;
		border-bottom: 3px solid #f2987f;
	}
	.nav li.active{
		color: #f2987f;
		border-bottom: 3px solid #f2987f;
	}
	table{
  	margin: 5px 0 0 0px;
  	text-align: center;
  }
  tr{
  	height: 108px;
  	border-bottom: 1px solid #eee;
  }
  .text{
  	padding: 5px;
  	background: #fef4f2;
  	display: inline-block;
  	border-radius: 5px;
  }
  .pic{
  	width: 120px;
  	height: 80px;
  	margin-top: 8px;
  }
  .active-text{
  	color: #e63100;
  }
  .num{
  	font-size: 18px;
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
</style>
