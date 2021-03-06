<?php
/**
 * Created by PhpStorm.
 * User: harlen-z97
 * Date: 2017/5/8
 * Time: 上午12:34
 */

namespace backend\models\form;


use backend\models\Shoper;

class ShoperForm extends Shoper
{
    /**
     * 添加店铺主表信息
     * @return $this|bool
     */
    public function createShoper()
    {
        if (!$this->validate()) {
            return false;
        }
        $this->credit_amount = $this->credit_remain;
        $this->add_time = time();
        if($this->save()){
            return $this;
        }
        return false;
    }

    /**
     * 更新店铺的主表信息
     * @return array|bool
     */
    public function updateShoper()
    {
        if (!$this->validate()) {
            return false;
        }
        $model = self::findOne($this->id);
        /**
         * 修改授信
         */
        if($model->credit_remain != $this->credit_remain){
            /**
             * 判断授信是否合法
             */
            if((float)$this->credit_amount !== (float)$model->credit_remain){
                $this->addError('credit_remain','授信未还不能调整！');
                return false;
            }
            $this->credit_amount = $this->credit_remain;
        }
        if($this->save()){
            return $this;
        }
        return false;
    }
}