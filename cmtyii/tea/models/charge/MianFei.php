<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\models\charge;


class MianFei extends Object
{
    /**
     * 设置价格
     * @param $price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    /**
     * 加载数据库的值
     * @param $db
     */
    public function LoadDbData($db)
    {
        $this->setId($db['id']);
        $this->setType($db['type']);
        $this->setName($db['name']);
        $data = unserialize($db['value']);
        $this->setPrice($data['price']);
    }

    /**
     * 获取数据保存字符串
     * @return string
     */
    public function saveDB()
    {
        return serialize([
            'price'=>$this->price,
        ]);
    }


    /**
     * 获取数组
     */
    public function getArray()
    {
        $data['name']       = $this->name;
        $data['type']       = $this->type;
        $data['price']      = $this->price;
        return $data;
    }
}