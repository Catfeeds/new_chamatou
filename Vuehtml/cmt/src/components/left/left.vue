<template>
  <div class="leftpanel">
    <img src="static/images/logo.png" id="logo">
    <div class="leftmenu thin-scroll">
      <ul>
        <li v-if='business'><router-link to="/content/business" id="yingye" active-class="current" tag="a">营业</router-link></li>
        <li v-if='member'><router-link to="/content/member" id="huiyuan" active-class="current"  tag="a">会员</router-link></li>
        <li v-if='repertory'><router-link to="/content/repertory" id="kucun" active-class="current"  tag="a">库存</router-link></li>
        <li v-if='statement'><router-link to="/content/statement" id="baobiao" active-class="current"  tag="a">报表</router-link></li>
        <li v-if='consume'><router-link to="/content/consume" id="xiaofeidan"  active-class="current"  tag="a">消费单</router-link></li>
        <li v-if='b2b'><router-link to="/content/shouxin"  id="shouxin" active-class="current"  tag="a">提现</router-link></li>
        <li v-if='leavemessage'><router-link to="/content/leavemessage" id="liuyan"  active-class="current"  tag="a">留言</router-link></li>
        <li v-if='setting'><router-link to="/content/setting"  id="shezhi" active-class="current"  tag="a">设置</router-link></li>
      </ul>
    </div>
  </div>
</template>
<script>
  import {mapGetters,mapActions} from 'vuex';
  export default{
  	data(){
  		return{
  			//ole:JSON.parse(this.getRole()),
  			business:false,
  			member:false,
  			repertory:false,
  			statement:false,
  			consume:false,
  			b2b:false,
  			leavemessage:false,
  			setting:false,
        getRole:{
  				'business':{length:0},
  				'member':{length:0},
  				'consume':{length:0},
  				'message':{length:0},
  				'repertory':{length:0},
  				'setting':{length:0},
  				'statement':{length:0},
  				'withdraw':{length:0},
        }
  		}
  	},
    computed:mapGetters(['getInit']),
  	methods:{
  		 initLeft(){
  		 	if(this.getInit['isLogin']){
          if(this.getRole['business'].length){
            this.business=true;
          }
          if(this.getRole['member'].length){
            this.member=true;
          }
          if(this.getRole['consume'].length){
            this.consume=true;
          }
          if(this.getRole['message'].length){
            this.leavemessage=true;
          }
          if(this.getRole['repertory'].length){
            this.repertory=true;
          }
          if(this.getRole['setting'].length){
            this.setting=true;
          }
          if(this.getRole['statement'].length){
            this.statement=true;
          }
          if(this.getRole['withdraw'].length){
            this.b2b=true;
          }
        }
      }
      
  	},
    
  	//示例创建成功后
  	 mounted(){
      var _this=this;
       setTimeout(function () {
         _this.getRole=_this.getInit['roleData'];
         _this.initLeft();
       },800)
    }
  }
  
  
</script>

