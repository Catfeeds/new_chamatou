<?php
$this->title = '添加分类';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="wrapper">
    <?php
    $form = \yii\bootstrap\ActiveForm::begin();
    echo $form->field($model, 'cate_name')->textInput();
    echo \yii\helpers\Html::submitInput('提交', ['class' => 'btn btn-success', 'style' => 'margin-right:1em;']);
    \yii\bootstrap\ActiveForm::end();
    ?>
</div>

