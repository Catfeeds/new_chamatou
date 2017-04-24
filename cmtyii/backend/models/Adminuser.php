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
            'id' => 'ID',
            'username' => '用户名',
            'real_name' => '姓名',
            'phone' => '手机',
            'auth_key' => 'Auth Key',
            'password_hash' => 'Password Hash',
            'password_reset_token' => 'Password Reset Token',
            'email' => '邮箱',
            'status' => '状态',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
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
    public function createAdminuser()
    {

        $this->setPassword('123456');
        $this->generateAuthKey();

        return $this->save() ? $this : null;
    }

}
