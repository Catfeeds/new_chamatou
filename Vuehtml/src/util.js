/*
                                                                                                              _ooOoo_
                                                                                                             o8888888o
                                                                                                              88"  .  "88
                                                                                                             (|     -_-    |)
                                                                                                            O\     =     /O
                                                                                                           ____/`---'\____
                                                                                                        .'    \\|           |//  `.
                                                                                                       /   \\|||      :     |||//  \
                                                                                                     /     _|||||    -:-    |||||-    \
                                                                                                     |    |  \\\     -     ///  |   |
                                                                                                     | \_|       ''\---/''        |   |
                                                                                                      \    .-\__   `-`   __/-.     /
                                                                                                  ___ `.  .'      /--.--\       `.  . ___
                                                                                                ."" '<    `.___\_<|>_/___.'  >   '"".
                                                                                               | | :  `-  \`. ;`     \ _ /`;.`/  -  `   :   | |
                                                                                                \  \ `-.     \_ __ \ /__ _/   .-`     /  /
                                                                                    ======`-.____`-.___\_____/___.-`____.-'======
                                                                                                                  `=---='
                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                                                                                          佛祖保佑       永无BUG
 */
export  default {
  install:function(Vue) {
    Vue.prototype.port={
      //营业模块
      'getorderone':'cf/order/getorderone',//获取开单详情
      'getbook':'cf/order/getbook',//获取预定接口
      'goodsTurn':'cf/order/goodsTurn',//转台时房间分类和坐台
      'orderturn':'cf/order/orderturn',//房间转台
      'ordermerge':'cf/order/ordermerge',//合并房间
      'book':'cf/order/book',//预定
      'beginBook':'cf/order/beginBook',//非预定开单
      'begin':'cf/order/begin',//开单
      'edittable':'cf/table/edittable',//修改桌台
      'addtable':'cf/table/addtable',//添加桌台
      'edittabletype':'cf/table/edittabletype',//修改茶座分类
      'addtabletype':'cf/table/addtabletype',//添加茶座分类
      'closebook':'cf/order/closebook',//取消预定
      'deltable':'cf/table/deltable',//删除桌台
      'deltabletype':'cf/table/deltabletype',//删除桌台类型
      'edittable':'cf/table/edittable',//编辑茶座
      'gettable':'cf/table/gettable',//切换状态
      'initlist':'cf/bar/initlist',//初始化商品数据
      'search':'cf/bar/search',//商品搜索
      'addgoods':'cf/order/addgoods',//t添加开单桌台消费
      'goodsCancel':'cf/order/goodsCancel',//移除开单桌台消费商品
      //会员模块
      'addMember':'vip/create',//添加会员接口
      'payMember':'cf/vip/pay',//会员充值接口
      'memberData':'cf/vip/getlistall',//会员数据获取接口
    }
    Vue.prototype.ajax = function (url,data,methodType,callback) {
      var _this=this;
     // const  HostUrl='http://192.168.2.174:8080/';
      const  HostUrl='http://192.168.2.174/index.php/';
      this.isLoading=true;
      this.iSsuccess=true;
      $.ajax({
        type: methodType,
        url: HostUrl+url,
        data:data,
        dataType:'json',
        success: function (data) {
          _this.isLoading=false;
          _this.iSsuccess=false;
         callback(data);
        },
        error:function (err) {
         console.log(err);
        }
      });
    };
    //信息提示
    Vue.prototype.msgHint=function(str){
      var _this=this;
      this.msgShow=true;
      this.msg=str;
      setTimeout(function () {
        _this.msgShow=false;
      },2000)
    };

  }
}
