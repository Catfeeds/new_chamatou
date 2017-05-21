<?php
return[
    'false'     =>'操作失败',
    'rabc_no_prieate' => '没有操作权限',
    'global'  => [
        'true'      => '成功',
        'false'     => '失败',
    ],
    'model'   => [
        'integer'   => '参数为整数',
        'string'    => '为字符串',
        'required'  => '不能为空',
    ],
    'user'    => [
        'loginTrue' =>  '登录成功',
        'password'  =>  '用户密码不正确',
        'phone'     =>  '手机不正确',
        'null'      =>  '手机号/密码不能为空',
        'shoper_null' => '商家不存在',
        'user_status'=>  '用户冻结',
    ],
    'table'   =>[
        'param_type_error'          =>'参数类型不正确',
        'param_type_null'           => '参数不能为空',
        'table_type_name_null'      => '台座类型名称不能为空啊',
        'table_type_type_null'      => '收费类型不能为空',
        'table_type_null'           => '台座类型不存在',
        'table_type_edit_id_null'   => '操作ID不存在',
        'table_type_name_exist'     => '台座类型名称存在',
        'add_log_true'              => '添加台座类型成功:%s',
        'edit_log_true'             => '修改台座类型成功:%s',
        'del_log_true'              => '删除台座类型成功:%s',
        'true'                      => '成功',
        'false'                     => '失败',
        'del_table_type_null'       => '删除分类不存在',
        'del_table_to_table'        => '分类删除失败，因为该分类下存在台座',
        'table_name_null'           => '台座名称不能为空啊',
        'table_name_exist'          => '台座名称存在',
        'add_log_true'              => '添加台座成功:%s',
        'edit_log_true'             => '修改台座成功:%s',
        'del_log_true'              => '删除台座成功:%s',
        'table_useing'              => '台座使用中',
        'sanzuo'                    => '散座',
        'baoxiang'                  => '包厢'
    ],
    'vip'   =>[
        'phone_exits'               => '手机号存在',
        'phone_null'                => '会员不存在'
    ],
    'message_peixunzhichi'          => '培训支持',
    'message_huodongshenqing'       => '活动申请',
    'message_guanggaosheji'         => '广告设计',

    'book_table_not_null'           =>'台座不空，所有无法预定',
    'book_close_flase'              =>'台座状态未处于预定',

    'book_table_null'               =>'台座不存在',
    'book_table_not_null'           =>'台座不未空，所有无法开台',
    'table_order_null'              =>'转台台座无订单',
    'table_order_true'              =>'指定台座有订单',
    'table_goods_null'              =>'消费商品不存在',
    'table_merge_table_null_order'  =>'台座无订单',
    'table_merge_null_order'        =>'合并台座未查询到结果',

    'vip_del_pay'                   =>'会员充值记录删除失败',


    'goods_cate_id_exist'           =>'商品分类ID不存在',
    'goods_cate_name_exist'         =>'商品分类名称已经存在',
    'goods_cate_name_use_ing'       =>'分类使用中、所以不能删除',
    'goods_id_not_exist'            =>'商品不存在',
    'goods_stock_not_push'          =>'不能进行入库操作',
    'stock_min_stock'               =>'出库数量大于现有库存量',

    'unit_id_exist'                 =>'商品单位ID不存在',
    'unit_name_exist'               =>'单位名称已经存在',
    'unit_name_use_ing'             =>'单位使用中、所以不能删除',

    'dosing_name_exist'             =>'原料已经存在',
    'dosing_unit_not_exist'         =>'原料单位不存在',
    'dosing_number_exist'           =>'编号已经存在',
    'dosing_id_exist'               =>'商品原料ID不存在',
    'dosing_use_ing'                =>'原料使用中，不能被删除',

    'discount_id_not_exist'         =>'优惠ID不存在',

    'phone_exist'                   =>'用户已经存在',

    'b2b_goods_exist'               =>'商品不存在',
    'b2b_goods_stack'               =>'商品库存不足',
    'b2b_goods_num_not_0'           =>'商品库存不能为空',
    'b2b_address_exist'             =>'收货地址不存在',

    'withdraw_total_not'                =>'茶币余额不足'

];