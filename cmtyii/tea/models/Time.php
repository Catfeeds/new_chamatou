<?php

namespace tea\models;

class Time
{
    /**
     * 格式化时间消费总计多少小时
     * @param $start_time
     * @param $end_time
     * @return string
     */
    public static function ToHour($start_time, $end_time)
    {

        if ($end_time == '' || $end_time == 0) {
            $time = time() - $start_time;
        } else {
            $time = $end_time - $start_time;
        }
        $d = floor($time / 86400);
        $h = floor($time % 86400 / 3600);
        $i = floor($time % 86400 % 3600 / 60);
        if ($d >= 1) {
            return "{$d}天{$h}小时{$i}分钟";
        }
        return "{$h}小时{$i}分钟";
    }
}
