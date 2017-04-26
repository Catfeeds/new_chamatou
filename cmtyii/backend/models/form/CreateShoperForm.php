<?php
/**
 * User: harlen-angkemac
 * Date: 2017/4/26 - 下午4:53
 *
 */

namespace backend\models\form;


use Yii;
use yii\base\Model;

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

    public function rules()
    {
        return [

        ];
    }
    public function attributeLabels()
    {
        return [
            'store_sp_name' => Yii::t('app', 'Store Sp Name'),
            'store_' => Yii::t('app', 'Store Sp Name'),
        ];
    }
}
