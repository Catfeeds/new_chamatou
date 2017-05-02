<?php
/**
 * User: harlen-angkemac
 * Date: 2017/4/26 - 下午4:53
 *
 */

namespace backend\models\form;


use backend\models\Locations;
use backend\models\Shoper;
use backend\models\ShoperImg;
use backend\models\SpStore;
use backend\models\SpUsers;
use backend\models\Upload;
use Yii;
use yii\base\Model;
use yii\helpers\ArrayHelper;
use yii\web\UploadedFile;

class CreateShoperForm extends Model
{

    //店铺信息
    public $store_sp_name; //店铺名称
    public $store_address; //店铺地址
    public $store_lat;
    public $store_lot;
    public $store_provinces_id;
    public $store_city_id;
    public $store_area_id;
    public $store_add_detail; //店铺详细地址
    public $store_sp_phone;     //店铺手机号
    public $store_cover;    //店铺封面图片名称
    public $store_intro;     //店铺简介

    //商家主体信息
    public $shoper_boss; //商家boss
    public $shoper_phone; //商家电话
    public $shoper_credit_type; //授信类型
    public $shoper_credit_amount; //授信额度
    public $shoper_contract_no; //合同号
    public $shoper_withdraw_type; //提现方式
    public $shoper_bank; //开户行
    public $shoper_bank_user; //开户人
    public $shoper_card_no; //卡号
    public $shoper_credit_remain; //授信营业
    public $shoper_status; //授信状态 0正常，1冻结
    public $shoper_salesman_id; //销售人员
    public $shoper_add_time;    //添加时间
    public $shoper_beans_incom;    //茶豆币收入
    public $shoper_total_amount;    //现金总收入
    public $shoper_withdraw_total;  //提现总额
    public $shoper_sp_status;   //商户状态
    public $shoper_pay_account; //支付宝账号

    public $file;

    public function rules()
    {
        return [
            [['store_sp_name', 'store_address','store_lat','store_lot','store_provinces_id',
                    'store_city_id','store_area_id','store_add_detail', 'store_sp_phone','store_cover',
                    'store_intro','shoper_boss', 'shoper_phone','shoper_credit_type','shoper_credit_amount','shoper_contract_no',
                'shoper_withdraw_type','shoper_bank','shoper_bank_user', 'shoper_card_no','shoper_credit_remain',
                'shoper_status','shoper_salesman_id','shoper_add_time','shoper_beans_incom','shoper_total_amount',
                'shoper_withdraw_total','shoper_sp_status','shoper_pay_account','file']
                , 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            "store_sp_name"         => Yii::t('app', '名称'),
            "store_address"        => Yii::t('app', '地址'),
            "store_lat"            => Yii::t('app', '纬度'),
            "store_lot"            => Yii::t('app', '经度'),
            "store_provinces_id"   => Yii::t('app', '省'),
            "store_city_id"        => Yii::t('app', '市'),
            "store_area_id"        => Yii::t('app', '区'),
            "store_add_detail"     => Yii::t('app', '详细地址'),
            "store_sp_phone"       => Yii::t('app', '联系电话'),
            "store_cover"          => Yii::t('app', '封面'),
            "store_intro"          => Yii::t('app', '简介'),

            //商家主体信息
            "shoper_boss"          => Yii::t('app', '负责人'),
            "shoper_phone"         => Yii::t('app', '负责人电话'),
            "shoper_credit_type"    => Yii::t('app', '授信类型'),
            "shoper_credit_amount"  => Yii::t('app', '授信金额'),
            "shoper_contract_no"    => Yii::t('app', '合同号'),
            "shoper_withdraw_type"  => Yii::t('app', '提现类型'),
            "shoper_bank"           => Yii::t('app', '开户行'),
            "shoper_bank_user"      => Yii::t('app', '开户人'),
            "shoper_card_no"        => Yii::t('app', '卡号'),
            "shoper_credit_remain"  => Yii::t('app', '授信余额'),
            "shoper_status"         => Yii::t('app', '授信状态'),
            "shoper_salesman_id"    => Yii::t('app', '销售人员'),
            "shoper_add_time"       => Yii::t('app', '添加时间'),
            "shoper_beans_incom"    => Yii::t('app', '茶豆币总收入'),
            "shoper_total_amount"   => Yii::t('app', '现金收入'),
            "shoper_withdraw_total" => Yii::t('app', '提现总额'),
            "shoper_sp_status"      => Yii::t('app', '账号状态'),
            "shoper_pay_account"    => Yii::t('app', '支付宝/微信账号'),
        ];
    }

    public function scenarios()
    {
        return parent::scenarios();
    }

    public function getCityList($pid)
    {
        return Locations::getCityList($pid);
    }

    public function createShoper()
    {
        if (!$this->validate()) {
            return null;
        }
        //保存商铺主体信息
        $shoper = new Shoper();
        $shoper->boss = $this->shoper_boss;
        $shoper->phone = $this->shoper_phone;
        $shoper->credit_amount = $this->shoper_credit_amount;
        $shoper->contract_no = $this->shoper_contract_no;
        $shoper->withdraw_type = $this->shoper_withdraw_type;
        $shoper->bank = $this->shoper_bank;
        $shoper->bank_user = $this->shoper_bank_user;
        $shoper->card_no = $this->shoper_card_no;
        $shoper->credit_remain = $this->shoper_credit_amount;
        $shoper->status = 0;
        $shoper->salesman_id = 0;
        $shoper->add_time = time();
        $shoper->beans_incom = 0;
        $shoper->total_amount = 0;
        $shoper->withdraw_total = 0;
        $shoper->sp_status = 0;
        $shoper->pay_account = $this->shoper_pay_account;

        if (!$shoper->save()) {
            return null;
        }
        //保存店铺信息
        $store = new SpStore();
        $store->shoper_id = $shoper->id;
        $store->sp_name = $this->store_sp_name;
        $store->address = '';
        $store->lat = '';
        $store->lot = '';
        $store->provinces_id = $this->store_provinces_id;
        $store->city_id = $this->store_city_id;
        $store->area_id = $this->store_area_id;
        $store->add_detail = $this->store_add_detail;
        $store->sp_phone = $this->store_sp_phone;
        $store->cover = '';
        $store->intro = $this->store_intro;

        if (!$store->save()) {
            return null;
        }

        //处理上传图片
        //TODO::上传图片位置
        $upload = new Upload();
        $uploadSuccessPath = "";
        $upload->file = UploadedFile::getInstances($upload, "file");
        $dir = "public/uploads/" . date("Ymd");
        if (!is_dir($dir)){
            mkdir($dir);
        }
        if ($upload->file && $upload->validate()) {
            foreach ($upload->file as $file) {
                $fileName = date("HiiHsHis") . $file->baseName . "." . $file->extension;
                $dir = "public/uploads/" . date("Ymd") . "/" . $fileName;
                $file->saveAs($dir);
                $uploadSuccessPath = "/uploads/" . date("Ymd") . "/" . $fileName;
                //保存图片
                $imgModel = new ShoperImg();
                $imgModel->shoper_id = $shoper->id;
                $imgModel->store_id = $store->id;
                $imgModel->path = $uploadSuccessPath;
                if($imgModel->validate()){
                    $imgModel->save();
                }
            }
        }

        //给店铺添加一个管理员-茶坊端的
        $spUser = new SpUsers();
        $spUser->store_id = $store->id;
        $spUser->shoper_id = $store->shoper_id;
        $spUser->user = 'admin';
        $spUser->phone = $store->sp_phone;
        $spUser->add_time = time();
        $spUser->password = md5('123456');
        $spUser->is_admin = 1;
        $spUser->status = 0;
        $spUser->save();

        return $shoper ? $shoper->id : null;
    }

}
