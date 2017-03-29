<template>
  <div class="leftpanel">
    <img src="static/images/logo.jpg" >
    <div class="leftmenu thin-scroll">
      <ul>
        <li><router-link to="/business" id="yingye" active-class="current" tag="a">营业</router-link></li>
        <li><router-link to="/member" id="huiyuan" active-class="current"  tag="a">会员</router-link></li>
        <li><router-link to="/repertory" id="jinxc" active-class="current"  tag="a">库存</router-link></li>
        <li><router-link to="/statement" id="baobiao" active-class="current"  tag="a">报表</router-link></li>
        <li><router-link to="/consume" id="xfd"  active-class="current"  tag="a">消费单</router-link></li>
        <li><router-link to="/serve" id="rw" active-class="current"  tag="a">微服务</router-link></li>
        <li><router-link to="/setting"  id="shezhi" active-class="current"  tag="a">设置</router-link></li>
        <li><router-link to="/leavemessage"  id="message" active-class="current"  tag="a">留言</router-link></li>
      </ul>
    </div>
  </div>
</template>
<script>
  export default{
  }
</script>
