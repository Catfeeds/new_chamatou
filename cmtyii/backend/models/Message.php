<?php

namespace backend\models;

use backend\models\query\MessageQuery;
use Yii;

/**
 * This is the model class for table "{{%message}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $type
 * @property string $content
 * @property string $phone
 * @property string $username
 * @property integer $add_time
 * @property integer $status
 * @property integer $delete_tag
 * @property integer $delete_time
 * @property string $title
 */
class Message extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%message}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id', 'type', 'add_time', 'status', 'delete_tag', 'delete_time'], 'integer'],
            [['content'], 'required'],
            [['content'], 'string'],
            [['phone'], 'string', 'max' => 15],
            [['username'], 'string', 'max' => 10],
            [['title'], 'string', 'max' => 64],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'shoper_id' => Yii::t('app', 'Shoper ID'),
            'store_id' => Yii::t('app', 'Store ID'),
            'type' => Yii::t('app', 'Type'),
            'content' => Yii::t('app', 'Content'),
            'phone' => Yii::t('app', 'Phone'),
            'username' => Yii::t('app', 'Username'),
            'add_time' => Yii::t('app', 'Add Time'),
            'status' => Yii::t('app', 'Status'),
            'delete_tag' => Yii::t('app', 'Delete Tag'),
            'delete_time' => Yii::t('app', 'Delete Time'),
            'title' => Yii::t('app', 'Title'),
        ];
    }

    /**
     * @inheritdoc
     * @return MessageQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MessageQuery(get_called_class());
    }

    public function getStoreName()
    {
        return $this->hasOne(SpStore::className(), ['id'=> 'store_id']);
    }

    /**
     * 查看的时候调用。将留言标记为已读
     * @param $id
     * @return static
     */
    public static function view($id)
    {
        $model = Message::findOne($id);
        $model->status =1;
        $model->save();
        return $model;
    }
}
