<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_book}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $wx_user_id
 * @property integer $vip_user_id
 * @property integer $table_id
 * @property string $deposit
 * @property integer $add_time
 * @property integer $radd_time
 * @property integer $status
 * @property integer $arrive_time
 * @property string $username
 * @property string $phone
 * @property string $notes
 * @property integer $send_time
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_book}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'wx_user_id', 'vip_user_id', 'table_id','store_id','add_time', 'radd_time', 'status', 'arrive_time', 'send_time'], 'integer'],
            [['deposit'], 'number'],
            [['username'], 'string', 'max' => 32],
            [['phone'], 'string', 'max' => 15],
            [['notes'], 'string', 'max' => 120],
            [['shoper_id','username','phone','add_time','table_id','arrive_time'],'required','on'=>['add']],
            [['status'],'in','range'=>[0,1,2]],
            [['phone'],'validateTableStatus','on'=>['add']],
        ];
    }

    /**
     * 判断台座是否可以预定
     */
    public function validateTableStatus($attribute, $params)
    {
        if(!$this->hasErrors())
        {
            $model = Table::findOne($this->table_id);
            if(empty($model))
                return $this->addError($attribute,Yii::t('app','book_table_null'));
            if($model->getBook())
                return $this->addError($attribute,Yii::t('app','book_table_not_null'));
            if($model->getOrderAR())
                return $this->addError($attribute,Yii::t('app','book_table_not_null'));
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'shoper_id' => Yii::t('app', 'Shoper ID'),
            'wx_user_id' => Yii::t('app', 'Wx User ID'),
            'vip_user_id' => Yii::t('app', 'Vip User ID'),
            'table_id' => Yii::t('app', 'Table ID'),
            'deposit' => Yii::t('app', 'Deposit'),
            'add_time' => Yii::t('app', 'Add Time'),
            'radd_time' => Yii::t('app', 'Radd Time'),
            'status' => Yii::t('app', 'Status'),
            'arrive_time' => Yii::t('app', 'Arrive Time'),
            'username' => Yii::t('app', 'Username'),
            'phone' => Yii::t('app', 'Phone'),
            'notes' => Yii::t('app', 'Notes'),
            'send_time' => Yii::t('app', 'Send Time'),
        ];
    }

    /**
     * 添加预定功能
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $data['shoper_id']  = Yii::$app->session->get('shoper_id');
        $data['store_id']  = Yii::$app->session->get('store_id');
        $data['add_time']   = time();
        $data['arrive_time']= strtotime($data['arrive_time']);
        $data['send_time']= strtotime($data['send_time']);
        $this->scenario = 'add';
        if($this->load($data,'') && $this->save())
            return true;
        return false;
    }

    /**
     * 预定订单完成函数
     * @param $data
     * @return bool
     */
    public function endBook($data)
    {
        $table = Table::findOne($data['table_id']);
        if($table)
        {
            $book  = $table->getBookAR();
            if($book)
            {
                $book->status = 1;
                return $book->save();
            }
        }
        return false;
    }
}
