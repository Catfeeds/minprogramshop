<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:74:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\index\index.html";i:1530084972;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;s:74:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\left.html";i:1515142508;}*/ ?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<title>后台管理中心</title>
	<link href="__PUBLIC__/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="__PUBLIC__/admin/css/style.min.css" rel="stylesheet">
<link href="__PUBLIC__/admin/css/login.min.css" rel="stylesheet">

<script src="__PUBLIC__/admin/js/jquery.min.js"></script>
<script src="__PUBLIC__/admin/js/jquery-ui-1.10.4.min.js"></script>
<script src="__PUBLIC__/admin/js/jquery-ui.custom.min.js"></script>
<script src="__PUBLIC__/common/layer/layer.js" type="text/javascript"></script>
<script src="__PUBLIC__/common/laytpl.js" type="text/javascript"></script>
<script src="__PUBLIC__/common/laydate/laydate.js" type="text/javascript"></script>
<link href="__PUBLIC__/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="__PUBLIC__/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="__PUBLIC__/admin/js/admin.js"></script>
<script src="__PUBLIC__/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="__PUBLIC__/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="__PUBLIC__/admin/js/contabs.min.js"></script>
<script src="__PUBLIC__/admin/js/plugins/pace/pace.min.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<link href="__PUBLIC__/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<!-- <link href="__PUBLIC__/admin/css/animate.min.css" rel="stylesheet"> -->
<link href="__PUBLIC__/admin/css/mest.css" rel="stylesheet">

</head>
<body class="fixed-sidebar full-height-layout gray-bg">
<!--头部 begin-->
<div class="head">
    <nav class="navbar navbar-default">
        <div>
            <div class="navbar-header">
                <a style="height:auto;overflow:hidden;display:block">
                    <img src="<?=$miniapp->head_img?>" style="height: 55px;">
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><!--<i class="wi wi-user color-gray"></i>-->
                            <img src="<?=$miniapp->head_img?>" style="width:35px; height:35px; margin-right:10px;">
                            <?=$miniapp->nick_name?> <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu color-gray" role="menu">
                            <li>
                                <a href="<?=url('manage/passport/logout');?>" target="_top"><i class="wi wi-user color-gray"></i> 安全退出</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<!--头部 end-->
<div class="main">
    <div id="wrapper">
        <!--左侧导航开始-->
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse left-menu">
        <div class="basemenu">
            <div class="left-scrool-panel">
                <div class="leftMenu-box">
                    <div class="leftMenu active">
                      <div class="leftMenu-header">
                        <i class="fa fa-home"></i>
                        <span>管理中心</span>
                        <i class="indexImg firstMenuDown"></i>
                        <i class="indexImg firstMenuUp"></i>
                      </div>
                      <ul class="secondMenu">
                        <li class="active">
                          <a class="J_menuItem" href="<?=url('index/main')?>">
                            <i class="secondMenuIcon"></i>
                            <span>主页</span>
                          </a>
                        </li>
                      </ul>
                    </div>
                    <!--菜单循环 begin-->
                    <?php foreach($leftMenus as $k=>$val){?>
                    <div class="leftMenu active">
                      <div class="leftMenu-header">
                        <i class="fa <?=$val['icon']?>"></i>
                        <span><?=$val['name']?></span>
                        <i class="indexImg firstMenuDown"></i>
                        <i class="indexImg firstMenuUp"></i>
                      </div>
                      <ul class="secondMenu">
                         <?php foreach($val['menu'] as $val1){ if($val1['is_show']==1){?>
                        <li class="">
                          <a class="J_menuItem" href="<?=$val1['is_sub'] == 1 ? '' : url('admin/'.$val1['link']);?>">
                            <i class="secondMenuIcon"></i>
                            <span><?=$val1['name']?></span>
                          </a>
                          <?php if($val1['is_sub'] == 1) { ?>
                          <ul class="threeMenu">
                              <?php foreach($val1['sub'] as $val2){ if($val2['is_show']==1){?>
                              <li><a class="J_menuItem" href="<?=url('admin/'.$val2['link']);?>"><?=$val2['name']?></a>
                              </li>
                              <?php }} ?>
                          </ul>
                          <?php } ?>
                        </li>
                        <?php }} ?>
                      </ul>
                    </div>
                    <?php } ?>
                    <!--菜单循环 end-->
                </div>
            </div>
      </div>
        <!-- <ul class="nav" id="side-menu">
            <li>
                <a class="J_menuItem" href="<?=url('index/main')?>">
                    <i class="fa fa-home"></i>
                    <span class="nav-label">主页</span>
                </a>
            </li>
            <?php foreach($leftMenus as $k=>$val){?>
            <li>
                <a href="#"><i class="fa <?=$val['icon']?>"></i> <span class="nav-label"><?=$val['name']?></span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <?php foreach($val['menu'] as $val1){ if($val1['is_show']==1){?>
                    <li><a class="J_menuItem"
                           href="<?=$val1['is_sub'] == 1 ? '' : url('admin/'.$val1['link']);?>"><?=$val1['name']?> <?=$val1['is_sub'] == 1 ? '<span class="fa arrow">
                        ' : ''?></a>
                        <?php if($val1['is_sub'] == 1) { ?>
                        <ul class="nav nav-third-level">
                            <?php foreach($val1['sub'] as $val2){ if($val2['is_show']==1){?>
                            <li><a class="J_menuItem" href="<?=url('admin/'.$val2['link']);?>"><?=$val2['name']?></a>
                            </li>
                            <?php }} ?>
                        </ul>
                        <?php } ?>
                    </li>
                    <?php } } ?>
                </ul>
            </li>
            <?php } ?>
        </ul> -->
    </div>
</nav>
<script type="text/javascript">
  $(function(){
  /*左边菜单点击伸缩效果*/
  $(".leftMenu-header").click(function(){
    $(this).parent(".leftMenu").toggleClass("active")
  });
})
</script>
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row J_mainContent" style="width: 100%; height: 95%; margin:  0 auto; "   id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="__ROOT__/miniapp/index/main" frameborder="0"  seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
</div>
<script src="__PUBLIC__/admin/js/hplus.min.js?v=4.1.0"></script>
</body>
</html>