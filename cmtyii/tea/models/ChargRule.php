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
    const TYPE_TIME = 1;

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
        $param['shoper_id'] = Yii::$app->session->get('shoper_id');
        $param['store_id'] = Yii::$app->session->get('store_id');
        if ($this->load($param, '') && $this->validate()) {
            if ($param['type'] == self::TYPE_TIME) {
                $time = new Time();
                $time->setName($param['name']);
                $time->setType($param['type']);
                $time->setPrice($param['price']);
                $this->value = $time->saveDB();
                return $this->save();
            } elseif ($param['type'] == self::TYPE_MIANGEI) {
                $mianFei = new MianFei();
                $mianFei->setName($param['name']);
                $mianFei->setType($param['type']);
                $mianFei->setPrice(0);
                $this->value = $mianFei->saveDB();
                return $this->save();
            } elseif ($param['type'] == self::TYPE_BAODUAN) {
                $baoDuan = new BaoDuan();
                $baoDuan->setName($param['name']);
                $baoDuan->setType($param['type']);
                $baoDuan->setPrice($param['price']);
                $baoDuan->setShiDuan($param['sd']);
                $baoDuan->setMeiXiaoShiPrice($param['xsprice']);
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
        $data = self::find()->andWhere(['shoper_id' => Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id' => Yii::$app->session->get('store_id')])
            ->all();
        $retData = '';
        foreach ($data as $key => $value) {
            if ($value['type'] == self::TYPE_TIME) {
                $time = new Time();
                $time->loadDbData($value);
                $retData[$key] = $time->getArray();

            } elseif ($value['type'] == self::TYPE_BAODUAN) {
                $baoDuan = new BaoDuan();
                $baoDuan->loadDbData($value);
                $retData[$key] = $baoDuan->getArray();

            } elseif ($value['type'] == self::TYPE_MIANGEI) {
                $mianFei = new MianFei();
                $mianFei->loadDbData($value);
                $retData[$key] = $mianFei->getArray();
            }
        }
        return $retData;
    }

    /**
     * 删除一个规则！
     * @return false|int
     */
    public function del()
    {
<<<<<<< HEAD
        if(!$order = Order::find()->andWhere(['charg_id'=>$this->id])->one()){
=======
        if(!$order = Order::find()->andWhere(['charg_id'=>$this->id])->andWhere(['!=','status',2])->one()){
>>>>>>> 11ccbf4012988c804c2961d8d9c6a79e9ddf439a
            return $this->delete();
        }
        $this->addError('id','删除收费规则正在使用中！');
        return false;
    }

    /**
     * 解析函数
     * @return BaoDuan|MianFei|Time
     */
    public function parse()
    {
        if ($this->type == self::TYPE_TIME) {
            $time = new Time();
            $time->loadDbData($this);
            return $time;
        } elseif ($this->type == self::TYPE_BAODUAN) {
            $baoDuan = new BaoDuan();
            $baoDuan->loadDbData($this);
            return $baoDuan;

        } elseif ($this->type == self::TYPE_MIANGEI) {
            $mianFei = new MianFei();
            $mianFei->loadDbData($this);
            return $mianFei;
        }
    }

    /**
     * 计费规则
     * @param $chargId
     * @return mixed
     */
    public static function getName($chargId)
    {
        $model = self::findOne($chargId);
        return $model['name'];
    }
}
