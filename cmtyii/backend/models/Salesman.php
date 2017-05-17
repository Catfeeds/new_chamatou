<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%salesman}}".
 *
 * @property integer $id
 * @property string $username
 * @property string $phone
 * @property integer $shop_total
 * @property integer $add_time
 */
class Salesman extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%salesman}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shop_total', 'add_time'], 'integer'],
            [['add_time'], 'required'],
            [['username'], 'string', 'max' => 10],
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
            'username' => Yii::t('app', 'Username'),
            'phone' => Yii::t('app', 'Phone'),
            'shop_total' => Yii::t('app', 'Shop Total'),
            'add_time' => Yii::t('app', 'Add Time'),
        ];
    }

    public static function updateShopTotal($shoper_id, $id, $old_id)
    {
        if(empty($old_id) && !empty($id)){
            return Salesman::incShopTotal($id);
        }
        if(!empty($old_id) && !empty($id) && $old_id != $id){
            return Salesman::decShopTotal($old_id) &&
                Salesman::incShopTotal($id);
        }

        return null;
    }

    public static function incShopTotal($id, $num =1)
    {
        $model = Salesman::findOne(['id'=>$id]);
        $model->shop_total+=$num;
        return $model->save();
    }

    public static function decShopTotal($id, $num=1)
    {
        $model = Salesman::findOne(['id'=>$id]);
        $model->shop_total-=1;
        return $model->save();
    }
}
