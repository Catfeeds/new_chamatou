<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
namespace  tea\models;

use yii\base\Model;
use Yii;
use yii\data\Pagination;

class ErpLogic extends Model
{
    public function rules()
    {

    }

    /**
     * 库存获取列表的功能实现
     * 1.带分页
     * 2.带搜索
     * @param array $data
     * @return array
     */
    public function getListSearchPage($data = [])
    {
        if(empty($data)){
            $data['select']  = 'dosing';
            $data['keyword'] = '';
        }

        if ($data['select'] == 'goods')
        {
            return $this->getGoodsListSearchPage($data);
        }
        elseif ($data['select'] == 'dosing')
        {
            return $this->getDosingListSearchPage($data);
        }
    }

    /**
     * 获取商品列表、带分页功能
     * 算法思路：
     * 1.初始化data数据、防止数据为空、报错
     * 2.查询数据库、并返回所有的数据条数
     * 3.使用分页组件、进行分页
     * 4.返回数据
     * @param $data
     * @return mixed
     */
    public function getGoodsListSearchPage($data, $cate_id = '')
    {
        if(empty($data)){
            $data['select']  = 'dosing';
            $data['keyword'] = '';
        }

        $session = Yii::$app->session;
        $goods = Goods::find()
                ->andWhere(['shoper_id'=>$session->get('shoper_id')])
                ->andWhere(['store_id'=>$session->get('store_id')])
                ->andWhere(['like','goods_name',$data['keyword']])
                ->andWhere(['is_stock'=>1])
                ->select(['id','goods_name','stock','sales_price','unit']);

        if($cate_id != '' && $cate_id != 0)
        {
            $goods = $goods->andWhere(['cate_id'=>$cate_id]);
        }

        $count = $goods->count();

        $goodsPages  = new Pagination([
            'totalCount'=>$goods->count(),
            'pageSize'=>Yii::$app->params['pageSize']
        ]);

        $list = $goods->offset($goodsPages->offset)->limit($goodsPages->limit)->asArray()->all();
        foreach ($list as $key=>$value){
            $list[$key]['class'] = '商品';
            $list[$key]['name']  = $value['goods_name'];
        }
        $datas['pageNum']    = $goodsPages->getPageCount();
        $datas['pageCount']  = $count;
        $datas['list']       = $list;

        return $datas;
    }

    /**
     * 获取原料商品、带分页功能
     * 算法思路：
     * 1.初始化data数据、防止数据为空、报错
     * 2.查询数据库、并返回所有的数据条数
     * 3.使用分页组件、进行分页
     * 4.返回数据
     * @param $data
     * @return mixed
     */
    public function getDosingListSearchPage($data)
    {
        if(empty($data)){
            $data['select']  = 'dosing';
            $data['keyword'] = '';
        }

        $session = Yii::$app->session;
        $dosing = Dosing::find()
                ->andWhere(['shoper_id'=>$session->get('shoper_id')])
                ->andWhere(['store_id'=>$session->get('store_id')])
                ->andWhere(['like','name',$data['keyword']])
                ->select(['id','name','unit','stock']);

        $count       = $dosing->count();
        $goodsPages  = new Pagination([
            'totalCount'=>$dosing->count(),
            'pageSize'=>Yii::$app->params['pageSize']
        ]);
        $list        = $dosing->offset($goodsPages->offset)->limit($goodsPages->limit)->asArray()->all();
        foreach ($list as $key=>$value){
            $list[$key]['class'] = '原料';
        }
        $datas['pageNum']    = $goodsPages->getPageCount();
        $datas['pageCount']  = $count;
        $datas['list']       = $list;

        return $datas;
    }

    /**
     * 初始化商品列表
     * @param $data
     * @return mixed
     */
    public function initPushGoodsPage($data)
    {
        $data['cate_id'] = isset($data['cate_id']) ? $data['cate_id'] : '';
        $data['select']  = isset($data['select']) ? $data['select'] : 'goods';
        if($data['select'] == 'goods')
        {
            $list = $this->getGoodsListSearchPage([],$data['cate_id']);
            $cate = GoodsCate::find()->andWhere(['shoper_id'=>Yii::$app->session->get('shoper_id')])
                                    ->andWhere(['store_id'=>Yii::$app->session->get('store_id')])
                                    ->select(['id','cate_name'])
                                    ->all();
            $list['cate'] = $cate;
            return $list;
        }elseif ($data['select'] == 'dosing'){
            $list = $this->getDosingListSearchPage([]);
            foreach ($list['list'] as $key=>$value ){
                $list['list'][$key]['sales_price'] = 0;
            }
            return $list;
        }
    }

}