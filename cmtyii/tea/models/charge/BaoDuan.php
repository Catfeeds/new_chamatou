<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\models\charge;

use yii\db\ActiveRecord;

class BaoDuan extends Object
{
    /**
     * 时段
     * @var int
     */
    public $shiDuan = 0;

    /**
     * 缓冲时间
     * @var int
     */
    public $huanChongTime = 0;

    /**
     * 超出时间
     * @var int
     */
    public $meiXiaoShiPrice = 0;

    /**
     * 设置时段
     * @param $shiDuan
     */
    public function setShiDuan($shiDuan)
    {
        $this->shiDuan = $shiDuan;
    }

    /**
     * 设置缓冲时间
     * @param $huanChongTime
     */
    public function setHuanChongTime($huanChongTime)
    {
        $this->huanChongTime = $huanChongTime;
    }

    /**
     * 设置超出时间的没小时价格
     * @param $meiXiaoShiPrice
     */
    public function setMeiXiaoShiPrice($meiXiaoShiPrice)
    {
        $this->$meiXiaoShiPrice = $meiXiaoShiPrice;
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
        $this->setShiDuan($data['sd']);
        $this->setHuanChongTime($data['hctime']);
        $this->setMeiXiaoShiPrice($data['xstime']);
    }

    /**
     * 获取数组
     */
    public function getArray()
    {
        $data['name']       = $this->name;
        $data['type']       = $this->type;
        $data['price']      = $this->price;
        $data['hctime']     = $this->huanChongTime;
        $data['xstime']     = $this->meiXiaoShiPrice;
        $data['sd']         = $this->shiDuan;
        return $data;
    }

    /**
     * 获取数据保存字符串
     * @return string
     */
    public function saveDB()
    {
        return serialize([
            'price' => $this->price,
            'sd' => $this->shiDuan,
            'hctime' => $this->huanChongTime,
            'xstime' => $this->meiXiaoShiPrice,
        ]);
    }

}