<?php

namespace tea\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%sp_table}}".
 *
 * @property integer $id
 * @property integer $shoper_id
 * @property string $table_name
 * @property integer $type_id
 * @property integer $people_num
 * @property integer $store_id
 */
class Table extends \yii\db\ActiveRecord
{
    private $tableLangu = [];

    # 转台需要的转台ID
    public $table_turn_id = '';

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub
        $this->tableLangu = Yii::t('app','table');
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sp_table}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['shoper_id', 'type_id', 'people_num','store_id'], 'integer','on'=>['add','edit'],'message'=>$this->tableLangu['param_type_error']],
            [['table_name','type_id','people_num','shoper_id','store_id'],'required','on'=>['add','edit'],'message'=>$this->tableLangu['param_type_null']],
            [['type_id'],'validateTypeID','on'=>['edit','add']],
            [['table_name'],'validateAddTableName','on'=>['add']],
            [['table_name'],'validateEditTableName','on'=>['edit']],
            [['id'],'validateDelID','on'=>['del']],
            [['id','table_turn_id'],'integer','on'=>['tableTurn']],
            [['id'],'validateTableTurn','on'=>['tableTurn']],
            [['id'],'validateGoodsTurn','on'=>['goodsTurn']],
        ];
    }

    /**
     * 台桌添加校验函数
     * @param $attribute
     * @param $params
     */
    public function validateAddTableName($attribute, $params)
    {
        if(!$this->hasErrors())
        {
            $data = self::find()->where('shoper_id = :shoper_id and table_name = :table_name and store_id = :store_id',
                    [':shoper_id'=>Yii::$app->session->get('shoper_id'),':table_name'=>$this->table_name,':store_id'=>Yii::$app->session->get('store_id')])
                    ->select(['id'])->one();
            if($data)
            {
                $this->addError($attribute,$this->tableLangu['table_name_exist']);
            }
        }
    }

    /**
     * 台桌修改校验函数
     * @param $attribute
     * @param $params
     */
    public function validateEditTableName($attribute, $params)
    {
        if(!$this->hasErrors())
        {
            $data = self::find()->where('shoper_id = :shoper_id and store_id = :store_id and table_name = :table_name and id != :id ',
                    [':shoper_id'=>Yii::$app->session->get('shoper_id'),':store_id'=>Yii::$app->session->get('store_id'),':table_name'=>$this->table_name,':id'=>$this->id])
                    ->select(['id'])->one();
            if($data)
            {
                $this->addError($attribute,$this->tableLangu['table_name_exist']);
            }
        }
    }

    /**
     * 台座是否可以删除检验函数
     * @param $attribute
     * @param $params
     */
    public function validateDelID($attribute, $params)
    {
        if(!$this->hasErrors())
        {
            if($this->getOrderAR())
            {
                $this->addError($attribute,$this->tableLangu['table_useing']);
            }
        }
    }
    /**
     * 台桌添加修改校验类型是否存在函数
     * @param $attribute
     * @param $params
     */
    public function validateTypeID($attribute, $params)
    {

        if(!$this->hasErrors())
        {
            $data = TableType::find()->where('shoper_id = :shoper_id and store_id=:store_id and id = :id',
                    [':shoper_id'=>Yii::$app->session->get('shoper_id'),':store_id'=>Yii::$app->session->get('store_id'),':id'=>$this->type_id])
                    ->select(['id'])->one();
            if(!$data)
            {
                $this->addError($attribute,$this->tableLangu['table_type_null']);
            }
        }
    }

    /**
     * 转台之前检查是否可以转台
     * @param $attribute
     * @param $params
     */
    public function validateTableTurn($attribute, $params)
    {
        if(!$this->hasErrors())
        {
            $model = self::findOne($this->id);
            if(empty($model))
                return $this->addError($attribute,Yii::t('app','book_table_null'));
            if(empty($model->getOrderAR()))
                return $this->addError($attribute,Yii::t('app','table_order_null'));
            $model = self::findOne($this->table_turn_id);
            if(empty($model))
                return $this->addError($attribute,Yii::t('app','book_table_null'));
            if($model->getOrderAR())
                return $this->addError($attribute,Yii::t('app','table_order_null'));
        }
    }

    /**
     * 商品转台之前检查是否可以转台
     * @param $attribute
     * @param $params
     */
    public function validateGoodsTurn($attribute, $params)
    {
        if(!$this->hasErrors())
        {
            $model = self::findOne($this->id);
            if(empty($model))
                return $this->addError($attribute,Yii::t('app','book_table_null'));
            if(empty($model->getOrderAR()))
                return $this->addError($attribute,Yii::t('app','table_order_null'));
        }
    }

    /**
     * 关联查询台桌的订单
     */
    public function getOrderAndGoods($select =[])
    {
        $order = $this->hasOne(Order::className(),['table_id'=>'id'])
                      ->select($select)->where('status = 1 and merge_order_id = 0')
                      ->asArray()->one();
        if (empty($order))
            return [];

        #查询消费的商品
        $order['goods_list'] = OrderGoods::find()->where(['order_id'=>$order['id']])->asArray()->all();

        # 算出订单价格
        $order['table_amount'] = $this->redyTableAmount($order['start_time']);
        $order['total_amount'] = 0;
        foreach ($order['goods_list'] as $key=>$value)
        {
            $order['total_amount'] += $value['sum_price'];
            $order['goods_list'][$key]['add_time'] = date('Y-m-d H:i:s',$value['add_time']);
        }
        # 格式化相应的时间
        $order['time']       = $this->ToHour($order['start_time']);
        $order['start_time'] = date('Y-m-d H:i:s',$order['start_time']);
        return $order;
    }

    /**
     *
     * 获取合并的订单
     * @param $oderId
     * @return array
     */
    public function getMergeOrder($oderId)
    {

        $MerOrder=Order::find()
                ->where('shoper_id = :shoper_id and merge_order_id=:merge_order_id and status = :status',
                            ['shoper_id'=>Yii::$app->session->get('shoper_id'),'merge_order_id'=>$oderId,'status'=>1])->all();
        if(empty($MerOrder))
            return [];

        $MerOrderArray = ArrayHelper::toArray($MerOrder);
        foreach ($MerOrder as $key=>$value)
        {
            $model = OrderGoods::find()->where(['order_id'=>$value['id']]);
            $MerOrderArray[$key]['goods_num']  = $model->count() ;
            $MerOrderArray[$key]['goods_list'] = $model->asArray()->all();
            foreach ($MerOrderArray[$key]['goods_list'] as $key1=>$value1)
                $MerOrderArray[$key]['goods_list'][$key1]['add_time'] = date('Y-m-d H:i:s',$value1['add_time']);
        }
        return $MerOrderArray;
    }

    /**
     *
     * 获取合并的订单
     * @param $oderId
     * @return array
     */
    public function getMergeOrderAR($oderId)
    {

        $MerOrder=Order::find()
            ->where('shoper_id = :shoper_id and merge_order_id=:merge_order_id and status = :status',
                ['shoper_id'=>Yii::$app->session->get('shoper_id'),'merge_order_id'=>$oderId,'status'=>1])->all();
        return $MerOrder;
    }

    /**
     * 关联查询订单
     * @return array|null|\yii\db\ActiveRecord
     */
    public function getOrderAR($select = [])
    {
        return $this->hasOne(Order::className(),['table_id'=>'id'])
                ->where('status = 1 and merge_order_id = 0')
                ->select($select)->one();
    }

    /**
     * 关联查询订单
     * @return array|null|\yii\db\ActiveRecord
     */
    public function getOrder($select = [])
    {
        return $this->hasOne(Order::className(),['table_id'=>'id'])
            ->where('status = 1 and merge_order_id = 0')
            ->asArray()->select($select)->one();
    }
    /**
     * 关联查询台桌的预定
     */
    public function getBook($select =[])
    {
        $bookData = $this->hasOne(Book::className(),['table_id'=>'id'])->select($select)->where('status = 0 ')->asArray()->one();
        if(empty($bookData))
            return $bookData;

        # 格式化时间
        $bookData['arrive_time']    = date('Y-m-d H:i:s',$bookData['arrive_time']);
        $bookData['send_time']      = date('Y-m-d H:i:s',$bookData['send_time']);
        return $bookData;
    }
    /**
     * 关联查询台桌的预定
     */
    public function getBookAR($select =[])
    {
        return $this->hasOne(Book::className(),['table_id'=>'id'])->select($select)->where('status = 0 ')->one();
    }
    /**
     * 根据台桌查询出台座类型
     */
    public function getTableType($select = [])
    {
        return $this->hasOne(TableType::className(),['id'=>'type_id'])->select($select)->asArray()->one();
    }

    /**
     * 算出桌台的使用费用
     * @param int $start_time 订单开始时间
     * @return float|int
     */
    public function redyTableAmount($start_time = 0)
    {
        $price = 0;
        $tableData = $this->getTableType();
        $h      = $this->ToHourI($start_time);
        if($tableData['type'] == 1)
        {
            $price  = round(($tableData['price'] * $h));
        }
        elseif ($tableData['type'] == 2)
        {
            $h      = ceil($h/$tableData['hour']);
            $price  = round(($h * $tableData['price']));
        }
        elseif($tableData['type'] == 3)
        {
            $price = 0;
        }

        return $price;
    }

    /***********************************************************************
    -  Function :       // 排序时间
    -  Description :    // 12:12(12个小时12分钟)
    -  Calls By:        // null
    -  Table Accessed ：// null
    -  Table Update :   // null
    -  Input :          // time 格式化的时间
    -  Output :         // string
    -  Return ：        // string
    -  Others :         // 其他说明
     ***********************************************************************/
    public function ToHourI($time){

        $time = time()-$time;
        $d = floor($time/86400);
        $h = floor($time%86400/3600);
        $i = floor($time%86400%3600/60);
        if($d >= 1)
        {
            $h = ($h + ($d * 24));
        }
        if($i >= Yii::$app->params['minTime'])
        {
            $h++;
        }
        return $h;
    }

    /***********************************************************************
    -  Function :       // 排序时间
    -  Description :    // 格式为 1天1小时1分钟
    -  Calls By:        // null
    -  Table Accessed ：// null
    -  Table Update :   // null
    -  Input :          // time 格式化的时间
    -  Output :         // string
    -  Return ：        // string
    -  Others :         // 其他说明
     ***********************************************************************/
    public function ToHour($time){

        $time = time() - $time;
        $d = floor($time/86400);
        $h = floor($time%86400/3600);
        $i = floor($time%86400%3600/60);
        if($d >= 1)
        {
            return "{$d}天{$h}小时{$i}分钟";
        }
        return "{$h}小时{$i}分钟";
    }

    /***********************************************************************
    -  Function :       // 排序时间
    -  Description :    // 格式为 今天1小时1分钟 || 名天1小时1分钟 || 2017-03-13 16:48
    -  Calls By:        // null
    -  Table Accessed ：// null
    -  Table Update :   // null
    -  Input :          // time 格式化的时间
    -  Output :         // string
    -  Return ：        // string
    -  Others :         // 其他说明
     ***********************************************************************/
    private function ToHourDouble($time)
    {
        $retTime = '';
        $YMD            = date('Y-m-d', time());
        $YMD            = strtotime($YMD);
        $jinTianTime    = $YMD + 86400;
        $mingtianTime   = $YMD + 86400 * 2;
        if ($time < $jinTianTime)
        {
            $retTime = date('H:i:s', $time);
            return '今天:' . $retTime;
        }
        elseif ($time >= $jinTianTime && $time <= $mingtianTime)
        {
            $retTime = date('H:i:s', $time);
            return '明天:' . $retTime;
        }
        else
        {
            return $retTime = date('Y-m-d H:i:s', $time);
        }
    }

    /**
     * 台座添加操作
     * @param $data
     */
    public function addTable($data)
    {
        $data['shoper_id']  =   Yii::$app->session->get('shoper_id');
        $data['store_id']  =   Yii::$app->session->get('store_id');
        $this->scenario = 'add';
        if($this->load($data,'') && $this->validate())
        {
            return $this->save();
        }
        return false;
    }

    /**
     * 台座修改操作
     * @param $data
     */
    public function editTable($data)
    {
        $this->scenario = 'edit';
        if($this->load($data,''))
        {
            return $this->save();
        }
        return false;
    }

    /**
     * 删除台座操作
     * @return false|int
     */
    public function delTable()
    {
        $this->scenario = 'del';
        if($this->validate())
        {
            return $this->delete();
        }
    }

    /**
     * 获取桌台的所有状态
     * type = 0；查询全部 1:使用中 2：预定中 3：空闲
     * ret = 1:使用中 2:已预订 3:合并 0:空闲 5:预定加使用中 6：合并加预定
     * @param int $type
     * @return array
     */
    public function getDeskStatus($type = 0)
    {
        # 查询出所有的台座类型
        $tableTypeModel = TableType::find()
                        ->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                        ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])->all();
        $tableTypeArray = ArrayHelper::toArray($tableTypeModel);
        $classification['sanzuoNum'] = 0;
        $classification['baoxiangNum'] = 0;
        foreach ($tableTypeModel as $tableTypeKey => $tableTypeValue)
        {
            # 判断分类的散座与包厢
            if($tableTypeValue->classification == 0){
                $tableTypeArray[$tableTypeKey]['classification_name'] = $this->tableLangu['sanzuo'];
            }else{
                $tableTypeArray[$tableTypeKey]['classification_name'] = $this->tableLangu['baoxiang'];
            }

            # 获取这个分类下的所有台桌
            $tableModel = $tableTypeValue->getTableAR();
            $tableArray = ArrayHelper::toArray($tableModel);
            foreach ($tableModel as $tableKey=>$tableValue)
            {
                # 统计散座包厢的数量
                if($tableTypeValue->classification == 0){
                    $classification['sanzuoNum'] ++;
                }else{
                    $classification['baoxiangNum'] ++;
                }

                # 获取这个台桌的订单与预定
                $order                          = $tableValue->getOrderAndGoods();
                $book                           = $tableValue->getBook();
                $tableArray[$tableKey]['book']  = $book;
                $tableArray[$tableKey]['order'] = $order;

                # 判断是否存在合并订单、先查看是否存在主订单
                if(!empty($order))
                    $tableArray[$tableKey]['merge_order'] = $this->getMergeOrder($order['id']);
                else
                    $tableArray[$tableKey]['merge_order'] = [];

                if($type == 0) # 显示全部
                {
                    # 使用中+合并+预定
                    if (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']) && !empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 6;
                    # 使用中+预定中
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 5;
                    # 使用中 + 合并
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']))
                        $tableArray[$tableKey]['use_type']  = 3;
                    # 使用中
                    elseif(!empty($tableArray[$tableKey]['order']))
                        $tableArray[$tableKey]['use_type']  = 1;
                    # 预定中
                    elseif (!empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 2;
                    #空闲中
                    else
                        $tableArray[$tableKey]['use_type']  = 0;
                }
                elseif ($type == 1) # 显示使用中
                {
                    # 使用中+合并+预定
                    if (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']) && !empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 6;
                    # 使用中+预定中
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 5;
                    # 使用中 + 合并
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']))
                        $tableArray[$tableKey]['use_type']  = 3;
                    # 使用中
                    elseif(!empty($tableArray[$tableKey]['order']))
                        $tableArray[$tableKey]['use_type']  = 1;
                    # 预定中
                    elseif (!empty($tableArray[$tableKey]['book']))
                        unset($tableArray[$tableKey]);
                    #空闲中
                    else
                        unset($tableArray[$tableKey]);
                }
                elseif ($type == 2) # 显示预定订单
                {
                    # 使用中+合并+预定
                    if (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']) && !empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 6;
                    # 使用中+预定中
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 5;
                    # 使用中 + 合并
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']))
                        unset($tableArray[$tableKey]);
                    # 使用中
                    elseif(!empty($tableArray[$tableKey]['order']))
                        unset($tableArray[$tableKey]);
                    # 预定中
                    elseif (!empty($tableArray[$tableKey]['book']))
                        $tableArray[$tableKey]['use_type']  = 2;
                    #空闲中
                    else
                        unset($tableArray[$tableKey]);
                }
                elseif ($type == 3) # 显示空闲
                {
                    # 使用中+合并+预定
                    if (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']) && !empty($tableArray[$tableKey]['book']))
                        unset($tableArray[$tableKey]);
                    # 使用中+预定中
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['book']))
                        unset($tableArray[$tableKey]);
                    # 使用中 + 合并
                    elseif (!empty($tableArray[$tableKey]['order']) && !empty($tableArray[$tableKey]['merge_order']))
                        unset($tableArray[$tableKey]);
                    # 使用中
                    elseif(!empty($tableArray[$tableKey]['order']))
                        unset($tableArray[$tableKey]);
                    # 预定中
                    elseif (!empty($tableArray[$tableKey]['book']))
                        unset($tableArray[$tableKey]);
                    #空闲中
                    else
                        $tableArray[$tableKey]['use_type']  = 0;
                }
            }

            $tableTypeArray[$tableTypeKey]['tables']   = $tableArray;
        }
        # 返回值封装一下
        $classification['he']      = $classification['sanzuoNum']+$classification['baoxiangNum'];
        $retData['classification'] = $classification;
        $retData['data']           = $tableTypeArray;
        return $retData;

    }

    /**
     * 获取台座的分类下的空闲分类
     * @param $type_id
     * @return array
     */
    public function getTableTypeFreeTable($type_id)
    {
       $data = self::find()->where('shoper_id = :shoper_id and type_id = :type',
                [':shoper_id'=>Yii::$app->session->get('shoper_id'),':type'=>$type_id])->select(['id','table_name'])->all();
       $table = ArrayHelper::toArray($data);
       foreach ($data as $key=>$value)
       {
           if ($value->getOrderAR(['id']))
           {
                unset($table[$key]);
           }
       }
       return $table;
    }

    /**
     * 获取台座的分类下的空闲分类
     * @param $type_id
     * @return array
     */
    public function getTableTypeUseTable($type_id)
    {
        $data = self::find()->where('shoper_id = :shoper_id and type_id = :type',
            [':shoper_id'=>Yii::$app->session->get('shoper_id'),':type'=>$type_id])->select(['id','table_name'])->all();
        $table = ArrayHelper::toArray($data);
        foreach ($data as $key=>$value)
        {
            if (!$value->getOrderAR(['id']))
            {
                unset($table[$key]);
            }
        }
        return $table;
    }

    /**
     * 台座商品转台的操作
     * @param $data
     * @return bool
     */
    public function tableGoodsTurn($data)
    {
        $this->id = $data['table_id'];
        $this->scenario = 'goodsTurn';
        if(!$this->hasErrors())
        {
            $orderModel = $this->getOrder(['id']);
            $data = OrderGoods::findOne($data['goods_id']);
            if (empty($data))
                return $this->addError('id', Yii::t('app', 'table_goods_null'));
            $data->order_id = $orderModel['id'];
            return $data->save();
        }
    }

    /**
     * 台座转台的操作
     * @param $data
     * @return bool
     */
    public function tableTurn($data)
    {
        $this->table_turn_id = $data['table_turn_id'];
        $this->id            = $data['table_id'];
        $this->scenario = 'tableTurn';
        if($this->validate() )
        {
            if(!$this->hasErrors())
            {
                $model = self::findOne($this->id);
                $modelTurn = self::findOne($this->table_turn_id);
                $orderModel = $model->getOrderAR();
                $tableType = $model->getTableType(['cate_name','type','price']);
                if($model->tableUseCost($orderModel,$tableType))
                {
                    $orderModel->table_id   = $this->table_turn_id;
                    $orderModel->start_time = time();
                    $orderModel->table_name = reset($tableType).'--'.$modelTurn->table_name;
                    return $orderModel->save();
                }
            }
        }
        return false;
    }

    /**
     * 台座合并操作
     * @param $data
     * @return bool|void
     */
    public function tableMerge($data)
    {
        $table = self::findOne($data['table_id']);
        $tableOrder = $table->getOrderAR(['id']);
        if($table) {
            # 检查出是否存在自身ID合并
            foreach ($data['table_merge_id'] as $key => $id)
            {
                if($id == $table->id)
                    unset($data['table_merge_id'][$key]);
            }
            $tables = self::find()->where(['and','shoper_id'=>Yii::$app->session->get('shoper_id'),['in','id',$data['table_merge_id']]])->all();

            if($tables)
            {
                foreach ($tables as $key=>$value)
                {
                    $order = $value->getOrderAR();
                    if($order)
                    {
                        /**
                         * 判断合并订单有没有合并订单
                         */
                        $mergeOrder = $value->getMergeOrderAR($order->id);
                        foreach ($mergeOrder as $mkey=>$mvalue)
                        {
                            $mvalue->merge_order_id = $tableOrder->id;
                            if($mvalue->save() == false)
                            {
                                $msg = $mvalue->getErrors();
                                return $this->addError('id',reset($msg));
                            }
                        }
                        $value->tableUseCost($order,$value->getTableType());
                        $order->total_amount = $order->getGoodsSumPrice();
                        $order->table_amount = $order->redyTableAmount($order->start_time);
                        $order->merge_order_id = $tableOrder->id;
                        if($order->save() == false)
                        {
                            $msg = $order->getErrors();
                            return $this->addError('id',reset($msg));
                        }

                    }
                }
                return true;
            }
            return $this->addError('id',Yii::t('app','table_merge_null_order'));
        }
        return $this->addError('id',Yii::t('app','table_merge_table_null_order'));
    }
    /**
     * 生成订单的商品数据
     * @param $order
     * @return bool
     */
    public function tableUseCost($order,$type)
    {
        $model =new OrderGoods();
        $model->order_id    = $order['id'];
        $model->goods_id    = 0;
        $model->goods_name  = $order['table_name'];
        $model->price       = $type['price'];
        $model->num         = $this->ToHourI($order['start_time']);
        $model->give        = 0;
        $model->sum_price   = $this->redyTableAmount($order['start_time']);
        $model->add_time    = time();
        $model->is_goods    = 0;
        if($type['type'] == 1)
            $model->spec ='小时';
        elseif($type['type'] == 2)
            $model->spec = '包段';
        else
            $model->spec = '免费';
        return $model->save();

    }
}
