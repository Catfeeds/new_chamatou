<?php
return [
    'adminEmail' => 'admin@example.com',
    'pageSize'   => 10,# 分页 一页的显示数量
    'minTime'    => 0,# 茶坊忽略的时间 分钟
    'wxPay'=>[
        'appid'=>'wx3a8c350faa88e646',
        'secret'=>'9fee3d531dcd68e50c19c4941a033fb8',
        'mch_id'=>'1241023702',
        'pay_url'=>'https://api.mch.weixin.qq.com/pay/unifiedorder',
        'api_key'=>'6393246e2aecabb5caf267f3cabc1b7f',
        'spbill_create_ip'=>'118.178.132.84',
        'notify_url'=>'http://15982707139.tunnel.2bdata.com/b2b/order/wx-pay-ret',
        'trade_type'=>'NATIVE',
    ],
    //添加角色的列表
    /* 数据库中添加的数据*/
    'rbacInitList'       =>[
        [
            'name'=>'公共模块',
            'list'=>[
                [
                    'name'=>'交班',
                    'list'=>[
                      ['name'=>'交班','value' => 'jiaoban','select'=>0],
                      ['name'=>'交班记录','value' => 'jiaoban/list','select'=>0]
                    ],
                ],
                [
                    'name'=>'消息',
                    'list'=>[
                        ['name'=>'消息' ,'value'=>'information','select'=>0],
                    ],
                ]
            ],
        ],
        [
            'name'=>'营业管理',
            'list'=>[
                [
                    'name'=>'营业桌台显示',
                    'list'=>[
                        ['name'  =>'营业桌台显示', 'value'   =>'business/desktopstatus', 'select'=>0],
                    ],
                ]
                ,
                [
                    'name'=>'预定',
                    'list'=>[
                        ['name'  =>'预定', 'value'   =>'business/book', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'开单台座管理',
                    'list'=>[
                        ['name'  =>'开台', 'value'   =>'business/begin-table-order', 'select'=>0],
                        ['name'  =>'更换台座', 'value'   =>'business/table/table-turn', 'select'=>0],
                        ['name'  =>'合并账单', 'value'   =>'business/merge', 'select'=>0],
                        ['name'  =>'商品转配', 'value'   =>'business/goods-giv', 'select'=>0],
                        ['name'  =>'商品取消', 'value'   =>'business/goods-close', 'select'=>0],
                        ['name'  =>'商品转台', 'value'   =>'business/table-goods-turn', 'select'=>0],
                        ['name'  =>'增加消费', 'value'   =>'business/add-goods', 'select'=>0],
                        ['name'  =>'查看',    'value'   =>'business/orderInfo', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'吧台消费',
                    'list'=>[
                        ['name'  =>'吧台消费', 'value'   =>'order/btxf', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'台桌类型管理',
                    'list'=>[
                        ['name'  =>'台桌类型管理', 'value'   =>'business/table-type', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'台座管理',
                    'list'=>[
                        ['name'  =>'台座管理', 'value'   =>'business/table', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'结账',
                    'list'=>[
                        ['name'  =>'结账', 'value'   =>'business/order', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'会员管理',
            'list'=>[
                [
                    'name'=>'添加会员',
                    'list'=>[
                        ['name'  =>'添加会员', 'value'   =>'vip/create', 'select'=>0],
                        ['name'  =>'会员删除', 'value'   =>'vip/delete', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'会员列表',
                    'list'=>[
                        ['name'  =>'会员列表', 'value'   =>'vip/list-vip', 'select'=>0],
                        ['name'  =>'充值', 'value'   =>'vip/pay', 'select'=>0],
                        ['name'  =>'充值记录', 'value'   =>'vip/pay-list', 'select'=>0],
                        ['name'  =>'消费记录', 'value'   =>'vip/consume', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'库存管理',
            'list'=>[
                [
                    'name' => '库存列表',
                    'list' => [
                        ['name' => '库存列表', 'value' => 'erp/goods-list', 'select' => 0]
                    ],
                ],
                [
                    'name'=>'入库',
                    'list'=>[
                        ['name'  =>'入库', 'value'   =>'erp/push', 'select'=>0],
                        ['name'  =>'入库记录', 'value'   =>'erp/push-log', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'盘存',
                    'list'=>[
                        ['name'  =>'盘存', 'value'   =>'erp/pan-dian', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'出库',
                    'list'=>[
                        ['name'  =>'出库', 'value'   =>'erp/pop', 'select'=>0],
                        ['name'  =>'出库记录', 'value'   =>'erp/pop-log', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'消费单',
            'list'=>[
                [
                    'name'=>'消费单',
                    'list'=>[
                        ['name'  =>'消费单', 'value'   =>'spending/list', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'留言模块',
            'list'=>[
                [
                    'name'=>'留言模块',
                    'list'=>[
                        ['name'  =>'留言模块', 'value'   =>'message', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'提现管理',
            'list'=>[
                [
                    'name'=>'查看编辑',
                    'list'=>[
                        ['name'  =>'查看编辑', 'value'   =>'withdraw', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'B2B商城',
            'list'=>[
                [
                    'name'=>'B2B商城',
                    'list'=>[
                        ['name'  =>'B2B商城', 'value'   =>'b2b', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'报表管理',
            'list'=>[
                [
                    'name'=>'报表管理',
                    'list'=>[
                        ['name'  =>'报表管理', 'value'   =>'statement/actual-data', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'奖品管理',
            'list'=>[
                [
                    'name'=>'奖品管理',
                    'list'=>[
                        ['name'  =>'奖品管理', 'value'   =>'draw/index', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'设置',
            'list'=>[
                [
                    'name' => '生成二维码',
                    'list' => [
                        ['name' => '生成二维码', 'value' => 'qrcode/store', 'select' => 0]
                    ],
                ],
                [
                    'name'=>'优惠配置',
                    'list'=>[
                        ['name'  =>'优惠配置', 'value'   =>'discount/config', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'角色管理',
                    'list'=>[
                        ['name'  =>'角色管理', 'value'   =>'role/index', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'商品管理',
                    'list'=>[
                        ['name'  =>'商品管理', 'value'   =>'goods/config', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'单位管理',
                    'list'=>[
                        ['name'  =>'单位管理', 'value'   =>'unit/config', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'原料配置',
                    'list'=>[
                        ['name'  =>'原料配置', 'value'   =>'dosing/config', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'员工操作',
                    'list'=>[
                        ['name'  =>'员工操作', 'value'   =>'users/config', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'预留金',
                    'list'=>[
                        ['name'  =>'预留金', 'value'   =>'jiaoban/index', 'select'=>0]
                    ]
                ]
                ,
                [
                    'name'=>'抽奖设置',
                    'list'=>[
                        ['name'  =>'抽奖设置', 'value'   =>'draw/list', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'会员等级',
                    'list'=>[
                        ['name'  =>'会员等级', 'value'   =>'vip/get-all', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'收费规则',
                    'list'=>[
                        ['name'  =>'收费规则', 'value'   =>'charg/add', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'缓冲时间',
                    'list'=>[
                        ['name'  =>'缓冲时间', 'value'   =>'charg/buffer-time', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'支付选择',
                    'list'=>[
                        ['name'  =>'支付选择', 'value'   =>'payment/payment-select', 'select'=>0]
                    ]
                ]
            ]
        ],
    ],
    'notRbacUrlList'=>[
        'role/get-roles'=>1,
        'users/edit-password'=>1,
        'users/logout'=>1,
        'table/begin-table-order'=>1,
        'information/message-box'=>1,
        'jiaoban/index'=>1,
        'draw/test1'=>1,
        'draw/test2'=>1,
        'qrcode/download'=>1,
        'vip/get-all'=>1,
        'charg/get-all'=>1,
        'payment/payment-select'=>1
    ],
    /* 判断权限下所包含的URL*/
    'rbacUrlList' =>[
        # 设置中心
        'role/init'  =>'role/index',//设置--初始化所有的权限列表
        'role/get-roles'  =>'role/index',//设置--获取当前用户所有权限
        'role/add'  =>'role/index',//角色添加
        'role/edit'  =>'role/index',//角色添加
        'role/one'  =>'role/index',//角色添加
        'role/del'  =>'role/index',//角色添加
        'jiaoban/index'  =>'jiaoban/index',//设置--交班金额设置
        'qrcode/store'=>'qrcode/store', //设置--生成二维码
        'goods/goods-cate-and-goods'=>'goods/config',//设置--获取商品的分类
        'goods/goods-cate'=>'goods/config',//设置--获取商品的分类
        'goods/goods-cate-add'=>'goods/config',//设置--商品的分类 添加
        'goods/goods-cate-edit'=>'goods/config',//设置--商品的分类 修改
        'goods/goods-cate-del'=>'goods/config',//设置--商品的分类 删除
        'goods/add'=>'goods/config',//设置--商品的分类 添加
        'goods/edit'=>'goods/config',//设置--商品的分类 修改
        'goods/del'=>'goods/config',//设置--商品的分类 删除
        'goods/get-cate-goods-page'=>'goods/config',//设置--分类下的商品
        'unit/get-all'=>'unit/config',//设置--获取商品的单位
        'unit/get-one'=>'unit/config',//设置--获取商品的i
        'unit/add'=>'unit/config',//设置--商品的单位 添加
        'unit/edit'=>'unit/config',//设置--商品的单位 修改
        'unit/del'=>'unit/config',//设置--商品的单位 删除
        'dosing/add'=>'dosing/config' ,//设置--商品原料 添加
        'dosing/edit'=>'dosing/config' ,//设置--商品原料 修改
        'dosing/del'=>'dosing/config' ,//设置--商品原料 删除
        'dosing/get-all'=>'dosing/config' ,//设置--商品原料 获取所有
        'dosing/get-all-page'=>'dosing/config' ,//设置--商品原料 获取所有带分页
        'dosing/get-one'=>'dosing/config' ,//设置--商品原料 获取一个
        'users/add'=>'users/config',//设置--添加管理员
        'users/del'=>'users/config',//设置--添加管理员
        'users/edit'=>'users/config',//设置--添加管理员
        'users/get-role'=>'users/config',//设置--添加管理员
        'users/get-list'=>'users/config',//设置--获取管理员列表
        'users/get-one'=>'users/config',//设置--获取管理员列表
        'users/one'=>'users/config',//设置--获取管理员列表
        'discount/add'=>'discount/config',//设置 -- 优惠操作 添加
        'discount/edit'=>'discount/config',//设置 -- 优惠操作 添加
        'discount/del'=>'discount/config',//设置 -- 优惠操作 添加
        'discount/get-list'=>'discount/config',//设置 -- 优惠操作 添加
        'vip/get-all'=>'vip/get-all',//设置
        'vip/get-one'=>'vip/get-all',//设置
        'vip/del-grade'=>'vip/get-all',//设置
        'vip/edit-grade'=>'vip/get-all',//设置
        'vip/add-grade'=>'vip/get-all',//设置
        'charg/add'=>'charg/add',//设置
        'charg/get-all'=>'charg/add',//设置
        'charg/delete'=>'charg/add',//设置
        'charg/get-one'=>'charg/add',//设置
        'charg/edit'=>'charg/add',//设置
        'charg/buffer-time'=>'charg/buffer-time',//设置
        'payment/payment-select'=>'payment/payment-select',//设置

        'draw/list'=>'draw/list',//设置 -- 抽奖列表
        'draw/create'=>'draw/list',//设置 -- 抽奖列表
        'draw/del'=>'draw/list',//设置 -- 抽奖列表
        'draw/edit'=>'draw/list',//设置 -- 抽奖列表
        'draw/one'=>'draw/list',//设置 -- 抽奖列表
        'draw/create-conf'=>'draw/list',//设置 -- 抽奖列表
        'draw/one-conf'=>'draw/list',//设置 -- 抽奖列表
        'draw/index'=>'draw/index',//设置 -- 抽奖列表
        'draw/end-card'=>'draw/index',//设置 -- 抽奖列表

        'erp/goods-list'=>'erp/goods-list',//库存 -- 获取库存列表  添加
        'erp/push-one'=>'erp/push',//库存 -- 入库一个商品或原料
        'erp/push-all'=>'erp/push',//库存 -- 入库多个商品或原料
        'erp/init-push-goods'=>'erp/push',//库存 -- 入库多个商品或原料
        'erp/push-log'=>'erp/push-log',//库存 -- 商品或原料入库记录
        'erp/push-documents'=>'erp/push-log',//库存 -- 入库单据记录
        'erp/pop-one'=>'erp/pop',//库存 -- 单商品出库库
        'erp/pop-all'=>'erp/pop',//库存 -- 单商品出库生成单据
        'erp/pop-log'=>'erp/pop-log',//库存 -- 单商品出库记录
        'erp/pop-documents'=>'erp/pop-log',//库存 -- 单商品出库生成单据
        'erp/pan-dian'=>'erp/pan-dian',//库存 -- 库存盘点
        'erp/pan-dian-log'=>'erp/pan-dian',//库存 -- 库存盘点
        'erp/excel'=>'erp/excel',//库存 -- 导出Excel
        'table/desktopstatus'=>'business/desktopstatus',//营业桌台显示
        'table/gettableorder'=>'business/orderInfo',//查看台座消费详情
        'table/begin-table-order'=>'business/begin-table-order',//开台
        'table/begin-table-order-and-book'=>'business/begin-table-order',//开台
        'table/table-turn'=>'business/table/table-turn',//转台操作
        'table/merge'=>'business/merge',//合并台座
        'order/goods-giv'=>'business/goods-giv',//商品转配
        'order/goods-close'=>'business/goods-close',//商品取消
        'table/table-goods-turn'=>'business/table-goods-turn',//商品转台
        'table/add-goods'=>'business/add-goods',//商品添加
        'goods/list-goods'=>'business/add-goods',//商品列表
        'goods/search-goods'=>'business/add-goods',//商品列表
        'table/add-table'=>'business/table',//添加台座
        'table/edit-table'=>'business/table',//修改台座
        'table/del-table'=>'business/table',//删除台座
        'table/addtabletype'=>'business/table-type',//添加台桌分类
        'table/edittabletype'=>'business/table-type',//修改台桌分类
        'table/deltabletype'=>'business/table-type',//删除台桌分类
        'table/begin-table-book'=>'business/book',//预定权限
        'table/get-table-book'=>'business/book',//获取预定详情
        'table/close-table-book'=>'business/book',//取消预定
        'order/get-vip-one'=>'business/order',//取消预定
        'order/pay'=>'business/order',//订单结算
        'order/preferential'=>'business/order',//订单结算//优惠券
        'order/btxf'=>'order/btxf',//吧台消费订单生成
        'order/paybtxf'=>'order/btxf',//吧台订单结算
        'b2b/default/index'=>'b2b',//b2b商场首页
        'b2b/category/index'=>'b2b',//b2b商品分类
        'b2b/goods/search'=>'b2b',//b2b商品搜索
        'b2b/users/info'=>'b2b',//b2b个人信息
        'b2b/cart/list'=>'b2b',//b2b购物车
        'b2b/cart/del'=>'b2b',//b2b删除购物车商品
        'b2b/cart/add'=>'b2b',//b2b添加商品到购物车
        'b2b/cart/edit-cart-num'=>'b2b',//b2b购物车修改数量
        'b2b/address/add'=>'b2b',//b2b购物车修改数量
        'b2b/address/del'=>'b2b',//b2b购物车修改数量
        'b2b/address/list'=>'b2b',//b2b购物车修改数量
        'b2b/address/one'=>'b2b',//b2b购物车修改数量
        'b2b/address/edit'=>'b2b',//b2b购物车修改数量
        'b2b/address/edit-default'=>'b2b',//b2b购物车修改数量
        'b2b/address/locations'=>'b2b',//b2b购物车修改数量
        'b2b/order/list'=>'b2b',//b2b购物车修改数量
        'b2b/goods/info-one'=>'b2b',//b2b购物车修改数量
        'b2b/order/save-order'=>'b2b',//b2b购物车修改数量
        'b2b/credit/info'=>'b2b',//b2b购物车修改数量
        'b2b/credit/list'=>'b2b',//b2b购物车修改数量
        'b2b/order/pay-status'=>'b2b',//b2b购物车修改数量
        'b2b/order/pay-one'=>'b2b',//b2b购物车修改数量
        'b2b/order/zjgm'=>'b2b',//b2b购物车修改数量
        'spending/list'=>'spending/list',//消费单
        'spending/one'=>'spending/list',//消费单
        'withdraw/yl'=>'withdraw',//提现
        'withdraw/list'=>'withdraw',//提现
        'withdraw/add'=>'withdraw',//提现
        'message/list-message'=>'message',//留言
        'message/create'=>'message',//留言
        'message/message'=>'message',//留言
        'statement/actual-data'=>'statement/actual-data',//报表系统
        'statement/operating-data'=>'statement/actual-data',//报表系统
        'statement/wx-user'=>'statement/actual-data',//报表系统
        'statement/goods'=>'statement/actual-data',//报表系统
        'vip/list-vip'=>'vip/list-vip',//会员列表
        'vip/search'=>'vip/list-vip',//会员列表
        'vip/pay'=>'vip/pay',//会员充值
        'vip/pay-list'=>'vip/pay-list',//会员充值记录
        'vip/print'=>'vip/pay-list',//会员打印和查看详情
        'vip/consume'=>'vip/consume',//会员消费记录
        'vip/create'=>'vip/create',//会员添加
        'vip/delete'=>'vip/delete',//会员删除
        'jiaoban/init'=>'jiaoban',//交班初始化
        'jiaoban/save'=>'jiaoban',//交班保存
        'jiaoban/list'=>'jiaoban/list',//交班记录
        'information/unread'=>'information',//消息通知
        'information/read'=>'information',//消息通知
        'information/count'=>'information',//消息通知

    ],


    /* 数据库中添加的数据*/
    'databaseRbacList'=>[
        # 设置中心
        ['name'=>'qrcode/store','description'=>'生成二维码','data'=>'setting'],
        ['name'=>'role/index','description'=>'权限管理','data'=>'setting'],
        ['name'=>'goods/config','description'=>'商品管理权限','data'=>'setting'],
        ['name'=>'unit/config','description'=>'商品单位权限','data'=>'setting'],
        ['name'=>'dosing/config','description'=>'商品原料权限','data'=>'setting'],
        ['name'=>'discount/config','description'=>'优惠添加操作','data'=>'setting'],
        ['name'=>'users/config','description'=>'员工操作','data'=>'setting'],
        ['name'=>'jiaoban/index','description'=>'交班预留金额设置','data'=>'setting'],
        ['name'=>'draw/list','description'=>'抽奖配置','data'=>'setting'],
        ['name'=>'draw/index','description'=>'奖品领取','data'=>'draw'],
        ['name'=>'vip/get-all','description'=>'会员管理','data'=>'setting'],
        ['name'=>'charg/add','description'=>'收费规则管理','data'=>'setting'],
        ['name'=>'charg/buffer-time','description'=>'缓冲时间','data'=>'setting'],
        ['name'=>'payment/payment-select','description'=>'支付时间','data'=>'setting'],
        #库存管理
        ['name'=>'erp/goods-list','description'=>'库存商品列表','data'=>'repertory'],
        ['name'=>'erp/push','description'=>'库存入库','data'=>'repertory'],
        ['name'=>'erp/push-log','description'=>'库存入记录','data'=>'repertory'],
        ['name'=>'erp/pop','description'=>'库存出库','data'=>'repertory'],
        ['name'=>'erp/pop-log','description'=>'库存出库记录','data'=>'repertory'],
        ['name'=>'erp/pan-dian','description'=>'库存盘点记录','data'=>'repertory'],
        ['name'=>'erp/excel','description'=>'导出Excel','data'=>'repertory'],
        #营业模块
        ['name'=>'business/desktopstatus','description'=>'营业桌台显示','data'=>'business'],
        ['name'=>'business/add-goods','description'=>'增加消费','data'=>'business'],
        ['name'=>'business/table-goods-turn','description'=>'商品转台','data'=>'business'],
        ['name'=>'business/goods-close','description'=>'商品取消','data'=>'business'],
        ['name'=>'business/goods-giv','description'=>'商品转配','data'=>'business'],
        ['name'=>'business/merge','description'=>'合并账单','data'=>'business'],
        ['name'=>'business/table/table-turn','description'=>'更换台座','data'=>'business'],
        ['name'=>'business/begin-table-order','description'=>'开台','data'=>'business'],
        ['name'=>'business/orderInfo','description'=>'查看详情','data'=>'business'],
        ['name'=>'business/table','description'=>'台桌管理','data'=>'business'],
        ['name'=>'business/table-type','description'=>'台桌类型管理','data'=>'business'],
        ['name'=>'business/book','description'=>'预定权限','data'=>'business'],
        ['name'=>'business/order','description'=>'订单权限','data'=>'business'],
        ['name'=>'order/btxf','description'=>'吧台消费','data'=>'business'],
        #消费单
        ['name'=>'spending/list','description'=>'消费单','data'=>'consume'],
        #报表
        ['name'=>'statement/actual-data','description'=>'报表系统','data'=>'statement'],
        #提现
        ['name'=>'withdraw','description'=>'提现管理','data'=>'withdraw'],
        #留言
        ['name'=>'message','description'=>'留言','data'=>'message'],
        #公共模块
        ['name'=>'jiaoban','description'=>'交班','data'=>'common'],
        ['name'=>'message','description'=>'留言','data'=>'common'],
        ['name'=>'information','description'=>'消息','data'=>'common'],
        ['name'=>'jiaoban/list','description'=>'交班记录','data'=>'common'],
        #B2B
        ['name'=>'b2b','description'=>'b2b商场权限','data'=>'b2b'],
        #会员
        ['name'=>'vip/list-vip','description'=>'查看会员','data'=>'member'],
        ['name'=>'vip/pay','description'=>'会员充值','data'=>'member'],
        ['name'=>'vip/pay-list','description'=>'会员充值记录','data'=>'member'],
        ['name'=>'vip/consume','description'=>'会员消费记录','data'=>'member'],
        ['name'=>'vip/create','description'=>'会员添加','data'=>'member'],
        ['name'=>'vip/delete','description'=>'会员删除','data'=>'member'],
    ]
];
