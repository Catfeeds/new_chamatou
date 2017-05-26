<template>
  <div class="content-left g-left" style="padding-bottom: 200px;">
     <div class="head">
				<p class="g-left g-text-ellipsis">首页 > {{goodsDetail.cate_name}} > {{goodsDetail.goods_name}}</p>
				<router-link to="/index"><div class="btn g-right">返回首页</div></router-link>
		 </div>
		 <!--图片详情-->
		 <div class="deta-box">
				<img :src="imgUrl+goodsDetail.cover" class="pic g-left">
				<div class="deta g-right">
						<h3 class="g-text-ellipsis" style="width:400px;border-bottom: 2px solid #eee;line-height:30px;">
							{{goodsDetail.goods_name}}
						</h3>
						<p class="margin_top" style="margin-top: 30px;text-decoration:line-through;">
							市场价:<span>￥{{goodsDetail.price}}</span>
						</p>
						<p class="margin_top" style="color: #e63100;font-size: 18px;">茶码头价:<span >￥{{goodsDetail.price}}</span><span style="color: #ccc;padding-left: 20px;">
							已售：{{goodsDetail.sum_sell}}</span>
						</p>
						<p style="margin-top: 38px;font-size: 16px;border-bottom: 2px solid #eee;line-height: 30px;">
							商品库存: 库存[{{goodsDetail.store}}]件
						</p>
						<div style="font-size: 16px;margin-top: 15px;" class="clearfix">
							<p class="g-left">购买数量:</p>
							<div class="operation g-left" @click="changeNum('prve')">－</div>
							<input class="g-left" id="num"  type="tel" value="1" style="width: 60px;height:20px;text-align: center;background: #eee;">
							<div class="operation g-left" @click="changeNum('next')">＋</div>
						</div>
						<div class="addcart" @click="addCart()">
	           		 加入购物车
	          </div>
				</div>
		 </div>
		 
		 <!--图片详情-->
		 <div class="content" id="deta-content">
		 		<h3 class="g-text-ellipsis" style="color:#777;width:100%;border-bottom: 2px solid #eee;line-height: 30px;margin-bottom: 10px;">
		 			商品详情-{{goodsDetail.goods_name}}
		 		</h3>
       <div class="mmmm">
         <div v-html="goodsDetail.content"></div>
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
  		return{
        isLoading:false,
        iSsuccess:false,
        msgShow: false,
        msg: '',
        msgType:'',
  			goodsId:'',
        goodsDetail:[]
      }
    },
    methods:{
    	//数量加减
      changeNum(type){
        var _this=this;
        var num = $('#num').val();
        if(type=='prve'){
          if(num>1){
            num--;
            $('#num').val(num);
          }else{
            return;
          }
        }else{
          num++;
          $('#num').val(num);
        }
      },
      //初始化数据
  		getInit(){
        var _this=this;
        this.ajax(this.port.getdoodsDetail,{goods_id:this.goodsId},'get',function (res) {
          if(res.code==1){
            _this.goodsDetail=[];
            _this.goodsDetail=res.data;
          }else{
            _this.msgHint('error',res.msg)
          }
        })
      },
      //添加购物车
      addCart(){
        var _this=this;
        var num = $('#num').val();
        var data={
          goods_id:this.goodsId,
          goods_num:num
        }
        this.ajax(this.port.addCart,data,'post',function (res) {
          if(res.code==1){
            _this.msgHint('success','添加购物车成功')
            _this.getUserInfo();
          }else{
            _this.msgHint('error',res.msg)
          }
        })
    
      },
      //获取用户信息
      getUserInfo(){
        var _this=this;
        this.ajax(this.port.getUserInfo,{},'get',function (res) {
          if(res.code==1){
           
            var userInfo=res.data;
            _this.$store.commit('setCount',userInfo.cart)
          }
        },false)
      },
      
    },
    mounted(){
      this.goodsId=this.$route.params.id;
      this.getInit();
    },
    updated(){
      $('#num').on('input',function () {
        var num = $(this).val();
        if(!/^[1-9]{1}\d{0,9}$/.test(num)){
        
          $(this).val('');
          $(this).focus();
        }
      })
      $('#num').on('blur',function () {
        var num = $(this).val();
        if(!/^[1-9]{1}\d{0,9}$/.test(num)){
          $(this).val(1);
          $(this).focus();
        }
      })
    }
  }
</script>
<style scoped>
	 .deta-box{
	 	width: 100%;
	 	height: 300px;
	 	margin-top: 20px;
	 }
	 .pic{
	 	width: 300px;
	 	height: 300px;
	 	display: block;
	 	margin-left: 20px;
	 }
	 .margin_top{
	 	padding-top: 10px;
	 }
	 .operation{
  	width: 20px;
  	height: 20px;
		border-radius: 3px;
		background: #e63100;
		border: 1px solid #eee;
		margin: 0 10px;
		cursor: pointer;
		color: #fff;
		transition: all .5s;
		text-align: center;
  }
  .operation:hover{
  	background: #f2987f;
  }
  .addcart{
  	font-size:15px;
  	height:40px;
  	background: #ffdfd7;
  	text-align: center;
  	border-radius: 5px;
  	width: 300px;
    clear: both;
    margin-top:15px;
    cursor: pointer;
    line-height: 40px;
    transition: all .5s;
    color: #ed2e15;
    margin-top: 22px;
  }
  .addcart:hover{
  	background: #ec2a12;
  	transition: all .5s;
  	color: #fff;
  }
  .content{
  	width: 100%;
  	height: auto;
  	padding: 5px 28px ;
  	box-sizing: border-box;
  	margin-top: 28px;
  }
  #deta-content img{
  	width: 100%;
  }
</style>
