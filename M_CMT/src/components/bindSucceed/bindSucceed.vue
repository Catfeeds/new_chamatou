<template>
  <div id="bindSucceed">
      <div class="bindPhoneMain">
        <div class="bindPhoneRow">
          <img src="static/images/succeed.png" alt="">
          <span class="bindSucceedI"> 绑定成功 </span>
        </div>
      </div>
      <router-link to="/main/center">
      <div class="bind global_IptSad global_BtnCol2 global_boxSad">
        确定
      </div>
      </router-link>
  </div>
</template>
<script>
export default {
  name: "bindSucceed",
  data: function data() {
    return {

    }
  }
}
</script>
<style>
</style>
