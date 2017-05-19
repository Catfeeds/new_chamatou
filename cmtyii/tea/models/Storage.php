<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;

/**
 * 商品入库单操作
 * This is the model class for table "{{%sp_storage}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $users_id
 * @property string $number
 * @property integer $add_time
 * @property string $note
 * @property integer $status
 */
class Storage extends \yii\db\ActiveRecord
{
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
        return '{{%sp_storage}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'status','users_id', 'add_time'], 'integer'],
            [['number'], 'string', 'max' => 32],
            [['note'], 'string', 'max' => 255],
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
            'store_id' => '门店ID',
            'users_id' => '用户ID',
            'number' => '编号',
            'add_time' => '添加时间',
            'note' => '备注',
        ];
    }

    /**
     * 添加并生成一个入库单
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            $this->users_id = Yii::$app->session->get('tea_user_id');
            $this->number = (string)(date('YmdHis') . time());
            $this->add_time = time();
            $this->note = $data['note'];
            $this->status = Storage::STATUS_PUSH;
            foreach ($data['list'] as $key => $value) {
                $value['storage_number'] = $this->number;
                $storageInfo = new  StorageInfo();
                if (!$storageInfo->add($value)) {
                    $msg = $storageInfo->getFirstErrors();
                    $msg = reset($msg);
                    throw  new \Exception($msg);
                }
            }
            if ($this->save()) {
                $transaction->commit();
                return true;
            } else {
                $msg = $this->getFirstErrors();
                $msg = reset($msg);
                throw  new \Exception($msg);
            }
        } catch (\Exception $exception) {
            $transaction->rollBack();
            $this->addError('id', $exception->getMessage());
            return false;
        }
    }

    /**
     * 添加并生成一个入库单
     * @param $data
     * @return bool
     */
    public function pop($data)
    {
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $this->shoper_id = Yii::$app->session->get('shoper_id');
            $this->store_id = Yii::$app->session->get('store_id');
            $this->users_id = Yii::$app->session->get('tea_user_id');
            $this->number = (string)(date('YmdHis') . time());
            $this->add_time = time();
            $this->note = $data['note'];
            $this->status = Storage::STATUS_POP;
            foreach ($data['list'] as $key => $value) {
                $value['storage_number'] = $this->number;
                $storageInfo = new  StorageInfo();
                if (!$storageInfo->pop($value)) {
                    $msg = $storageInfo->getFirstErrors();
                    $msg = reset($msg);
                    throw  new \Exception($msg);
                }
            }
            if ($this->save()) {
                $transaction->commit();
                return true;
            } else {
                $msg = $this->getFirstErrors();
                $msg = reset($msg);
                throw  new \Exception($msg);
            }
        } catch (\Exception $exception) {
            $transaction->rollBack();
            $this->addError('id', $exception->getMessage());
            return false;
        }
    }

    /**
     * 返回入库单据
     * @param $data
     * @return array
     */
    public function getListPushPage($data)
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
                ->andWhere(['status'=>Storage::STATUS_PUSH])
                ->select(['id', 'users_id', 'add_time', 'number', 'note']);

        $count = $model->count();
        $page = new  Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)->asArray()->all();
        foreach ($data as $key => $val) {
            $data[$key]['users_name'] = UsersForm::getUserNameById($val['users_id']);
            $data[$key]['add_time'] = date("Y-m-d H:i:s", $data[$key]['add_time']);
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $page->getPageCount();
        $datas['list'] = $data;
        return $datas;
    }

    /**
     * 商品出库单据
     * @param $data
     * @return array
     */
    public function getListPopPage($data)
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
                ->andWhere(['status'=>Storage::STATUS_POP])
                ->select(['id', 'users_id', 'add_time', 'number', 'note']);

        $count = $model->count();
        $page = new  Pagination(['totalCount' => $count, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)->asArray()->all();
        foreach ($data as $key => $val) {
            $data[$key]['users_name'] = UsersForm::getUserNameById($val['users_id']);
            $data[$key]['add_time'] = date("Y-m-d H:i:s", $data[$key]['add_time']);
        }
        $datas['pageCount'] = $count;
        $datas['pageNum'] = $page->getPageCount();
        $datas['list'] = $data;
        return $datas;
    }
}
