<?php
return [
    'adminEmail' => 'admin@example.com',
    'pageSize'   => 2,# 分页 一页的显示数量
    'minTime'    => 0,# 茶坊忽略的时间 分钟

    //添加角色的列表
    'rbacInitList'       =>[
        [
            'name'=>'公共模块',
            'list'=>[
                [
                    'name'=>'交班',
                    'list'=>[
                      ['name'=>'交班','value' => '1','select'=>0],
                    ],
                ],
                [
                    'name'=>'个人交班记录',
                    'list'=>[
                        ['name'=>'个人交班记录' ,'value'=>'2','select'=>0],
                    ],
                ],
                [
                    'name'=>'查看全部交班记录',
                    'list'=>[
                        ['name'=>'查看全部交班记录' ,'value'=>'3','select'=>0],
                    ],
                ]
            ],
        ],
        [
            'name'=>'营业管理',
            'list'=>[
                [
                    'name'=>'预定',
                    'list'=>[
                        ['name'  =>'新增预约', 'value'   =>'table/begin-table-order', 'select'=>0],
                        ['name'  =>'查看已预约', 'value'   =>'table/begin-table-order-and-book', 'select'=>0],
                        ['name'  =>'取消预约', 'value'   =>'table/gettableorder', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'开单台座管理',
                    'list'=>[
                        ['name'  =>'开台', 'value'   =>'table/begin-table-order11', 'select'=>0],
                        ['name'  =>'更换台座', 'value'   =>'table/begin-table-order-and-book22', 'select'=>0],
                        ['name'  =>'合并账单', 'value'   =>'table/gettableorder33', 'select'=>0],
                        ['name'  =>'商品转配', 'value'   =>'table/gettableorder44', 'select'=>0],
                        ['name'  =>'商品取消', 'value'   =>'table/gettableorder55', 'select'=>0],
                        ['name'  =>'商品转台', 'value'   =>'table/gettableorder66', 'select'=>0],
                        ['name'  =>'增加消费', 'value'   =>'table/gettableorder77', 'select'=>0],
                        ['name'  =>'查看', 'value'   =>'table/gettableorder88', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'吧台消费',
                    'list'=>[
                        ['name'  =>'吧台消费', 'value'   =>'table/begin-table-order99', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'分类管理',
                    'list'=>[
                        ['name'  =>'编辑', 'value'   =>'table/begin-table-order111', 'select'=>0],
                        ['name'  =>'删除', 'value'   =>'table/begin-table-order-and-boo22k', 'select'=>0],
                        ['name'  =>'新增', 'value'   =>'table/gettableorde232r', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'台座管理',
                    'list'=>[
                        ['name'  =>'新增台座', 'value'   =>'table/begin-table121-order', 'select'=>0],
                        ['name'  =>'编辑台桌', 'value'   =>'table/begin-table-or32152der-and-book', 'select'=>0],
                        ['name'  =>'删除台桌', 'value'   =>'table/gettableorde1455r', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'结账',
                    'list'=>[
                        ['name'  =>'手动优惠', 'value'   =>'table/begin-table-ord21425er', 'select'=>0],
                        ['name'  =>'结账', 'value'   =>'table/begin-table-order-and-bo5145ok', 'select'=>0],
                        ['name'  =>'免单', 'value'   =>'table/gettableorder4154', 'select'=>0],
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
                        ['name'  =>'添加会员', 'value'   =>'table/begin-table-o122514rder', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'会员列表',
                    'list'=>[
                        ['name'  =>'编辑', 'value'   =>'table/begin-table-orde212r', 'select'=>0],
                        ['name'  =>'删除', 'value'   =>'table/begin-table-order-a121nd-book', 'select'=>0],
                        ['name'  =>'充值', 'value'   =>'table/gettableorde5142r', 'select'=>0],
                        ['name'  =>'充值记录', 'value'   =>'table/gettableorde1454r', 'select'=>0],
                        ['name'  =>'消费记录', 'value'   =>'table/gettableorde1454r', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'库存管理',
            'list'=>[
                [
                    'name'=>'商品管理',
                    'list'=>[
                        ['name'  =>'查看商品列表', 'value'   =>'table/begin-table121-order11', 'select'=>0],
                        ['name'  =>'计入库存', 'value'   =>'table/begin-table-order121', 'select'=>0],
                        ['name'  =>'编辑商品', 'value'   =>'table/begin-table-orde121r', 'select'=>0],
                        ['name'  =>'绑定原料', 'value'   =>'table/begin-table-order2121', 'select'=>0],
                        ['name'  =>'删除', 'value'   =>'table/begin-table-order51454', 'select'=>0],
                        ['name'  =>'查看销售流水', 'value'   =>'table/begin-table-or1454der', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'原料管理',
                    'list'=>[
                        ['name'  =>'入库', 'value'   =>'table/begin-4-order', 'select'=>0],
                        ['name'  =>'盘存', 'value'   =>'table/begin-table-4', 'select'=>0],
                        ['name'  =>'编辑', 'value'   =>'table/begin-table-orderdasd', 'select'=>0],
                        ['name'  =>'报废', 'value'   =>'table/begin-table-o41rder', 'select'=>0],
                        ['name'  =>'查看使用详情', 'value'   =>'table/begin-454-order', 'select'=>0],
                        ['name'  =>'添加单位', 'value'   =>'table/begin-tabl242e-order', 'select'=>0],
                        ['name'  =>'新增原料', 'value'   =>'table/begin-4-order', 'select'=>0],
                        ['name'  =>'查看原料库存', 'value'   =>'table/begin-ta45ble-order', 'select'=>0],
                    ],
                ],
                [
                    'name'=>'入库记录',
                    'list'=>[
                        ['name'  =>'入库记录', 'value'   =>'table/begin-table-454', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'盘存记录',
                    'list'=>[
                        ['name'  =>'盘存记录', 'value'   =>'table/begin-table-54', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'出库记录',
                    'list'=>[
                        ['name'  =>'出库记录', 'value'   =>'table/begin-457-order', 'select'=>0]
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
                        ['name'  =>'消费单', 'value'   =>'table/begin-757-order', 'select'=>0]
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
                        ['name'  =>'留言模块', 'value'   =>'table/begin-77-order', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'提现管理',
            'list'=>[
                [
                    'name'=>'查看提现申请列表',
                    'list'=>[
                        ['name'  =>'查看提现申请列表', 'value'   =>'table/888-table-order', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'申请提现',
                    'list'=>[
                        ['name'  =>'申请提现', 'value'   =>'table/begin-978-order', 'select'=>0]
                    ],
                ],
            ]
        ],
        [
            'name'=>'B2B商城',
            'list'=>[
                [
                    'name'=>'B2B商城',
                    'list'=>[
                        ['name'  =>'B2B商城', 'value'   =>'table/begin-87887-order', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'授信管理',
            'list'=>[
                [
                    'name'=>'授信管理',
                    'list'=>[
                        ['name'  =>'授信管理', 'value'   =>'table/begin-575788-order', 'select'=>0]
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
                        ['name'  =>'报表管理', 'value'   =>'table/begin-8454-order', 'select'=>0]
                    ],
                ]
            ]
        ],
        [
            'name'=>'设置',
            'list'=>[
                [
                'name'=>'生成二维码',
                'list'=>[
                    ['name'  =>'生成二维码', 'value'   =>'table/begin-table587524-order', 'select'=>0]
                ],
                ],
                [
                    'name'=>'优惠配置',
                    'list'=>[
                        ['name'  =>'优惠配置', 'value'   =>'table/begin-58754578-order', 'select'=>0]
                    ],
                ],
                [
                    'name'=>'员工管理',
                    'list'=>[
                        ['name'  =>'员工管理', 'value'   =>'table/begin-78985454-order', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'单位配置',
                    'list'=>[
                        ['name'  =>'单位配置', 'value'   =>'table/begin-table-o878415rder', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'交班配置',
                    'list'=>[
                        ['name'  =>'交班配置', 'value'   =>'table/begin-table-8781458', 'select'=>0]
                    ]
                ],
                [
                    'name'=>'权限管理',
                    'list'=>[
                        ['name'  =>'权限管理', 'value'   =>'table/begin-871587-order', 'select'=>0]
                    ]
                ]
            ]
        ],
    ],

    /* 判断权限下所包含的URL*/
    'rbacUrlList' =>[


        # 设置中心
        'role/init'  =>'role/index',//设置--初始化所有的权限列表
        'role/get-roles'  =>'role/index',//设置--获取当前用户所有权限

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
        'unit/get-one'=>'unit/config',//设置--获取商品的单位
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
        'users/get-list'=>'users/config',//设置--获取管理员列表

        'discount/add'=>'discount/config',//设置 -- 优惠操作 添加
        'discount/edit'=>'discount/config',//设置 -- 优惠操作 添加
        'discount/del'=>'discount/config',//设置 -- 优惠操作 添加
        'discount/get-list'=>'discount/config',//设置 -- 优惠操作 添加


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
        'order/goods-close'=>'business/goods-close',//商品转配
        'table/table-goods-turn'=>'business/table-goods-turn',//商品转配
        'table/add-goods'=>'business/add-goods',//商品转配
        'goods/list-goods'=>'business/add-goods',//商品列表
        'goods/search-goods'=>'business/add-goods',//商品列表
        'table/add-table'=>'business/add-table',//添加台座
        'table/edit-table'=>'business/edit-table',//修改台座
        'table/del-table'=>'business/del-table',//删除台座

        'b2b/default/index'=>'b2b',//b2b商场首页
        'b2b/category/index'=>'b2b',//b2b商品分类
        'b2b/goods/search'=>'b2b',//b2b商品搜索
        'b2b/users/info'=>'b2b',//b2b个人信息
        'b2b/cart/list'=>'b2b',//b2b购物车
        'b2b/cart/del'=>'b2b',//b2b删除购物车商品
        'b2b/cart/add'=>'b2b',//b2b添加商品到购物车
        'b2b/cart/edit-cart-num'=>'b2b',//b2b购物车修改数量

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

        ['name'=>'erp/goods-list','description'=>'库存商品列表','data'=>'repertory'],
        ['name'=>'erp/push','description'=>'库存入库','data'=>'repertory'],
        ['name'=>'erp/push-log','description'=>'库存入记录','data'=>'repertory'],
        ['name'=>'erp/pop','description'=>'库存出库','data'=>'repertory'],
        ['name'=>'erp/pop-log','description'=>'库存出库记录','data'=>'repertory'],
        ['name'=>'erp/pan-dian','description'=>'库存盘点记录','data'=>'repertory'],
        ['name'=>'erp/excel','description'=>'导出Excel','data'=>'repertory'],

        ['name'=>'business/desktopstatus','description'=>'营业桌台显示','data'=>'business'],
        ['name'=>'business/add-goods','description'=>'增加消费','data'=>'business'],
        ['name'=>'business/table-goods-turn','description'=>'商品转台','data'=>'business'],
        ['name'=>'business/goods-close','description'=>'商品取消','data'=>'business'],
        ['name'=>'business/goods-giv','description'=>'商品转配','data'=>'business'],
        ['name'=>'business/merge','description'=>'合并账单','data'=>'business'],
        ['name'=>'business/table/table-turn','description'=>'更换台座','data'=>'business'],
        ['name'=>'business/begin-table-order','description'=>'开台','data'=>'business'],
        ['name'=>'business/orderInfo','description'=>'查看详情','data'=>'business'],
        ['name'=>'business/del-table','description'=>'新增台座','data'=>'business'],
        ['name'=>'business/edit-table','description'=>'编辑台桌','data'=>'business'],
        ['name'=>'business/add-table','description'=>'删除台桌','data'=>'business'],


        ['name'=>'b2b','description'=>'b2b商场权限','data'=>'b2b'],

    ]
    /**
     *
     *
     *
     * 'list'=>[
    [
    'name'=>'预定',
    'list'=>[
    ['name'  =>'新增预约', 'value'   =>'table/begin-table-order', 'select'=>0],
    ['name'  =>'查看已预约', 'value'   =>'table/begin-table-order-and-book', 'select'=>0],
    ['name'  =>'取消预约', 'value'   =>'table/gettableorder', 'select'=>0],
    ],
    ],
    [
    [
    'name'=>'吧台消费',
    'list'=>[
    ['name'  =>'吧台消费', 'value'   =>'table/begin-table-order99', 'select'=>0],
    ],
    ],
    [
    'name'=>'分类管理',
    'list'=>[
    ['name'  =>'编辑', 'value'   =>'table/begin-table-order111', 'select'=>0],
    ['name'  =>'删除', 'value'   =>'table/begin-table-order-and-boo22k', 'select'=>0],
    ['name'  =>'新增', 'value'   =>'table/gettableorde232r', 'select'=>0],
    ],
    ],
    [
    'name'=>'结账',
    'list'=>[
    ['name'  =>'手动优惠', 'value'   =>'table/begin-table-ord21425er', 'select'=>0],
    ['name'  =>'结账', 'value'   =>'table/begin-table-order-and-bo5145ok', 'select'=>0],
    ['name'  =>'免单', 'value'   =>'table/gettableorder4154', 'select'=>0],
    ],
    ]
    ]
     */

];
