<template>
<div id="app">
  <router-view></router-view>

  <!--遮罩层-->
  <div v-if="iSsuccess" class="bgblacks  in"></div>
  <!--遮罩层end-->
  <!--loading-->
  <div type="primary" element-loading-text="拼命加载中" v-loading.fullscreen.lock="isLoading"></div>
  <!--loading-->
</div>
<!--
*            * * * * * * * * * * * * * * * * * * * * * * * * *
*            *                                               *
*            *                    _ooOoo_                    *
*            *                   o8888888o                   *
*            *                   88" . "88                   *
*            *                   (| -_- |)                   *
*            *                    O\ = /O                    *
*            *                ____/`- -'\____                *
*            *              .   ' \\| |// `.                 *
*            *               / \\||| : |||// \               *
*            *             / _||||| -:- |||||- \             *
*            *               | | \\\ - /// | |               *
*            *             | \_| ''\- -/'' | |               *
*            *              \ .-\__ `-` ___/-. /             *
*            *           ___`. .' / -. -\ `. . __            *
*            *        ."" '< `.___\_<|>_/___.' >'"".         *
*            *       | | : `- \`.;`\ _ /`;.`/ - ` : | |      *
*            *         \ \ `-. \_ __\ /__ _/ .-` / /         *
*            * ======`-.____`-.___\_____/___.-`____.-'====== *
*            *                    `= - ='                    *
*     ................................................................
*                        佛祖保佑             永无BUG
*
*      /\       | \ \     | |  _ · - - - - 、 | |     / /  .- - - - - -
*     /  \      | |\ \    | |、  、- - - -、- \| |   / /   | |- - - - -
*    / /\ \     | | \ \   | |  |              | |  / /    |  _ _ _ _ _
*   / /  \ \    | |  \ \  | |  |   . - - -  - | ||（      |  _ _ _ _ _
*  / /=== \ \   | |   \ \ | |\  \  ' - - - / /| |  \ \    | |
* / /      \ \  | |    \ \| | 、  、- - - / ） | |   \ \   | ._ _ _ _ _
*/ /        \ \ | |     \ | |    - - - -  /   | |    \ \  |_ _ _ _ _ __
*
*           If this comment is removed the program will blow up
*
*            actor:Constantine                     wx:Vergil_2083
*
*        When I wrote this, only God and I understood what I was doing
*                              Now, God only knows
*                              你在看源码，我在看着你
 -->
</template>

<script>
export default {
  name: "topUp",
  data: function data() {
    return {
      iSsuccess: false,
      isLoading: false,
    }
  },
  methods: {

  },
  mounted: function mounted() {
    var _this = this;
    //判断进入的方式，是通过扫码，还是公众号点击
    this.ajax(_this.port.outIn, {}, 'GET', function(res) {
      //console.log(res);
      if (res.status == 1) {
        if(res.data.qr == 1){
            var shopId = res.data.shoper_id;
            var storeId = res.data.store_id;
            _this.$router.push({name: 'goodsList', params: {shoper_id:shopId , store_id:storeId}});
        }else{
            _this.$router.push({
              path: '/main/nearbyTea'
            })
        }
      } else {
        _this.$message({
          message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',
          type: 'warning'
        });
      }
    })

    console.log("                    .::::.");
    console.log("                  .::::::::.");
    console.log("                 :::::::::::  ");
    console.log("             ..:::::::::::'");
    console.log("           '::::::::::::'");
    console.log("             .::::::::::");
    console.log("        '::::::::::::::..");
    console.log("             ..::::::::::::.");
    console.log("           ``::::::::::::::::");
    console.log("            ::::``:::::::::'        .:::.");
    console.log("           ::::'   ':::::'       .::::::::.");
    console.log("         .::::'      ::::     .:::::::'::::.");
    console.log("        .:::'       :::::  .:::::::::' ':::::.");
    console.log("       .::'        :::::.:::::::::'      ':::::.");
    console.log("      .::'         ::::::::::::::'         ``::::.");
    console.log("  ...:::           ::::::::::::'              ``::.");
    console.log(" ```` ':.          ':::::::::'                  ::::..");
    console.log("                    '.:::::'                    ':'````..");
    console.log('                   你在看源码，我在看着你                         ');
    // })
  },

}
</script>
