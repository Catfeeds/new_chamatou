<template>
  <div id="bindPhone">
    <div class="bindPhoneMain">
      <div class="bindPhoneRow">
        <span>请输入手机号：</span>
        <input type="number" class="global_IptSad" name="" value="" v-model="iptPhoneNumber" @keyup="readPhone()">
      </div>
      <p class="global_blkBB"></p>
      <div class="bindPhoneRow">
        <span>请输入验证码：</span><input type="number" class="global_IptSad dCodeIpt" name="" value="" v-model="iptCode">
        <div v-show="sendDCodeFlag && PhoneT" v-bind="PhoneT" class="spendDCode global_IptSad  global_BtnCol2" @click="sendCode()">
          发送验证短信
        </div>
        <div style="font-size:0.2rem" v-show="!PhoneT && sendDCodeFlag" v-bind="PhoneT" class="spendDCode global_IptSad  global_BtnColRed">
          请输入正确手机号
        </div>
        <div v-show="!sendDCodeFlag" class="spendDCode global_IptSad  global_BtnCol2" >
          {{timeOut}}s
        </div>
      </div>
    </div>
      <div class="bind global_IptSad global_BtnCol2 global_boxSad" @click="sendBind()">
        绑定
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
  name: "bindPhone",
  data: function data() {
    return {
      iSsuccess:false,
      isLoading:false,
      iptPhoneNumber:'',//用户输入的电话号码
      iptCode:'',//用户输入的验证码
      sendDCodeFlag:true,//发送验证码按钮开关，默认为TRUE 为可发送
      timeOut:60,//可点击发送倒计时
      timeInt:{},//清除定时器
      PhoneT:false,//手机号是否输入正确，默认为FALSE
      Code:'',//发送回来的验证码
    }
  },
  methods: {
    //发送短信：
    sendCode: function sendCode() {
      var _this = this;
      _this.sendDCodeFlag = false
      var phone = _this.iptPhoneNumber;
      this.ajax(_this.port.bindPhone, {
        phone:phone,
      }, 'GET', function(res) {
        //console.log(res);
        if (res.status == 1) {
          _this.Code = res.data;
            _this.$message({
              message: '发送成功，请注意查收~！！',
              type: 'success'
            });

        }else if (res.status == 0) {
            _this.$message.error(res.msg);

        }else{
          _this.$message({message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',type: 'warning'});
        }
      })
      _this.timeMin()
    },
    //倒计时：
    timeMin: function timeMin(){
      var _this = this;
      var downTime = _this.timeOut;
      _this.timeInt = setInterval(function(){
        if (_this.timeOut == 0) {
          _this.sendDCodeFlag = true;
          _this.timeOut = 60;
          clearInterval(_this.timeInt);
        }
        _this.timeOut = _this.timeOut - 1;
        //console.log(_this.timeOut);
      },1000)


    },
    //验证手机号
    readPhone:function readPhone(){
      var _this = this
      var phoneNumber = _this.iptPhoneNumber
      //console.log(phoneNumber);
      if(!(/^1[34578]\d{9}$/.test(phoneNumber))){
        _this.PhoneT = false;
        return false;
      }else {
        _this.PhoneT = true;
      }
    },
    //绑定手机号
    sendBind:function sendBind(){
      var _this = this;
      if(_this.Code == _this.iptCode){
        // var phone = _this.iptPhoneNumber;
        // var code = _this.iptCode;
        //alert(_this.iptPhoneNumber)
        this.ajax(_this.port.bind, {
          phone:_this.iptPhoneNumber,
          code:_this.iptCode
        }, 'POST', function(res) {
          //console.log(res);
          if (res.status == 1) {
            _this.$router.push({ path: '/bindSucceed' })
          }else if (res.status == 0) {
              _this.$message.error(res.msg);
          }else{
            _this.$message({message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',type: 'warning'});
          }
        })
      }else {
        alert('您输入的验证码不正确，请稍后重试')
      }
    }
  },
  mounted: function mounted() {
    //do something after mounting vue instance

  }
}
</script>
<style media="screen">
.msgP{
  font-size: 0.24rem;
  color: #ccc;
}
</style>
