<template>
<div id="topUp">
  <div class="bindPhoneMain">
    <div class="bindPhoneRow">
      <span>我的茶豆币余额：</span>
      <input disabled="disabled" type="number" class="topUpIpt" name="" v-model="userHasBeans" style="">
    </div>

    <p class="global_blkBB"></p>
    <div class="bindPhoneRow">
      <span>请输入充值金额：</span>
      <input type="number" class="global_IptSad topUpIpt topUpUserNum" name="" value="" v-model="iptBeans">

    </div>
  </div>
  <div class="bind global_IptSad global_BtnCol2 global_boxSad" @click="pay()">
    确认充值
  </div>
  <div class="topUpRule">
    (换算比例：1人民币 = {{ratio}}茶豆币)
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
  name: "topUp",
  data: function data() {
    return {
      iSsuccess: false,
      isLoading: false,
      userHasBeans: '', //用户的茶豆币；
      iptBeans: '', //用户要冲多少茶豆币；
      ratio: '', //兑换比例
    }
  },
  methods: {
    //充值
    pay() {
      var _this = this
      if (!/^[1-9]\d{0,9}$/.test(this.iptBeans)) {
        this.$message({
          message: '请输入正确的数字',
          duration: '800',
          type: 'warning' //成功 'success'  , 失败 'eroor' , 警告 'warning'
        });
        return;
      }
      _this.ajax(_this.port.pay, {
        money: _this.iptBeans
      }, 'get', function(res) {
        //console.log(res);
        var payData = res.jsApiConfig
        //console.log('payData_________-------_--————————-————--------_-');
        //console.log(payData);
        if (res.status == 1) {
          wx.chooseWXPay({
            timestamp: payData.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
            nonceStr: payData.nonceStr, // 支付签名随机串，不长于 32 位
            package: payData.package, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
            signType: payData.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
            paySign: payData.paySign, // 支付签名
            success: function(res) {
              if (msg.errMsg == 'chooseWXPay:ok') {
                _this.ajax(_this.port.cdbPay, {
                  money: _this.iptBeans
                }, 'post', function(res) {
                  alert(res)
                  if(res.status == 1){

                    _this.$message({
                      message: '恭喜你，充值成功了',
                      duration: '800',
                      type: 'success' //成功 'success'  , 失败 'eroor' , 警告 'warning'
                    });
                    _this.iptBeans = '';
                    _this.getInitData();
                  }else {
                    _this.$message({
                      message: '抱歉，由于某种原因您未支付成功',
                      duration: '800',
                      type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
                    });
                  }
                })
              } else {

                _this.$message({
                  message: '抱歉，由于某种原因您未支付成功',
                  duration: '800',
                  type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
                });
              }
              //console.log('请求支付成功');
              //console.log(res);
              // 支付成功后的回调函数
            }
          });
        }else{
          _this.$message({
            message: '抱歉，服务器开小差了，请您稍后重试....',
            duration: '800',
            type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
          });
        }
      })
    },
    //初始化数据
    getInitData() {
      var _this = this;
      this.ajax(_this.port.getB, {}, 'GET', function(res) {
        if (res.status == 1) {
          _this.userHasBeans = res.beans;
        } else {
          _this.$message({
            message: res.msg,
            duration: '800',
            type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
          });
        }
      })
    },
    //获取茶豆币兑换比例
    getDdbBili() {
      var _this = this;
      this.ajax(_this.port.getRatio, {}, 'GET', function(res) {
        //console.log(res);
        if (res.status == 1) {
          _this.ratio = res.data;
        } else {
          _this.$message({
            message: res.msg,
            duration: '800',
            type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
          });
        }
      })
    }
  },
  mounted: function mounted() {
    this.getInitData();
    this.getDdbBili();
  }
}
</script>
