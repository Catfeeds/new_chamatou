<aside class="main-sidebar">
<style>
   
</style>
    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>Alexander Pierce</p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
                <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu'],
                'items' => [
                    ['label' => 'Menu Yii2', 'options' => ['class' => 'header']],
                    [
                        'label' => '权限管理',
                        'url' => '#',
                        'items' => [
                            ['label' => '管理员管理', 'url' => ['/adminuser'],],
                            ['label' => '分配', 'url' => ['/admin/assignment'],],
                            ['label' => '路由管理', 'url' => ['/admin/route'],],
                            ['label' => '权限管理', 'url' => ['/admin/permission'],],
                            ['label' => '菜单管理', 'url' => ['/admin/menu'],],
                            ['label' => '角色管理', 'url' => ['/admin/role'],],

                        ],
                    ],
                    ['label' => '门店管理', 'url' => ['/store']],
//                    ['label' => '商铺管理', 'url' => ['/shoper']],
                    ['label' => '提现管理', 'url' => ['/withdraw']],
                    [
                        'label' => '用户管理',
                        'url' => ['/#'],
                        'items' => [
                             ['label' => '用户列表','url' => ['users/userslist']],
                             ['label' => '充值列表','url' => ['users/usersrecharge']],
                             ['label' => '消费列表','url' => ['users/usersreduce']],
                        ]
                    ],
                    ['label' => '留言管理', 'url' => ['/message']],
                    [
                        'label' => 'B2B商城管理',
                        'url' => '#',
                        'items' => [
                            ['label' => '商品列表', 'url' => ['goods/index'],],
                            ['label' => '品类列表', 'url' => ['category/index'],],
                            ['label' => '订单管理', 'url' => ['order/index'],],
                        ]
                    ],
                    ['label' => '统计中心', 'url' => ['/statistics/store/index']],
                    ['label' => '业务员管理', 'url' => ['/salesman']],
                    [
                            'label' => '授信',
                            'url' => '#',
                            'items' => [
                                    ['label' => '授信订单', 'url' => ['credit/order']],
                                    ['label' => '还款记录', 'url' => ['credit/refund']],
                            ]
                    ],
                ],
            ]
        ) ?>

    </section>

</aside>
