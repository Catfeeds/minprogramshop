<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"D:\soft\Apache24\htdocs/youge/miniapp\view\setting\activity\index.html";i:1503555822;s:54:"D:\soft\Apache24\htdocs/youge/miniapp\view\layout.html";i:1515024814;s:61:"D:\soft\Apache24\htdocs/youge/miniapp\view\public\header.html";i:1515142918;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>微点应用后台管理中心</title>
    <link href="/public/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="/public/admin/css/style.min.css" rel="stylesheet">
<link href="/public/admin/css/login.min.css" rel="stylesheet">

<script src="/public/admin/js/jquery.min.js"></script>
<script src="/public/admin/js/jquery-ui-1.10.4.min.js"></script>
<script src="/public/admin/js/jquery-ui.custom.min.js"></script>
<script src="/public/common/layer/layer.js" type="text/javascript"></script>
<script src="/public/common/laytpl.js" type="text/javascript"></script>
<script src="/public/common/laydate/laydate.js" type="text/javascript"></script>
<link href="/public/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="/public/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/public/admin/js/admin.js"></script>
<script src="/public/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/public/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="/public/admin/js/contabs.min.js"></script>
<script src="/public/admin/js/plugins/pace/pace.min.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<link href="/public/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<!-- <link href="/public/admin/css/animate.min.css" rel="stylesheet"> -->
<link href="/public/admin/css/mest.css" rel="stylesheet">

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
            <div class="ibox-content">
                <div class="row">
                    <div class="tableTools-container">
                        <a title="添加活动" href="<?=url('setting.activity/create')?>" class="btn btn-sm btn-success"><i class=" fa fa-plus"></i>添加活动</a>
                    </div>
                    <div class="table-responsive">
                        <table id="simple-table" class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>标题</th>
                                <th>优惠券面额</th>
                                <th>使用限制</th>
                                <th>过期天数</th>
                                <th>可以使用天数</th>
                                <th>优惠剩余券数量</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>排序</th>
                                <th>是否允许新用户参与</th>
                                <th>是否启动该活动</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <form id="mini_list">
                                <tbody>
                                <?php foreach($list as $val){ ?>
                                <tr>
                                    <td><?=$val->activity_id ?></td>
                                    <td><?=$val->title?></td>
                                    <td><?=sprintf("%.2f",$val->money/100)?>元</td>
                                    <td><?=sprintf("%.2f",$val->need_money/100)?>元</td>
                                    <td><?=$val->expire_day?>天</td>
                                    <td><?=$val->use_day?>天</td>
                                    <td><?=$val->num?>个</td>
                                    <td><?=$val->bg_date?></td>
                                    <td><?=$val->end_date?></td>
                                    <td><?=$val->orderby?></td>
                                    <td><?=$val->is_newuser ==1 ? '<span class="label label-primary">允许</span>' : '<span class="label label-warning">不允许</span>'?></td>
                                    <td><?=$val->is_online == 1 ? '<span class="label label-primary">活动进行中</span>' : '<span class="label label-warning">活动未启用</span>'?></td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <a title="编辑activity" href="<?=url('setting.activity/edit','activity_id='.$val->activity_id)?>" class="btn btn-xs btn-info"><i class=" fa fa-edit bigger-120"></i>编辑</a>
                                            <a title="删除activity" mini="act" href="<?=url('setting.activity/delete','activity_id='.$val->activity_id)?>" class="btn btn-xs btn-warning"><i class="fa fa-trash bigger-120"></i>删除</a>
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

<script src="/public/admin/js/content.min.js?v=1.0.0"></script>
<script src="/public/admin/js/plugins/iCheck/icheck.min.js"></script>
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
