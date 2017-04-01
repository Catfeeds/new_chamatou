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
      'getorderone':'table/gettableorder',//获取开单详情
      'getbook':'table/get-table-book',//获取预定接口
      'goodsTurn':'table/table-goods-turn',//转台时房间分类和坐台
      'orderturn':'table/table-turn',//房间转台
      'ordermerge':'table/merge',//合并房间
      'book':'table/begin-table-book',//预定
      'beginBook':'table/begin-table-order-and-book',//非预定开单
      'begin':'table/begin-table-order',//开单
      'edittable':'table/edit-table',//修改桌台
      'addtable':'table/add-table',//添加桌台
      'deltable':'table/del-table',//删除桌台
      'edittabletype':'table/edittabletype',//修改茶座分类
      'addtabletype':'table/addtabletype',//添加茶座分类
      'closebook':'table/close-table-book',//取消预定
      'deltabletype':'table/deltabletype',//删除桌台类型
      'gettable':'table/desktopstatus',//切换状态
      'initlist':'goods/list-goods',//初始化商品数据
      'search':'goods/search-goods',//商品搜索
      'addgoods':'table/add-goods',//t添加开单桌台消费
      'goodsCancel':'order/goods-close',//移除开单桌台消费商品
      'goodsGiv':'order/goods-giv',//商品转赠送 order_id 订单ID order_goods_id 订单商品ID POST提交
      //会员模块
      'addMember':'vip/create',//添加会员接口
      'payMember':'cf/vip/pay',//会员充值接口
      'memberData':'vip/list-vip',//会员数据获取接口
      'Search':'vip/search',// username 用户名 phone手机号 POST提交
      'Pay':'vip/pay',//会员充值接口 Get vip_id 获取数据 || POST
      'delete':'vip/delete',//会员删除 POST提交 vip_id参数
      'payList':'vip/pay-list',//会员充值记录
      'print':'vip/print',///vip/print?print_id=90 GET
      //留言模块
      'messageCreate':'message/create',//添加一条留言 POST提交
      'messageList':'message/list-message', //留言获取列表 GET提交
      'messageOne':'message/message' ,//留言获取列表一条数据 GET提交
    }
    Vue.prototype.ajax = function (url,data,methodType,callback) {
      var _this=this;
     const  HostUrl='http://192.168.2.174:8080/';
     //  const  HostUrl='http://192.168.2.174/index.php/';
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
