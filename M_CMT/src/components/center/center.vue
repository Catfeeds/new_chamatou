<!--
    ============= 个人中心模块 =============
-->
<template>
<div>

  <div class="TitBg">
    <div class="headPic global_flexC global_boxSad">
      <img :src="userPic" alt="">
    </div>
    <span class="nickName">{{userName}}</span>
  </div>
  <div class="balanceBox global_boxSad">
    <router-link to="/topUp">
      <div class="balanceList">
        <p>{{userHasBeans}}</p>
        <p>茶豆币</p>
      </div>
    </router-link>
    <div class="global_blkHB" style="height:1rem;float:left;width:1px"></div>
    <router-link to="/clubCard">
      <div class="balanceList">
        <p>{{vip_num}}</p>
        <p>商家会员卡</p>
      </div>
    </router-link>
  </div>

  <div class="listBox">
    <p class="global_blkBB"></p>
    <router-link to="/record_expense">
      <div class="rowBox">
        <div>
          <i class="iconfont my-icon icon-xiaofei"></i> 茶豆币消费记录
        </div>
        <span> > </span>
      </div>
    </router-link>
    <p class="global_blkBB"></p>
    <router-link to="/myOrder">
      <div class="rowBox">
        <div>
          <i class="iconfont my-icon icon-dingdan"></i> 我的订单
        </div>
        <span> > </span>
      </div>
    </router-link>
    <p class="global_blkBB"></p>
    <router-link to="/topUp">
      <div class="rowBox">
        <div>
          <i class="iconfont my-icon icon-chongzhi1"></i> 充值茶豆币
        </div>
        <span> > </span>
      </div>
      <p class="global_blkBB"></p>
    </router-link>
    <router-link to="/record_topUp">
      <div class="rowBox">
        <div>
          <i class="iconfont my-icon icon-chongzhi"></i> 充值记录
        </div>
        <span> > </span>
      </div>
    </router-link>
    <p class="global_blkBB"></p>
    <router-link to="/bindPhone">
      <div class="rowBox" v-if="bindPhoneFlag">
        <div>
          <i class="iconfont my-icon icon-shouji"></i> 绑定手机
        </div>
        <span> > </span>
      </div>
      <div class="rowBox" v-if="!bindPhoneFlag">
        <div>
          <i class="iconfont my-icon icon-shouji"></i> 更换手机号(现已绑定尾号{{phoneNum}})
        </div>
        <span> > </span>
      </div>
    </router-link>
    <p class="global_blkBB"></p>



  </div>


  <!--遮罩层-->
  <div v-if="iSsuccess" class="bgblacks  in"></div>
  <!--遮罩层end-->
  <!--loading-->
  <div type="primary" element-loading-text="拼命加载中" v-loading.fullscreen.lock="isLoading"></div>
  <!--loading-->
</div>
</template>


<script type="text/javascript">
export default {
  data() {
    return {
      iSsuccess: false,
      isLoading: false,
      swiperImg: {},
      vip_num: 0, //用户会员卡数量
      userHasBeans: 0, //用户茶豆币
      userPic: '', //用户头像，
      userName: '', //用户昵称
      bindPhoneFlag: true, //是否显示绑定手机模块
      phoneNum: '',
    }
  },
  methods: {
    funName: function funName() {

    }
  },
  mounted: function mounted() {
    //do something after mounting vue instance
    //初次加载数据
    laodData: {
      var _this = this;
      document.title = '茶码头';
      this.ajax(_this.port.getB, {}, 'GET', function(res) {
        console.log(res);
        if (res.status == 1) {
          _this.userHasBeans = res.beans;
          _this.userPic = res.userPic;
          _this.userName = res.userName;
          if (res.phone) {
            var phoneNumber = res.phone
            console.log(phoneNumber);
            _this.bindPhoneFlag = false;
            _this.phoneNum = phoneNumber.substring(7);
          }
        } else {
          _this.$message({
            message: '噢哦~!服务器好像开小差了，请待会儿重试吧....',
            type: 'warning'
          });
        }
      })
      this.ajax(_this.port.vipCardNum, {}, 'GET', function(res) {
        //console.log(res);
        _this.vip_num = res.vip_num;
      })
    }
  }
}
</script>


<style>
body {
  background-color: #eee !important;
}

.TitBg {
  width: 100%;
  height: 2.7rem;
  background: url(./2.jpg) no-repeat;
  background-size: cover;
  position: relative;
}

.headPic {
  position: absolute;
  width: 1.5rem;
  height: 1.5rem;
  border-radius: 50%;
  background-color: #ccc;
  bottom: -0.75rem;
  left: 0.2rem;
  overflow: hidden;
}

.headPic img {
  width: 100%;
}

.nickName {
  color: #FFF;
  font-size: 0.36rem;
  position: absolute;
  bottom: 0.15rem;
  left: 33%;
}

.balanceBox {
  width: 100%;
  height: 1rem;
  background-color: #fff;
  padding-left: 35%;
}

.balanceList {
  float: left;
  min-width: 1.5rem;
  text-align: center;
  font-size: 0.24rem;
  color: #222;
  padding-top: 0.15rem
}

.balanceList p {
  margin-top: 0.05rem
}



/*列表模块：*/

.listBox {
  background-color: #fff;
  min-height: 1rem;
  margin-top: 0.2rem
}

.rowBox {
  width: 100%;
  height: 0.8rem;
  display: flex;
  padding-left: 0.2rem;
  padding-right: 0.2rem;
  justify-content: space-between;
  align-items: center;
  font-size: 0.24rem;
  color: #8e655c;
}

.rowBox span {
  font-size: 0.4rem;
}

.my-icon {
  font-size: 0.36rem;
  margin-right: 0.08rem;
}
</style>
