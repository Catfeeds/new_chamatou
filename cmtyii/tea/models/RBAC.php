<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace  tea\models;

use yii\helpers\ArrayHelper;

/**
 * Class RBAC
 * @package tea\models
 */
class RBAC{

    /**
     * RBAC设置角色名称
     * @param $name
     * @return string
     */
    public static function setRoleName($name)
    {
        if(empty($name)){
            return $name;
        }

        $name = $name.'__'.\Yii::$app->session->get('shoper_id');
        return $name;
    }

    /**
     * 解析角色
     * @param $name
     * @return string
     */
    public static function getRoleName($name)
    {
        if(empty($name)){
            return $name;
        }

       $strShoper = '__'.\Yii::$app->session->get('shoper_id');
       $name = strstr($name,$strShoper,true);
       return $name;
    }

    /**
     * 判断当前登录用户是否有权限
     * @param $route
     * @return bool
     *
     */
    public static function validateRole($route)
    {
        $rbacUrlList = \Yii::$app->params['rbacUrlList'];
        if(!isset($rbacUrlList[$route])){
            return false ;
        }
        return \Yii::$app->user->can($rbacUrlList[$route]);
    }

    /**
     * 获取当前登录用户的所有权限
     * @return array
     */
    public static function getPermissions()
    {

        $auto = \Yii::$app->authManager;
        $rbacDataList = ArrayHelper::toArray($auto->getPermissionsByUser(\Yii::$app->user->id));
        unset($auto);

        $roleList = [
            'business'  =>[
                'length'=>1,
            ],
            'member'    =>[
                'length'=>1,
            ],
            'repertory' =>[
                'length'=>1,
            ],
            'statement' =>[
                'length'=>1,
            ],
            'consume'   =>[
                'length'=>1,
            ],
            'b2b'       =>[
                'length'=>1,
            ],
            'message'   =>[
                'length'=>1,
            ],
            'setting'   =>[
                'length'=>1,
            ]
        ];
        foreach ($rbacDataList as $key=>$item)
        {
            switch ($item['data']){
                case 'business':
                    $roleList['business'][$item['name']] = 1;
                    $roleList['business']['length'] ++;
                    break;
                case  'member':
                    $roleList['member'][$item['name']] = 1;
                    $roleList['member']['length'] ++;
                    break;
                case  'repertory':
                    $roleList['repertory'][$item['name']] = 1;
                    $roleList['repertory']['length'] ++;
                    break;
                case  'statement':
                    $roleList['statement'][$item['name']] = 1;
                    $roleList['statement']['length'] ++;
                    break;
                case  'consume':
                    $roleList['consume'][$item['name']] = 1;
                    $roleList['consume']['length'] ++;
                    break;
                case  'b2b':
                    $roleList['b2b'][$item['name']] = 1;
                    $roleList['b2b']['length'] ++;
                    break;
                case  'message':
                    $roleList['message'][$item['name']] = 1;
                    $roleList['message']['length'] ++;
                    break;
                case  'setting':
                    $roleList['setting'][$item['name']] = 1;
                    $roleList['setting']['length'] ++;
                    break;
            }
        }

        return $roleList;
    }

    /**
     * 开始使用的随时更新权限代码
     */
    public static function initAuth()
    {
        $item = \Yii::$app->params['databaseRbacList'];
        $auth = \Yii::$app->authManager;
        $admins = $auth->getRole(self::setRoleName('超级管理员'));
        if(!$admins){
            $admins = $auth->createRole(self::setRoleName('超级管理员'));
            $auth->add($admins);
            $auth->assign($admins,\Yii::$app->user->id);
        }
        foreach ($item as $key=>$value){
            $isPer = $auth->getPermission($value['name']);
            if(!$isPer){
                $temPer = $auth->createPermission($value['name']);
                $temPer->description = $value['description'];
                $temPer->data = $value['data'];
                $auth->add($temPer);
                $auth->addChild($admins,$temPer);
            }
        }
    }
}