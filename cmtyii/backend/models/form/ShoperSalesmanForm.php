<?php
/**
 * User: harlen-angkemac
 * Date: 2017/5/13 - 下午4:14
 *
 */

namespace backend\models\form;


use backend\models\Salesman;
use backend\models\SpStore;
use Yii;
use yii\base\Model;

class ShoperSalesmanForm extends Model
{
    public $isNewRecord = false;
    public $shoper_id;
    public $store_name;

    public $salesman_id;
    public $salesman_username;

    public function attributeLabels()
    {
        return [
            'store_name' => Yii::t('app', '商铺名称'),
            'salesman_username' => Yii::t('app', '销售人员'),
        ];
    }

    public function base($store_id)
    {
        $storeinfo = SpStore::findOne(['id'=>$store_id]);

        $this->shoper_id = $storeinfo->shoper_id;
        $this->store_name = $storeinfo->sp_name;
        if($storeinfo->salesman_id){
            $salesman = Salesman::findOne(['id'=>$storeinfo->salesman_id]);
            $this->salesman_username = $salesman->username;
        }
        return $this;
    }

}