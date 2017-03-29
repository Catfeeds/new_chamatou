<template>
  <div  id="main" class=" w100">
    <div class="contnav clearfix">
      <div class="left" style="font-size:18px; color:#8c7e70; line-height:56px; font-weight:bold; padding-left:20px">
        我的茶楼<span> - 营业</span>
      </div>
      <div class="navinfo thin-scroll right">
        <div class="message"><a>消息</a></div>
        <div class="user showlist" @mouseover="nnn(1)"  @mouseout="nnn(2)">
          <a href="javascript:void(0)" >琳琳</a>
          <div class="dropdown r5px " :class="{ 'in' : classin }">
            <ul>
              <li><a href="javascript:void(0);">账号信息</a></li>
              <li><a href="javascript:void(0);">交班</a></li>
              <li><a>交班记录</a></li>
              <li><a href="javascript:void(0);">退出登录</a></li>
            </ul>
          </div>
        </div>
        <div class="shop ">
          <a  href="javascript:void(0)">【我的茶楼】</a>
          <div class="dropdown   r5px">
            <ul>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {
        classin:false
      }
    },
    methods:{
      nnn(m){
         if(m==1){
           this.classin=true;
         }else{
           this.classin=false;
         }

      }
    }

  }
</script>
