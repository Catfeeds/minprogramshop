<?php
if (!file_exists('./install/install.lock')) {//走安装
    header('Location:/install/');
    die;
}

define('IMG_URL','https://'.$_SERVER['HTTP_HOST'].'/attachs/uploads/');

define('APP_PATH', __DIR__ . '/youge/');
//手机验证测试阶段；
define('IS_ONLINE',true);

require __DIR__ . '/thinkphp/start.php';