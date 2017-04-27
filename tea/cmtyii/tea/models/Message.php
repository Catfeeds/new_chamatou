<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%message}}".
 *
 * @property integer $Id
 * @property string $shoper_id
 * @property string $store_id
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
            [['shoper_id', 'type', 'add_time', 'status', 'delete_tag', 'delete_time','store_id'], 'integer'],
            [['content','shoper_id','add_time','type','phone','username','title'], 'required','message'=>Yii::t('app','table')['param_type_null'] ,'on'=>['add']],
            [['content'], 'string'],
            [['phone'], 'string', 'max' => 15],
            [['username'], 'string', 'max' => 10],
            [['title'], 'string', 'max' => 64],
            [['type'],'in','range'=>[1,2,3]]
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
            'type' => 'Type',
            'content' => 'Content',
            'phone' => 'Phone',
            'username' => 'Username',
            'add_time' => 'Add Time',
            'status' => 'Status',
            'delete_tag' => 'Delete Tag',
            'delete_time' => 'Delete Time',
            'title' => 'Title',
        ];
    }

    /**
     * 添加一条留言
     */
    public function add($data)
    {
        $data['shoper_id'] = Yii::$app->session->get('shoper_id');
        $data['store_id'] = Yii::$app->session->get('store_id');
        $data['add_time']  = time();
        $this->scenario = 'add';
        if($this->load($data,'') && $this->save())
        {
            return true;
        }
        return false;
    }
}
