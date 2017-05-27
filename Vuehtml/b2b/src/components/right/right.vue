<template>
  <div class="content-right g-right " style="padding-bottom: 100px;">
    <!--个人信息-->
    <h5 class="g-text-ellipsis right-h5">欢迎您，{{userInfo.sp_name}}</h5>
    <div class="user-info g-position-relative">
      <img  src="static/images/user.png"/>
      <div class="g-right userdetail ">
        <p >{{userInfo.sp_name}}</p>
        <p class="g-text-ellipsis g-position-absolute" style="bottom:0">茶豆币:<span style="color:red;">{{userInfo.withdraw_total}}</span></p>
      </div>
    </div>
    <div class="mt15 g-overflow-hide">
      <p class="g-left shouxintext g-text-ellipsis">授信余额:{{userInfo.credit_balance}}</p>
      <p class="g-right but" @click="open">还款方式</p>
    </div>
    <!--个人信息/end-->
    <!--导航部分-->
    <router-link to="/cart" active-class="active">
      <div class="nav mb15 mt15" >
        <i class="icon iconfont icon-gouwuchexiantiao"></i><span>购物车({{getCount}})</span>
      </div>
    </router-link>
    <router-link to="/address" active-class="active">
      <div class="nav mb15" >
        <i class="icon iconfont icon-dizhi"></i><span>地址管理</span>
      </div>
    </router-link>
    <router-link to="/orderlist" active-class="active">
      <div class="nav mb15" >
        <i class="icon iconfont icon-dingdan"></i><span>我的订单({{userInfo.order}})</span>
      </div>
    </router-link>
    <router-link to="/credit" active-class="active">
      <div class="nav mb15" >
        <i class="icon iconfont icon-dingdan"></i><span>授信管理</span>
      </div>
    </router-link>
    <!--导航部分/end-->
    <!--最近购买-->
    <div class="mt15" v-if="recentlyShow">
      <h4 id="title">最近购买</h4>
      <ul class="recently-order" v-for="(goods,index) in goodsList">
        <li class="mt15">
          <img :src="imgUrl+goods.cover" onerror="this.onerror=null; this.src='../../static/images/defalut.png'" >
          <div class="recently-detail ">
            <p class="recently-title g-text-ellipsis">{{goods.goods_name}}</p>
            <p class="recently-price"><span>￥&nbsp;{{goods.price}}</span>/{{goods.spec}}</p>
            <div class="recently-num g-position-absolute">
              <span>数量</span>
              <i class="icon iconfont icon-jian" @click="changeNum('prve',goods.Id)"></i>
              <span class="line" :id="'num' + goods.Id" >{{goods.num}}</span>
              <i class="icon iconfont icon-jia" @click="changeNum('next',goods.Id)"></i>
            </div>
          </div>
          <div class="addcart" @click="addCart(goods.goods_id,goods.Id)">
            		加入购物车
          </div>
        
        </li>
    
     
      
      </ul>
    </div>
    <!--最近购买/end-->
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
  import {mapGetters} from 'vuex';
  export default{
    props:['recentlyShow'],
    data(){
    	return {
        isLoading:false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        msgType:'',
        userInfo:[],//用户信息
        goodsList:[],//最近购买
      }
    },
    computed:mapGetters(['getCount']),
    methods:{
    	//获取用户信息
      getUserInfo(){
      	var _this=this;
      	this.ajax(this.port.getUserInfo,{},'get',function (res) {
      		if(res.code==1){
      			_this.userInfo=[];
      			_this.userInfo=res.data
            _this.$store.commit('setCount',_this.userInfo.cart)
          }
        },false)
      },
      Recent(){
  			var _this = this;
      	this.ajax(this.port.Recent,{},'get',function (res){
      	  _this.goodsList=[];
          if(res.code==1){
          	_this.goodsList = res.data;
          }
	      })
      },
      open() {
        this.$alert('撒的黑客技术打卡还是打款哈可视对讲和卡仕达卡机', '还款方式', {
          confirmButtonText: '确定',
          callback: action => {
//            this.$message({
//              type: 'info',
//              message: `action: ${ action }`
//            });
          }
        });
      },
      //添加购物车
      addCart(id,type){
        var _this=this;
        var goodsId = id;
        var num = '';
       for(var i = 0; i < _this.goodsList.length;i++){
       	  if(type == _this.goodsList[i].Id){
       	  	 num = _this.goodsList[i].num;
       	  }
       }
       var data={
       	 goods_id:goodsId,
       	 goods_num:num
       }

        this.ajax(this.port.addCart,data,'post',function (res) {
          if(res.code==1){
            _this.msgHint('success','添加购物车成功');
            _this.getUserInfo();
          }else{
            _this.msgHint('error',res.msg)
          }
        })
        
      },
       //更改数量
      changeNum(type,id){
      	var _this=this;
      	var num = $('#num'+id).html();
      
      	if(type=='prve'){
      		if(num>1){
      			num--;
            $('#num'+id).html(num);
          }else{
      			return;
          }
        }else{
        	if(num<999){
        		 num++;
          	$('#num'+id).html(num);
        	}else{
        		return;
        	}
        }
      },
    },
    mounted(){
    	var _this=this;
    	_this.Recent();
      _this.getUserInfo();
    }
     
  }
  	//图片加载失败显示
	 $('img').error(function(){
		    $(this).attr('src',"defalut.png");
		})
</script>
<style scoped>
  a{text-decoration: none;}
  .nav{background: #f79681;text-align: center;height: 35px;line-height: 35px;color:#fff;transition:all 0.5s;width: 96%;margin-left: 2%;}
  .nav:hover{background: #ee5336;transition: all .5s}
  .nav i{font-size: 20px !important;font-weight: 500;}
  .nav span{display: inline-block;margin-left: 5px; }
  .mt15{margin-top: 15px;}
  .mb15{margin-bottom: 15px;}
  .right-h5{color:#777;margin-top: 15px;width: 95%;font-size: 16px;font-weight: 400}
  .user-info img{width: 80px;height: 80px;}
  .userdetail{width: 110px;margin-right: 10px;}
  .shouxintext{color:#ad410f;font-size: 14px;}
  .but{width:63px;height:22px;line-height: 22px;text-align: center;background: #e6e6e6;color:#666;border:1px solid #aaa;margin-right: 10px;cursor: pointer}
  #title{height:40px;text-align: center;color: #777;font-size: 16px;line-height: 40px;
    border:1px solid #eee;width: 96%;margin-left: 2%;border-right:none;border-left:none;font-weight: 400}
  .recently-order{width: 96%;margin-left: 2%;}
  .recently-order li{
    display: block;float:left;width: 100%;box-shadow: 1px 1px 4px #ccc;margin-bottom: 10px;color: #777;
    box-shadow: 0px 0px 10px #ccc;padding-top: 5px;cursor: pointer;transition: all  .5s;
       
  }
  .recently-order li:hover{
  	 box-shadow: 0px 0px 15px #444;
    -weblit-box-shadow: 0px 0px 15px #444;
    -moz-box-shadow: 0px 0px 15px #444;
  }
  .recently-order li img{
    width:94px;height:82px;float:left;
    margin-left: 2px;
  }
  .recently-detail{
    float:right;margin-left: 5px;width: 100px;height: 82px;position: relative;
    
  }
  .line{
  		line-height: 21px;
    }
  .icon{
  	 font-size: 17px!important;
  }
  .recently-title{color:#777;line-height: 150%}
  .recently-price span{color:red;}
  .recently-num {bottom:-9px;position: absolute}
  .recently-num i{font-size: 22px;cursor: pointer;transition: all 0.5s;}
  .recently-num i:hover{color: red;transition: all 0.5s;}
  .recently-num span{vertical-align: text-bottom;}
  .addcart{font-size:15px;height:40px;background: #ffdfd7;text-align: center;clear: both;margin-top: 90px;cursor: pointer;line-height: 40px;transition: all .5s;color: #ed2e15}
  .addcart:hover{background: #ec2a12;transition: all .5s;color: #fff;}
</style>
