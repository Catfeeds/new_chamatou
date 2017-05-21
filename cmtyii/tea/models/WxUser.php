<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%wx_user}}".
 *
 * @property integer $Id
 * @property string $nickname
 * @property integer $add_time
 * @property string $openid
 * @property string $beans
 * @property string $phone
 */
class WxUser extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%wx_user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['add_time'], 'integer'],
            [['beans'], 'number'],
            [['nickname'], 'string', 'max' => 20],
            [['openid'], 'string', 'max' => 255],
            [['phone'], 'string', 'max' => 15],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'nickname' => 'Nickname',
            'add_time' => 'Add Time',
            'openid' => 'Openid',
            'beans' => 'Beans',
            'phone' => 'Phone',
        ];
    }

    public static function getInfoById($id)
    {
        return self::findOne($id);
    }
}
