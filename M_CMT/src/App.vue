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
* / /      \ \  | |    \ \| | 、  、- - - ` ） | |   \ \   | ._ _ _ _ _
*/ /        \ \ | |     \ | |    - - - -  `   | |    \ \  |_ _ _ _ _ __
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
    _this.$router.push({
      path: '/main/nearbyTea'
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
