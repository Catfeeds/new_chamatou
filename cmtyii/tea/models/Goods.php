<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%sp_goods}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $cate_id
 * @property string $goods_name
 * @property integer $stock
 * @property integer $is_stock
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
     *启用库存管理
     */
    const IS_STOCK_TRUE     = 1;

    /**
     * 未启用库存管理
     */
    const IS_STOCK_FLASE    = 0;
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
            [['shoper_id', 'store_id', 'cate_id', 'stock', 'is_stock', 'warning_store', 'status', 'add_time', 'give'], 'integer'],
            [['sales_price', 'buy_price'], 'number'],
            [['goods_name', 'spec', 'note'], 'string', 'max' => 255],
            [['unit'], 'string', 'max' => 6],
            [['goods_name', 'cate_id', 'is_stock', 'warning_store', 'sales_price', 'buy_price', 'note', 'unit'], 'required', 'on' => ['add']],
            [['cate_id'], 'validateCate', 'on' => ['add', 'edit']],
            [['unit'], 'validateUnit', 'on' => ['add', 'edit']],
            [['is_stock', 'status', 'give'], 'in', 'range' => [1, 0]],

        ];
    }

    /**
     * 判断商品分类是否存在
     * @param $atr
     * @param $par
     */
    public function validateCate($atr, $par)
    {
        if (!$this->hasErrors()) {
            $cate = GoodsCate::find()->andWhere(['id' => $this->cate_id])
                ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                ->select(['id'])
                ->one();
            if (!$cate) {
                return $this->addError($atr, Yii::t('app', 'goods_cate_id_exist'));
            }
        }
    }

    /**
     * 判断单位是否存在
     * @param $atr
     * @param $par
     */
    public function validateUnit($atr, $par)
    {
        if (!$this->hasErrors()) {
            $unit = Unit::find()->andWhere(['name' => $this->unit])
                ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
                ->select([])->one();
            if (!$unit) {
                return $this->addError($atr, Yii::t('app', 'dosing_unit_not_exist'));
            }
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'shoper_id' => 'Shoper ID',
            'store_id' => '门店',
            'cate_id' => '分类',
            'goods_name' => '商品名称',
            'stock' => '库存',
            'warning_store' => '预警库存',
            'sales_price' => '销售价格',
            'buy_price' => '进货价格',
            'spec' => '规则',
            'note' => '备注',
            'status' => '状态',
            'add_time' => '添加时间',
            'unit' => '单位',
            'give' => '转配',
        ];
    }

    /**
     * 获取分类菜单
     * @param array $select
     * @return array|null|\yii\db\ActiveRecord
     */
    public function getGoodsToDosing($select = [])
    {
        return $this->hasMany(GoodsToDosing::className(), ['goods_id' => 'id'])->select($select)->all();
    }

    /**
     * 获取分类菜单
     * @param array $select
     * @return array|null|\yii\db\ActiveRecord
     */
    public function getGoodsCate($select = [])
    {
        return $this->hasOne(GoodsCate::className(), ['id' => 'cate_id'])->select($select)->one();
    }

    /**
     * 商品搜索操作
     * @param $post
     * @return array|\yii\db\ActiveRecord[]
     */
    public function search($post)
    {
        $post['cate_id'] = isset($post['cate_id']) ? $post['cate_id'] : '';
        $post['keyword'] = isset($post['keyword']) ? $post['keyword'] : '';

        $data = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')]);

        /* 检查是否启用分类*/
        if ($post['cate_id'] != '') {
            $data = $data->andWhere(['cate_id'=>$post['cate_id']]);
        }
        
        /* 带关键字 加关键字搜索 */
        if ($post['keyword'] != '') {
            $data = $data->andWhere(['like', 'goods_name', $post['keyword']]);
        }

        $dataCount = $data->count();
        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);

        $data = $data->offset($page->offset)->limit($page->limit)->asArray()->all();


        $category = GoodsCate::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->select(['id', 'cate_name'])->asArray()->all();

        # 遍历算法处理分类的名称、程序算出、避免数据库压力
        foreach ($category as $key => $value) {
            foreach ($data as $dkey => $dvalue) {
                if ($dvalue['cate_id'] == $value['id']) {
                    $data[$dkey]['cate_name'] = $value['cate_name'];
                    $data[$dkey]['stock']    = $this->getGoodsStock($dvalue['id']);
                }
            }
        }

        return ['list' => ['goods' => $data, 'category' => $category], 'pageNum' => $page->pageCount, 'count' => $dataCount];
    }


    /**
     * 获取分类下的商品并分页
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getCateGoodsPage($cate_id = '')
    {
        $data = $this->search(['cate_id' => $cate_id, 'goods_name' => '', 'keyword' => '']);
        unset($data['list']['category']);
        return $data;
    }


    /**
     * 商品添加函数
     * $data['goods_name']       商品名称
     * $data['cate_id']          分类ID
     * $data['is_stock']         是否参与库存管理
     * $data['warning_store']    库存预计数量
     * $data['sales_price']      销售价格
     * $data['buy_price']        采购价
     * $data['note']             商品备注
     * $data['unit']             商品单位
     * $data['give']             是否允许转台
     *
     * @param array $data
     * @return bool
     */
    public function add($data = [])
    {
        $this->scenario = 'add';
        if ($this->load($data, '') && $this->validate()) {
            $dosing = isset($data['dosing']) ? $data['dosing'] : [];
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            $this->status = 1;
            $this->add_time = time();
            $tran = Yii::$app->db->beginTransaction();
            try {

                /**
                 * 未知BUG 作者预留lrdouble
                 */
                if (!$this->save()) {
                    throw  new \Exception('error goods save!');
                }

                if ($dosing) {
                    $this->is_stock = 0;
                    /*
                     * 循环添加商品原料关联关系
                     * */
                    foreach ($dosing as $key => $value) {
                        $goodsToDosingData['goods_id'] = $this->id;
                        $goodsToDosingData['dosing_id'] = $value['id'];
                        $goodsToDosingData['number'] = $value['count'];
                        $goodsToDosing = new GoodsToDosing();
                        if (!$goodsToDosing->add($goodsToDosingData)) {
                            $message = $goodsToDosing->getFirstErrors();
                            $message = reset($message);
                            $this->addError('goods_name', $message);
                            throw new \Exception('error dosing save!');
                        }
                    }
                }

                $tran->commit();
            } catch (\Exception $e) {
                $tran->rollBack();
                $this->addError('goods_name', $e->getMessage());
                return false;
            }
            return true;
        }
    }

    /**
     * 商品修改函数
     * $data['goods_name']       商品名称
     * $data['cate_id']          分类ID
     * $data['is_stock']         是否参与库存管理
     * $data['warning_store']    库存预计数量
     * $data['sales_price']      销售价格
     * $data['buy_price']        采购价
     * $data['note']             商品备注
     * $data['unit']             商品单位
     * $data['give']             是否允许转台
     *
     * @param array $data
     * @return bool
     */
    public function edit($data = [])
    {
        $this->scenario = 'edit';
        if ($this->load($data, '') && $this->validate()) {
            $dosing = isset($data['dosing']) ? $data['dosing'] : [];
            $this->status = 1;
            $tran = Yii::$app->db->beginTransaction();
            try {

                /**
                 * 修改时先删除原有的关联关系、
                 * 在进行绑定关联关系
                 */
                $goodsToDosing = new GoodsToDosing();
                if (!$goodsToDosing->delByGoodsId($this->id)) {
                    throw new \Exception('error dosing delete!');
                }

                /**
                 * 检查是否存在关联关系
                 */
                if ($dosing) {
                    $this->is_stock = 0;

                    /*
                     * 循环添加商品原料关联关系
                     * */
                    foreach ($dosing as $key => $value) {
                        $goodsToDosingData['goods_id'] = $this->id;
                        $goodsToDosingData['dosing_id'] = $value['id'];
                        $goodsToDosingData['number'] = $value['count'];
                        $goodsToDosing = new GoodsToDosing();

                        if (!$goodsToDosing->add($goodsToDosingData)) {
                            $message = $goodsToDosing->getFirstErrors();
                            $message = reset($message);
                            $this->addError('goods_name', $message);
                            throw new \Exception('error dosing save!');
                        }
                    }
                }

                if (!$this->save()) {
                    throw  new \Exception('error goods save!');
                }

                $tran->commit();
            } catch (\Exception $e) {
                $tran->rollBack();
                $this->addError('goods_name', $e->getMessage());
                return false;
            }
            return true;
        }
    }

    /**
     * 获取一个商品资料
     * 算法思路：
     *  1.查询商品是否存在
     *  2.查询商品的关联原料
     *  3.查询商品原料的名称
     * @param string $goods_id
     * @return array
     */
    public function getOneGoods($goods_id = '')
    {
        if (empty($goods_id)) {
            $goods_id = $this->id;
        }
        $data = self::findOne($goods_id);
        if ($data) {
            $retData = ArrayHelper::toArray($data);
            $retData['dosing'] = ArrayHelper::toArray($data->getGoodsToDosing());
            foreach ($retData['dosing'] as $key => $value) {
                $retData['dosing'][$key]['name'] = Dosing::getDosingNameById($value['dosing_id']);
                $retData['dosing'][$key]['count'] = $retData['dosing'][$key]['number'];
                $retData['dosing'][$key]['id'] = $retData['dosing'][$key]['dosing_id'];
                unset($retData['dosing'][$key]['goods_id']);
                unset($retData['dosing'][$key]['number']);
                unset($retData['dosing'][$key]['dosing_id']);
            }
            return $retData;
        }
        return [];
    }

    /**
     * 有严重的BUG--作者LRdouble留言
     * 商品删除操作
     * @return false|int
     */
    public function del()
    {
        $goodsToDosing = new GoodsToDosing();
        if ($goodsToDosing->delByGoodsId($this->id)) {
            return $this->delete();
        }
    }

    /**
     * 商品入库设置库存
     * @param $number
     * @param string $goods_id
     * @return bool
     */
    public function setStockNum($number)
    {

        if ($number == '') {
            $this->addError('id', Yii::t('app', 'model')['required']);
            return false;
        }

        if ($this->is_stock == 0) {
            $msg = $this->goods_name . Yii::t('app', 'goods_stock_not_push');
            $this->addError('id', $msg);
            return false;
        }
        if ($number < 0) {
            $temp = abs($number);
            if ($temp > $this->stock) {
                $msg = $this->goods_name . Yii::t('app', 'stock_min_stock');
                $this->addError('id', $msg);
                return false;
            }
        }
        $this->stock = $this->stock + $number;
        return $this->save();
    }

    /**
     * 根据ID获取名称
     * @param $goods_id
     * @return string
     */
    public static function getGoodsNameById($goods_id)
    {
        if ($goods_id) {
            $data = self::findOne($goods_id);
            return $data['goods_name'];
        }
        return '';
    }

    /**
     * 获取这个商品的库存
     * @param string $goods_id
     * @return array|bool|int|null
     */
    public function getGoodsStock($goods_id = '')
    {
        if($goods_id == ''){
            $goods_id = $this->id;
        }
        $model = self::findOne($goods_id);
        if($model->is_stock == Goods::IS_STOCK_TRUE){
            return $model->stock;
        }else{
            $stock = GoodsToDosing::getGoodsStock($model->id);
            return $stock;
        }
    }
}
