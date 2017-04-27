<aside class="main-sidebar">

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
                'items'   => [
                    ['label' => 'Menu Yii2', 'options' => ['class' => 'header']],
                    [
                        'label' => '权限管理',
                        'url'   => '#',
                        'items' => [
                            ['label' => '管理员管理', 'url' => ['/adminuser'],],
                            ['label' => '路由管理', 'url' => ['/admin/route'],],
                            ['label' => '权限管理', 'url' => ['/admin/permission'],],
                            ['label' => '菜单管理', 'url' => ['/admin/menu'],],
                            ['label' => '角色管理', 'url' => ['/admin/role'],],
                            ['label' => '用户管理', 'url' => ['/adminuser'],],

                        ],
                    ],
                    ['label' => '商户管理', 'url' => ['/shoper']],
                    ['label' => '提现管理', 'url' => ['/withdraw']],
                    ['label' => '充值记录', 'url' => ['/#']],
                    ['label' => '留言管理', 'url' => ['/message']],
                    ['label' => 'B2B商城管理', 'url' => ['/#']],
                    ['label' => '统计中心', 'url' => ['/dataCenter']],
                    ['label' => '业务员管理', 'url' => ['/salesman']],
                ],
            ]
        ) ?>

    </section>

</aside>
