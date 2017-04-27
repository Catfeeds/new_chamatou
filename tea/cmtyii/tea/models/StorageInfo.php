<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;

/**
 * 商品入库商品详情
 * This is the model class for table "{{%sp_storage_info}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $goods_id
 * @property integer $users_id
 * @property integer $num
 * @property integer $add_time
 * @property integer $status
 * @property string $note
 * @property string $buy_price
 * @property string $type
 * @property string $storage_number
 */
class StorageInfo extends \yii\db\ActiveRecord
{
    /**
     * 商品变量
     */
    const TYPE_GOODS = 1;

    /**
     * 原料
     */
    const TYPE_DOSING = 0;

    /**
     * 入库
     */
    const STATUS_PUSH = 1;

    /**
     * 出库
     */
    const STATUS_POP = 2;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_storage_info}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'status', 'goods_id', 'users_id', 'num', 'add_time', 'type'], 'integer'],
            [['buy_price'], 'number'],
            [['note'], 'string', 'max' => 255],
            [['storage_number'], 'safe']
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
            'store_id' => 'Store ID',
            'goods_id' => 'Goods ID',
            'users_id' => 'Users ID',
            'num' => '数量',
            'add_time' => '添加时间',
            'note' => '备注',
            'buy_price' => '采购价格'
        ];
    }

    /**
     * 添加一个商品的入库操作
     * @param array $data
     * @return bool
     */
    public function add($data = [])
    {
        if ($data) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                /* 初始化参数 */
                $this->shoper_id = Yii::$app->session->get('shoper_id');
                $this->store_id = Yii::$app->session->get('store_id');
                $this->goods_id = $data['id'];
                $this->users_id = Yii::$app->session->get('tea_user_id');
                $this->num = $data['num'];
                $this->add_time = time();
                $this->note = isset($data['note']) ? $data['note'] : '';
                $this->buy_price = isset($data['buy_price']) ? $data['buy_price'] : 0;
                $this->storage_number = isset($data['storage_number']) ? $data['storage_number'] : 0;
                $this->status = StorageInfo::STATUS_PUSH;
                /* 判断添加入库的类型 */
                if ($data['type'] == 'goods') {
                    $this->type = StorageInfo::TYPE_GOODS;
                    $goods = Goods::findOne($data['id']);
                    if ($goods) {
                        $goodsRet = $goods->setStockNum($data['num']);
                        if ($goodsRet) {
                            if ($this->save()) {
                                $transaction->commit();
                                return true;
                            }
                            $msg = $this->getFirstErrors();
                            $msg = reset($msg);
                            throw new \Exception($msg);
                        }
                        $msg = $goods->getFirstErrors();
                        $msg = reset($msg);
                        throw new \Exception($msg);
                    }
                    throw new \Exception(Yii::t('app', 'goods_id_not_exist'));
                } elseif ($data['type'] == 'dosing') {
                    $this->type = StorageInfo::TYPE_DOSING;
                    $dosing = Dosing::findOne($data['id']);
                    if ($dosing) {
                        $dosingRet = $dosing->setStockNum($data['num']);
                        if ($dosingRet) {
                            if ($this->save()) {
                                $transaction->commit();
                                return true;
                            }
                            $msg = $this->getFirstErrors();
                            $msg = reset($msg);
                            throw new \Exception($msg);
                        }
                        $msg = $dosing->getFirstErrors();
                        $msg = reset($msg);
                        throw new \Exception($msg);
                    }
                    throw new \Exception(Yii::t('app', 'dosing_id_exist'));
                }

            } catch (\Exception $exception) {
                $transaction->rollBack();
                $this->addError('id', $exception->getMessage());
                return false;
            }
        }
        $this->addError('id', Yii::t('app', 'model')['required']);
    }

    /**
     * 获取商品的入库列表
     * @param $data
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getListPushPage($data)
    {
        if (empty($data)) {
            return [];
        }

        $model = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['status' => StorageInfo::STATUS_PUSH])
            ->select(['id', 'users_id', 'goods_id', 'add_time', 'num', 'buy_price', 'note', 'type']);

        if (isset($data['start_time'])) {
            $model = $model->andWhere(['>', 'add_time', strtotime($data['start_time'])])
                ->andWhere(['<', 'add_time', strtotime($data['end_time'])]);
        }

        /*查看是否带单据号、带了就执行单据查询*/
        if (isset($data['storage_number']) && !empty($data['storage_number'])) {
            $model = $model->andWhere(['storage_number' => $data['storage_number']]);
        }

        /*查看是否带商品ID、带了就执行商品ID*/
        if (isset($data['id']) && empty($data['id'])) {
            $model = $model->andWhere(['goods_id' => $data['id']]);
        }

        /*查看是否带商品类型、带了就执行商品类型*/
        if (isset($data['type']) && empty($data['type'])) {
            if ($data['type'] == 'goods') {
                $model = $model->andWhere(['type' => StorageInfo::TYPE_GOODS]);
            } elseif ($data['type'] == 'dosing') {
                $model = $model->andWhere(['type' => StorageInfo::TYPE_DOSING]);
            }
        }
        $count = $model->count();
        $page = new Pagination(['totalCount' => $model->count(), 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)->asArray()->all();
        foreach ($data as $key => $val) {
            $data[$key]['users_name'] = UsersForm::getUserNameById($val['users_id']);
            $data[$key]['add_time'] = date("Y-m-d H:i:s", $data[$key]['add_time']);
            if ($val['type'] == StorageInfo::TYPE_GOODS) {
                $data[$key]['goods_name'] = Goods::getGoodsNameById($val['goods_id']);
            } elseif ($val['type'] == StorageInfo::TYPE_DOSING) {
                $data[$key]['goods_name'] = Dosing::getDosingNameById($val['goods_id']);
            }
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $page->getPageCount();
        $datas['list'] = $data;
        return $datas;
    }

    /**
     * 商品出库
     * @param array $data
     * @return bool
     */
    public function pop($data = [])
    {
        if ($data) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                /* 初始化参数 */
                $this->shoper_id = Yii::$app->session->get('shoper_id');
                $this->store_id = Yii::$app->session->get('store_id');
                $this->goods_id = $data['id'];
                $this->users_id = Yii::$app->session->get('tea_user_id');
                $this->num = $data['num'];
                $this->add_time = time();
                $this->note = isset($data['note']) ? $data['note'] : '';
                $this->buy_price = isset($data['buy_price']) ? $data['buy_price'] : 0;
                $this->storage_number = isset($data['storage_number']) ? $data['storage_number'] : 0;
                $this->status = StorageInfo::STATUS_POP;
                /* 判断添加入库的类型 */
                if ($data['type'] == 'goods') {
                    $this->type = StorageInfo::TYPE_GOODS;
                    $goods = Goods::findOne($data['id']);
                    if ($goods) {
                        $goodsRet = $goods->setStockNum(-$data['num']);
                        if ($goodsRet) {
                            if ($this->save()) {
                                $transaction->commit();
                                return true;
                            }
                            $msg = $this->getFirstErrors();
                            $msg = reset($msg);
                            throw new \Exception($msg);
                        }
                        $msg = $goods->getFirstErrors();
                        $msg = reset($msg);
                        throw new \Exception($msg);
                    }
                    throw new \Exception(Yii::t('app', 'goods_id_not_exist'));
                } elseif ($data['type'] == 'dosing') {
                    $this->type = StorageInfo::TYPE_DOSING;
                    $dosing = Dosing::findOne($data['id']);
                    if ($dosing) {
                        $dosingRet = $dosing->setStockNum(-$data['num']);
                        if ($dosingRet) {
                            if ($this->save()) {
                                $transaction->commit();
                                return true;
                            }

                            $msg = $this->getFirstErrors();
                            $msg = reset($msg);
                            throw new \Exception($msg);
                        }
                        $msg = $dosing->getFirstErrors();
                        $msg = reset($msg);
                        throw new \Exception($msg);
                    }
                    throw new \Exception(Yii::t('app', 'dosing_id_exist'));
                }

            } catch (\Exception $exception) {
                $transaction->rollBack();
                $this->addError('id', $exception->getMessage());
                return false;
            }
        }
        $this->addError('id', Yii::t('app', 'model')['required']);
    }

    /**
     * 商品出库列表
     * @param $data
     * @return array
     */
    public function getListPopPage($data)
    {
        if (empty($data)) {
            return [];
        }

        $model = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['status' => StorageInfo::STATUS_PUSH])
            ->select(['id', 'users_id', 'goods_id', 'add_time', 'num', 'buy_price', 'note', 'type']);
        /* 判断是否带时间查询 */
        if (isset($data['start_time'])) {
            $model = $model->andWhere(['>', 'add_time', strtotime($data['start_time'])])
                ->andWhere(['<', 'add_time', strtotime($data['end_time'])]);
        }

        /*查看是否带单据号、带了就执行单据查询*/
        if (isset($data['storage_number']) && !empty($data['storage_number'])) {
            $model = $model->andWhere(['storage_number' => $data['storage_number']]);
        }

        /*查看是否带商品ID、带了就执行商品ID*/
        if (isset($data['id']) && empty($data['id'])) {
            $model = $model->andWhere(['goods_id' => $data['id']]);
        }

        /*查看是否带商品类型、带了就执行商品类型*/
        if (isset($data['type']) && empty($data['type'])) {
            if ($data['type'] == 'goods') {
                $model = $model->andWhere(['type' => StorageInfo::TYPE_GOODS]);
            } elseif ($data['type'] == 'dosing') {
                $model = $model->andWhere(['type' => StorageInfo::TYPE_DOSING]);
            }
        }

        $count = $model->count();
        $page = new Pagination(['totalCount' => $model->count(), 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)->asArray()->all();
        foreach ($data as $key => $val) {
            $data[$key]['users_name'] = UsersForm::getUserNameById($val['users_id']);
            $data[$key]['add_time'] = date("Y-m-d H:i:s", $data[$key]['add_time']);
            if ($val['type'] == StorageInfo::TYPE_GOODS) {
                $data[$key]['goods_name'] = Goods::getGoodsNameById($val['goods_id']);
            } elseif ($val['type'] == StorageInfo::TYPE_DOSING) {
                $data[$key]['goods_name'] = Dosing::getDosingNameById($val['goods_id']);
            }
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $page->getPageCount();
        $datas['list'] = $data;
        return $datas;
    }
}
