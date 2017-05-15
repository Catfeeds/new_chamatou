<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;

$this->title = '用户列表';
$this->params['breadcrumbs'][] = $this->title;
?>
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
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>头像</th>
            <th>用户昵称</th>
            <th>电话</th>
            <th>茶豆币</th>
            <th>添加时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($models as $v): ?>
            <tr>
                <td><img src="<?= $v->photo?>" alt="" width="30px"></td>

                <td><?= $v->nickname?></td>
                <td><?= $v->phone ? $v->phone : '未绑定' ?></td>
                <td><?= $v->beans ? $v->beans : 0?></td>
                <td><?= date('Y-m-d H:i:s',$v->add_time)?></td>
                <td>
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