<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\controllers;

use tea\models\RBAC;
use yii\helpers\ArrayHelper;

class  RoleController extends ObjectController
{

    public function actionInit()
    {
        return ['code' => 1, 'msg' => 'ok', 'data' => \Yii::$app->params['rbacInitList']];
    }

    public function actionGetRoles()
    {
        return ['code' => 1, 'msg' => 'ok', 'data' => RBAC::getPermissions()];
    }

    /**
     * @return array
     */
    public function actionAdd()
    {
        $roleArr = \Yii::$app->request->post('role_list');
        $roleName = \Yii::$app->request->post('role_name');
        $auth = \Yii::$app->authManager;
        $role = $auth->getRole(RBAC::setRoleName($roleName));
        if (empty($roleName)) {
            return ['code' => 0, 'msg' => '角色名不能为空！'];
        }
        if ($role) {
            return ['code' => 0, 'msg' => '角色名存在！'];
        }
        $admins = $auth->createRole(RBAC::setRoleName($roleName));
        $auth->add($admins);
        foreach ($roleArr as $key => $value) {

            $temp = $auth->getPermission($value);
            $auth->addChild($admins, $temp);
        }
        return ['code' => 1, 'msg' => '成功！'];
    }

    /**
     * 修改操作
     * @return array
     */
    public function actionEdit()
    {
        if (\Yii::$app->request->isGet) {
            $roleName = \Yii::$app->request->get('role_name');
            $auth = \Yii::$app->authManager;
            $role = $auth->getRole(RBAC::setRoleName($roleName));
            if ($role) {
                $databaseAuth = ArrayHelper::toArray($auth->getPermissionsByRole(RBAC::setRoleName($roleName)));
                $locaAuth = [];
                foreach ($databaseAuth as $key => $value) {
                    $locaAuth[] = $key;
                }
                unset($databaseAuth);
                $dataList = [];
                $rbacInitList = \Yii::$app->params['rbacInitList'];
                /**
                 * 排序算法
                 */
                for ($i = 0; $i < sizeof($rbacInitList); $i++) {
                    for ($j = 0; $j < sizeof($rbacInitList[$i]['list']); $j++) {
                        foreach ($rbacInitList[$i]['list'][$j]['list'] as $key => $value) {
                            foreach ($locaAuth as $kkey => $vvalue) {
                                if ($vvalue == $value['value']) {
                                    $dataList[$i]['name'] = $rbacInitList[$i]['name'];
                                    $dataList[$i]['list'][$j]['name'] = $rbacInitList[$i]['list'][$j]['name'];
                                    $dataList[$i]['list'][$j]['list'][$key] = $value;
                                }
                            }
                        }
                    }
                }
                /**
                 * 去处第一个坐标
                 */
                $temp = [];
                foreach ($dataList as $key => $value) {
                    $temp[] = $value;
                }
                /**
                 * 去除第二个角标
                 */
                $dataList = $temp;
                foreach ($dataList as $key => $value) {
                    unset($temp[$key]['list']);
                    foreach ($value['list'] as $kkey => $vvalue) {
                        $temp[$key]['list'][] = $vvalue;
                    }
                }

                return ['code' => 1, 'msg' => '成功！', 'data' => $temp];
            }
            return ['code' => 0, 'msg' => '角色名不存在！'];
        } elseif (\Yii::$app->request->isPost) {
            $auth = \Yii::$app->authManager;
            $roleArr = \Yii::$app->request->post('role_list');
            $roleName = \Yii::$app->request->post('role_name');
            if($roleName == '超级管理员'){
                return ['code'=>0,'msg'=>'超级管理员不能修改！'];
            }
            $user_id = $auth->getUserIdsByRole(RBAC::setRoleName($roleName));
            $role = $auth->getRole(RBAC::setRoleName($roleName));
            $auth->removeChildren($role);//移除所有权限
            foreach ($roleArr as $key => $value) {

                $temp = $auth->getPermission($value);
                $auth->addChild($role, $temp);
            }
            return ['code' => 1, 'msg' => '成功！'];

        }
    }

    /**
     * 删除成功！
     * @return array
     */
    public function actionDel()
    {
        $roleName = \Yii::$app->request->post('role_name');
        if($roleName == '超级管理员'){
            return ['code'=>0,'msg'=>'超级管理员不能删除！'];
        }
        $auth = \Yii::$app->authManager;
        $user_id = $auth->getUserIdsByRole(RBAC::setRoleName($roleName));
        if($user_id){
            return ['code'=>0,'msg'=>'该角色有员工绑定！不能删除'];
        }
        $role = $auth->getRole(RBAC::setRoleName($roleName));
        $auth->remove($role);
        return ['code'=>1,'msg'=>'删除成功！'];
    }

    /**
     * 方法暂时没有使用／代码有点乱
     * @return array
     */
    public function actionOne()
    {
        if (\Yii::$app->request->isGet) {
            $roleName = \Yii::$app->request->post('role_name');
            $auth = \Yii::$app->authManager;
            $role = $auth->getRole(RBAC::setRoleName($roleName));
            if ($role) {
                $databaseAuth = ArrayHelper::toArray($auth->getPermissionsByRole(RBAC::setRoleName($roleName)));
                $locaAuth = [];
                foreach ($databaseAuth as $key => $value) {
                    $locaAuth[] = $key;
                }
                unset($databaseAuth);
                $dataList = [];
                $rbacInitList = \Yii::$app->params['rbacInitList'];

                for ($i = 0; $i < sizeof($rbacInitList); $i++) {
                    for ($j = 0; $j < sizeof($rbacInitList[$i]['list']); $j++) {
                        foreach ($rbacInitList[$i]['list'][$j]['list'] as $key => $value) {
                            foreach ($locaAuth as $kkey => $vvalue) {
                                if ($vvalue == $value['value']) {
                                    $dataList[$i]['name'] = $rbacInitList[$i]['name'];
                                    $dataList[$i]['list'][$j]['name'] = $rbacInitList[$i]['list'][$j]['name'];
                                    $dataList[$i]['list'][$j]['list'][$key] = $value;
                                }
                            }
                        }
                    }
                }

                /**
                 * 去处第一个坐标
                 */
                $temp = [];
                foreach ($dataList as $key => $value) {
                    $temp[] = $value;
                }
                /**
                 * 去除第二个角标
                 */
                $dataList = $temp;
                foreach ($dataList as $key => $value) {
                    unset($temp[$key]['list']);
                    foreach ($value['list'] as $kkey => $vvalue) {
                        $temp[$key]['list'][] = $vvalue;
                    }
                }
                $dataList = $temp;


                $html = '<table border="1">';
                $xx = false;
                $xxx = false;
                for ($i = 0; $i < sizeof($dataList); $i++) {
                    $rowspanOneNum = 0;
                    $rowspanTowNum = 0;
                    $tow = '';
                    $ton = '';
                    $x = 0;
                    for ($j = 0; $j < sizeof($dataList[$i]['list']); $j++) {
                        $rowspanTowNum = sizeof($dataList[$i]['list'][$j]['list']);
                        $rowspanOneNum += sizeof($dataList[$i]['list'][$j]['list']);
                        foreach ($dataList[$i]['list'][$j]['list'] as $key => $value) {
                            if ($xx == false) {
                                $xx = $value['name'];
                                $jj = $rowspanTowNum;
                                $k = $jj;
                                $jjName = $dataList[$i]['list'][$j]['name'];
                            } elseif ($x == 0 && $k <= 0) {
                                $x++;
                                $tow .= "<tr>";
                                $tow .= "<td rowspan='" . $rowspanTowNum . "'>";
                                $tow .= $value['name'];
                                $tow .= "</td>";
                                $tow .= "<td>";
                                $tow .= $value['name'];
                                $tow .= "</td>";
                                $tow .= "</tr>";

                            } else {
                                $tow .= "<tr>";
                                $tow .= "<td>";
                                $tow .= $value['name'];
                                $tow .= "</td>";
                                $tow .= "</tr>";
                            }
                            $k--;
                        }
                        $x = 0;
                    }
                    $html .= "<tr>";
                    $html .= "<td rowspan='" . $rowspanOneNum . "'>";
                    $html .= $dataList[$i]['name'];
                    $html .= "</td>";
                    $html .= "<td rowspan='" . $jj . "'>";
                    $html .= $jjName;
                    $html .= "</td>";
                    $html .= "<td>";
                    $html .= $xx;
                    $html .= "</td>";
                    $html .= "</tr>";
                    $html .= $tow;
                    $xx = false;
                }
                $html .= "</table>";
                echo $html;
                exit();
                return ['code' => 1, 'msg' => '成功！', 'data' => $html];
            }
            return ['code' => 0, 'msg' => '角色名不存在！'];
        }
    }
}