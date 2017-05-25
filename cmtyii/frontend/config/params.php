<?php
return [
    'adminEmail' => 'admin@example.com',
    'sms'=>[
        'type' => 'ALIDAYU',//短信发送类型 只支持 ALIDAYU(阿里大于) ALIYUN(阿里云)
        'ak' => '23613453', //第三方appkey
        'sk' => '9fc60db9f9b83dfa37ad62281ab281a2',//第三方secretkey
        'signname' => '御达呼', //模板签名
        'templatecode' => 'SMS_43240124',//签名ID
    ],
    'picurl' => 'http://zh.chamatou.cn/public',
    'WECHAT'=>[
        'app_id'  => 'wx3a8c350faa88e646',         // AppID
        'secret'  => '9fee3d531dcd68e50c19c4941a033fb8',     // AppSecret
        'token'   => 'weixinchamatou',          // Token
        'aes_key' => '',                    // EncodingAESKey，安全模式下请一定要填写！！！
        'oauth' => [
            'scopes'   => ['snsapi_userinfo'],
            'callback' => 'http://127.0.0.1.tunnel.qydev.com/index/callback',//授权回调地址
        ],
        'guzzle' => [
            'timeout' => 300, // 超时时间（秒）
            //'verify' => false, // 关掉 SSL 认证（强烈不建议！！！）
        ],
        'payment' => [
            'merchant_id'        => '1241023702',
            'key'                => '6393246e2aecabb5caf267f3cabc1b7f',
            'cert_path'          => 'F:\project\cmt\chamatou\cmtyii\frontend\web', // XXX: 绝对路径！！！！
            'key_path'           => 'F:\project\cmt\chamatou\cmtyii\frontend\web',      // XXX: 绝对路径！！！！
            'notify_url'         => 'http://127.0.0.1.tunnel.qydev.com/wechat/notify',       // 你也可以在下单时单独设置来想覆盖它
            // 'device_info'     => '013467007045764',
            // 'sub_app_id'      => '',
            // 'sub_merchant_id' => '',
            // ...
        ],
    ],
];
