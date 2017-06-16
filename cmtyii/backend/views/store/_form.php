<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\SpStore */
/* @var $form yii\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin([
    'options' => [
        'enctype'=>'multipart/form-data',
        'layout' => 'horizontal',
        'class'=>'form-horizontal'
    ],
    'fieldConfig' => [
        'template' => "{input}{error}",
    ]
]); ?>

    <div class="panel panel-default">
        <div class="panel-heading">商家基本信息</div>
        <div class="panel-body" style="padding: 0px;">
            <div class="sp-store-form">

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">负责人姓名</label>
                        <div class="col-sm-2">
                            <?= $form->field($shoperModel, 'boss')->textInput(['maxlength' => true,'placeholder'=>'负责人姓名']) ?>
                        </div>
                        <div class="col-sm-4 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)茶楼负责人！最好是对应着营业执照上面进行填写！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">负责人联系电话</label>
                        <div class="col-sm-2">
                            <?= $form->field($shoperModel,'phone')->textInput(['maxlength'=>true,'placeholder'=>'请输入负责人电话'])?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)负责人联系电话！方便后续平台进行联系！如逾期后电话联系等！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">授信金额</label>
                        <div class="col-sm-2">
                            <?= $form->field($shoperModel, 'credit_remain')->textInput(['maxlength' => true,'placeholder'=>'请输入授信金额']) ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)授信金额！0表示不授信！金额为人民币元！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">合同号</label>
                        <div class="col-sm-2">
                            <?= $form->field($shoperModel, 'contract_no')->textInput(['maxlength' => true,'placeholder'=>'请输入合同号']) ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            * 注：(非必填)合同号为线下合同号！方便快速查找！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">开户行</label>
                        <div class="col-sm-2">
                            <?= $form->field($shoperModel, 'bank')->textInput(['maxlength' => true,'placeholder'=>'请输入开户行']) ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)银行开户的开户行！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">开户人</label>
                        <div class="col-sm-2">
                            <?= $form->field($shoperModel, 'bank_user')->textInput(['maxlength' => true,'placeholder'=>'请输入开户人']) ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)银行开户的开户人！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">卡号</label>
                        <div class="col-sm-3">
                            <?= $form->field($shoperModel, 'card_no')->textInput(['maxlength' => true,'placeholder'=>'请输入银行开户的卡号']) ?>
                        </div>
                        <div class="col-sm-3 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)银行开户的卡号！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">其他提现账号</label>
                        <div class="col-sm-3">
                            <?= $form->field($shoperModel, 'pay_account')->textInput(['maxlength' => true,'placeholder'=>'请输入其他提现方式联系账号']) ?>
                        </div>
                        <div class="col-sm-3 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            * 注：(非必填)填写规范为：(微信号)xxxx
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">安排业务员</label>
                        <div class="col-sm-2">
                            <?= $form->field($shoperModel, 'salesman_id')->dropDownList(\backend\models\Salesman::find()
                                ->select('username')
                                ->indexBy('id')
                                ->column(), [
                                ['prompt' => '请指定销售']
                            ]) ?>
                        </div>
                        <div class="col-sm-3 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)安排相应的业务员进行业务负责！
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">店铺基本信息</div>
        <div class="panel-body" style="padding: 0px;">
            <div class="sp-store-form">

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">店铺名称</label>
                        <div class="col-sm-5">
                            <?= $form->field($storeModel, 'sp_name')->textInput(['maxlength' => true,'placeholder'=>'请输入店铺名称']) ?>
                        </div>
                        <div class="col-sm-4 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)商家店铺名称的最大长度为255个字符！请注意字符数！不支持特殊字符
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">请选择省</label>
                        <div class="col-sm-2">
                            <?= $form->field($storeModel,'provinces_id')->dropDownList($storeModel->getLocations(0),
                                [
                                    'prompt'=>'--请选择省--',
                                    'onchange'=>'
                                            $.post("'.yii::$app->urlManager->createUrl('/tools/address').'&typeid=1&pid="+$(this).val(),function(data){
                                                $("select#storeform-city_id").html(data);
                                            });',
                                ])
                            ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)C端定位会使用、否则C端附近的茶楼无法显示出此茶楼！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">请选择市</label>
                        <div class="col-sm-2">
                            <?= $form->field($storeModel, 'city_id')->dropDownList($storeModel->getLocations($storeModel->provinces_id),
                                [
                                    'prompt'=>'--请选择市--',
                                    'onchange'=>'
                                            $.post("'.yii::$app->urlManager->createUrl('/tools/address').'&typeid=2&pid="+$(this).val(),function(data){
                                                $("select#storeform-area_id").html(data);
                                            });',
                                ])
                            ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)C端定位会使用、否则C端附近的茶楼无法显示出此茶楼！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">请选择区</label>
                        <div class="col-sm-2">
                            <?= $form->field($storeModel, 'area_id')->dropDownList($storeModel->getLocations($storeModel->city_id),['prompt'=>'--请选择区--',]) ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)C端定位会使用、否则C端附近的茶楼无法显示出此茶楼！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">详细地址</label>
                        <div class="col-sm-3">
                            <?= $form->field($storeModel, 'add_detail')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)C端定位会使用、否则C端附近的茶楼无法显示出此茶楼！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">商铺电话号码</label>
                        <div class="col-sm-3">
                            <?= $form->field($storeModel, 'sp_phone')->textInput(['maxlength' => true]) ?>
                        </div>
                        <div class="col-sm-7 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            <span style="color: #dd4b39">*</span> 注：(必填)方便C端用户电话联系该商家店铺！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">店铺图片</label>
                        <div class="col-sm-7">
                            <!--门店信息-上传图片-->
                            <?php if(!empty($storeImage)):?>
                                <?= $form->field($uploadModel, 'file[]')->widget(\kartik\file\FileInput::classname(), [
                                    'options' => [
                                        'accept' => 'image/*',
                                        'multiple' => true
                                    ],
                                    'pluginOptions' => [
                                        'maxFileCount' => 5,
                                        'showUpload' => false,
                                        'initialPreview' => $storeImage ,
                                        'initialPreviewAsData'=>true,
                                    ]
                                ]) ?>
                            <?php else:?>
                                <?= $form->field($uploadModel, 'file[]')->widget(\kartik\file\FileInput::classname(), [
                                    'options' => [
                                        'accept' => 'image/*',
                                        'multiple' => true
                                    ],
                                    'pluginOptions' => [
                                        'maxFileCount' => 5,
                                        'showUpload' => false,
                                        'initialPreviewAsData'=>true,
                                    ]
                                ]) ?>
                            <?php endif;?>
                        </div>
                        <div class="col-sm-3 hidden-xs" style="line-height: 34px;font-size: 12px;color: #999999">
                            * 注：(非必填)最多支持5张图片！请用Ctrl多选图片！
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>

                <div class="" style="margin-top: 20px;">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">店铺描述</label>
                        <div class="col-sm-9">
                            <?= $form->field($storeModel, 'intro')->textarea(['maxlength' => true,'rows'=>10]) ?>
                        </div>
                    </div>
                    <div class=""  style="border-top: 1px dotted #e3e3e3 ;margin-top: -20px;"></div>
                </div>
            </div>

            <div class="" style="margin-top: 20px;">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label" style="color: #808080;font-weight: 400">
                    </label>
                    <div class="col-sm-2">

                        <?php echo Html::submitButton("<span class='glyphicon glyphicon-floppy-save'></span> 保存数据",['class'=>'btn btn btn-success'])?>
                        &nbsp;&nbsp;
                        <?php echo Html::resetButton("<span class='glyphicon glyphicon-repeat'></span> 重置",['class'=>'btn btn btn-default'])?>

                    </div>
                </div>
            </div>

        </div>
    </div>
<?php ActiveForm::end(); ?>