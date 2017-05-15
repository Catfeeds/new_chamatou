<template>
<div>

  <!-- 轮播图模块 -->
  <div class="swiper-container global_boxSad">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="static/images/lb1.jpeg" alt=""></div>
      <div class="swiper-slide"><img src="static/images/lb2.jpeg" alt=""></div>
      <div class="swiper-slide"><img src="static/images/lb3.jpeg" alt=""></div>
      <div class="swiper-slide"><img src="static/images/lb4.jpeg" alt=""></div>
      <div class="swiper-slide"><img src="static/images/lb5.jpeg" alt=""></div>

    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>

  <!-- 定位模块 -->
  <div class="locationBox pLR" @click="fun()">
    <i class="iconfont icon-iconset0392"></i>
    <span>定位：</span>
    <span id="">{{location}}</span>
  </div>

  <!-- 茶楼列表模块 -->

  <div class="mainBox">
    <div class="" v-for="data in Data" :key="data.key">
      <router-link :to="{ name: 'teaDeta', params: { teaId: data.id}}" >
        <div class="mainList pLR  ">
          <div class="mainImgBox">
            <img v-if="data.teaPic" v-bind:src='data.teaPic' alt="">
            <img v-if="!data.teaPic" src="static/images/1.jpg" alt="">
          </div>
          <div class="mainDeta">
            <h2>{{data.sp_name}}</h2>
            <p class="distanceP">
              <i class="iconfont icon-juli"></i>
              <span>距离：{{data.distance}}km</span>
            </p>
            <div class="distanceD global_txtDOver">
              地址：{{data.address}}
            </div>
          </div>
        </div>
      </router-link>
    </div>
  </div>

  <!-- 茶楼列表模块结束 -->

  <!-- 底部空DIV -->
  <div class="global_nullDiv"></div>

  <!--遮罩层-->
  <div v-if="iSsuccess" class="bgblacks  in"></div>
  <!--遮罩层end-->
  <!--loading-->
  <div type="primary" element-loading-text="拼命加载中" v-loading.fullscreen.lock="isLoading"></div>
  <!--loading-->
</div>
</template>
<script type="text/javascript">
window.onload = function() {
  var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-pagination',
    paginationClickable: true,
    pagination: '.swiper-pagination',
    loop: true,
    autoplay: 3000
  });
}
import Swiper from '../../../static/lib/swiper-3.4.2.jquery.min.js';
export default {
  data() {
    return {
      thisProvince:'',//省
      thisLat:'',//获取的纬度
      thisLon:'',//获取的经度
      iSsuccess: true,
      isLoading: true,
      location: '正在为您定位，请您稍等。。。', //地址
    }
  },
  components: {},
  methods: {
    //将经纬度转换成地理位置
    changeD: function changeD(lon, lat) {
      //console.log(lon);
      var _this = this;
      _this.thisLon = lon;
      _this.thisLat = lat
      var map = new BMap.Map("allmap");
      var point = new BMap.Point(lon, lat);
      var geoc = new BMap.Geocoder();
      var pt = point;
      geoc.getLocation(pt, function(rs) {
        var addComp = rs.addressComponents;
        var thisLocation = addComp.district + addComp.street + addComp.streetNumber
        var thatProvince = addComp.city
        //console.log(addComp.province + ", " + addComp.city + ", " + addComp.street + ", " + addComp.district + ", " + addComp.streetNumber);
        //console.log(thatProvince);
        _this.thisProvince = thatProvince ;
        _this.location = thisLocation;
        // localStorage.setItem('province',JSON.stringify(addComp.province));
        // window.localStorage.setItem('thisLocation',JSON.stringify(thisLocation));
        // _this.province = localStorage.getItem('province');
        // _this.location = window.localStorage.getItem('thisLocation');
        // console.log(_this.province,_this.location );
        _this.getTeaData();
      });
      // 从新获取推荐列表

    },
    //点击地理位置重新启动定位
    fun() {
      var _this = this;
      //获取当时的地理位置经纬度
        wx.getLocation({
          success: function(res) {
            //console.log('mounted');
            _this.changeD(res.longitude, res.latitude)
          },
          cancel: function(res) {
            _this.$message({
              message: res,
              duration: '800',
              type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
            });
          }
        });
    },
    //根据定位获取茶楼
    getTeaData: function (){
      var _this = this
      //console.log('thatProvince:'+_this.thisProvince);
      this.ajax(_this.port.getTeaData, {
        lat:_this.thisLat,
        lon:_this.thisLon,
        address:_this.thisProvince
      }, 'GET', function(res) {
        //console.log(res);
        if(res.status == 1){
          _this.Data = res.data
        }else if (res.status == 0) {
          _this.$message.error(res.msg);
        }else {
          _this.$message({
            message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',
            type: 'warning'
          });
        }
        //console.log(res);
      })
    }
  },
  //组件渲染完成时执行
  mounted() {
    //do something after mounting vue instance
    //console.log('Im dwon');
    var _this = this;
    var swiper = new Swiper('.swiper-container', {
      pagination: '.swiper-pagination',
      paginationClickable: true,
      pagination: '.swiper-pagination',
      loop: true,
      autoplay: 3000
    });
//第一次获取地理位置
    _this.ajax(_this.port.configData, {}, 'GET', function(res) {
      wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: res.data.appId, // 必填，公众号的唯一标识
        timestamp: res.data.timestamp, // 必填，生成签名的时间戳
        nonceStr: res.data.nonceStr, // 必填，生成签名的随机串
        signature: res.data.signature, // 必填，签名，见附录1
        jsApiList: [
          "openLocation",
          "getLocation",
          "scanQRCode",
          "chooseWXPay",
        ]
      });
      //获取地理位置，存储到localStorage；
      wx.ready(function() {
        wx.getLocation({
          success: function(res) {
            //alert(JSON.stringify(res) + 'ready');
            _this.changeD(res.longitude, res.latitude)
            //console.log('第一次获取数据');
          },
          cancel: function(res) {
            _this.$message({
              message: res,
              duration: '800',
              type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
            });
          }
        });
      });
    })





  }
}
</script>

<style media="screen">
body {
  background-color: #fafafa !important;
}

.swiper-container {
  height: 2.8rem;
}

.swiper-slide {
  background-color: #fff;
}

.swiper-pagination-bullet-active {
  color: #ffad37;
  background-color: #ffad37;
}

.swiper-slide img {
  width: 100%;
  height: 100%;
}



/*        定位模块：     */

.locationBox {
  height: 0.7rem;
  color: #ffad37;
  font-size: 0.28rem;
  display: flex;
  justify-content: flex-start;
  align-items: center;
}

.icon-iconset0392 {
  font-size: 0.34rem;
  margin-right: 0.2rem
}



/*        定位模块结束      */


/*        茶楼列表模块：      */

.mainBox {
  width: 100%;
  height: auto;
}

.mainList {
  height: 2rem;
  border-top: solid 1px #c87b28;
  border-bottom: solid 1px #c87b28;
  box-shadow: 0 1px 5px #aaa;
  margin-bottom: 0.2rem;
}

.mainImgBox {
  width: 2.6rem;
  height: 1.8rem;
  margin-top: 0.08rem;
  border-radius: 0.05rem;
  overflow: hidden;
  float: left;
}

.mainImgBox img {
  width: 100%;
  height: 100%;
}

.mainDeta {
  float: left;
  font-size: 0.24rem;
  padding-left: 0.4rem;
  padding-top: 0.15rem;
}

.mainDeta h2 {
  font-size: 0.3rem;
  color: #222;
  padding-left: 0.05rem
}

.mainDeta .distanceP {
  color: #e58a08;
  font-size: 0.22rem;
  margin-top: 0.1rem;
  margin-bottom: 0.1rem;
}

.distanceD {
  width: 2.9rem;
  color: #666;
}



/*        茶楼列表结束      */
</style>
