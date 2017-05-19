<?php

namespace tea\models;

use Yii;

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
            'id' => 'ID',
            'name' => 'Name',
            'parent_id' => 'Parent ID',
            'level' => 'Level',
        ];
    }

    /**
     * 地址联动数据生成
     * @return array|mixed|\yii\db\ActiveRecord[]
     */
    public static function getList()
    {
        if (Yii::$app->cache->get('locations')) {
            return unserialize(Yii::$app->cache->get('locations'));
        }
        $list = [];
        $lists = self::find()
            ->andWhere(['level' => 1])
            ->asArray()
            ->select(['id', 'name', 'parent_id'])
            ->all();
        //查询所有的省
        foreach ($lists as $provinceKey => $provinceValue) {
            $list[$provinceKey] = $provinceValue;
            $data = self::find()
                ->andWhere(['level' => 2])
                ->andWhere(['parent_id' => $provinceValue['id']])
                ->select(['id', 'name', 'parent_id'])
                ->asArray()
                ->all();
            //查询所有的市
            foreach ($data as $cityKey => $cityValue) {
                $list[$provinceKey]['city'][$cityKey] = $cityValue;
                $datas = self::find()
                    ->andWhere(['level' => 3])
                    ->andWhere(['parent_id' => $cityValue['id']])
                    ->asArray()
                    ->select(['id', 'name', 'parent_id'])
                    ->all();
                //查询所有的区
                foreach ($datas as $districtKey => $districtValue) {
                    $list[$provinceKey]['city'][$cityKey]['district'][$districtKey] = $districtValue;
                }
            }
        }
        Yii::$app->cache->set('locations', serialize($list), 10000000000000);
        return $list;
    }
}
