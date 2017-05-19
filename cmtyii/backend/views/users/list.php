<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;

$this->title = '用户列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="Constiantine_titleBox">
    <h2>用户列表</h2>
</div>
    <header class="panel-heading">
        <span class="tools">
            <?php
            $form = ActiveForm::begin([
                'layout' => 'inline',
                'method' => 'get',
                'action' => Url::to(['userslist']),
                'options' => [
                    'style' => 'margin-bottom:1em'
                ],
            ]); ?>

            <?php echo $form->field($searchModel, 'username')->textInput(['placeholder' => '用户昵称']); ?>
            <?php echo $form->field($searchModel, 'phone')->textInput(['placeholder' => '电话号码']); ?>
            <?php echo Html::submitInput('搜索', ['class' => 'btn btn-primary']); ?>
            <a href="<?= Url::to(['userslist'])?>" class="btn btn-success" style="float: right">所有用户</a>
            <?php ActiveForm::end(); ?>
    </span>
    </header>
    <div class="adv-table">
    <table class="table table-striped table-bordered global_boxSad">
        <thead>
        <tr>
            <th class="global_txtCenter">头像</th>
            <th class="global_txtCenter">用户昵称</th>
            <th class="global_txtCenter">电话</th>
            <th class="global_txtCenter">茶豆币</th>
            <th class="global_txtCenter">添加时间</th>
            <th class="global_txtCenter">操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($models as $v): ?>
            <tr class="bodyTr">
                <td class="global_txtCenter"><img src="<?= $v->photo?>" alt="" width="30px"></td>

                <td class="global_txtCenter"><?= $v->nickname?></td>
                <td class="global_txtCenter"><?= $v->phone ? $v->phone : '未绑定' ?></td>
                <td class="global_txtCenter"><?= $v->beans ? $v->beans : 0?></td>
                <td class="global_txtCenter"><?= date('Y-m-d H:i:s',$v->add_time)?></td>
                <td class="global_flexC">
                    <?= Html::a('充值记录',['usersrecharge','id'=>$v->id],['class'=>'btn btn-xs btn-primary'])?>
                    <?= Html::a('消费记录',['usersreduce','id'=>$v->id],['class'=>'btn btn-xs btn-info'])?>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php if(count($models)<1):?>
    <a href="<?= Url::to(['userslist'])?>">
    <div class="text-center m-t-lg clearfix wrapper-lg animated fadeInRightBig" id="galleryLoading">
        <h1><i class="fa fa-warning" style="color: red;font-size: 40px"></i></h1>
        <h4 class="text-muted">没有查到对应的用户,点击回到用户列表</h4>
        <p class="m-t-lg"></p>
    </div>
    </a>
<?php endif;?>
<?php
echo LinkPager::widget([
    'pagination' => $pager,
    'firstPageLabel' => '首页',
    'lastPageLabel'  => '尾页',
    'nextPageLabel'  => '下一页',
    'prevPageLabel' => '上一页',
    'maxButtonCount' => 5,
 ]); ?>
<style media="screen">
    .Constiantine_titleBox{
        height: 50px;
        margin-top: 15px;
        width: 100%;
    }
    /*      弹性盒居中            */
    .global_flexC{
            display: flex;
            justify-content: space-around;
            align-items: center;
    }
    .global_txtCenter{
        text-align: center;
    }
    .bodyTr{
        height: 60px;
    }
    .bodyTr td{
        height: 60px;
        padding-top: 15px !important;
    }
    /*      实体的阴影          */
    .global_boxSad{
      box-shadow: 0 0 6px #666;
      border-radius: 5px;
    }
    thead{
        border-bottom: 1px solid #ccc
    }
</style>
