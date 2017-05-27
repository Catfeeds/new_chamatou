<template>
  <div class="prompt r3px in" v-if="msgShow">
    {{msg}}
  </div>
</template>
<script>
  export default{
    props:['msg','msgShow']
  }
</script>
