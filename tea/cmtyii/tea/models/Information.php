<?php

namespace tea\models;

use Yii;
use yii\data\Pagination;

/**
 * This is the model class for table "{{%sp_information}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $content
 * @property integer $reading
 * @property integer $type
 * @property integer $add_time
 */
class Information extends \yii\db\ActiveRecord
{
    /**
     * 系统消息
     */
    const SYSTEM_MESSAGE = 1;

    /**
     * 商品添加消息
     */
    const TABLE_ADD_GOODS = 2;

    /**
     * 台座预定到期
     */
    const BOOK_MATURE = 3;

    /**
     * 库存数量不足提示
     */
    const ERP_WARNING = 4;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_information}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'reading','type','add_time'], 'integer'],
            [['content'], 'string'],
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
            'content' => 'Content',
            'reading' => 'Reading',
        ];
    }

    /**
     * 添加一条消息到消息队列中
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $this->shoper_id = Yii::$app->session->get('shoper_id');
        $this->store_id = Yii::$app->session->get('store_id');
        $this->content = $data['content'];
        $this->type = $data['type'];
        $this->reading = 1;
        $this->add_time = time();
        return $this->save();
    }

    /**
     * 获取已读消息
     * @return mixed
     */
    public function getReadList()
    {
        $list = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['reading' => 0])
            ->orderBy('add_time DESC');
        $count = $list->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>Yii::$app->params['pageSize']]);
        $list =$list->offset($pages->offset)->limit($pages->limit)->all();
        foreach ($list as $key=>$value)
        {
            $list[$key]['add_time'] = date('Y-m-d H:i:s',$value['add_time']);
        }
        $data['pageCount'] = $count;
        $data['pageNum'] = $pages->getPageCount();
        $data['list'] = $list;
        return $data;
    }

    /**
     * 获取未读消息列表
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getUnreadList()
    {
        $list = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['reading' => 1])
            ->orderBy('add_time DESC')
            ->all();
        foreach ($list as $key=>$value)
        {
            $value->reading =  0;
            $value->save();
            $list[$key]['add_time'] = date('Y-m-d H:i:s',$value['add_time']);
        }
        return $list;
    }
    /**
     * 获取未读消息列表
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getMessageBox()
    {
        $list = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['or',['type'=>Information::BOOK_MATURE],['type'=>Information::TABLE_ADD_GOODS]])
            ->andWhere(['reading' => 1])
            ->orderBy('add_time DESC')->all();
        foreach ($list as $key=>$value)
        {
            $value->reading =  0;
            $value->save();
            $list[$key]['add_time'] = date('Y-m-d H:i:s',$value['add_time']);
        }
        return $list;
    }

    /**
     * 获取总条数
     * @return mixed
     */
    public function getCount()
    {
        $data['unread'] = $this->getUnreadCount();
        $data['read'] = $this->getReadCount();
        return $data;
    }

    /**
     * 获取未读的总条数
     * @return int|string
     */
    public function getUnreadCount()
    {
        $list = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['reading' => 1])->count();
        return $list;
    }

    /**
     * 获取已读的总条数
     * @return int|string
     */
    public function getReadCount()
    {
        $list = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->andWhere(['reading' => 0])->count();
        return $list;
    }
}
