<template>
	<div class="content-left g-left" style="padding-bottom: 200px;">
	 	<div class="head">
			<p class="g-left">支付订单</p>
			<router-link to="/index"><div class="btn g-right">返回首页</div></router-link>
		</div>
		<!---->
	    <table>
			<tr style="height: 30px;border: 0;font-size: 20px;">
				<td style="width: 165px;"></td>
				<td style="width: 130px;">名称</td>
				<td style="width: 120px;">规格</td>
				<td style="width: 130px;">数量</td>
				<td style="width: 120px;">价格</td>
			</tr>
			<tr v-for="(order,index) in orderList">
				<td style="width: 165px;" >
					<img class="pic" :src="imgUrl+order.goods_info.cover" />
				</td>
				<td style="width: 130px;">{{order.goods_info.goods_name}}</td>
				<td style="width: 120px;">{{order.goods_info.spec}}</td>
				<td style="width: 130px;">{{order.goods_num}}</td>
				<td style="width: 120px;">{{order.goods_info.price}}元</td>
			</tr>
	    </table>
	    <div style="width: 100%;box-sizing: border-box;border: 1px solid #eee;border-left:0;border-right:0;height: 70px;line-height: 70px;padding-right: 10px;">
	    	<p class="g-right">总计：￥<span style="color: #ff9d6e;font-size: 18px;">{{priceCount}}</span>元</p>
	    </div>
	    <div style="width: 738px;margin: 0 auto;height: auto;border-bottom: 1px solid #eee;margin-bottom: 15px;">
	    	<p style="border-bottom: 1px solid #eee;font-size: 16px;line-height: 40px;">选择收货地址:</p>
	    	<p class="dz" :class="{'active' : address.id == site}" v-for="(address,index) in siteList">
	    		<label>
		    		<input class="g-left" type="radio" :value="address.id" v-model="site" />
		    		<span class="g-left">{{address.province+address.city+address.district+address.address}}<span v-if="address.default==1">(默认地址)</span></span>
	    		</label>
	    	</p>
	    </div>
	    <div class="bottom">
	    	<p class="g-left" style="margin-left: 20px;">使用茶豆币</p>
	    	<input type="text" name="tea" class="g-left tea" placeholder="输入茶豆币"  v-model="checkCdb" @input="changeCdb()"/>
	    	<p class="g-left"><span class="active-text">（茶豆币余额：{{cdb}}）</span></p>
	    	<div class="count-btn g-right" @click="pay()">去结算</div>
	    	<p class="g-right" style="margin-right: 10px;">
	    		<label>
	    			<input type="checkbox" name="pay" value="0" v-model="checkshouxin" @change="changePayType('s')"/>
	    			授信支付
	    		</label>
	    		<label>
	    			<input type="checkbox" name="pay" value="1"  v-model="checkpay" @change="changePayType('z')" />
	    			在线支付
	    		</label>
	    	</p>
	    </div>
    <div class="login-mask " v-show="dialog">
      <p id="login-close" class="g-position-absolute" @click="closeDialog()">X</p>
      <div id="share-erweima"   >
        <img src=""/>
        <p class="text-center" style="font-size: 12px;;">打开微信，点击底部的“发现”</p>
        <p class="text-center" style="font-size:12px;"> 使用“扫一扫”即可将网页分享至朋友圈。</p>
      </div>
    </div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
    <!--loading-->
    <!--弹出框-->
    <v-msg  :msg="msg" :msgShow="msgShow" :msgType="msgType"></v-msg>
	</div>
</template>
<script>
  export default{
    data(){
      return {
        dialog:false,
        isLoading:false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        msgType:'',
        cartList:[],//商品数据
        site:'',//地址
        siteList:[],//地址列表
        orderList:[],//商品列表
        orderIdArr:[],//商品id
        priceCount:0,//总价
        userInfo:[],//用户信息
        bili:0,//茶豆币兑换比例
        cdb:0,//茶豆币
        cdbAll:0,//茶豆币拷贝
        priceCountAll:0,//总价拷贝
        checkCdb:'',//选择茶豆币支付多少
        checkshouxin:false,//是否选择授信支付
        checkpay:false,//是否在线支付
        showxin:0,//授信支付多少
        payType:[],//支付方式
        oderId:'',//支付订单id
      }
    },
    methods: {
      //切换支付方式
      changePayType(type){
      	if(type=='s'){
      	
      		if(Number(this.showxin)<=this.priceCount){
            this.checkshouxin=false;
            this.checkpay=false;
            this.msgHint('error','您的授信不足，请选择其他支付方式!');
          }else{
            this.checkpay=false;
          }
        }else{
          this.checkshouxin=false;
        }
      },
      //支付
      pay(){
      	
        this.payType=[];
      	if(this.checkCdb!=''){
      		this.payType.push({cdb:1,num:this.checkCdb});
        }else{
          this.payType.push({cdb:0,num:0});
        }
        if(this.checkshouxin){
          this.payType.push({shouxin:1,num:this.priceCount});
        }else{
          this.payType.push({shouxin:0,num:0});
        }
        if(this.checkpay){
          this.payType.push({zaixian:1,num:this.priceCount});
        }else{
          this.payType.push({zaixian:0,num:0});
        }
        if(this.priceCount!=0){
          if(!this.checkshouxin && !this.checkpay){
              this.msgHint('error','请选择一种支付方式！');
              return;
          }else{
            this.gotoPay()
          }
        }else{
          this.gotoPay()
        }
        
      },
      //去支付
      gotoPay(){
        var _this=this;
        this.ajax(this.port.getOrderList,{cart_id:this.orderIdArr,address_id:this.site,pay:this.payType},'post',function (res) {
        	if(res.code==1){
        		if(_this.payType[2]['zaixian']==1){
            	_this.dialog=true;
            	_this.oderId=res.data.order_id;
              var img_src = 'http://paysdk.weixin.qq.com/example/qrcode.php?data=' + res.data.wx_pay_url;
              $("#share-erweima img").attr('src', img_src);
              _this.monitorOderStatus();
            }else{
        			_this.$router.push({name:'orderlist'});
            }
        		
          }else{
        		_this.msgHint('error',res.msg)
          }
        })
      },
      //监听支付状态
      monitorOderStatus(){
      	var _this=this;
      	var timer = setInterval(function(){
	        _this.ajax(_this.port.getOderStatus,{order_id:_this.oderId},'get',function (res) {
	        	if(res.code==1){
	        		_this.dialog=false;
	        		_this.msgHint('success','支付成功');
	        		clearInterval(timer);
	        		var b = setTimeout(function(){
	        			 clearTimeout(b);
	        			_this.$router.push({name:'orderlist'});
	        		},2000)
	        		
	        	}
	        })
      	},1000)
      },
      //关闭二维码跳转到订单页面
      closeDialog(){
      	this.dialog=false;
        this.$router.push({name:'orderlist'});
      },
    	//获取地址
      getSite(){
        var _this =this;
        _this.ajax(this.port.addressList,{},'get',function (res){
          if(res.code==1){
            _this.siteList=[];
            _this.siteList = res.data;
            for(let i = 0; i < _this.siteList.length; i++){
              if(_this.siteList[i]['default'] == 1){
                _this.site = _this.siteList[i]['id'];
                return;
              }else{
                _this.site = _this.siteList[0]['id'];
              }
            }
          }
        })
      },
      //获取结算订单列表
      getOrderInit(){
      	var _this=this;
      	this.ajax(this.port.getOrderList,{cart_id:this.orderIdArr},'get',function (res) {
          if(res.code==1){
          	_this.orderList=[];
          	_this.bili=res.data['bili'];
          	_this.orderList=res.data['cart_list'];
            var count=0;
          	for(var i=0;i<res.data['cart_list'].length;i++){
              var num = Number(res.data['cart_list'][i]['goods_num']);
              var price = Number(res.data['cart_list'][i]['goods_info']['price']);
              count+=num*price;
            }
            _this.priceCount =count.toFixed(2);
            _this.priceCountAll =count.toFixed(2);
          }else{
          	_this.msgHint('error',res.msg);
          }
        })
      },
      //获取用户信息
      getUserInfo(){
        var _this=this;
        this.ajax(this.port.getUserInfo,{},'get',function (res) {
          if(res.code==1){
            _this.userInfo=[];
            _this.userInfo=res.data;
            _this.cdb=res.data['withdraw_total'];
            _this.cdbAll=res.data['withdraw_total'];
            _this.showxin=res.data['credit_balance'];
          }
        },false)
      },
      //使用茶豆币付款
      changeCdb(){
//          this.checkCdb=this.priceCount;
//          this.cdb=this.cdb-this.priceCount;
        if(/^[1-9]\d{0,9}$/.test(this.checkCdb)){
        	
        	if(Number(this.checkCdb)<=Number(this.cdbAll)){
            this.cdb = (this.cdbAll -this.checkCdb).toFixed(2);
            this.priceCount = (Number(this.priceCountAll)-(Number(this.checkCdb)/this.bili));
            this.priceCount=this.priceCount.toFixed(2)
          }else{
            this.checkCdb=''
            this.cdb = this.cdbAll ;
            this.priceCount = this.priceCountAll
        		this.msgHint('error','您的茶豆币不足,请重新输入');
          }
          if(Number(this.checkCdb)<=Number(this.priceCountAll)){
            this.cdb = (this.cdbAll -this.checkCdb).toFixed(2);
            this.priceCount = Number(this.priceCountAll)-(Number(this.checkCdb/this.bili));
            this.priceCount=this.priceCount.toFixed(2)
          }else{
            this.checkCdb=''
            this.cdb = this.cdbAll ;
            this.priceCount = this.priceCountAll
            this.msgHint('error','输入的茶豆币超过了订单总额！');
          }
        }else{
          this.checkCdb=''
          this.cdb = this.cdbAll ;
          this.priceCount = this.priceCountAll
        }
      }
    },
    mounted(){
      //初始化数据
      this.orderIdArr = JSON.parse(this.$route.params.id);
      this.getSite();
      this.getUserInfo();
      this.getOrderInit();
    }
  }
</script>
<style scoped>
  table{
  	margin: 20px 0 0 20px;
  	text-align: center;
  }
  tr{
  	height: 108px;
  	border-bottom: 1px solid #eee;
  }
  .default{
  	border: 1px solid #eee;
  	background: #f5f5f5;
  	height: 18px;
  	width: 18px;
  	margin-top: 40px;
  }
  .tea{
  	margin: 22px 0 0 3px;
  	height: 32px;
  	line-height: 32px;
  	width: 100px;
  	border: 1px solid #eee;
  	background: #fff;
  	font-size: 14px;
  	text-align: center;
  }
  .pic{
  	width: 120px;
  	height: 80px;
  	margin-top: 8px;
  }

  .delete{
  	width: 58px;
  	height: 26px;
  	line-height: 26px;
  	background: #b4b4b4;
  	color: #fff;
  	border: 1px solid #eee;
  	border-radius: 3px;
  	margin-left: 20px;
  	cursor: pointer;
  	transition: all .5s;
  }
  .delete:hover{
  	background: #f2987f;
  }
  .active-text{
  	color: #e63100;
  }
  .bottom{
  	height: 78px;
  	width: 100%;
  	line-height: 78px;
  	background: #ffe5de;
  	font-size: 18px;
  }
  .count-btn{
  	width: 130px;
  	height: 78px;
  	background: #ff7316;
  	color: #fff;
  	text-align: center;
  	font-size: 22px;
  	cursor: pointer;
  	transition: all 0.5s;
  }
  .count-btn:hover{
  	background: #ee5336;
  }
  .dz{
  	width: 100%;
  	height: 40px;
  	line-height: 40px;
  	margin-top: 5px;
  	overflow: hidden;
  	border-radius: 5px;
  }
  .active{
  	background: #ffe5de;
  	color: #ff7316;
  }
  .dz input{
  	display: inline-block;
  	margin: 14px 28px;
  }
</style>
