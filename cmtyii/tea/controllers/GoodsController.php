<?php

namespace tea\controllers;

use tea\models\Goods;
use tea\models\GoodsCate;
use Yii;
use yii\data\Pagination;
use yii\helpers\ArrayHelper;

class  GoodsController extends ObjectController
{

    /**
     * 初始化商品列表
     * @return array
     */
//    public function actionListGoods()
//    {
//        $model = Goods::find()->where('shoper_id = :shoper_id and store_id = :store_id',
//            [':shoper_id' => Yii::$app->session->get('shoper_id'),':store_id' => Yii::$app->session->get('store_id')]);
//        $dataCount = $model->count();
//        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);
//        $data = $model->offset($page->offset)->limit($page->limit)
//            ->select(['id','cate_id','goods_name','stock','sales_price','spec'])->asArray()->all();
//        $category = GoodsCate::find()->where('shoper_id = :shoper_id and store_id = :store_id',
//            [':shoper_id'=>Yii::$app->session->get('shoper_id'),':store_id' => Yii::$app->session->get('store_id')])
//                    ->select(['id','cate_name'])->asArray()->all();
//
//        # 遍历算法处理分类的名称、程序算出、避免数据库压力
//        foreach ($category as $key=>$value)
//        {
//            foreach ($data as $dkey =>$dvalue)
//            {
//                if($dvalue['cate_id'] == $value['id'])
//                {
//                    $data[$dkey]['cate_name']=$value['cate_name'];
//                }
//            }
//        }
//
//        return [
//            'code' => 1, 'msg' => Yii::t('app', 'global')['true'],
//            'data'=>[
//                'list'=>[
//                    'goods'=>$data,
//                    'category'=>$category,
//                ],
//                'pageNum'=>$page->getPageCount(),
//                'count'  =>$dataCount,
//            ]
//        ];
//    }

    /**
     * 搜索商品
     * @return array
     */
    public function actionSearchGoods()
    {
        $get = Yii::$app->request->get();
        $model = new Goods();
        $data = $model->search($get);
        return ['code' => 1, 'msg' => Yii::t('app', 'global')['true'],
            'data'=>$data
        ];

    }

    /**
     * 获取商品分类下的商品带分页功能
     * @return array
     */
    public function actionGetCateGoodsPage()
    {
        if(Yii::$app->request->isGet)
        {
            $goods = new Goods();
            $data  = $goods->getCateGoodsPage(Yii::$app->request->get('cate_id',''));
            return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    /**
     * 获取商品分类及其下面的商品 GET提交
     * @return array
     */
    public function actionGoodsCateAndGoods()
    {
        if(Yii::$app->request->isGet)
        {
            $cateGoods = new GoodsCate();
            $data = $cateGoods->getAllCateAndGoods();

            return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    /**
     * 获取商品分类GET提交
     * @return array
     */
    public function actionGoodsCate()
    {
        if(Yii::$app->request->isGet)
        {
            $cateGoods = new GoodsCate();
            $data = $cateGoods->getAlls();
            return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$data];
        }
    }

    /**
     * 添加商品分类 POST提交
     * @return array
     */
    public function actionGoodsCateAdd()
    {
        if (Yii::$app->request->isPost)
        {
            $cateGoods = new GoodsCate();
            $addRet = $cateGoods->addCategory(Yii::$app->request->post());
            if($addRet){
                return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
            }
            $message = $cateGoods->getFirstErrors();
            $message = reset($message);

            return ['code'=>0,'msg'=>$message];
        }
    }

    /**
     * 修改 POST提交
     * @return array
     */
    public function actionGoodsCateEdit()
    {
        if (Yii::$app->request->isPost)
        {
            $cateGoods = GoodsCate::findOne(Yii::$app->request->post('cate_id'));
            if($cateGoods)
            {
                $addRet = $cateGoods->editCategory(Yii::$app->request->post());
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $cateGoods->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','goods_cate_id_exist')];
        }
    }

    /**
     * 删除 POST提交
     * @return array
     */
    public function actionGoodsCateDel()
    {
        if (Yii::$app->request->isPost)
        {
            $cateGoods = GoodsCate::findOne(Yii::$app->request->post('cate_id'));
            if($cateGoods)
            {
                $addRet = $cateGoods->delCategory();
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $cateGoods->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','goods_cate_id_exist')];
        }
    }

    /**
     * 添加一个商品资料
     * @return array
     */
    public function actionAdd()
    {
        if(Yii::$app->request->isPost)
        {
            $goods = new Goods();
            $data = $goods->add(Yii::$app->request->post());
            if($data){
                return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
            }
            $message = $goods->getFirstErrors();
            $message = reset($message);
            return ['code'=>0,'msg'=>$message];
        }
    }

    /**
     * 修改一个商品资料
     * 算法思路：
     * 1.POST提交为修改操作
     * 2.GET提交为修改一个商品资料
     *
     * @return array
     */
    public function actionEdit()
    {
        if (Yii::$app->request->isPost)
        {
            $goods = Goods::findOne(Yii::$app->request->post('goods_id'));
            if($goods)
            {
                $addRet = $goods->edit(Yii::$app->request->post());
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $goods->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','goods_id_not_exist')];
        }
        else
        {
            $goods = Goods::findOne(Yii::$app->request->get('goods_id'));
            if($goods){
                $retData = $goods->getOneGoods();
                return ['code'=>1,'msg'=>Yii::t('app', 'global')['true'],'data'=>$retData];
            }
            return ['code'=>0,'msg'=>Yii::t('app','goods_id_not_exist')];
        }
    }


    /**
     * 删除一个商品资料
     * @return array
     */
    public function actionDel()
    {
        if (Yii::$app->request->isPost)
        {
            $goods = Goods::findOne(Yii::$app->request->post('goods_id'));
            if($goods)
            {
                $addRet = $goods->del();
                if($addRet){
                    return ['code'=>1,'msg'=>Yii::t('app', 'global')['true']];
                }
                $message = $goods->getFirstErrors();
                $message = reset($message);

                return ['code'=>0,'msg'=>$message];
            }
            return ['code'=>0,'msg'=>Yii::t('app','goods_id_not_exist')];
        }
    }
}