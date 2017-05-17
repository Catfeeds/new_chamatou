<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;

/**
 * This is the model class for table "{{%sp_pandian}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $users_id
 * @property integer $store_id
 * @property integer $goods_id
 * @property integer $type
 * @property integer $before
 * @property integer $after
 * @property string $note
 * @property integer $add_time
 */
class Pandian extends \yii\db\ActiveRecord
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
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_pandian}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'users_id', 'store_id', 'goods_id', 'before', 'after', 'add_time'], 'integer'],
            [['note'], 'string', 'max' => 255],
            [['goods_id', 'after'], 'required', 'on' => ['add']],
            [['after'], 'match', 'pattern' => '/^\+?[1-9][0-9]*$/', 'on' => ['add']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'shoper_id' => '商家ID',
            'users_id' => '用户ID',
            'store_id' => '店铺ID',
            'goods_id' => '商品ID',
            'before' => '盘前库存',
            'after' => '盘后库存',
            'note' => '备注',
            'add_time' => '添加时间',
        ];
    }

    /**
     * 盘点保存方法
     * 此处算法有问题--作者lrdouble
     * @param array $data
     * @return bool
     */
    public function add($data = [])
    {
        /* 配合前端 */
        $data['goods_id'] = $data['id'];
        $data['after'] = $data['num'];
        unset($data['id']);
        unset($data['num']);
        $this->scenario = 'add';
        if ($this->load($data, '') && $this->validate()) {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            $this->users_id = Yii::$app->session->get('tea_user_id');
            $this->add_time = time();

            if ($data['type'] == 'goods') {
                $this->type = Pandian::TYPE_GOODS;
                $goods = Goods::findOne($this->goods_id);
                if (!$goods) {
                    $this->addError('id', Yii::t('app', 'goods_id_not_exist'));
                    return false;
                }
                $this->before = $goods->stock;
                $goods->stock = $this->after;
                if ($goods->save()) {
                    if ($this->save()) {
                        return true;
                    }
                }
                $msg = $goods->getFirstErrors();
                $msg = reset($msg);
                $this->addError('id', $msg);
                return false;
            } elseif ($data['type'] == 'dosing') {
                $this->type = Pandian::TYPE_DOSING;
                $dosing = Dosing::findOne($this->goods_id);
                if (!$dosing) {
                    $this->addError('id', Yii::t('app', 'goods_id_not_exist'));
                    return false;
                }
                $this->before = $dosing->stock;
                $dosing->stock = $this->after;
                if ($dosing->save()) {
                    if ($this->save()) {
                        return true;
                    }
                }
                $msg = $dosing->getFirstErrors();
                $msg = reset($msg);
                $this->addError('id', $msg);
                return false;
            }
        }
    }

    public function getListPage($data)
    {
        //参数为空时、返回空数组
        if (empty($data)) {
            return [];
        }

        $model = self::find()
            ->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['>', 'add_time', strtotime($data['start_time'])])
            ->andWhere(['<', 'add_time', strtotime($data['end_time'])])
            ->select(['id', 'users_id', 'add_time', 'before','goods_id', 'type','note', 'after']);

        $count = $model->count();
        $page = new  Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)->asArray()->all();
        foreach ($data as $key => $val) {
            $data[$key]['users_name'] = UsersForm::getUserNameById($val['users_id']);
            $data[$key]['add_time'] = date("Y-m-d H:i:s", $data[$key]['add_time']);
            if($val['type'] == Pandian::TYPE_GOODS){
                $data[$key]['goods_name'] = Goods::getGoodsNameById($val['goods_id']);
            }elseif ($val['type'] == Pandian::TYPE_DOSING){
                $data[$key]['goods_name'] = Dosing::getDosingNameById($val['goods_id']);
            }
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $page->getPageCount();
        $datas['list'] = $data;
        return $datas;
    }
}
