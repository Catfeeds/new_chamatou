<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */

namespace tea\b2b\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%cart}}".
 *
 * @property integer $Id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $goods_id
 * @property integer $goods_num
 * @property integer $add_time
 */
class Cart extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_cart}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'goods_id', 'goods_num', 'add_time'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'shoper_id' => 'Shoper ID',
            'goods_id' => 'Goods ID',
            'goods_num' => 'Goods Num',
            'add_time' => 'Add Time',
        ];
    }

    /**
     * 返回购物车中的商品数量
     * @return int|string
     */
    public static function getCount()
    {
        $model = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')]);
        $count = $model->count();
        return $count;
    }

    /**
     * 获取购物车列表
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getList()
    {
        $this->updateCart();
        $data = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->select([])
            ->all();
        $data = $this->forCartGoods($data);
        return $data;
    }

    /**
     * 生成订单前获取的购物车数据
     * @param $in
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getSaveOrderList($in)
    {
        $data = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['IN','Id',$in])
            ->select([])->all();
        $data = $this->forCartGoods($data);
        return $data;
    }
    /**
     * 添加一个购车资料
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $this->updateCart();
        $goodsModel = Goods::findOne($data['goods_id']);
        if ($goodsModel) {
            /* 判断库存是否足够 */
            if ($goodsModel->store < $data['goods_num']) {
                $this->addError('id', Yii::t('app', 'b2b_goods_stack'));
                return false;
            }
            if ($data['goods_num'] < 1) {
                $this->addError('id', Yii::t('app', 'b2b_goods_num_not_0'));
                return false;
            }
            $cartModel = self::find()
                ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                ->andWhere(['goods_id' => $data['goods_id']])
                ->one();
            /* 判断商品是否存在购物车 */
            if ($cartModel) {
                $cartModel->goods_num = $cartModel->goods_num + $data['goods_num'];
                /* 判断库存是否足够 */
                if ($goodsModel->store < $cartModel->goods_num) {
                    $this->addError('id', Yii::t('app', 'b2b_goods_stack'));
                    return false;
                }
                return $cartModel->save();
            } else {
                $data['shoper_id'] = Yii::$app->session->get('shoper_id');
                $data['store_id'] = Yii::$app->session->get('store_id');
                if ($this->load($data, '') && $this->validate()) {
                    $this->add_time = time();
                    return $this->save();
                }
            }
        }
        $this->addError('id', Yii::t('app', 'b2b_goods_exist'));
        return false;
    }

    /**
     * 商品修改库存
     * @param $data
     * @return bool
     */
    public function editCartNum($data)
    {
        $this->updateCart();
        $goodsModel = Goods::findOne($data['goods_id']);
        if ($goodsModel) {
            /* 判断库存是否足够 */
            if ($goodsModel->store < $data['goods_num']) {
                $this->addError('id', Yii::t('app', 'b2b_goods_stack'));
                return false;
            }
            if ($data['goods_num'] < 1) {
                $this->addError('id', Yii::t('app', 'b2b_goods_num_not_0'));
                return false;
            }
            $cartModel = self::find()
                ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                ->andWhere(['goods_id' => $data['goods_id']])
                ->one();
            /* 判断商品是否存在购物车 */
            if ($cartModel) {
                $cartModel->goods_num = $data['goods_num'];
                return $cartModel->save();
            } else {
                $data['shoper_id'] = Yii::$app->session->get('shoper_id');
                $data['store_id'] = Yii::$app->session->get('store_id');
                if ($this->load($data, '') && $this->validate()) {
                    $this->add_time = time();
                    return $this->save();
                }
            }
        }
        $this->addError('id', Yii::t('app', 'b2b_goods_exist'));
        return false;
    }

    /**
     * 删除一个购车资料
     * @param $id
     * @return bool
     */
    public function del($id = '')
    {
        if(empty($id))
        {
            $id = $this->Id;
        }
        $this->updateCart();
        $model = self::findOne($id);
        if ($model) {
            return $model->delete();
        }
        $this->addError('id', Yii::t('app', 'b2b_goods_exist'));
    }

    /**
     * 处理购物车的数据+时间+名称
     * @param array $data
     * @return array
     */
    public function forCartGoods($data = [])
    {
        $data = ArrayHelper::toArray($data);
        foreach ($data as $key => $value) {
            $data[$key]['goods_info'] = Goods::findOne($value['goods_id']);
            $data[$key]['add_time'] = date("Y-m-d H:i:s", $value['add_time']);
        }
        return $data;
    }

    /**
     * 1.2修改代码！原代码死循环！
     * 更新商品资料
     */
    private function updateCart()
    {
        $data = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->select(['Id', 'goods_id'])
            ->all();

        foreach ($data as $key => $value) {
            $goods = Goods::findOne($value['goods_id']);
            if (!$goods) {
                $model = self::findOne($value['Id']);
                $model->delete();
            } else if ($goods->status == Goods::STATUS_UNDERCARRIAGE) {
                $model = self::findOne($value['Id']);
                $model->delete();
            }
        }
    }
}
