<!--
    ============= 订单详情模块 =============
    这个页面简单，一目了然，不需要多的注释了。
-->
<template>
<div id="orderDeta">
  <div class="sureOrder">
    <div class="tableBox" style="border:none;display:block">
      <div class="orderDetaNum pLR">
        <span>订单号：{{Order_id}}</span>

        <span v-if="Order_status == 1">进行中</span>
        <span v-if="Order_status == 2">已完成</span>

      </div>
      <div class="orderDetaAllDeta">
          <p><span>{{table_no}}</span>桌，共选<span>{{allNum}}</span>件商品</p>
          <p>合计：<span>￥{{allPic}}</span></p>
      </div>
    </div>
    <div class="sureOrderDeta">
      <h5 class="pLR"><span>已选购商品</span> <span>消费了{{beans}}茶豆币</span></h5>
      <div class="" style="height:auto;">
        <div class="carDetaRow pLR" v-for="data in orderDetaList" :key="data.key">
          <h4 class="global_txtOver">{{data.goods_name}}/一{{data.spec}}</h4>
          <p class="orderDetaNumP">x{{data.num}}</p>
          <span class="carDetaCost">￥{{data.price}}</span>
        </div>
      </div>
    </div>

      <div class=" orderDetaFooterBtn">
        <router-link :to="{ name: 'goodsList', params: { shoper_id:shopId , store_id:storeId , table_no:table_no}}" style="flex:1;">
        <div class="global_BtnCol2 alginBtn">
          继续点单
        </div>
        </router-link>
        <router-link to="/main/nearbyTea">
        <div class="global_BtnCol goIndexBtn">
          返回首页
        </div>
        </router-link>
      </div>

    <router-link v-if="Order_status == 2" to="/main/center" >
      <div class="global_BtnCol2 orderDetaFooterBtn" style="justify-content:center">
        返回个人中心
      </div>
    </router-link>
  </div>

  <!--遮罩层-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
  <!--遮罩层end-->
  <!--loading-->
  <div type="primary" element-loading-text="拼命加载中" v-loading.fullscreen.lock="isLoading"></div>
  <!--loading-->
</div>
</template>
<script>
export default {
  name: "orderDeta",
  data: function data() {
    return {
      iSsuccess:false,
      isLoading:false,
      orderId: '', //订单ID
      orderDetaList: [], //订单详情的商品列表
      allNum:0,//总数量
      allPic:0,//总价格
      Order_status:'',//订单状态
      Order_id:'',//订单号
      shopId:'',//
      storeId:'',//
      table_no:'',//台座号
      beans:'',//用户消费的茶豆币
    }
  },
  //方法盒子
  methods: {

  },
  created: function created() {
    //do something after creating vue instance
    //初次加载数据
    loadData: {
      var _this = this
      var orderId = _this.$route.params.id;
      //console.log(orderId);
      this.ajax(_this.port.orderDeta, {
        order_id: orderId,
      }, 'GET', function(res) {
        console.log(res);
        if (res.status == 1) {
          if (res.data) {
            _this.orderDetaList = res.data;
            _this.allNum = res.allNum;
            _this.allPic = res.allPic;
            _this.Order_status = res.order_status;
            _this.Order_id = res.order_no;
            _this.shopId = res.shoper_id;
            _this.storeId = res.store_id;
            _this.table_no = res.table_no;
            _this.beans = res.beans;
            //console.log(_this.Order_status);
          }
        } else if (res.status == 0) {
          _this.$message.error(res.msg);
        } else {
          _this.$message({message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',type: 'warning'});
        }
        //console.log(res);
      })
    }
  }
}
</script>
<style>
.orderDetaNum {
  width: 100%;
  display: flex;
  justify-content: space-between;
  height: 0.6rem;
  align-items: center;
  border-bottom: solid 1px #ccc;
}

.orderDetaNum span {
  font-size: 0.26rem;
}

.orderDetaAllDeta {
  font-size: 0.34rem;
  color: #222;
  text-align: center;
  height: 1.5rem;
  padding-top: 0.3rem;
  overflow: hidden;
}

.orderDetaAllDeta span {
  font-size: 0.38rem;
  color: #ff874a;
}

.orderDetaNumP {
  font-size: 0.24rem;
  color: #666;
}
.orderDetaFooterBtn{
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 1rem;
  font-size: 0.35rem;
  text-align: center;
  line-height: 1rem;
  display: flex;
}
.alginBtn{
  flex:1;
}
.goIndexBtn{
  width: 2rem;
}
</style>
