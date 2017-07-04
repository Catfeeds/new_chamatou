<?php
use yii\helpers\Html;

/* @var $this \yii\web\View */
/* @var $content string */
?>

<header class="main-header">

    <?= Html::a('<span class="logo-mini">茶</span><span class="logo-lg">' . Yii::$app->name . '</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>

    <nav class="navbar navbar-static-top" role="navigation" style="height: 50px;">

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">

                <!-- Messages: style can be found in dropdown.less-->


                <li class="dropdown user user-menu">
                    <a href="<?php echo  \yii\helpers\Url::to(['/admin/user/change-password'])?>">
                        <span class="hidden-xs">
                            当前登录用户:
                            <?php if(isset(Yii::$app->user->identity->username)){ echo Yii::$app->user->identity->username;} ?>
                        </span>
                    </a>
                </li>
                <li>
                    <?= Html::a(
                        '修改密码',
                        ['/admin/user/change-password'],
                        ['class' => 'btn  btn-flat']
                    ) ?>
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li>
                    <?= Html::a(
                        '注销',
                        ['/site/logout'],
                        ['data-method' => 'post', 'class' => 'btn  btn-flat']
                    ) ?>
                </li>
            </ul>
        </div>
    </nav>
</header>
<style>
    .skin-red-light .main-header .logo {
        background-color: #286090;

    }

    .skin-red-light .main-header .navbar {
        background-color: #286090;
    }

    .skin-red-light .main-header .logo:hover {
        background-color: #367fa9;
    }

    .skin-red-light .main-header .navbar .sidebar-toggle:hover {
        background-color: #367fa9;
    }
</style>