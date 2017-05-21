<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\b2b\models;

use Yii;
use yii\data\Pagination;
use yii\data\Sort;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%goods}}".
 *
 * @property integer $Id
 * @property string $goods_name
 * @property string $cover
 * @property string $content
 * @property integer $store
 * @property string $price
 * @property string $address
 * @property string $spec
 * @property string $note
 * @property integer $status
 * @property integer $add_time
 * @property integer $sum_sell
 * @property integer $sum_price
 */
class Goods extends \yii\db\ActiveRecord
{
    /**
     * 商品上架中
     */
    const STATUS_GROUNDING = 1;

    /**
     * 商品上架中
     */
    const STATUS_UNDERCARRIAGE = 2;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%goods}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content'], 'string'],
            [['store', 'status', 'add_time', 'cat_id', 'sum_sell'], 'integer'],
            [['price'], 'number'],
            [['goods_name', 'cover', 'address', 'spec', 'note'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'goods_name' => 'Goods Name',
            'cover' => 'Cover',
            'content' => 'Content',
            'store' => 'Store',
            'price' => 'Price',
            'address' => 'Address',
            'spec' => 'Spec',
            'note' => 'Note',
            'status' => 'Status',
            'add_time' => 'Add Time',
            'sum_sell' => 'sum_sell',
            'cat_id' => 'cat_id',
        ];
    }

    /**
     * 搜索、带分页、返回商品列表
     * @param array $data
     * @return mixed
     */
    public function search($data = [])
    {
        $data['keyword'] = isset($data['keyword']) ? $data['keyword'] : '';
        $data['sort'] = isset($data['sort']) ? $data['sort'] : 2;
        $data['cate_id'] = isset($data['cate_id']) ? $data['cate_id'] : '';

        $goodsModel = self::find()->andWhere(['like', 'goods_name', $data['keyword']]);
        /**
         * 判断是否使用分页查询
         */
        if (!empty($data['cate_id'])) {
            $goodsModel = $goodsModel->andWhere(['cat_id' => $data['cate_id']]);
        }

        if ($data['sort'] == 1) {
            //销量排序
            $goodsModel->orderBy("sum_sell DESC");
        } elseif ($data['sort'] == -1) {
            $goodsModel->orderBy("sum_sell ASC");
        } elseif ($data['sort'] == 2) {
            //价格排序
            $goodsModel->orderBy("price DESC");
        } elseif ($data['sort'] == -2) {
            $goodsModel->orderBy("price ASC");
        } elseif ($data['sort'] == 3) {
            //时间排序
            $goodsModel->orderBy("add_time DESC");
        } elseif ($data['sort'] == -3) {
            $goodsModel->orderBy("add_time ASC");
        }

        $count = $goodsModel->count();
        $pages = new Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);
        $goodsList = $goodsModel->offset($pages->offset)->limit($pages->limit)->all();
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $pages->getPageCount();
        $datas['list'] = $goodsList;
        if($datas['pageNum'] == 0){
            $datas['pageNum'] = 1;
        }
        return $datas;
    }

    /**
     * 获取一个资料的详情
     * @param $goods_id
     * @return array
     */
    public function getOne($goods_id)
    {
        if(empty($goods_id)){
            $goods_id = $this->Id;
        }
        $data = ArrayHelper::toArray(self::findOne($goods_id));
        $data['cate_name'] =  GoodsCate::getCateNameById($data['cat_id']);
        return $data;
    }

    /**
     * 根据商品ID来查询商品名称
     * @param $goods_id
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function getNameByGoodsId($goods_id)
    {
        $goods_name = self::find()->andWhere(['id' => $goods_id])->select(['goods_name'])->one();
        return $goods_name['goods_name'];
    }

    /**
     * 判断商品是否存在
     * @param $goods_id
     * @return bool
     */
    public static function issetGoods($goods_id)
    {
        $model = self::findOne($goods_id);
        if (!empty($model)) {
            return true;
        }
        return false;
    }
}
