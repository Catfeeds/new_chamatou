<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\models;

use yii\helpers\ArrayHelper;

/**
 * Class RBAC
 * @package tea\models
 */
class RBAC
{

    /**
     * RBAC设置角色名称
     * @param $name
     * @return string
     */
    public static function setRoleName($name)
    {
        if (empty($name)) {
            return $name;
        }

        $name = $name . '__' . \Yii::$app->session->get('shoper_id');
        return $name;
    }

    /**
     * 解析角色
     * @param $name
     * @return string
     */
    public static function getRoleName($name)
    {
        if (empty($name)) {
            return $name;
        }

        if(substr($name,(strpos($name,'__')+2)) == \Yii::$app->session->get('shoper_id')){
            $strShoper = '__' . \Yii::$app->session->get('shoper_id');
            $name = strstr($name, $strShoper, true);
        }else{
            $name = false;
        }
        return $name;
    }

    /**
     * 判断用户角色是否存在
     * @param $role_name
     * @return bool|null|\yii\rbac\Role
     */
    public static function isRoleNameExist($role_name)
    {
        $auto = \Yii::$app->authManager;
        $data = $auto->getRole(RBAC::setRoleName($role_name));
        if ($data) {
            return $data;
        }
        return false;
    }

    /**
     * 解绑定管理员与角色的关系
     * @param $pa
     * @return bool
     */
    public static function revokeUserRoleName($pa)
    {
        $auto = \Yii::$app->authManager;
        $admins = $auto->getRole(RBAC::setRoleName($pa['role_name']));
        return $auto->revoke($admins, $pa['user_id']);
    }

    /**
     * 绑定管理员与角色的关系
     * @param $pa
     * @return \yii\rbac\Assignment
     */
    public static function addUserRoleName($pa)
    {
        $auto = \Yii::$app->authManager;
        $admins = $auto->getRole(RBAC::setRoleName($pa['role_name']));
        return $auto->assign($admins, $pa['user_id']);
    }

    /**
     * 通过用户ID获取用户的角色名称
     * @param $user_id
     * @return string
     */
    public static function getUserRoleNameByUserId($user_id)
    {
        $auto = \Yii::$app->authManager;
        $data = $auto->getRolesByUser($user_id);
        $data = ArrayHelper::toArray($data);
        $data = reset($data);
        if ($data) {
            return RBAC::getRoleName($data['name']);
        }
        return '';
    }

    /**
     * 获取所有角色
     * @return array
     */
    public static function getRoleNameAll()
    {
        $auto = \Yii::$app->authManager;
        $data = $auto->getRoles();
        $data = ArrayHelper::toArray($data);
        $list = [];
        foreach ($data as $key => $value) {
            if($ret = RBAC::getRoleName($key)){
                $list[] = $ret;
            }
        }
        return $list;
    }

    /**
     * 判断当前登录用户是否有权限
     * @param $route
     * @return bool
     *
     */
    public static function validateRole($route)
    {
        /**
         * 检查是不是超级管理员！
         */
        if(\Yii::$app->session->get('is_admin')){
            return true;
        }
        /**
         * 检查不许要权限的
         */
        $notRbacUrlList = \Yii::$app->params['notRbacUrlList'];

        if (isset($notRbacUrlList[$route])) {
            return true;
        }

        /**
         * 检查需要的权限的
         */
        $rbacUrlList = \Yii::$app->params['rbacUrlList'];
        if (!isset($rbacUrlList[$route])) {
            return false;
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
        if(empty($rbacDataList) && \Yii::$app->session->get('is_admin') == 1){
            $rbacDataList = $auto->getPermissions();
            $admins = $auto->getRole(self::setRoleName('超级管理员'));
            if (!$admins) {
                $admins = $auto->createRole(self::setRoleName('超级管理员'));
                $auto->add($admins);
                $auto->assign($admins, \Yii::$app->user->id);
            }

            foreach ($rbacDataList as $key => $value) {
                    $auto->addChild($admins, $value);
            }
            unset($rbacDataList);
            $rbacDataList = ArrayHelper::toArray($auto->getPermissionsByUser(\Yii::$app->user->id));
        }
        unset($auto);

        $roleList = [
            'business' => [
                'length' => 0,
            ],
            'member' => [
                'length' => 0,
            ],
            'repertory' => [
                'length' => 0,
            ],
            'statement' => [
                'length' => 0,
            ],
            'consume' => [
                'length' => 0,
            ],
            'b2b' => [
                'length' => 0,
            ],
            'message' => [
                'length' => 0,
            ],
            'setting' => [
                'length' => 0,
            ],'withdraw'=>[
                'length' => 0,
            ],'common'=>[
                'length' => 0,
            ]
        ];
        foreach ($rbacDataList as $key => $item) {
            switch ($item['data']) {
                case 'business':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['business'][$name] = 1;
                    $roleList['business']['length']++;
                    break;
                case  'member':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['member'][$name] = 1;
                    $roleList['member']['length']++;
                    break;
                case  'repertory':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['repertory'][$name] = 1;
                    $roleList['repertory']['length']++;
                    break;
                case  'statement':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['statement'][$name] = 1;
                    $roleList['statement']['length']++;
                    break;
                case  'consume':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['consume'][$name] = 1;
                    $roleList['consume']['length']++;
                    break;
                case  'b2b':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['b2b'][$name] = 1;
                    $roleList['b2b']['length']++;
                    break;
                case  'message':
                    $name = str_replace('/','_',$item['name']);
                    $roleList['message'][$name] = 1;
                    $roleList['message']['length']++;
                    break;
                case  'setting':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['setting'][$name] = 1;
                    $roleList['setting']['length']++;
                    break;
                case  'withdraw':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['withdraw'][$name] = 1;
                    $roleList['withdraw']['length']++;
                    break;
                case  'common':
                    $name = str_replace('/','_',$item['name']);
                    $name = str_replace('-','_',$name);
                    $roleList['common'][$name] = 1;
                    $roleList['common']['length']++;
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
        if (!$admins) {
            $admins = $auth->createRole(self::setRoleName('超级管理员'));
            $auth->add($admins);
            $auth->assign($admins, \Yii::$app->user->id);
        }
        foreach ($item as $key => $value) {
            $isPer = $auth->getPermission($value['name']);
            if (!$isPer) {
                $temPer = $auth->createPermission($value['name']);
                $temPer->description = $value['description'];
                $temPer->data = $value['data'];
                $auth->add($temPer);
                $auth->addChild($admins, $temPer);
            }
        }
    }
}