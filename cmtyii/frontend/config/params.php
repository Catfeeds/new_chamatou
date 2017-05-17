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
];
