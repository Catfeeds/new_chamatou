<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "{{%adminuser}}".
 *
 * @property integer $id
 * @property string $username
 * @property string $real_name
 * @property string $phone
 * @property string $auth_key
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 */
class Adminuser extends \yii\db\ActiveRecord
{
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;

    protected $statusMsg = [];

    public function __construct(array $config = [])
    {
        parent::__construct($config);
        $this->statusMsg = [
            self::STATUS_ACTIVE => yii::t('app', 'status_active'),
            self::STATUS_DELETED => yii::t('app', 'status_deleted'),
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%adminuser}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'real_name', 'phone', 'email'], 'required'],
            [['status', 'created_at', 'updated_at'], 'integer'],
            [['username', 'real_name', 'password_hash', 'password_reset_token', 'email'], 'string', 'max' => 255],
            [['phone'], 'string', 'max' => 11],
            [['auth_key'], 'string', 'max' => 32],
            [['username'], 'unique'],
            [['email'], 'unique'],
            [['password_reset_token'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => yii::t('app', 'id'),
            'username' => yii::t('app', 'username'),
            'real_name' => yii::t('app', 'real_name'),
            'phone' => yii::t('app', 'phone'),
            'auth_key' => yii::t('app', 'auth_key'),
            'password_hash' => yii::t('app', 'password_hash'),
            'password_reset_token' => yii::t('app', 'password_reset_token'),
            'email' => yii::t('app', 'email'),
            'status' => yii::t('app', 'status'),
            'created_at' => yii::t('app', 'created_at'),
            'updated_at' => yii::t('app', 'updated_at'),
            ['password_hash', 'safe'],
        ];
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }
    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    public function getStatusMsg()
    {
        return $this->statusMsg[$this->status];
    }
}
