<aside class="main-sidebar">
<style>
   
</style>
    <section class="sidebar">
        <?php
        $roles = Yii::$app->session->get('roles');

        $items = [];
        if(isset($roles['/statistics/store/index'])){
            $items[] = ['label' => '统计中心', 'url' => ['/statistics/store/index'], 'icon'=>'dashboard'];
        }

        if(isset($roles['/store/index'])){
            $items[] = ['label' => '门店管理', 'url' => ['/store'], 'icon'=>'tv'];
        }

        if(isset($roles['/withdraw/index'])){
            $items[] = ['label' => '提现管理', 'url' => ['/withdraw'], 'icon'=>'rmb'];
        }
        
        if(isset($roles['/users/userslist'])){
            $items[] = [
                'label' => '用户管理',
                'url' => ['/#'],
                'icon'=>'user',
                'items' => [
                    ['label' => '用户列表','url' => ['users/userslist']],
                    ['label' => '充值列表','url' => ['users/usersrecharge']],
                    ['label' => '消费列表','url' => ['users/usersreduce']],
                ]
            ];
        }

        if(isset($roles['/salesman/index'])){
            $items[] = ['label' => '业务员管理', 'url' => ['/salesman/index'], 'icon'=>'user-md'];
        }

        if(isset($roles['/admin/role/index'])){
            $items[] = [
                'label' => '权限管理',
                'url' => '#',
                'icon' => ' fa-get-pocket',
                'items' => [
                    ['label' => '管理员管理', 'url' => ['/adminuser'],],
                    ['label' => '分配', 'url' => ['/admin/assignment'],],
//                    ['label' => '路由管理', 'url' => ['/admin/route'],],
//                    ['label' => '权限管理', 'url' => ['/admin/permission'],],
//                    ['label' => '菜单管理', 'url' => ['/admin/menu'],],
//                    ['label' => '角色管理', 'url' => ['/admin/role'],],
                ]
            ];
        }

        if(isset($roles['/message/index'])){
            $items[] = ['label' => '留言管理', 'url' => ['/message'], 'icon'=>'comments'];
        }

        if(isset($roles['/goods/index'])){
            $items[] = [
                'label' => 'B2B商城管理',
                'url' => '#',
                'icon'=>'amazon',
                'items' => [
                    ['label' => '商品列表', 'url' => ['goods/index'],],
                    ['label' => '品类列表', 'url' => ['category/index'],],
                    ['label' => '订单管理', 'url' => ['order/index'],],
                ]
            ];
        }

        if(isset($roles['/credit/order'])){
            $items[] = [
                'label' => '授信',
                'url' => '#',
                'icon'=>'bank',
                'items' => [
                    ['label' => '授信订单', 'url' => ['credit/order']],
                    ['label' => '还款记录', 'url' => ['credit/refund']],
                ]
            ];
        }

        ?>
        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu'],
                'items' =>
                    $items,
            ]
        ) ?>

    </section>

</aside>
