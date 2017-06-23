export default {
  install: function(Vue) {
    Vue.prototype.port = {
      'addDeposit': 'erp/push-all', //添加多个商品入库
      'depositInit': 'erp/init-push-goods', //初始化商品入库
      'goods': 'goods/index', //测试接口
      'sendOrder': 'goods/order', //确认点单接口
      'getRatio': 'user/getconfig', //获取差豆币及兑换比例接口
      'getB': 'user/getbeans', //获取茶豆币接口
      'orderDeta': 'user/orderdetail', //订单详情页接口
      'orderList': 'user/orderlist', //订单列表页接口
      'beansCons': 'user/beanscons', //用户茶豆币消费记录
      'vipCardNum': 'user/vip', //用户会员卡数量统计
      'topUprecord': 'user/getrecharge', //充值记录
      'vipCardList': 'user/viplist', //用户会员卡数量统计
      'bindPhone': 'user/bingphone', //用户绑定手机号
      'cdbPay': 'user/recharge', //茶豆币充值
      'bind': 'user/verify', //用户绑定手机号，发送手机号以及验证码
      'configData': 'wechat/config', //获取配置文件
      'getTeaData': 'index/tea', //根据位置获取推荐茶楼
      'teaDeta': 'index/teadetail', //获取茶楼的详细信息
      'pay': 'wechat/pay', //调取支付的参数
      'outIn':'index/type',//判断是否从外面扫码进入
      /*@add coding
      * @update  Author for zhangwenxia in  2017-06-07
      */
      'drawInit':'draw/test1',//初始化抽奖数据
      'getdraw':'draw/test2',//初始化抽奖数据
      'getprize':'draw/index',//初始化中奖数据
      'cardprize':'draw/end-card',//初始化中奖数据
    };
    Vue.prototype.hostUrl = 'http://wx.chamatou.cn/'; //定义请求公共头
    Vue.prototype.ajax = function(url, data, methodType, callback) {
      var _this = this;
      //const  HostUrl=
      //const  HostUrl='http://192.168.2.174/';
      this.isLoading = true;
      this.iSsuccess = true;
      $.ajax({
        type: methodType,
        url: _this.hostUrl + url,
        data: data,
        timeout: 15000,
        dataType: 'json',
        success: function(data) {
          _this.isLoading = false;
          _this.iSsuccess = false;
          callback(data);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
          console.log(textStatus)
          if (textStatus == 'timeout') {
            //alert('网络超时');
            _this.isLoading = false;
            _this.iSsuccess = false;
          } else if (textStatus == 'error') {
            //alert('网络错误');
            _this.isLoading = false;
            _this.iSsuccess = false;
          } else if (textStatus == 'parsererror') {
            //alert('数据异常');
            _this.isLoading = false;
            _this.iSsuccess = false;
          }
        }
      });
    };
  }
}
