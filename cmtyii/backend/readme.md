初始化过程
========
1.初始化
-------

```
composer install
./yii init

```


2.更改配置文件
------------

```
return [
    'modules' => [
        'admin' => [
            'class' => 'mdm\admin\Module',
             'layout' => 'left-menu',//yii2-admin的导航菜单
        ]
        ...
    ],
    ...
    'components' => [
        ...
        'authManager' => [
            'class' => 'yii\rbac\DbManager', // 使用数据库管理配置文件
        ]
    ],
    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            'site/*',//允许访问的节点，可自行添加
            'admin/*',//允许所有人访问admin节点及其子节点
        ]
    ],
];

```



3.执行数据迁移
------------
```
$ yii migrate
$ yii migrate --migrationPath=@mdm/admin/migrations
$ yii migrate --migrationPath=@yii/rbac/migrations
```



4. coding start
---------------

http#//localhost/path/to/index.php?r=admin


使用方法可以参考
--------------
https://github.com/michaelweixi/blogdemo2