export  default {
  install: function (Vue) {
    Vue.prototype.port = {
      //营业模块
      'getorderone': 'table/gettableorder',//获取开单详情
      'getbook': 'table/get-table-book',//获取预定接口
      'goodsTurn': 'table/table-goods-turn',//转台时房间分类和坐台
      'orderturn': 'table/table-turn',//房间转台
      'ordermerge': 'table/merge',//合并房间
      'book': 'table/begin-table-book',//预定
      'beginBook': 'table/begin-table-order-and-book',//非预定开单
      'begin': 'table/begin-table-order',//开单
      'edittable': 'table/edit-table',//修改桌台
      'addtable': 'table/add-table',//添加桌台
      'deltable': 'table/del-table',//删除桌台
      'edittabletype': 'table/edittabletype',//修改茶座分类
      'addtabletype': 'table/addtabletype',//添加茶座分类
      'closebook': 'table/close-table-book',//取消预定
      'deltabletype': 'table/deltabletype',//删除桌台类型
      'gettable': 'table/desktopstatus',//切换状态
      //'initlist':'goods/list-goods',//初始化商品数据
      'initlist': 'goods/search-goods',//初始化商品数据
      'search': 'goods/search-goods',//商品搜索
      'addgoods': 'table/add-goods',//添加开单桌台消费
      'goodsCancel': 'order/goods-close',//移除开单桌台消费商品
      'goodsGiv': 'order/goods-giv',//商品转赠送 order_id 订单ID order_goods_id 订单商品ID POST提交
      //会员模块
      'addMember': 'vip/create',//添加会员接口
      'memberData': 'vip/list-vip',//会员数据获取接口
      'Search': 'vip/search',// username 用户名 phone手机号 POST提交
      'Pay': 'vip/pay',//会员充值接口 Get vip_id 获取数据 || POST
      'delete': 'vip/delete',//会员删除 POST提交 vip_id参数
      'payList': 'vip/pay-list',//会员充值记录
      'print': 'vip/print',///vip/print?print_id=90 GET
      //留言模块
      'messageCreate': 'message/create',//添加一条留言 POST提交
      'messageList': 'message/list-message', //留言获取列表 GET提交
      'messageOne': 'message/message',//留言获取列表一条数据 GET提交
      //权限模块
      'roleInit': 'role/init',//权限初始化
      'getRoleData': 'role/get-roles',//获取用户权限
      'addunit': 'unit/add',//添加单位
      'unitinit': 'unit/get-all',//添加单位
      'unitDel': 'unit/del',//删除单位
      'unitOne': 'unit/get-one',//获取单位
      'unitedit': 'unit/edit',//修改单位
      'qrCode': 'qrcode/store',
      'doSingInit': 'dosing/get-all',//获取原料
      'addDoSingInit': 'dosing/add',//添加原料
      'dosingOne': 'dosing/get-one',//原料详情
      'editsing': 'dosing/edit',//原料详情
      'deltsing': 'dosing/del',//原料详情
      'addGoodsClass': 'goods/goods-cate-add',//添加商品分类
      'editGoodsClass': 'goods/goods-cate-edit',//修改商品分类
      'goodsClassify': 'goods/goods-cate',//获取商品分类
      'delgoodsClassify': 'goods/goods-cate-del',//删除商品分类
      'detailgoodsClassify': 'goods/get-cate-goods-page',//删除商品分类
      'addDiscount': 'discount/add',//添加优惠
      'editDiscount': 'discount/edit',//修改优惠
      'discount': 'discount/get-list',//初始化优惠数据
      'delDiscount': 'discount/del',//初始化优惠数据
      'dosingPage': 'dosing/get-all-page',//原料分页
      'goodsAdd': 'goods/add',
      'goodsList': 'erp/goods-list',//库存列表
      'goodsEdit': 'goods/edit',//修改商品
      'goodsDel': 'goods/del',//删除商品
      'deposit': 'erp/push-one',//入库商品
      'depositdeta': 'erp/push-log',//入库商品详情
      'addDeposit': 'erp/push-all',//添加多个商品入库
      'depositInit': 'erp/init-push-goods',//初始化商品入库
      'godown': 'erp/push-documents',//初始化入库单
      'getOut': 'erp/pop-one',//添加一个商品出库
      'getOutDeta': 'erp/pop-log',//出库明细
      'getOutMulti': 'erp/pop-all',//添加多个商品出库
      'getMulti': 'erp/pop-documents',//获取出库单
      'inventory': 'erp/pan-dian',//单个盘存
      'inventoryDeta': 'erp/pan-dian-log',//盘存记录
      'export': '/erp/excel',//盘存记录
      'getStaff':'users/get-list',//获取所有员工
      'getConsume':'spending/list',//获取消费单数据
      'member':'order/get-vip-one',//获取会员信息
      'orderPay':'order/pay',//营业结账
      'getOneConsume':'spending/one',//获取单个消费单
      'btxf':'order/btxf',//吧台消费
      'paybtxf':'order/paybtxf',//吧台消费结账
      'handWork':'jiaoban/index',//交班设置
      'realTimeData':'statement/actual-data',//实时数据
      'handworkInit':'jiaoban/init',//交班初始数据
      'addHandWork':'jiaoban/save',//保存交班初始数据
      'HandWorkList':'jiaoban/list',//交班数据列表
      'statementData':'statement/operating-data',//营业报表数据
      'SeniorityData':'statement/goods',//营业报表数据
      'unread':'information/unread',//未读消息
      'read':'information/read',//已读消息
      'information':'information/count',//消息总条数
      'caller':'statement/wx-user',//访客记录
      'messages':'information/message-box',//消息通知
      'staffList':'users/get-list',//获取所以管理员列表
      'staffDel':'users/del',//获取所以管理员列表
      'staffAdd':'users/add',//添加管理员
      'staffEdit':'users/edit',//修改管理员
      'staffOne':'users/one',//获取一个管理员
      'roleList':'users/get-role',//角色列表
      'getwithdraw':'withdraw/yl',//获取可以提现金额
      'withdraw':'withdraw/add',//提现
      'getwithdrawList':'withdraw/list',//获取提现列表
      'vipRecord':'vip/consume',//会员消费记录
      'addRole':'role/add',//添加角色权限
      'delRole':'role/del',//添加角色权限
      'editRole':'role/edit',//修改权限
      'getLoginRoleList':'role/get-roles',//获取登录用户权限
      'editPwd':'users/edit-password',//修改密码
      'login':'login/index',//登录
      'loginOut':'users/logout',//退出登录
    };
    //Vue.prototype.hostUrl = 'http://192.168.2.222:8083/';
    Vue.prototype.hostUrl = 'http://tea.chamatou.cn/';
    Vue.prototype.ajax = function (url, data, methodType, callback,is_loading) {
      var _this = this;
      //const  HostUrl=
      //  const  HostUrl='http://192.168.2.174/index.php/';
      if(is_loading==false){
      }else{
        this.isLoading = true;
        this.iSsuccess = true;
      }
      $.ajax({
        type: methodType,
        url: _this.hostUrl + url,
        data: data,
        timeout: 15000,
        dataType: 'json',
        success: function (data) {
          if(is_loading==false){
          }else{
            _this.isLoading = false;
            _this.iSsuccess = false;
          }
          callback(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
          if (textStatus == 'timeout') {
            //alert('网络超时');
              _this.isLoading = false;
              _this.iSsuccess = false;
          } else if (textStatus == 'error') {
            //alert('网络错误');
              _this.isLoading = false;
              _this.iSsuccess = false;
          }
          else if (textStatus == 'parsererror') {
            //alert('数据异常');
              _this.isLoading = false;
              _this.iSsuccess = false;
          }
        }
      });
    };
    //信息提示
    Vue.prototype.msgHint = function (str) {
      var _this = this;
      this.msgShow = true;
      this.msg = str;
      setTimeout(function () {
        _this.msgShow = false;
      }, 2000)
    };
    // Vue.prototype.getRole =JSON.parse(window.localStorage.getItem('roledata'));
    //Vue.prototype.getUserInfo =JSON.parse(window.localStorage.getItem('userinfo'));
    //Vue.prototype.getStoreInfo =JSON.parse(window.localStorage.getItem('storeinfo'));
  }
}
