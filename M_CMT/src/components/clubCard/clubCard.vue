<!--
    ============= 商家会员卡模块 =============
-->
<template>
  <div id="clubCard ">
    <p class="clubCardTit pLR">我的商家会员卡</p>


    <div class="cardRow" v-for="data in Data" :key="data.key">
      <div class="cardMainBox">
        <div class="cardLeftBox">
          <p class="cardMB global_txtOver">会员卡号：<b>{{data.card_no}}</b></p>
          <p class="global_txtOver">商家名称：{{data.shoper_name}}</p>
        </div>
        <div class="cardRightBox">
          <span class="cardCost global_txtOver">{{data.vip_total}}</span>
          <span>余额</span>
        </div>
      </div>
      <div class="cardTimeBox">
        有效期   长期有效
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
  name: "clubCard",
  data: function data() {
    return {
      iSsuccess:false,
      isLoading:false,
      Data:[],
    }
  },
  mounted: function mounted() {
    //do something after mounting vue instance
    //初次加载数据
    loadData: {
      var _this = this;
      this.ajax(_this.port.vipCardList, {
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
</style>
