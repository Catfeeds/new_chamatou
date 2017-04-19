<?php
namespace tea\controllers;

use tea\models\Goods;
use tea\models\GoodsCate;
use Yii;
use yii\data\Pagination;

class  GoodsController extends ObjectController
{

    /**
     * 初始化商品列表
     * @return array
     */
    public function actionListGoods()
    {
        $model = Goods::find()->where('shoper_id = :shoper_id and store_id = :store_id',
            [':shoper_id' => Yii::$app->session->get('shoper_id'),':store_id' => Yii::$app->session->get('store_id')]);
        $dataCount = $model->count();
        $page = new Pagination(['totalCount' => $dataCount, 'pageSize' => Yii::$app->params['pageSize']]);
        $data = $model->offset($page->offset)->limit($page->limit)
            ->select(['id','cate_id','goods_name','store','sales_price','spec'])->asArray()->all();
        $category = GoodsCate::find()->where('shoper_id = :shoper_id and store_id = :store_id',
            [':shoper_id'=>Yii::$app->session->get('shoper_id'),':store_id' => Yii::$app->session->get('store_id')])
                    ->select(['id','cate_name'])->asArray()->all();

        # 遍历算法处理分类的名称、程序算出、避免数据库压力
        foreach ($category as $key=>$value)
        {
            foreach ($data as $dkey =>$dvalue)
            {
                if($dvalue['cate_id'] == $value['id'])
                {
                    $data[$dkey]['cate_name']=$value['cate_name'];
                }
            }
        }

        return [
            'code' => 1, 'msg' => Yii::t('app', 'global')['true'],
            'data'=>[
                'list'=>[
                    'goods'=>$data,
                    'category'=>$category,
                ],
                'pageNum'=>$page->getPageCount(),
                'count'  =>$dataCount,
            ]
        ];
    }

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


}