<template>
<div id="teaDeta">
  <div class="teaDetaMainBox">
    <h2 class="pLR"><span class="global_titLog global_BtnCol teaDetaTitLog"></span>{{spName}}</h2>
    <p class="pLR teaDetaTel">
      电话：{{spPhone}}
    </p>
    <p class="pLR teaDetaDes global_txtDOver">
      地址：{{thisName}}
    </p>

    <!-- 轮播图模块 -->
    <div v-if="PicData.length"  class="swiper-container">
      <div class="swiper-wrapper">
        <div v-for="data in PicData" :key="data.key" class="swiper-slide">
          <img :src="data" alt="">
        </div>
        <!-- <div class="swiper-slide">Slide 3</div>
        <div class="swiper-slide">Slide 4</div>
        <div class="swiper-slide">Slide 5</div> -->
      </div>
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
      <!-- Add Arrows -->
      <div class="swiper-button-next swiper-button-white"></div>
      <div class="swiper-button-prev swiper-button-white"></div>
    </div>
    <div class="teaDetaImgBox">
      <img v-if="!PicData.length" src="static/images/1.jpg" alt="">
    </div>
    <p class="teaDetaDeta pLR">
      <b>详情介绍：</b> {{thisAddress}}
    </p>

  </div>
  <div @click="goToMap()" class="global_BtnCol teaDetaGoBtn global_boxSad">
    <i class="iconfont icon-woyaoqudianpu"></i> 我要去
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
  name: "teaDeta",
  data: function data() {
    return {
      thisProvince: '', //省
      thisLat: '', //获取的纬度
      thisLon: '', //获取的经度
      thisName: '', // 位置名
      thisAddress: '', // 地址详情说明
      PicData:'',//图片盒子
      spName:'',//商店名字
      spPhone:'',//店铺电话
      iSsuccess: false,
      isLoading: false,

    }
  },
  methods: {
    goToMap: function goToMap() {
      var _this = this
      wx.openLocation({
        latitude: _this.thisLat, // 纬度，浮点数，范围为90 ~ -90
        longitude: _this.thisLon, // 经度，浮点数，范围为180 ~ -180。
        name: _this.thisName, // 位置名
        address: _this.thisAddress, // 地址详情说明
        scale: 20, // 地图缩放级别,整形值,范围从1~28。默认为最大
        infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
      });
    }
  },
  mounted() {
    //do something after mounting vue instance
    var _this = this
    var teaId = _this.$route.params.teaId;
    console.log(teaId);

    this.ajax(_this.port.teaDeta, {
      id: teaId,
    }, 'GET', function(res) {
      if (res.status == 1) {
        _this.thisLat = parseFloat(res.data.lat);
        _this.thisLon = parseFloat(res.data.lon);
        _this.thisAddress = res.data.intro;
        _this.thisName = res.data.address;
        _this.PicData = res.data.pic;
        _this.spName = res.data.sp_name;
        _this.spPhone = res.data.sp_phone;

      } else if (res.status == 0) {
        _this.$message.error(res.msg);
      } else {
        _this.$message({
          message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',
          type: 'warning'
        });
      }
      //console.log(res);
    })
  },
  updated: function updated() {
    //do something after updating vue instance
    var swiper = new Swiper('.swiper-container', {
      pagination: '.swiper-pagination',
      paginationClickable: true,
      pagination: '.swiper-pagination',
      nextButton: '.swiper-button-next',
      prevButton: '.swiper-button-prev',
      loop: true,
      autoplay: 3000,
      observer:true,//修改swiper自己或子元素时，自动初始化swiper
      observeParents:true,//修改swiper的父元素时，自动初始化swiper
    });
  }
}
</script>
<style>
.teaDetaMainBox {
  background-color: #fff;
}

.teaDetaMainBox h2 {
  font-size: 0.36rem;
  color: #222;
  height: 0.8rem;
  line-height: 0.8rem;
  display: flex;
  align-items: center;
  border-bottom: solid 1px #ccc;
}

.teaDetaTitLog {
  margin-right: 0.1rem;
}

.teaDetaTel {
  font-size: 0.24rem;
  color: #222;
  min-height: 0.6rem;
  line-height: 0.6rem;
  border-bottom: solid 1px #ccc;
}

.teaDetaDes {
  font-size: 0.24rem;
  color: #222;
  min-height: 0.6rem;
  line-height: 0.6rem;
  padding-bottom: 0.2rem;
}

.teaDetaDeta {
  font-size: 0.22rem;
  color: #444;
  padding-top: 0.2rem;
  padding-bottom: 0.4rem;
}

.teaDetaDeta b {
  display: block;
}

.teaDetaGoBtn {
  text-align: center;
  font-size: 0.3rem;
  width: 80%;
  margin: 0.3rem auto;
  height: 0.8rem;
  line-height: 0.8rem;
  border-radius: 0.05rem;
}

.icon-woyaoqudianpu {
  font-size: 0.4rem;
}
.teaDetaImgBox{
  text-align: center;
}
</style>
