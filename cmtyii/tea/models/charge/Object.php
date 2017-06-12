<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\models\charge;

class Object
{
    /**
     * 设置ID
     * @var string
     */
    public $id = '';
    /**
     * 计费类型
     * @var string
     */
    public $type = '';
    /**
     * 计费名称
     * @var string
     */
    public $name = '';
    /**
     * 价格
     * @var string
     */
    public $price = 0;

    /**
     * 获取数据保存字符串
     * @return string
     */
    public function saveDB()
    {
        return serialize([
            'price' => $this->price,
        ]);
    }

    /**
     * 设置价格
     * @param $price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    /**
     * 设置ID
     * @param $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * 设置name
     * @param $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * 设置类型
     * @param $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }
}