<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%wx_user}}".
 *
 * @property integer $id
 * @property string $nickname
 * @property integer $add_time
 * @property string $openid
 * @property string $beans
 * @property string $phone
 * @property string $photo
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
            [['openid', 'photo'], 'string', 'max' => 255],
            [['phone'], 'string', 'max' => 15],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'nickname' => Yii::t('app', 'Nickname'),
            'add_time' => Yii::t('app', 'Add Time'),
            'openid' => Yii::t('app', 'Openid'),
            'beans' => Yii::t('app', 'Beans'),
            'phone' => Yii::t('app', 'Phone'),
            'photo' => Yii::t('app', 'Photo'),
        ];
    }
}
