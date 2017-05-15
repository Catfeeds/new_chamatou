<?php
/**
 * User: harlen-angkemac
 * Date: 2017/5/13 - 下午4:14
 *
 */

namespace backend\models\form;


use backend\models\Salesman;
use backend\models\Shoper;
use backend\models\SpStore;
use Yii;
use yii\base\Model;

class ShoperSalesmanForm extends Model
{
    public $isNewRecord = false;
    public $shoper_id;
    public $store_name;
    public $store_id;

    public $_old_salesman_id;
    public $salesman_id;
    public $salesman_username;

    public function attributeLabels()
    {
        return [
            'store_name' => Yii::t('app', '商铺名称'),
            'salesman_username' => Yii::t('app', '销售人员'),
            'salesman_id' => Yii::t('app', '销售人员'),
        ];
    }

    public function rules()
    {
        return [
            [['shoper_id', 'salesman_id'], 'integer'],
            [['shoper_id', 'salesman_id'], 'required']
        ];
    }

    public static function build($store_id){
        $model = new ShoperSalesmanForm();
        return $model->base($store_id);
    }

    /**
     * 初始化设置销售人员表单模型
     * @param $store_id
     * @return $this
     */
    public function base($store_id)
    {
        $storeinfo = SpStore::find()
            ->alias('store')
            ->innerJoin(Shoper::tableName() . ' as shoper', 'shoper.id = store.shoper_id')
            ->select('store.sp_name,store.shoper_id,shoper.salesman_id')
            ->where(['store.id'=>$store_id])
            ->one();
        $this->store_id = $store_id;
        $this->shoper_id = $storeinfo->shoper_id;
        $this->store_name = $storeinfo->sp_name;
        $this->salesman_id = $this->_old_salesman_id = $storeinfo->salesman_id;
        return $this;
    }

    /**
     * 设置销售人员
     * @return bool|null
     */
    public function saveSalesman()
    {
        if(!$this->validate()){
            return null;
        }
        Salesman::updateShopTotal($this->shoper_id, $this->salesman_id, $this->_old_salesman_id);
        /* 作一个冗余代码,把店铺也加入销售人员关联，如果这个项目不死，以后肯定会改成这样!!! */
        $storeModel =SpStore::findOne(['id'=>$this->store_id]);
        $storeModel->salesman_id = $this->salesman_id;
        $storeModel->save();

        $model = Shoper::findOne(['id'=>$this->shoper_id]);
        $model->id = $this->shoper_id;
        $model->salesman_id = $this->salesman_id;
        return $model->save() ? true : false;
    }
}