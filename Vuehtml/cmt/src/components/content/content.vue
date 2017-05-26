<template>
  <div class="main">
    <!--左侧-->
    <!--bindTemplate -->
    <v-left></v-left>
    <!--bindTemplate-->
    <!--左侧/end-->
    <!--右侧-->
    <div class="content" style="margin: 0px 0px 0px 195px;">
      <!--顶部导航信息栏-->
      <v-header></v-header>
      <!--顶部导航信息栏/end-->
      <router-view></router-view>
    </div>
    <!--右侧/end-->
  </div>
</template>
<script>
  import left from '@/components/left/left.vue';
  import header from '@/components/header/header.vue';
  export default {
    components : {
      'v-left': left,
      'v-header': header
    }
    
  }
</script>
