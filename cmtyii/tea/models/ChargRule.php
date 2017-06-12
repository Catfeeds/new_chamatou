<?php

namespace tea\models;

use tea\models\charge\BaoDuan;
use tea\models\charge\Time;
use tea\models\charge\MianFei;
use Yii;

/**
 * This is the model class for table "{{%sp_charg_rule}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property integer $type
 * @property string $name
 * @property string $value
 */
class ChargRule extends \yii\db\ActiveRecord
{
    /**
     * 计时类型
     */
    const TYPE_TIME  = 1;

    /**
     * 包段类型
     */
    const TYPE_BAODUAN = 2;

    /**
     * 免费类型
     */
    const TYPE_MIANGEI = 3;


    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_charg_rule}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id', 'shoper_id', 'store_id', 'type'], 'integer'],
            [['value'], 'string'],
            [['name'], 'string', 'max' => 120],
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
            'type' => 'Type',
            'name' => 'Name',
            'value' => 'Value',
        ];
    }

    /**
     * 创建一个计费规则
     * @param $param
     * @return bool
     */
    public function create($param)
    {
        if($this->load($param,'') && $this->validate()){
            if ($param['type'] == self::TYPE_TIME) {
                $time = new Time();
                $time->setName($param['name']);
                $time->setType($param['type']);
                $time->setPrice($param['price']);
                $this->value = $time->saveDB();
                return $this->save();
            }
            elseif ($param['type'] == self::TYPE_MIANGEI)
            {
                $mianFei = new MianFei();
                $mianFei->setName($param['name']);
                $mianFei->setType($param['type']);
                $mianFei->setPrice(0);
                $this->value = $mianFei->saveDB();
                return $this->save();
            }
            elseif ($param['type'] == self::TYPE_BAODUAN)
            {
                $baoDuan = new BaoDuan();
                $baoDuan->setName($param['name']);
                $baoDuan->setType($param['type']);
                $baoDuan->setPrice($param['price']);
                $baoDuan->setShiDuan($param['sd']);
                $baoDuan->setHuanChongTime($param['hctime']);
                $baoDuan->setMeiXiaoShiPrice($param['xstime']);
                $this->value = $baoDuan->saveDB();
                return $this->save();
            }
        }
    }

    /**
     * 获取所有收费规则
     * @return string
     */
    public function getList()
    {
        $data = self::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
            ->all();
        $retData = '';
        foreach ($data as $key=>$value)
        {
            if($value['type'] == self::TYPE_TIME)
            {
                $time = new Time();
                $time->loadDbData($value);
                $retData[$key] = $time->getArray();

            }
            elseif ($value['type'] == self::TYPE_BAODUAN)
            {
                $baoDuan = new BaoDuan();
                $baoDuan->loadDbData($value);
                $retData[$key] = $baoDuan->getArray();

            }
            elseif ($value['type'] == self::TYPE_MIANGEI)
            {
                $mianFei = new MianFei();
                $mianFei->loadDbData($value);
                $retData[$key] = $mianFei->getArray();
            }
        }
        return $retData;
    }
}
