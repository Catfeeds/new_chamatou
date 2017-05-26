<template>
  <div id="app" class="g-w100">
   <v-header :recentlyShow="recentlyShow"></v-header>
    <div class="content g-margin-auto g-bg-white g-overflow-hide">
          <router-view></router-view>
          <v-right :recentlyShow="recentlyShow"></v-right>
    </div>  
  </div>
</template>
<script>
  import header from '@/components/header/header.vue';
  import right from '@/components/right/right.vue';
  export default {
  	data(){
  		return{
        recentlyShow:true
      }
    },
    components : {
      'v-header': header,
      'v-right': right
    },
    updated(){
      var Url =window.location.href;
      if(Url.indexOf('#/index')!=-1){
        this.recentlyShow=true;
      }else{
        this.recentlyShow=false;
      }
    },
    mounted(){
      var Url =window.location.href;
      if(Url.indexOf('#/index')!=-1){
        this.recentlyShow=true;
      }else{
        this.recentlyShow=false;
      }
    }
  }
</script>
