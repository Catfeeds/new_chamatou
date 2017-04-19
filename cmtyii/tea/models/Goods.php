<?php

namespace tea\models;

use tea\models\Order;
use Yii;
use yii\data\Pagination;

/**
 * This is the model class for table "{{%sp_goods}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property string $cate_id
 * @property string $goods_name
 * @property integer $store
 * @property integer $warning_store
 * @property string $sales_price
 * @property string $buy_price
 * @property string $spec
 * @property string $note
 * @property integer $status
 * @property integer $add_time
 * @property string $unit
 * @property integer $give
 */
class Goods extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_goods}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'cate_id', 'store', 'warning_store', 'status', 'add_time', 'give'], 'integer'],
            [['sales_price', 'buy_price'], 'number'],
            [['goods_name', 'spec', 'note'], 'string', 'max' => 255],
            [['unit'], 'string', 'max' => 6],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'shoper_id' => 'Shoper ID',
            'cate_id' => 'Cate ID',
            'goods_name' => 'Goods Name',
            'store' => 'Store',
            'warning_store' => 'Warning Store',
            'sales_price' => 'Sales Price',
            'buy_price' => 'Buy Price',
            'spec' => 'Spec',
            'note' => 'Note',
            'status' => 'Status',
            'add_time' => 'Add Time',
            'unit' => 'Unit',
            'give' => 'Give',
        ];
    }

    /**
     * 获取分类菜单
     * @param array $select
     * @return array|null|\yii\db\ActiveRecord
     */
    public function getGoodsCate($select = [])
    {
        return $this->hasOne(GoodsCate::className(),['id'=>'cate_id'])->select($select)->asArray()->one();
    }

    /**
     * 商品搜索操作
     * @param $post
     * @return array|\yii\db\ActiveRecord[]
     */
    public function search($post)
    {
        if($post['cate_id'] == '' || empty($post['cate_id']))
        {
            $data = self::find()->where('shoper_id = :shoper_id and store_id =:store_id and goods_name like :goods_name',
                    [':shoper_id'=>Yii::$app->session->get('shoper_id'),':goods_name'=>"%".$post['goods_name']."%",':store_id'=>Yii::$app->session->get('store_id')]);
        }else{
            $data =  self::find()->where("shoper_id = :shoper_id and goods_name like :goods_name and cate_id = :cate_id and store_id = :store_id",
                [':shoper_id'=>Yii::$app->session->get('shoper_id'),':goods_name'=>"%".$post['keyword']."%",':cate_id'=>$post['cate_id'],':store_id'=>Yii::$app->session->get('store_id')]);
        }
        $dataCount = $data->count();
        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);
        $data =  self::find()->where("shoper_id = :shoper_id and goods_name like :goods_name and cate_id = :cate_id and store_id = :store_id",
            [':shoper_id'=>Yii::$app->session->get('shoper_id'),':goods_name'=>"%".$post['keyword']."%",':cate_id'=>$post['cate_id'],':store_id'=>Yii::$app->session->get('store_id')])
            ->offset($page->offset)->limit($page->limit)->asArray()->all();
        $category = GoodsCate::find()->where('shoper_id = :shoper_id and store_id = :store_id',[':shoper_id'=>Yii::$app->session->get('shoper_id'),':store_id'=>Yii::$app->session->get('store_id')])
            ->select(['id','cate_name'])->asArray()->all();

        # 遍历算法处理分类的名称、程序算出、避免数据库压力
        foreach ($category as $key=>$value)
        {
            foreach ($data as $dkey =>$dvalue)
            {
                if($dvalue['cate_id'] == $value['id'])
                {
                    $data[$dkey]['cate_name']=$value['cate_name'];
                }
            }
        }
        return ['list'=>['goods'=>$data,'category'=>$category],'pageNum'=>$page->pageCount,'count'=>$dataCount];
    }
}
