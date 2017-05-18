<?php
/**
 * Created by PhpStorm.
 * User: lrdouble
 * Date: 2017/5/18
 * Time: 下午1:55
 */
namespace common\widgets;

use yii\grid\GridView;

class GridViewLrdouble extends GridView{

    /**
     * 默认布局文件
     * @var string
     */
    public $layout = "{items}\n
        <div style='background-color: #ffffff;height: 60px;padding-right: 30px;margin-top: -20px;'>
            <div class='col-sm-6' style='line-height: 60px;color: #666'>
                <div style='pull-left'>{summary}</div>
            </div>
            <div class='col-sm-6'>
                <div class='pull-right'>{pager}</div>
            </div>
        </div>";

    /**
     * 分页样式
     * @var array
     */
    public $pager = [
        'options' => [
            'class' => 'pagination  pagination-sm'
        ]
    ];

    /**
     * 表格样式
     * @var array
     */
    public $tableOptions = [
        'class' => 'table table-bordered table-hover'
    ];
}