<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-tea',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'tea\controllers',
    'bootstrap' => ['log'],
    'modules' => [],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-tea',
        ],
        'user' => [
            'identityClass' => 'tea\models\Users',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-tea', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the tea
            'name' => 'advanced-tea',
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
    ],
    'params' => $params,
];
