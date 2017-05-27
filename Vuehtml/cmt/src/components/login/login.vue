<template>
  <div class="mian" style="height: 100%">
    <div class="content" style="margin: 0px;height: 100%">
      <div class="Login_Bg">
        <div class="Login r10px">
          <div class="Logo" style="text-align: center;background:url(static/images/header_bg.png)  repeat-x ">
            <a href="javascript:void(0)">
              <img src="static/images/logo.png">
            </a>
          </div>
          <div class="Login_Form">
            <div class="List_Input">
              <input autocomplete="off" autofocus="true"  v-model="userName" maxlength="25" placeholder="请输入注册手机号码" type="text"
                     class="ng-untouched ng-pristine ng-invalid">
            </div>
            <div class="List_Input">
              <input autocomplete="off" maxlength="20" placeholder="请输入密码" v-model="pwd" type="password"
                     class="ng-untouched ng-pristine ng-invalid">
            </div>
            <button class="r3px" @click="login()">登 录</button>
            <!--报错模板-->
            <v-msg :msg="msg" :msgShow="msgShow"></v-msg>
          </div>
          <div class="link" style="display: none;">
            <a href="javascript:void(0)">忘记密码？</a>
          </div>
        </div>
        <div class="CopyRight">Copyright © 2017 茶码头科技 蜀ICP备543434</div>
      </div>
    </div>
    <!--遮罩-->
    <div>
      <div class="bgblack "></div>
    </div>
    <!--loading-->
    <v-loading v-if="isLoading"></v-loading>
    <!--loading/end-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
    <!--弹出层区、end-->
  </div>
</template>
<script>
  export default{
    data(){
      return {
        iSsuccess:false,
        isLoading: false,
        msgShow: false,
        msg: '',
        userName:'',
        pwd:'',
      }
    },
    methods: {
      //登录
      login(){
      	const _this=this;
        if (!/^1(3[0-9]|4[57]|5[0-35-9]|7[013678]|8[0-9])[\d]{8}$/g.test(this.userName)) {
          this.msgHint('请填写正确手机号码');
          return;
        }
        if(_this.pwd==''){
      		_this.msgHint('请输入密码');
      		return;
        }
      	_this.ajax(_this.port.login,{phone:_this.userName,password:_this.pwd},'post',function(res){
      		if(res.code==1){
      			_this.$store.commit('getLoginInfo',res.data);
            _this.$router.push({path: '/content/business'});
               window.sessionStorage.setItem('islogin','success');
               window.sessionStorage.setItem('roledata',JSON.stringify(res.data));
          }else{
      			_this.msgHint(res.msg);
          }
        })
       
      }
    },
    mounted(){
      const _this=this;
      //   回车登录
      document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){
        	_this.login();
        	
        }
      };
    }
  }
</script>
<style scoped>
  .prompt {
    padding: 0;
    top: 70px !important;
  }
</style>
