<?php

namespace tea\models;

use Yii;

/**
 * This is the model class for table "{{%sp_jiaoban_conf}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $value
 */
class JiaobanConf extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_jiaoban_conf}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id'], 'integer'],
            [['value'], 'number'],
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
            'value' => 'Value',
        ];
    }

    /**
     * 获取交班预留金额
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function Get()
    {
        return self::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                ->one();
    }

    /**
     * 添加余额金额
     * @param $data
     * @return bool
     */
    public static function Set($data){
        $model = self::Get();
        if($model){
            $model->value = $data['value'];
            return $model->save();
        }else{
            $model = new JiaobanConf();
            $model->value = $data['value'];
            $model->shoper_id = Yii::$app->session->get('shoper_id');
            $model->store_id = Yii::$app->session->get('store_id');
            return $model->save();
        }
    }
}
