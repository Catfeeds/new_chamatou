<template>
	<div class="content-left g-left" style="padding-bottom: 200px;">
	 	<div class="head">
			<p class="g-left">购物车</p>
			<router-link to="/index"><div class="btn g-right">返回首页</div></router-link>
		</div>
	    <table style="color: #777" v-if="cartDetaList.length != 0">
			<tr style="height: 30px;border: 0;font-size: 20px;">
				<td style="width: 165px;">选项</td>
				<td style="width: 130px;">名称</td>
				<td style="width: 120px;">规格</td>
				<td style="width: 130px;">数量</td>
				<td style="width: 120px;">价格</td>
				<td style="width: 95px;">操作</td>
			</tr>
			<tr v-for="(cart,index) in cartDetaList">
				<td style="width: 165px;">
					<input type="checkbox" name="default" class="default g-left" :value="cart.goods_id" v-model="cartList" @change="changeSum()" />
					<img class="pic" :src="imgUrl+cart.goods_info.cover" onerror="this.onerror=null; this.src='../../static/images/defalut.png'" />
				</td>
				<td style="width: 130px;">{{cart.goods_info.goods_name}}</td>
				<td style="width: 120px;">{{cart.goods_info.spec}}</td>
				<td style="width: 130px;">
					<div class="operation g-left" @click="changeCount(cart.goods_id,cart.goods_num,'prve')">－</div>
					<input class="g-left" :value="cart.goods_num" type="tel" @input="inputCount(cart.goods_id)" :id="'inputCount'+cart.goods_id" style="width: 38px;text-align: center;border: 0;">
					<div class="operation g-left" @click="changeCount(cart.goods_id,cart.goods_num,'next')">＋</div>
				</td>
				<td style="width: 120px;">{{(cart.goods_info.price * cart.goods_num).toFixed(2)}}元</td>
				<td style="width: 95px;"><div class="delete" @click="cartDelete(cart.Id,cart.goods_id)">删除</div></td>
			</tr>
	    </table>
	    <!--没有更多数据时显示-->
		<div v-if="cartDetaList.length == 0" style="width: 100%;text-align: center;margin-top: 68px;font-size: 20px;color: #ccc;">
		  		购物车空空如也,快快前去选购吧...
		</div>
	    <div class="bottom" style="color: #777;" v-if="cartDetaList.length != 0">
	        <label>
	    	<input type="checkbox" name="all" class="g-left all" @click="changePitch()" v-model="checkall"/>
	    	<p class="g-left" style="margin-right: 100px;" >全选</p>
	    	</label>
	    	<p class="g-left">已选中<span class="active-text ">{{cartList.length}}</span>件商品</p>
	    	<div class="count-btn g-right" @click="account()">去结算</div>
	    	<p class="g-right" style="margin-right: 10px;">合计：<span class="active-text">{{sum.toFixed(2)}}元</span></p>
	    </div>
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
	         iSsuccess:false,
	         msgShow: false,
	         msg: '',
	         msgType:'',
	         cartList:[],//选中的数组
	         cartDetaList:[],//数据
	         pitchNum:0,//选中多少商品
	         checkall:false,//全选开关
	         sum:0,//总价
	        }
        },
        methods: {
          getCart(){
          	var _this = this;
          	this.ajax(this.port.getCart,{},'get',function (res){
          	  _this.cartDetaList=[];
	          if(res.code==1){
	          	_this.cartDetaList = res.data;
	          	_this.changeSum();
	          }
	        })
          },
          //实时更新总价
          changeSum(){
          	this.sum=0;
          	 for(var i = 0; i < this.cartList.length; i++){
          	 	for(let j=0;j<this.cartDetaList.length;j++){
          	 		if(this.cartList[i] == this.cartDetaList[j]['goods_id']){
          	 			this.sum += this.cartDetaList[j]['goods_num'] * this.cartDetaList[j]['goods_info']['price'];
          	 		}
          	 	}
      		};
          	 if(this.cartList.length==this.cartDetaList.length){
          	 	this.checkall=true;
          	 }else{
          	 	this.checkall=false;
          	 }
          },
          //全选
          changePitch(){
          	if(this.checkall){
          		this.cartList=[];
          		for(var i = 0; i < this.cartDetaList.length; i++){
          			this.cartList.push(this.cartDetaList[i]['goods_id']);
          			this.changeSum();
          		}
          	}else{
          		this.cartList=[];
          		this.changeSum();
          	}
          },
          //加减数量
	     changeCount(id,count,name){
	     	var count=count;
	     	var index = '';
		 	for (var j = 0; j < this.cartDetaList.length; j++) {
		        if (this.cartDetaList[j]['goods_id'] == id ) {
		         index = j;
		        }
		    }
	     	if(name=='prve'){
	     		if(count>1){
	     			count--;
	     		}else{
	     			return;
	     		}
	     	}
	     	if(name=='next'){
     			if(count<999){
     				count++;
     			}else{
     				this.msgHint('error','单件商品数量不可超过999');
     				return;
     			}
	     	}
		     this.cartDetaList[index]['goods_num']=count;
		     this.editNum(id,count);
		     
	     },
	     //修改商品数量
	     editNum(id,num){
	     	var _this = this;
          	this.ajax(this.port.editNum,{goods_id:id,goods_num:num},'post',function (res) {
	          if(res.code==1){
//	             _this.msgHint('success','修改成功');
				 _this.getCart();
				 _this.changeSum();
	          }else{
	          	 _this.getCart();
	          	 _this.msgHint('error',res.msg);
	          }
	        })
	     },
	     //输入框修改数量
	     inputCount(id){
	     	var Count = Number($('#inputCount'+id).val());
	     	var index = '';
		 	for (var j = 0; j < this.cartDetaList.length; j++) {
		        if (this.cartDetaList[j]['goods_id'] == id ) {
		         index = j;
		        }
		  }
	     	if(Count > 999){
	     	  $('#inputCount'+id).val(999);
	     	  Count = 999;
	     	  this.msgHint('error','单件商品数量不可超过999');
	     	}
	     	this.cartDetaList[index]['goods_num']=Count;
	     	this.editNum(id,Count);
	     },
      //获取数组某个val的索引
        getIndex(v,arr){
	     	  var result;
	     	  for(let i=0;i<arr.length;i++){
	     	  	if(arr[i]==v){
	     	  		result=i;
            }
          }
          return result;
        },
	     //删除
	     cartDelete(id,goods_id){
	     	var _this = this;
           this.$confirm('确认删除吗？', '提示', {
             confirmButtonText: '确定',
             cancelButtonText: '取消',
             type: 'warning'
           }).then(() => {
             _this.ajax(_this.port.cartDelete,{cart_id:id,},'get',function (res) {
             if(res.code==1){
               _this.msgHint('success','删除商品成功');
               _this.cartList.splice(_this.getIndex(goods_id,_this.cartList),1);
               _this.getCart();
               _this.changeSum();
               _this.getUserInfo();
             }else{
               _this.getCart();
               _this.msgHint('error','网络延迟，删除商品失败');
             }
           })
           }).catch(() => {
             //取消
           });
	      },
	      //结算
	      account(){
	      	var _this = this;
	      	if(_this.cartList.length == 0){
	      		_this.msgHint('error','请选择商品');
	      		return;
	      	}else{
	      		var cartIdList=[];
	      		for(let i=0;i<_this.cartList.length;i++){
	      			for(let j=0;j<_this.cartDetaList.length;j++){
	      				if(_this.cartList[i]==_this.cartDetaList[j]['goods_id']){
                  cartIdList.push(this.cartDetaList[j]['Id']);
                }
              }
            }
	      	//	window.localStorage.setItem('cartLst',JSON.stringify(_this.cartList));
            _this.$router.push({ name:'count',params:{id:JSON.stringify(cartIdList)}});
          }
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
        	//初始化数据
      		this.getCart();
        }
    }
    //图片加载失败时显示图片
    $('img').error(function(){
	    $(this).attr('src',"defalut.png");
	})
</script>
<style scoped>
  table{
  	margin: 20px 0 0 20px;
  	text-align: center;
  	overflow: hidden;
  }
  tr{
  	height: 108px;
  	border-bottom: 1px solid #eee;
  }
  .default,.all{
  	border: 1px solid #eee;
  	background: #f5f5f5;
  	height: 18px;
  	width: 18px;
  	margin-top: 40px;
  }
  .all{
  	margin: 31px 33px 0 20px;
  }
  .pic{
  	width: 120px;
  	height: 80px;
  	margin-top: 8px;
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
  }
  .operation:hover{
  	background: #f2987f;
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
  	background: #eee;
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
</style>
