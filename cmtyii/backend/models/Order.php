<?php
/**
 * Created by PhpStorm.
 * User: angkebrand
 * Date: 2017/4/28
 * Time: 16:56
 */

namespace backend\models;

use Yii;
use yii\data\Pagination;
use yii\db\ActiveRecord;
class Order extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order}}';
    }

    public function getOrderGoods()
    {
        return $this->hasMany(OrderGoods::className(),['order_id'=>'Id'])->asArray();
    }

    public function getGoods()
    {
        $goods = $this->hasMany(OrderGoods::className(),['order_id'=>'Id'])->asArray()->all();
       // var_dump($goods);die;
        $goodsStr = '';
        foreach ($goods as $v){
            $goodsStr .= $v['goods_name'].'x'.$v['num'].';';
        }
        return $goodsStr;
   }

    /**
     * 分页获取订单列表
     * @return array|ActiveRecord[]
     */
   public function getList()
   {
       $query = Order::find()->orderBy('add_time desc');
       //根据提交状态构造查询条件条件
       $status = \Yii::$app->request->get('status');
       if($status > 0){
           $query->where(['status'=>$status]);
       }
       $count = $query->count();
       $size = \Yii::$app->params['orderPageSize'];//获取配置的分页条数
       $pager = new Pagination(['totalCount'=>$count,'pageSize'=>$size]);//实例化分页类
       $data = $query->offset($pager->offset)->limit($pager->limit)->all();
       return [
           'data'=>$data,
           'pager'=>$pager,
       ];
   }
}