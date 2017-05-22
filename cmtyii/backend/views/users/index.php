<?php
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\LinkPager;
use yii\bootstrap\ActiveForm;
use kartik\date\DatePicker;

$this->title = $title;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="Constiantine_titleBox">
    <?php if($title == '用户充值记录'):?>
        <h2>充值列表</h2>
    <?php endif;?>
    <?php if($title == '用户消费记录'):?>
        <h2>消费列表</h2>
    <?php endif;?>
</div>

<?php  $form = ActiveForm::begin([
            'layout' => 'inline',
            'method' => 'get',
            'action' => ($title == '用户消费记录') ? Url::to(['usersreduce']) : Url::to(['usersrecharge']),
            'options' => [
                'style' => 'margin-bottom:1em'
            ],
        ]);
?>
    <div style="width: 240px;float: left">
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

<div class="adv-table" style="margin-top:60px;">
    <table class="table table-striped table-bordered" >
        <thead>
        <tr>
            <th class="global_txtCenter">用户头像</th>
            <th class="global_txtCenter">用户昵称</th>
            <th class="global_txtCenter">
                <?php if($title == '用户充值记录'):?>
                    充值时间
                <?php endif;?>
                <?php if($title == '用户消费记录'):?>
                    消费时间
                <?php endif;?>
            </th>
            <th class="global_txtCenter">
                <?php if($title == '用户充值记录'):?>
                    充值(茶豆币)
                <?php endif;?>
                <?php if($title == '用户消费记录'):?>
                    消费(茶豆币)
                <?php endif;?>
            </th>
            <th class="global_txtCenter">电话</th>

        </tr>
        </thead>
        <tbody>
        <?php foreach ($models as $v): ?>
            <tr class="bodyTr">
                <td class="global_txtCenter"><img src="<?= $v->userInfo->photo?>" alt="" width="30px"></td>
                <td class="global_txtCenter"><span><?= $v->userInfo->nickname?></span></td>
                <td class="global_txtCenter"><span><?= date('Y-m-d H:i:s',$v->add_time)?></span></td>
                <td class="global_txtCenter"><span><?= $v->num?></span></td>
                <td class="global_txtCenter"><span><?= $v->userInfo->phone?></span></td>

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
<div class="LinkPagerBox">
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
</div>
<style media="screen">
.LinkPagerBox{
    width: 100%;
    height: auto;
    text-align: center;
}
.adv-table{
    background-color: #fff;
}
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
    .global_txtCenter img{
        margin-top: 8px;
    }
    .global_txtCenter span{
        margin-top: 13px;
        display: block;
    }
    .bodyTr{
        height: 40px;
    }
    .bodyTr td{
        height: 40px;
        padding-top: 0 !important;
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
