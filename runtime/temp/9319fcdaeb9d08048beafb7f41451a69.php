<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:78:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\user\user\index.html";i:1508465328;s:69:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\layout.html";i:1529652117;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>iamguao应用后台管理中心</title>
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
<body class="gray-bg">
<?php
  $is_soon_expir = $miniapp->expir_time < time() + config('setting.miniapp_warning_day') * 86400   ? true : false;
  $is_expir = $miniapp->expir_time   < time() ? true : false;
if($is_soon_expir && !$is_expir) { ?>
<div class="alert alert-warning" style="font-size: 2rem">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    您的模板还剩 <span style="color: red"> <b><?= round(($miniapp->expir_time - time()) /86400) < 0 ? 0 : round(($miniapp->expir_time - time()) /86400) ;?></b></span> 天到期 为保成程序正常运行 请续费
</div>
<?php } ?>
<div class="wrapper wrapper-content animated fadeInRight">
    <!-- PAGE CONTENT BEGINS -->
    <div class="row">
        <div class="col-xs-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>搜索</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="table-responsive">
                            <form class="form-search" method="get" action="<?=url('user.user/index')?>" role="form">
                                <table>
                                    <tr>
                                        <td>昵称（微信名称）:<input class="form-control" name="nick_name" id="nick_name" value="<?=$search['nick_name']?>" type="text" placeholder="请输入昵称" style=" width:200px"/></td>
                                        <td>
                                            <div class="input-group">
                                                <button type="submit" style="margin-top: 42%"
                                                        class="btn form-control btn-sm btn-primary">
                                                    搜索
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="ibox-content">
                <div class="row">
                    <div class="table-responsive">
                        <table id="simple-table" class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>OPENID</th>
                                <th>头像</th>
                                <th>昵称</th>
                                <th>真实姓名</th>
                                <th>手机</th>
                                <th>性别</th>
                                <th>生日</th>
                                <th>登录天数</th>
                                <th>最后登录时间</th>
                                <th>最后登录IP</th>
                                <th>锁定状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <form id="mini_list">
                                <tbody>
                                <?php foreach($list as $val){ ?>
                                <tr>
                                    <td><?= $val->user_id ?></td>
                                    <td><?=$val->open_id?></td>
                                    <td><img width="50" src="<?=$val->face?>"/></td>
                                    <td><?=$val->nick_name?></td>
                                    <td><?=$val->real_name?></td>
                                    <td><?=$val->mobile?></td>
                                    <td><?=$val->sex?></td>
                                    <td><?=$val->birthday?></td>
                                    <td><?=$val->day?></td>
                                    <td><?=date("Y-m-d H:i:s",$val->last_time)?></td>
                                    <td><?=$val->last_ip?></td>
                                    <td><?=$val->is_lock == 1 ? '<span class="label label-warning">已锁定</span>' : '<span class="label label-primary">正常</span>' ?></td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <?php if($val->is_lock == 1){?>
                                            <a title="锁定该会员" mini="act" href="<?=url('user.user/lock','user_id='.$val->user_id)?>" class="btn btn-xs btn-success"><i class="fa fa-unlock bigger-120"></i>解锁该会员</a>
                                            <?php }else{?>
                                            <a title="锁定该会员" mini="act" href="<?=url('user.user/lock','user_id='.$val->user_id)?>" class="btn btn-xs btn-warning"><i class="fa fa-lock bigger-120"></i>锁定该会员</a>
                                            <?php }?>
                                        </div>
                                    </td>
                                </tr>
                                <?php } ?>
                                </tbody>
                            </form>
                        </table>
                        <div>
                            <?php echo $page; ?>
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.main-container -->
            </div>
        </div>
    </div>
</div>


<script src="__PUBLIC__/admin/js/content.min.js?v=1.0.0"></script>
<script src="__PUBLIC__/admin/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function(){
        $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})
    });
    console.log("联系电话:15169991113 QQ:67930603 微点应用小程序研发中心")
</script>

<style>
    .c-red{color: red;}
</style>
</body>
</html>
