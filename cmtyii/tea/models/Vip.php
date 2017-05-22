<?php

namespace tea\models;

use tea\models\VipPay;
use Yii;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%sp_vip}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property integer $user_id
 * @property string $phone
 * @property string $card_no
 * @property string $username
 * @property string $total_amount
 * @property string $vip_amount
 * @property integer $password_type
 * @property string $password
 * @property integer $sex
 * @property integer $birthday
 * @property integer $notes
 * @property integer $address
 */
class Vip extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_vip}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'phone', 'username', 'card_no', 'birthday'], 'required', 'message' => Yii::t('app', 'table')['param_type_null'], 'on' => ['add']],
            [['shoper_id','user_id', 'sex'], 'integer', 'message' => Yii::t('app', 'table')['param_type_error'], 'on' => ['add']],
            [['phone'], 'validatePhone', 'on' => ['add']],
            [['phone'], 'match','pattern'=>'/^(1(([35][0-9])|(47)|[8][0126789]))\d{8}$/','on' => ['add']],
            [['notes', 'address'], 'safe'],
            [['sex'], 'in', 'range' => [1, 2], 'on' => 'add'],
        ];
    }

    /**
     * 判断手机号码是否可以注册
     */
    public function validatePhone($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $data = self::find()->where('phone = :phone and shoper_id = :shoper_id',
                [':phone' => $this->phone,':shoper_id'=>Yii::$app->session->get('shoper_id')])->select(['id'])->one();
            if ($data) {
                $this->addError($attribute, Yii::t('app', 'vip')['phone_exits']);
            }
        }
    }

    /**
     * 添加会员卡
     * @param $data
     * @return bool
     */
    public function add($data)
    {
        $this->scenario = 'add';
        $data['card_no'] = $this->randCardOn();
        $data['birthday'] = strtotime($data['birthday']);
        $data['shoper_id'] = Yii::$app->session->get('shoper_id');

        if ($this->load($data, '') && $this->save()) {
            return true;
        }
        return false;
    }

    /**
     * 会员删除
     * @param $data
     * @return array|bool
     */
    public function del($data)
    {
        $model = self::findOne($data['vip_id']);
        if($model)
        {
            $pay_list = $model->getPayAR('id');
            foreach ($pay_list as $key=>$value)
            {
                if(!$value->delete())
                {
                    return $this->addError('id',Yii::t('app','vip')['vip_del_pay']);
                }
            }
            return (bool)$model->delete();

        }
        return $this->addError('id',Yii::t('app','vip')['phone_null']);
    }

    /*
     * 随机生成卡号
     * */
    public function randCardOn()
    {
        $time = date('YmdHis', time());
        $time .= rand(1, 9999);
        $card = self::find()
            ->where("card_no = :card_no and shoper_id = :shoper_id", [':card_no' => $time, ':shoper_id' => Yii::$app->session->get('shoper_id')])
            ->one();
        if (!empty($card)) {
            return $this->randCardOn();
        }

        return $time;
    }

    /**
     * 搜索功能实现
     * @param $data
     * @return array
     */
    public function search($data)
    {
        $model = self::find()->where('shoper_id = :shoper_id and username like :username and phone  like :phone',[
                    ':shoper_id'=>Yii::$app->session->get('shoper_id'),
                    ':username' =>"%".$data['username']."%",
                    ':phone' =>"%".$data['phone']."%"]);
        $dataCount = $model->count();
        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)
                      ->select([])->asArray()->all();
        foreach ($data as $key => $value)
        {
            # 格式化时间
            $data[$key]['birthday'] = date('Y-m-d',$value['birthday']);
            if($value['sex'] == 1)
                $data[$key]['sex'] = '男';
            elseif ($value['sex'] == 2)
                $data[$key]['sex'] = '女';
        }
        return ['dateList'=>$data,'page'=>['pageCount'=>$page->getPageCount(),'dataCount'=>$dataCount]];
    }

    /**
     * 获取用户充值记录
     * @param array $select
     * @return  array
     */
    public function getPayAR($select = [])
    {
        $data = $this->hasMany(VipPay::className(),['vip_id'=>'id'])
                    ->where('shoper_id =:shoper_id',[':shoper_id'=>Yii::$app->session->get('shoper_id')])
                    ->select($select)->all();
        return $data;
    }
    /**
     * 获取用户充值记录
     * @param array $select
     * @return  array
     */
    public function getPay($select = [])
    {
        $data = $this->hasMany(VipPay::className(),['vip_id'=>'user_id'])
                    ->where('shoper_id =:shoper_id',[':shoper_id'=>Yii::$app->session->get('shoper_id')])->select($select)->asArray()->all();
        return $data;
    }

    /**
     * 会员充值接口
     * @param $data
     * @return array|bool
     */
    public function pay($data)
    {
        $vipModel = self::find()->where('shoper_id=:shoper_id and id = :id',
            [':shoper_id'=>Yii::$app->session->get('shoper_id'),':id'=>$data['vip_id']])->one();
        if($vipModel)
        {
            $data['add_time']       = time();
            $data['vip_id']         = $vipModel->id;
            $data['shoper_id']      = Yii::$app->session->get('shoper_id');
            $data['tea_user_id']    = Yii::$app->session->get('tea_user_id');
            $data['paly_on']        = $this->payNo();
            $data['zs']             = empty($data['zs']) ? 0 :$data['zs'];
            $data['pay_up_amount']  = $vipModel->vip_amount;
            $vipPay = new VipPay();
            if ($vipPay->load($data, '') && $vipPay->save()) {
                $vipModel->vip_amount = ($vipModel->vip_amount + $data['amount'] + $data['zs']);
                if ($vipModel->save())
                {
                    $vipPay->add_time = date('Y-m-d H:i:s',$vipPay->add_time);
                    return ArrayHelper::toArray($vipPay);
                }
                return false;
            }
            $msg = $vipPay->getFirstErrors();
            return $this->addError('id', reset($msg));
        }
        return $this->addError('id','会员不存在');
    }

    /**
     * 获取
     * @return false|string
     */
    public function payNo()
    {
        $time = date('HisYmd', time());
        $time .= rand(1, 9999);
        return $time;
    }
    /**
     * 翻译充值的类型
     * @param int $type 数据库ＩＤ
     * @return string
     */
    public function toplayType($type=1)
    {
        if($type == 1)
            return '现金';
        elseif ($type == 2)
            return 'pos';
        elseif ($type == 3)
            return '微信';
        elseif ($type == 4)
            return '支付宝';
        else
            return '未知';

    }

    /**
     * 会员充值记录查询
     * @param $data
     * @return array
     */
    public function payList($data)
    {

        $data['username'] = empty($data['username']) ? '' :$data['username'];
        $data['phone']    = empty($data['phone'])     ? '' :$data['phone'];
        $model = self::find()
            ->where('shoper_id = :shoper_id and username like :username and phone  like :phone',[
            ':shoper_id'=>Yii::$app->session->get('shoper_id'),
            ':username' =>"%".$data['username']."%",
            ':phone'    =>"%".$data['phone']."%"])->select(['id'])->asArray()->all();

        $vip_id = [];
        foreach ($model as $key=>$value)
            $vip_id[] = (int)$value['id'];

        $model = VipPay::find()->where(['in','vip_id',$vip_id]);
        $dataCount = $model->count();
        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)
            ->select([])->asArray()->all();
        foreach ($data as $key => $value)
        {
            # 格式化时间
            $data[$key]['add_time'] = date('Y-m-d H:i:s',$value['add_time']);
            $vip = self::find()->where('id = :id',[':id'=>$value['vip_id']])->select(['id','username','phone','card_no'])->asArray()->one();
            $data[$key]['print_id'] = $data[$key]['id'];
            $data[$key]['username'] = $vip['username'];
            $data[$key]['phone']    = $vip['phone'];
            $data[$key]['card_no']  = $vip['card_no'];
            $data[$key]['sum']      = number_format($value['amount'] + $value['zs'] + $value['pay_up_amount'],2);
        }
        return ['dateList'=>$data,'page'=>['pageCount'=>$page->getPageCount(),'dataCount'=>$dataCount]];
    }

    /**
     * 根据手机号查询会员卡
     * @param $phone
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function getVipByPhone($phone,$select=[])
    {
        if($phone){
            $data = self::find()->andWhere(['phone'=>$phone])
                        ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                        ->select($select)
                        ->one();
            return $data;

        }
        return [];
    }

    /**
     * 根据ID查询姓名
     * @param $id
     * @param array $select
     * @return array|null|\yii\db\ActiveRecord
     */
    public static function getUsernameById($id,$select=[])
    {
        if($id){
            $data = self::find()->andWhere(['id'=>$id])
                        ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                        ->select($select)
                        ->one();
            return $data;

        }
        return [];
    }

    /**
     * 会员消费记录
     * @param $pn
     * @return mixed
     */
    public function consume($pn)
    {
        $model = Order::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                              ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                              ->andWhere(['!=','vip_user_id',0])
                                ->andWhere(['merge_order_id'=>0]);
        if(isset($pn['start_time']) && !empty($pn['start_time']))
        {
            $model = $model->andWhere(['>','end_time',strtotime($pn['start_time'])]);
        }

        if(isset($pn['end_time'])  && !empty($pn['end_time']))
        {
            $model = $model->andWhere(['<','end_time',strtotime($pn['end_time'])]);
        }

        if(isset($pn['user_id']) && !empty($pn['user_id']))
        {
            $model = $model->andWhere(['user_id'=>$pn['user_id']]);
        }
        $count = $model->count();
        $pages = new Pagination(['totalCount'=>$count,'pageSize'=>Yii::$app->params['pageSize']]);
        $list = $model->offset($pages->offset)->limit($pages->limit)->asArray()->all();
        foreach ($list as $key=>$value)
        {
            $list[$key]['start_time'] = date('Y-m-d H:i:s',$value['start_time']);
            $list[$key]['end_time'] = date('Y-m-d H:i:s',$value['end_time']);
            $list[$key]['user_id'] = UsersForm::getUserNameById($value['user_id']);
            $list[$key]['xfsc'] = Time::ToHour($value['start_time'],$value['end_time']);
            $list[$key]['goods_sum_price'] = $value['total_amount'] - $value['table_amount'];
            $vip = Vip::getUsernameById($value['vip_user_id']) ;
            $list[$key]['vip_name'] =  $vip['username'];
        }

        $datas['pageCount'] = $count;
        $datas['pageNum'] = $pages->getPageCount();
        $datas['list'] = $list;
        return $datas;
    }
}
