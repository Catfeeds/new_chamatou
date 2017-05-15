<template>
<div id="app">
  <router-view></router-view>
  <foot-view></foot-view>
</div>
</template>


<script>
import foot from '@/components/foot/foot.vue' //依赖注入
export default {
  name: 'mian',
  data() {
    return {
    }
  },
  components: {
    'foot-view': foot
  },
  mounted() {


  }
}
</script>
