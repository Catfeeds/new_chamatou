<!--
    ============= 消费详情模块 =============
    这个模块也很简单，不需要多的注释了。
-->
<template>
<div id="record_expense">
  <div class="titBox">
    <span class="picBox">
        消费记录(个)
      </span>
    <span class="timeBox">
        消费时间
      </span>
  </div>

  <div class="mainBox" >

    <div class="r-detaRow" v-for="res in Data" :key="res.key">
      <span class="picBox">
          {{res.num}}
      </span>
      <span class="timeBox">
          {{res.add_time}}
      </span>
    </div>
  </div>

  <!--遮罩层-->
    <div v-if="iSsuccess" class="bgblacks  in"></div>
  <!--遮罩层end-->
  <!--loading-->
  <div type="primary" element-loading-text="拼命加载中" v-loading.fullscreen.lock="isLoading"></div>
  <!--loading-->
</div>
</template>
<script>
export default {
  data: function data() {
    return {
      iSsuccess:false,
      isLoading:false,
      Data:[],
    }
  },
  methods: {
    methodName: function methodName() {

    }
  },
  mounted: function mounted() {
    //do something after mounting vue instance
    loadData: {
      var _this = this;
      this.ajax(_this.port.beansCons, {
      }, 'GET', function(res) {
        //console.log(res);
        if (res.status == 1) {
          _this.Data = res.data;
        }else if (res.status == 0) {
            _this.$message.error(res.msg);
        }else{
          _this.$message({message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',type: 'warning'});
        }
      })

    }
  }
}
</script>
<style>
body {
  background-color: #eee !important;
}

#record_expense {
  background-color: #fff;
}

.titBox {
  width: 100%;
  height: 0.9rem;
  display: flex;
  justify-content: space-between;
  padding-top: 0.5rem;
  font-size: 0.24rem;
  color: #666;
  padding-bottom: 0.2rem;
}

.picBox {
  width: 40%;
  text-align: center;
}

.timeBox {
  width: 55%;
  text-align: center;
}

.r-detaRow {
  width: 100%;
  font-size: 0.24rem;
  color: #666;
  display: flex;
  justify-content: space-between;
  padding-top: 0.3rem;
  padding-bottom: 0.3rem;
  border-top: solid 1px #eee;
  height:0.84rem
}

.r-detaRow .picBox {
  color: #ff3737
}
</style>
