<?php

namespace tea\controllers;

use tea\models\Book;
use tea\models\Order;
use tea\models\Table;
use tea\models\TableType;
use tea\models\UsersForm;
use Yii;


class TableController extends ObjectController
{
    /**
     * 桌台添加操作方法
     * @return array
     */
    public function actionAddTable()
    {
        if(Yii::$app->request->isPost)
        {
            $post = Yii::$app->request->post();
            $table = new Table();
            if ($table->addTable($post))
            {
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            }
            $msg = $table->getFirstErrors();
            return ['code' => 0, 'msg' => reset($msg)];
        }
    }

    /**
     * 台座修改操作
     * @return array
     */
    public function actionEditTable()
    {
        if(Yii::$app->request->isPost)
        {
            $post = Yii::$app->request->post();
            $table = Table::findOne($post['id']);
            if($table)
            {
                if($table->editTable($post))
                {
                    return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
                }
                $msg = $table->getFirstErrors();
                return ['code' => 0, 'msg' => reset($msg)];
            }
            return ['code' => 0, 'msg' => Yii::t('app', 'table')['table_type_edit_id_null']];
        }
    }

    /**
     * 台座删除
     * @return array
     */
    public function actionDelTable()
    {
        if(Yii::$app->request->isPost)
        {
            $post = Yii::$app->request->post();
            $table = Table::findOne($post['id']);
            if($table)
            {
                if($table->delTable())
                {
                    return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
                }
                $msg = $table->getFirstErrors();
                return ['code' => 0, 'msg' => reset($msg)];
            }
            return ['code' => 0, 'msg' => Yii::t('app', 'table')['table_type_edit_id_null']];
        }
    }

    /**
     * 添加一个台桌类型的操作
     * @return array
     */
    public function actionAddtabletype()
    {
        if(Yii::$app->request->isPost)
        {
            $post = Yii::$app->request->post();
            $tableType = new TableType();
            if($tableType->addTableType($post))
            {
                return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
            }
            $msg = $tableType->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        }
    }

    /**
     * 修改一个台桌的操作
     * @return array
     */
    public function actionEdittabletype()
    {
        if(Yii::$app->request->isPost)
        {
            $post = Yii::$app->request->post();
            $tableType = TableType::findOne($post['id']);
            if($tableType)
            {
                if($tableType->editTableType($post))
                {
                    return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
                }
                $msg = $tableType->getFirstErrors();
                return ['code' => 0, 'msg' => reset($msg)];
            }
            return ['code' => 0, 'msg' => Yii::t('app', 'table')['table_type_edit_id_null']];
        }
    }

    /**
     * 删除一个台桌类型
     * @return array
     */
    public function actionDeltabletype()
    {
        if(Yii::$app->request->isPost)
        {
            $id = Yii::$app->request->post('id');
            $tableType = TableType::findOne($id);
            if($tableType)
            {
                if($tableType->delTableType())
                {
                    return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
                }
                $msg = $tableType->getFirstErrors();
                return ['code'=>0,'msg'=>reset($msg)];
            }
            return ['code' => 0, 'msg' => Yii::t('app', 'table')['table_type_edit_id_null']];
        }
    }

    /**
     * 获取所有的桌台状态
     * @return  array
     */
    public function actionDesktopstatus()
    {
        $table = new Table();
        $data  = $table->getDeskStatus(Yii::$app->request->get('type'));
        return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data['data'],
                    'sanzuoNum'  =>$data['classification']['sanzuoNum'],
                    'baoxiangNum'=>$data['classification']['baoxiangNum'],
                    'he'         =>$data['classification']['he'],
        ];
    }

    /**
     * 获取一个台座的订单数据
     * @return array
     */
    public function actionGettableorder()
    {
        $model = Table::findOne(Yii::$app->request->get('table_id'));
        $data  = $model->getOrderAndGoods();
        $data['merge_order'] = $model->getMergeOrder($data['id']);
        return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
    }


    /**
     * 获取一个桌台的预定详情数据
     * @return array
     */
    public function actionGetTableBook()
    {
        $model = Table::findOne(Yii::$app->request->get('table_id'));
        $data  = $model->getBook();
        return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
    }

    /**
     * 台座预约操作
     */
    public function actionBeginTableBook()
    {
        if(Yii::$app->request->isPost)
        {
            $model = new Book();
            if($model->add(Yii::$app->request->post()))
                return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
            $msg = $model->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        }
    }

    /**
     * 关闭台座预定操作
     */
    public function actionCloseTableBook()
    {
        if(Yii::$app->request->isPost)
        {
            $model = Table::findOne(Yii::$app->request->post('table_id'));
            $book  = $model->getBookAR();
            if($book)
            {
                $book->status = 2;
                if($book->save())
                    return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
                $msg = $book->getFirstErrors();
                return ['code'=>0,'msg'=>reset($msg)];
            }
            return ['code'=>0,'msg'=>Yii::t('app','book_close_flase')];
        }
    }

    /**
     * 台桌开台操作
     */
    public function actionBeginTableOrder()
    {
        if(Yii::$app->request->isPost)
        {
            $model = new Order();
            if($model->add(Yii::$app->request->post()))
            {
                return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
            }
            $msg = $model->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        } elseif (Yii::$app->request->isGet) {
            $model = new UsersForm();
            $data  = $model->getList();
            return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
        }
    }

    /**
     * 预约台桌开台操作
     */
    public function actionBeginTableOrderAndBook()
    {
        if(Yii::$app->request->isPost)
        {
            $post = Yii::$app->request->post();
            $model = new Order();
            $book  = new Book();
            if($book->endBook($post))
            {
                if($model->add($post))
                {
                    return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
                }
            }
            $msg = $model->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        }
    }


    /**
     * 台座转台操作
     * @return array
     */
    public function actionTableTurn()
    {
        if (Yii::$app->request->isGet)
        {
            $model = new Table();
            $data = $model->getTableTypeFreeTable(Yii::$app->request->get('type_id'));
            return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
        }
        else
        {
            $model = new Table();
            if($model->tableTurn(Yii::$app->request->post()))
            {
                return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
            }
            $msg = $model->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        }

    }

    /**
     * 台座商品转台操作
     * @return array
     */
    public function actionTableGoodsTurn()
    {
        if (Yii::$app->request->isGet)
        {
            $model = new Table();
            $data = $model->getTableTypeUseTable(Yii::$app->request->get('type_id'));
            return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
        }
        else
        {
            $model = new Table();
            if($model->tableGoodsTurn(Yii::$app->request->post()))
            {
                return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
            }
            $msg = $model->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        }

    }

    /**
     * 台桌添加商品
     */
    public function actionAddGoods()
    {
        if(Yii::$app->request->isPost)
        {
            $post = Yii::$app->request->post();
            $tableM = Table::findOne($post['table_id']);
            $orderM  = $tableM->getOrderAR();
            if($orderM->addGoods($post['goodsList']))
            {
                return ['code'=>1,'msg'=>Yii::t('app','global')['true']];
            }
            $msg = $orderM->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        }
    }

    /**
     * 台桌合并操作
     */
    public function actionMerge()
    {
        if(Yii::$app->request->isGet)
        {
            $table = new Table();
            $data  = $table->getDeskStatus(1);
            return ['code'=>1,'msg'=>Yii::t('app','global')['true'],'data'=>$data];
        }
        else
        {
            $table = new Table();
            if ($table->tableMerge(Yii::$app->request->post())){
                return ['code' => 1, 'msg' => Yii::t('app', 'global')['true']];
            }
            $msg = $table->getFirstErrors();
            return ['code'=>0,'msg'=>reset($msg)];
        }
    }
}
