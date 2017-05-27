<template>
  <div id="app" >
    <router-view></router-view>
  </div>
</template>
<script>
  export default {
  	data(){
  		return{
  		     islogin:false,
      }
    },
  	methods:{
  		isIe(){
        if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/6./i)=="6."){
          return false;
        }
        else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/7./i)=="7."){
          return false;
        }
        else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/8./i)=="8."){
          return false;
        }
        else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/9./i)=="9."){
          return false;
        }
        else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/10./i)=="10."){
          return false;
        }
        else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/11./i)=="11."){
          return false;
        }else{
          return true;
        }
      }
    },
    mounted(){
      document.onkeydown=function(event){
        if ( event.keyCode==116)
        {
          event.keyCode = 0;
          event.cancelBubble = true;
          return false;
        }
      }
      var _this=this;
      //.isLogin
      _this.islogin=_this.getInit;
      if(!_this.isIe()){
        _this.$router.push({path:'/notsupportbrowser'});
        return;
      }
      var islogin= window.sessionStorage.getItem('islogin');
      if(islogin){
        _this.$store.commit('getLoginInfo',JSON.parse(window.sessionStorage.getItem('roledata')));
        _this.$router.push({path:'/content/business'});
      }else{
        this.$router.push({path:'/login'});
      };
      console.log("                    .::::.");
      console.log("                  .::::::::.");
      console.log("                 :::::::::::  ");
      console.log("             ..:::::::::::'");
      console.log("           '::::::::::::'");
      console.log("             .::::::::::");
      console.log("        '::::::::::::::..");
      console.log("             ..::::::::::::.");
      console.log("           ``::::::::::::::::");
      console.log("            ::::``:::::::::'        .:::.");
      console.log("           ::::'   ':::::'       .::::::::.");
      console.log("         .::::'      ::::     .:::::::'::::.");
      console.log("        .:::'       :::::  .:::::::::' ':::::.");
      console.log("       .::'        :::::.:::::::::'      ':::::.");
      console.log("      .::'         ::::::::::::::'         ``::::.");
      console.log("  ...:::           ::::::::::::'              ``::.");
      console.log(" ```` ':.          ':::::::::'                  ::::..");
      console.log("                    '.:::::'                    ':'````..");
      console.log('                你在看源码，我在看你                          ');
    	
		},
   
  }
</script>
