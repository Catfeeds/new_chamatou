<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    //require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php')
    //require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-tea',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'tea\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'b2b' => [
            'class' => 'tea\b2b\b2b',
        ],
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-tea',
            'cookieValidationKey' => 'DUccx3jwes3r_NxCnLaFX1jKwuwntp6T',
        ],
        'user' => [
            'identityClass' => 'tea\models\Users',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-tea', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the tea
            'name' => 'tea-cf',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        /*
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
        */
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,//隐藏index.php
            'enableStrictParsing' => false,
            'suffix' => '',//后缀，如果设置了此项，那么浏览器地址栏就必须带上.html后缀，否则会报404错误
            'rules' => [
                //'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
            ],
        ],
        'authManager' => [
            'class' => 'tea\rbac\DbManager',
            'itemTable' => 't_sp_auth_item',
            'assignmentTable' => 't_sp_auth_assignment',
            'itemChildTable' => 't_sp_auth_item_child',
            'ruleTable' => 't_sp_auth_rule',
        ],

    ],
    'timeZone' => 'Asia/Chongqing',
    'params' => $params,
    'language' => 'zh-CN',
];
