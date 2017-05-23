<template>
<div id="goodsList">
  <!-- 商品列表模块 -->
  <div class="goodsListypeBox" v-show="fishFlag">
    <div class="" v-for="(res , key) in Data" key="res.key">
      <h3 :class="res.cate_name" v-if="key == 0 && res.goods" class="goodsListypeAct goodsTypeList" @click="jump(res.cate_name)">{{res.cate_name}}</h3>
      <h3 :class="res.cate_name" v-if="key > 0 && res.goods" @click="jump(res.cate_name)" class="goodsTypeList">{{res.cate_name}}</h3>
    </div>
  </div>
  <div class="goodsListlistBox" v-show="fishFlag">
    <div class="goodsListATypeBox" v-for="data in Data" v-if="data.goods">
      <div :id="data.cate_name">
        <h4 class="goodsListTit "><span class="global_titLog global_BtnCol"></span>{{data.cate_name}}</h4>
        <div class="" v-for="res in data.goods">
          <div class="goodsDetaBox">
            <h4>{{res.goods_name}}/一{{res.unit}}</h4>
            <p>
              {{res.note}}
              <span> 库存:({{res.stock}})</span>
            </p>
            <div class="goodsNumBox">
              <div class="goodsCost">
                ￥ <span>{{res.sales_price}}</span>
              </div>

              <transition name="fold" mode="out-in" appear>
                <div class="goodsNum goodsNumMoreBox" v-if="res.num != 0">
                  <i class="downBtn goodsListBtn global_BtnCol2" @click="changeNum(res.id , 1)">
                    —
                  </i>
                  <span>
                    {{res.num}}
                  </span>
                  <i class="upBtn goodsListBtn global_BtnCol2" @click="changeNum(res.id , 0)">
                    +
                  </i>
                </div>
              </transition>

              <transition name="fold2" mode="out-in" appear>
                <div class="goodsNum goodsNum0Box" v-if="res.num == 0">
                  <i class="upBtn goodsListBtn global_BtnCol2" @click="changeNum(res.id , 0)">
                  +
                </i>
                </div>
              </transition>
            </div>
          </div>
          <p class="global_blkBB"></p>
        </div>
      </div>

    </div>
    <div class="global_nullDiv"></div>
  </div>
  <!-- 商品列表模块结束 -->


  <!-- 确认订单模块： -->

  <div class="sureOrder" v-show="!fishFlag">
    <div v-if="tableIptFlag" class="tableBox pLR">
      <i class="iconfont icon-zhuozi"></i>
      <span>请输入您的桌号:</span>
      <input type="text" name="" value="iptTable" class="global_IptSad" v-model="iptTable">
    </div>
    <div class="sureOrderDeta">
      <h5 class="pLR">选购商品</h5>
      <div class="carGoodsList">
        <div class="carDetaRow pLR" v-for="data in carData" :key="data.key">
          <h4 class="global_txtOver">{{data.name}}/一{{data.unit}}</h4>
          <span class="carDetaCost">￥{{data.cost}}</span>
        </div>
      </div>
      <div class="carDetaRow pLR" style="border:none">
        <h4 class="global_txtOver" style="color:#222;font-size:0.28rem;">合计</h4>
        <span class="carDetaCost" style="color:#222;font-size:0.36rem;">￥{{totalPrices}}</span>
      </div>
    </div>
    <div class="useCode">
      <div class="">
        <span>
        使用茶豆币
      </span>
        <input type="number" name="" value="iptBeans" class="global_IptSad" @keyup="downB()" v-model="iptBeans">
      </div>
      <div class="">
        <span>
        可用余额：
      </span>
        <b>
        {{userHasBeans}}
      </b>
      </div>
    </div>
    <div class="goback  global_BtnCol2 global_boxSad" @click="goFish()">
      继续选购
    </div>
  </div>
  <!-- 确认订单模块结束 -->

  <!-- 底部，去结算 -->
  <div class="shopCardBox" v-show="fishFlag">
    <div class="shopCardDeta">
      <div class="shopCardListBtn" @click="showCar()">
        <i v-if="shopCar" class="iconfont icon-diancandingdan0101"></i>
        <i style="color:#787878;" v-if="!shopCar" class="iconfont icon-diancandingdan0101"></i>
        <span v-if="shopCar" id="CarNum">{{shopCar}}</span>
      </div>
      <div v-if="shopCar" class="shopOrderBox">
        <p>
          ￥{{totalPrices}}
        </p>
        <h5>
          (茶豆币：{{userHasBeans}})
        </h5>
      </div>
      <div v-if="!shopCar" class="shopOrderBox">
        <h5>未选择商品</h5>
      </div>
    </div>
    <div v-if="shopCar" class="goFBtn global_BtnCol2" @click="goFish()">
      去结算
    </div>
    <div v-if="!shopCar" class="goFBtn" style="background-color:#2b272b ;font-size:0.30rem;">
      选择商品
    </div>
  </div>
  <!-- 底部，去结算结束 -->


  <!-- 底部，确认点单 -->
  <div class="shopCardBox" v-show="!fishFlag">
    <div class="shopCardDeta">
      <div v-if="shopCar" class="shopOrderBox">
        <p class="pLR">
          合计:￥{{totalPrices}}
          <span style="font-size: 0.24rem;color: #8e8e8e;">(茶豆币：{{userHasBeans}})</span>
        </p>
      </div>
    </div>
    <div v-if="shopCar" class="goFBtn global_BtnCol2" @click="sendOrder()">
      确认点单
    </div>
  </div>
  <!-- 底部，确认点单结束 -->

  <!-- 购物车模块： -->
  <div class="mark" v-show="carFlag" @click="showCar()">

  </div>

  <div class="carBox" v-show="carFlag">
    <h3 class="pLR carTit">
      <span>已选商品</span>
      <div class="" @click="clearAll()">
        <img src="./del.png" alt="">
        清空
      </div>
    </h3>
    <div class="carGoodsList">
      <div class="carDetaRow pLR" v-for="data in carData" :key="data.key">
        <h4 class="global_txtOver">{{data.name}}/一{{data.unit}}</h4>
        <span class="carDetaCost">￥{{data.cost}}</span>
        <transition name="fold" mode="out-in" appear>
          <div class="goodsNum goodsNumMoreBox" v-if="data.num != 0">
            <i class="downBtn goodsListBtn global_BtnCol2" @click="changeNum(data.id , 1)">
              —
            </i>
            <span>
              {{data.num}}
            </span>
            <i class="upBtn goodsListBtn global_BtnCol2" @click="changeNum(data.id , 0)">
              +
            </i>
          </div>
        </transition>
      </div>
    </div>
  </div>
  <!-- 购物车模块结束 -->

  <!-- 点单成功弹出模块 -->
  <!-- <transition name="fade" mode="out-in" appear>
    <div class="mark" v-show="succeedAlertFlag" style="z-index:9999">
      <div class="succeedAlert global_boxSad" >
        <p><img src="static/images/succeed.png" alt="">点单成功</p>
        <div class="operationBox">
          <div class="operationBtn" @click="goFish()">
            继续点单
          </div>
          <router-link :to="{name:'orderDeta',params:{id: orderId}}">
            <div class="operationBtn">
              查看详情
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </transition> -->
  <!-- 点单成功弹出模块结束 -->

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
  name: "goodsList",
  data: function data() {
    return {
      iSsuccess: false,
      isLoading: false,
      Data: {}, //请求回来的数据盒子（在进入页面时存入）
      carData: [], //渲染购物车数组对象
      sendData: [], //确认点单 发送的goodslist数组对象
      shopCar: 0, //购物车数量
      totalPrices: 0, //购物车总价
      carFlag: false, //是否展示购物车模块开关 FALSE为关
      fishFlag: true, //确认点单模块开关 TRUE为关
      iptBeans: '', //用户输入的茶豆币
      iptTable: '', //用户输入的桌号
      userHasBeans: 0, //用户拥有的茶豆币（在进入页面时存入）
      succeedAlertFlag: false, //点单成功弹出层开关
      orderId: '', //传参的orderId
      tableIptFlag: true, //是否让用户输入桌号
      totalBox: 0, //用于储存总价格
    }
  },
  //方法盒子
  methods: {
    //更新购物车数据（数量，总价，。。。
    upCarDate: function upCarDate() {
      var _this = this;
      _this.shopCar = 0;
      _this.totalPrices = 0;
      _this.carData = [];
      _this.sendData = [];
      for (var i = 0; i < _this.Data.length - 1; i++) {
        var goods = _this.Data[i].goods;
        if (goods) {
          for (var j = 0; j < goods.length; j++) {
            //console.log(goods[j].id);
            var thisNum = goods[j].num
            if (thisNum > 0) {
              _this.shopCar += thisNum;
              var thisCost = goods[j].sales_price;
              _this.totalPrices += thisCost * thisNum
              var obj = {
                name: goods[j].goods_name,
                id: goods[j].id,
                cost: goods[j].sales_price,
                num: goods[j].num,
                unit: goods[j].unit
              };
              var sendObj = {
                name: goods[j].goods_name,
                id: goods[j].id,
                count: goods[j].num,
                unit: goods[j].unit
              }
              _this.carData.push(obj);
              _this.sendData.push(sendObj);
            }
          }
        }
      }
      _this.totalBox = _this.totalPrices
    },

    //是否显示购物车:(显示隐藏购物车模块)
    showCar: function showCar() {
      this.carFlag = !this.carFlag;
    },

    //点击去结算：（显示隐藏确认点单模块，以及关联模块）
    goFish: function goFish() {
      this.fishFlag = !this.fishFlag;
      this.carFlag = false;
      this.succeedAlertFlag = false;
      this.iptBeans = ''
    },

    //点击清空按钮：（清除购物车中的所有商品）
    clearAll: function clearAll() {
      var _this = this;
      _this.shopCar = 0;
      _this.totalPrices = 0;
      _this.carData = [];
      _this.carFlag = false;
      for (var i = 0; i < _this.Data.length - 1; i++) {
        var goods = _this.Data[i].goods;
        if (goods) {
          for (var j = 0; j < goods.length; j++) {
            goods[j].num = 0;
          }
        }
      }
    },

    //输入了茶豆币，总价改变（用户输入使用茶豆币（必须判断用户输入的茶豆币是否大于用户拥有的茶豆币））
    downB: function downB() {
      var _this = this;
      var thisTotal = _this.totalBox;
      var iptB = parseFloat(_this.iptBeans);
      var uHasB = parseFloat(_this.userHasBeans)
      if (iptB > uHasB) {
        _this.$message({
          message: '您输入了大于您余额的茶豆币~！！',
          duration: '800',
          type: 'warning' //成功 'success'  , 失败 'eroor' , 警告 'warning'
        });
      } else {
        thisTotal = thisTotal - _this.iptBeans;
      }
      _this.totalPrices = thisTotal
    },

    //点击Tit右边跳转到对应的位置（电梯效果，点击左侧的导航栏，右侧运动到相应的分类位置）
    jump: function jump(theId) {
      var theCls = '.' + theId;
      theId = '#' + theId
      //console.log(theId);
      var anchor = $(theId).offset().top + $('.goodsListlistBox').scrollTop(); //计算背点击的id到页面顶端的距离
      var sTop = $('.goodsListlistBox').scrollTop()
      //console.log('$(document).scrollTop():' + sTop);
      //console.log(anchor)
      $('.goodsTypeList').removeClass('goodsListypeAct')
      $(theCls).addClass('goodsListypeAct');
      $('.goodsListlistBox').animate({
        scrollTop: anchor + "px"
      })
    },

    //更改数量（点击商品列表中的加减号执行此函数，对商品加入购物车，以及加入购物车中的商品数量进行操作）
    changeNum(pId, type) {
      var _this = this;
      for (var i = 0; i < _this.Data.length - 1; i++) {
        var goods = _this.Data[i].goods;
        if (goods) {
          for (var j = 0; j < goods.length; j++) {
            //console.log(goods[j].id);
            //console.log(goods[j].stock);
            if (pId == goods[j].id) {
              var num = goods[j].num;
              if (goods[j].stock == '-') {
                if (type == 0) {
                  num = num + 1;
                } else {
                  num = num - 1;
                }
              } else {
                if (num < Math.floor(goods[j].stock)) {
                  if (type == 0) {
                    num = num + 1;
                  } else {
                    num = num - 1;
                  }
                } else {
                  if (type == 0) {
                    alert('该商品库存不足');
                  } else {
                    num = num - 1;
                  }
                }
              }
              if (num < 0) { //数量不可小于0
                num = 0
              }
              goods[j].num = num;
              //console.log(goods[j].num);
              this.upCarDate()
              return
            }
          }
        }
      }
    },

    //弹出框模块：（提示用户是否点单成功， 并且让用户选择点单完成后的下一步操作：
    //             1、继续点单
    //             2、查看订单详情
    //             ）
    open() {
      var _this = this;
      this.$confirm('恭喜您，点单成功~！！', '提示', {
        confirmButtonText: '继续点单',
        cancelButtonText: '查看详情',
        type: 'success'
      }).then(() => {
        this.$message({
          type: 'success',
          message: '恭喜您，单成功~~！'
        });
      }).catch(() => {
        this.$router.push({
          name: 'orderDeta',
          params: {
            id: _this.orderId
          }
        })

      });
    },

    //确认点单：（点击确认点单时的函数
    //      1、判断桌号是否为空，2、判断茶豆币输入是否正常）
    sendOrder() {
      var _this = this;
      var iptB = parseFloat(_this.iptBeans);
      var uHasB = parseFloat(_this.userHasBeans)
      if (iptB > uHasB) {
        _this.$message({
          message: '使用的茶豆币不能大于您的余额，请您从新输入~',
          duration: '800',
          type: 'error' //成功 'success'  , 失败 'eroor' , 警告 'warning'
        });
        _this.iptBeans = '';
        return;
      } else if (_this.iptTable == '') {
        _this.$message({
          message: '您的桌号不能空，否则将无法点单。。。',
          duration: '800',
          type: 'warning' //成功 'success'  , 失败 'eroor' , 警告 'warning'
        });
        return;
      }

      //提交订单
      this.ajax(_this.port.sendOrder, {
        beans: _this.iptBeans,
        table_no: _this.iptTable,
        goodsList: _this.sendData
      }, 'POST', function(res) {
        if (res.status == 1) {
          //讲台座号存入本地
          window.localStorage.setItem('table_no', JSON.stringify(_this.iptTable))
          _this.userHasBeans = _this.userHasBeans - _this.iptBeans;
          _this.succeedAlertFlag = true;
          _this.orderId = res.order_id;
          _this.open();
          var table_noP = JSON.parse(window.localStorage.getItem('table_no'))
        } else if (res.status == 0) {
          _this.$message.error(res.msg);
        } else {
          _this.$message({
            message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',
            type: 'warning'
          });
        }
        //console.log(res);
      })
    }
  },
  created: function created() {

    //初次请求数据：
    loadData: {
      var _this = this;

      // 请求商品列表数据（拿到 扫码/继续点单 中返回来的商户ID和店铺ID）
      this.ajax(_this.port.goods, {
        shoper_id: _this.$route.params.shoper_id,
        store_id: _this.$route.params.store_id
      }, 'GET', function(res) {
        //console.log(res);
        if (res.status == 1) {
          _this.Data = res.data;
        } else {
          _this.$message({
            message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',
            type: 'warning'
          });
        }
      })

      //请求用户茶豆币
      this.ajax(_this.port.getB, {}, 'GET', function(res) {
        //console.log(res);
        if (res.status == 1) {
          _this.userHasBeans = res.beans;
        } else {
          _this.$message({
            message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',
            type: 'warning'
          });
        }
      })
    }
  },
  mounted: function mounted() {
    //do something after mounting vue instance
    var _this = this;
    var table_noP = _this.$route.params.table_no
    if (table_noP) {
      _this.iptTable = table_noP;
      _this.tableIptFlag = false;
    }
  }
}
</script>
<style>
.fold-enter-active {
  animation-name: fold-in;
  animation-duration: .1s;
}

.fold-leave-active {
  animation-name: fold-out;
  animation-duration: .1s;
}

@keyframes fold-in {
  0% {
    transform: translate3d(100%, 0, 0);
  }
  100% {
    transform: translate3d(50%, 0, 0);
  }
}

@keyframes fold-out {
  0% {
    transform: translate3d(50%, 0, 0);
  }
  100% {
    transform: translate3d(100%, 0, 0);
  }
}

.fold2-enter-active {
  animation-name: fold2-in;
  animation-duration: .2s;
}

.fold2-leave-active {
  animation-name: fold2-out;
  animation-duration: .1s;
}

@keyframes fold2-in {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

@keyframes fold2-out {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

.succeedAlert {
  position: fixed;
  width: 50vw;
  min-height: 20vh;
  top: 50%;
  left: 50%;
  margin-left: -25vw;
  margin-top: -10vh;
  background-color: #fff;
  font-size: 0.30rem;
  border-radius: 0.3rem;
  z-index: 99999;
}

.succeedAlert p {
  display: flex;
  height: auto;
  justify-content: center;
  align-items: center;
  margin-top: 0.3rem;
}

.succeedAlert p img {
  width: 0.45rem
}

.operationBox {
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 0.3rem 0.2rem 0.2rem;
}

.operationBtn {
  font-size: 0.24rem;
  color: #fff;
  background-color: #56d176;
  border-radius: 0.08rem;
  padding: 0.06rem;
}

.fixBtn {
  position: absolute;
}
</style>
