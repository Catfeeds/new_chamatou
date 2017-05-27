<template>
  <div class="prompt " :class="msgType" v-if="msgShow" >
    <div >
      {{msg}}
    </div>
  </div>
</template>
<script>
  export default{
    props:['msg','msgShow','msgType']
  }
</script>
