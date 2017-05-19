<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\models;
/**
 * Class Request
 * @package tea\models
 */
class Request
{
    /**
     * POST提交数据
     * @param string $url
     * @param string $param
     * @return bool|string
     */
    static function request_post($url = '', $param = '') {
        if (empty($url) || empty($param)) {
            return false;
        }
        $postUrl = $url;
//        $curlPost = http_build_query($param);
        $curlPost = Request::toXml($param);
        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
        curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/x-www-form-urlencoded'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
        $data = curl_exec($ch);//运行curl
        curl_close($ch);
        return $data;
    }

    /**
     * Array生成一个XML111
     * @param $array
     * @return string
     */
    public static function toXml($array)
    {
        $str = '<xml>';
        foreach ($array as $key=>$value)
        {
            $str.='<'.$key.'>'.$value.'</'.$key.'>';
        }
        $str.='</xml>';
        return $str;
    }
    /**
     * get调用接口
     * @param string $url
     * @return mixed
     */
    static function request_get($url = '')
    {
        return json_decode(file_get_content($url));
    }

}