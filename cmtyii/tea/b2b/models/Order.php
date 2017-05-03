<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace tea\b2b\models;

use Yii;

/**
 * This is the model class for table "{{%order}}".
 *
 * @property integer $Id
 * @property integer $shoper_id
 * @property integer $store_id
 * @property string $order_no
 * @property integer $add_time
 * @property integer $status
 * @property string $username
 * @property string $address
 * @property string $phone
 * @property integer $pay_time
 * @property integer $send_time
 * @property integer $get_time
 * @property string $express_no
 * @property integer $express_id
 * @property string $total_amount
 * @property string $credtit_amout
 * @property string $cash_amout
 * @property string $beans_amount
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'store_id','add_time', 'status', 'pay_time', 'send_time', 'get_time', 'express_id'], 'integer'],
            [['total_amount', 'credtit_amout', 'beans_amount'], 'number'],
            [['order_no', 'express_no'], 'string', 'max' => 20],
            [['username'], 'string', 'max' => 10],
            [['address', 'cash_amout'], 'string', 'max' => 255],
            [['phone'], 'string', 'max' => 15],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'store_id'=>'store_id',
            'shoper_id' => 'Shoper ID',
            'order_no' => 'Order No',
            'add_time' => 'Add Time',
            'status' => 'Status',
            'username' => 'Username',
            'address' => 'Address',
            'phone' => 'Phone',
            'pay_time' => 'Pay Time',
            'send_time' => 'Send Time',
            'get_time' => 'Get Time',
            'express_no' => 'Express No',
            'express_id' => 'Express ID',
            'total_amount' => 'Total Amount',
            'credtit_amout' => 'Credtit Amout',
            'cash_amout' => 'Cash Amout',
            'beans_amount' => 'Beans Amount',
        ];
    }

    /**
     * 返回所有订单数量
     * @return int|string
     */
    public static function getCount()
    {
        $model = self::find()
            ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
            ->andWhere(['store_id'=>Yii::$app->session->get('store_id')]);
        $count = $model->count();
        return $count;
    }
}
