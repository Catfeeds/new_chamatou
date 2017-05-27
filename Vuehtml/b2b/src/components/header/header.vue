<template>
  <div>
    <div class="g-w100 header" v-if="recentlyShow">
      <img  src="static/images/header.png"/>
    </div>
    <div class="g-w100 header"  style="padding-bottom: 0px;" v-if="!recentlyShow">
      <img  src="static/images/header.png"/>
    </div>
  </div>
</template>
<script>
  export default{
    props:['recentlyShow']
   
  }
</script>

