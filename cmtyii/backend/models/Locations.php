<?php

namespace backend\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "t_locations".
 *
 * @property integer $id
 * @property string $name
 * @property integer $parent_id
 * @property integer $level
 */
class Locations extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 't_locations';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'parent_id', 'level'], 'required'],
            [['parent_id', 'level'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'level' => Yii::t('app', 'Level'),
        ];
    }
    /**
     * @param $pid
     * @return array
     */
    public static function getCityList($pid)
    {
        $model = Locations::findAll(array('parent_id'=>$pid));
        return ArrayHelper::map($model, 'id', 'name');
    }
}
