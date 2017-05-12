<template>
  <div id="myOrder">
    <div class="orderListBox global_boxSad" v-for="res in Data" :key="res.key">
      <div class="orderNum pLR">
        <p>订单号：{{res.order_no}}</p>
        <div v-if="res.order_status == 2" class="global_BtnCol2 typeBtn">
          已完成
        </div>
        <div v-if="res.order_status == 1" class="global_BtnColR typeBtn">
          进行中
        </div>
      </div>
      <div class="detaBox pLR">
        <div class="picBox">
          <img src='static/images/test.jpg' alt="">
        </div>
        <div class="deta">
          <h3>{{res.shop_name}}</h3>
          <p class="global_txtDOver">
            <span v-for="spanDeta in res.goods" :key="spanDeta.key">
              {{spanDeta.goods_name}}
            </span>
          </p>
          <span v-if="res.order_status == 2" >合计：￥<b>{{res.total_amount}}</b></span>
          <span v-if="res.order_status == 1">正在进行中。。。</b></span>
        </div>
      </div>

      <div class="orderTime pLR">
        <p>下单时间：{{res.order_time}}</p>
        <router-link :to="{name:'orderDeta',params:{id: res.order_id}}">
          <div class="global_boxSad global_IptSad moreDeta">
            查看详情
          </div>
        </router-link>
      </div>
    </div>


<div class="global_nullDiv">

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
  name: "myOrder",
  data: function data() {
    return {
      iSsuccess:false,
      isLoading:false,
      Data:[],//请求回来的列表数据
    }
  },
  methods: {
    methodName: function methodName() {

    }
  },
  mounted: function mounted() {
    //do something after mounting vue instance
    //初次加载数据
    loadData: {
      var _this = this;
      this.ajax(_this.port.orderList, {
      }, 'GET', function(res) {
        //console.log(res);
        if (res.status == 1) {
          _this.Data = res.data;
        }else if (res.status == 0) {
            _this.$message.error(res.msg);
        }else{
          _this.$message({message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',type: 'warning'});
        }
      })

    }
  }
}
</script>
<style>
.orderListBox{
  width:100%;
  height: auto;
  background-color: #fff;
  margin-top: 0.2rem;
}
.orderNum{
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 0.24rem;
  color: #222;
  height:0.5rem;
}
.orderNum .typeBtn{
  width: 0.95rem;
  height: 0.35rem;
  text-align: center;
  line-height: 0.35rem;
  border-radius: 0.05rem;
  font-size: 0.21rem
}
.detaBox{
  width:100%;
  height: 1.86rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top: solid 1px #eee;
  border-bottom: solid 1px #eee;
}
.picBox{
  width: 1.5rem;
  height: 1.5rem;
  border-radius: 0.05rem;
  overflow: hidden;
}
.picBox img{
  width: 100%;
  height: 100%;
}
.deta{
  width: 4rem;
}
.deta h3{
  font-size: 0.3rem;
  color: #222;
}
.deta p{
  margin-top: 0.1rem;
  width: 100%;
  font-size: 0.24rem;
  color: #999;
}
.deta p span{
  font-size: 0.24rem;
  color: #999;
}
.deta span{
  font-size: 0.24rem;
  color: #222;
}
.deta span b{
  font-size: 0.3rem;
  font-weight: 500;
  color: #222;
}
.orderTime{
  font-size: 0.24rem;
  color: #777;
  padding-top: 0.2rem;
  padding-bottom: 0.2rem;
  display: flex;
  justify-content: space-between;
}
.moreDeta{
  padding: 0.06rem 0.15rem;
  background-color: #eaeaea;
  border-radius: 0.09rem;
}
</style>
