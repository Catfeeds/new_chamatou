<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;
use kartik\date\DatePicker;

$this->title = $title;
$this->params['breadcrumbs'][] = $this->title;
?>

<?php  $form = ActiveForm::begin([
            'layout' => 'inline',
            'method' => 'get',
            'action' => ($title == '用户消费记录') ? Url::to(['usersreduce']) : Url::to(['usersrecharge']),
            'options' => [
                'style' => 'margin-bottom:1em'
            ],
        ]);
?>
    <div style="width: 300px;float: left">
        <?= $form->field($searchModel, 'start')->widget(DatePicker::classname(), [
            'options' => ['placeholder' => ''],
            'pluginOptions' => [
                'format' => 'yyyy-mm-dd',
            ]
        ]); ?>
    </div>
    <div style="width: 300px;float: left">
        <?= $form->field($searchModel, 'end')->widget(DatePicker::classname(), [
            'options' => ['placeholder' => ''],
            'pluginOptions' => [
                'format' => 'yyyy-mm-dd',
            ]
        ]); ?>
    </div>
    <div style="width: 300px;float: left;margin-left: 0">
        <?php echo Html::submitInput('搜索', ['class' => 'btn btn-info']); ?>
        <?=  Html::a('全部记录',[($title == '用户充值记录') ? 'usersrecharge' : 'usersreduce'],['class'=>'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>

<div class="adv-table">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>用户头像</th>
            <th>用户昵称</th>
            <th>
                <?php if($title == '用户充值记录'):?>
                    充值时间
                <?php endif;?>
                <?php if($title == '用户消费记录'):?>
                    消费时间
                <?php endif;?>
            </th>
            <th>
                <?php if($title == '用户充值记录'):?>
                    充值(茶豆币)
                <?php endif;?>
                <?php if($title == '用户消费记录'):?>
                    消费(茶豆币)
                <?php endif;?>
            </th>
            <th>电话</th>

        </tr>
        </thead>
        <tbody>
        <?php foreach ($models as $v): ?>
            <tr>
                <td><img src="<?= $v->userInfo->photo?>" alt="" width="30px"></td>
                <td><?= $v->userInfo->nickname?></td>
                <td><?= date('Y-m-d H:i:s',$v->add_time)?></td>
                <td><?= $v->num?></td>
                <td><?= $v->userInfo->phone?></td>

            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php if(count($models)<1):?>
    <a href="<?= Url::to([($title == '用户充值记录') ? 'usersrecharge' : 'usersreduce'])?>">
    <div class="text-center m-t-lg clearfix wrapper-lg animated fadeInRightBig" id="galleryLoading">
        <h1><i class="fa fa-warning" style="color: red;font-size: 40px"></i></h1>
        <h4 class="text-muted">该用户暂时没有任何记录,点击此处回到列表</h4>
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
]);
?>

