<template>
<div>
  <footer id="footer" class="footer">

    <router-link to="/main/nearbyTea" active-class="act">
      <div class="footerList">
        <i class="iconfont icon-fujin"></i>
        <span>附近茶楼</span>
      </div>
    </router-link>

    <div class="footerList" @click="QRFun()">
      <div class="cLogo global_BtnCol global_boxSad">
        <img src="../../../static/images/c.png" alt="">
      </div>
    </div>
    <router-link to="/main/center" active-class="act">

      <div class="footerList">
        <i class="iconfont icon-gerenzhongxin"></i>
        <span>个人中心</span>
      </div>
    </router-link>
  </footer>
</div>
</template>


<script>
export default {
  name: 'foot',
  data() {
    return {
      msg: ''
    }
  },
  methods: {
    QRFun() {
      var _this = this;
      wx.scanQRCode({
        needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
        scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
        success: function(res) {
          var rStr = res.resultStr;
          var Sdata = rStr.slice((rStr.indexOf('?')+1));
          var shopId = rStr.slice((rStr.indexOf('shoper_id=')+10),(rStr.indexOf('&')));
          var storeId = rStr.slice((rStr.indexOf('store_id=')+9));
          var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
          _this.$router.push({name: 'goodsList', params: {shoper_id:shopId , store_id:storeId}});
        }
      });
    }
  }
}
</script>
<style media="screen">
.footer {
  width: 100%;
  height: 1rem;
  background-color: rgba(255, 255, 255, 0.9);
  position: fixed;
  bottom: 0;
  display: flex;
  justify-content: space-around;
  align-items: center;
  font-size: 0.30rem;
  color: #aaa;
  box-shadow: 0 0 5px #ccc;
}

.footer .act {
  color: #8e655c
}

.footerList {
  position: relative;
  text-align: center;
}

.cLogo {
  width: 1.3rem;
  height: 1.3rem;
  border-radius: 50%;
  position: absolute;
  bottom: -0.4rem;
  left: -0.6rem;
  display: flex;
  justify-content: center;
  align-items: center;
}

.cLogo img {
  width: 70%
}

.footerList i {
  display: block;
  font-size: 0.36rem;
}
</style>
