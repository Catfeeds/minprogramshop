<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:74:"D:\soft\Apache24\htdocs\minprogramshop/youge/manage\view\manage\index.html";i:1508475318;s:68:"D:\soft\Apache24\htdocs\minprogramshop/youge/manage\view\layout.html";i:1530062533;s:75:"D:\soft\Apache24\htdocs\minprogramshop/youge/manage\view\public\header.html";i:1529636749;}*/ ?>
<!DOCTYPE html>

<html>

<head>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="renderer" content="webkit">

    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <title>温格科技后台管理中心</title>

    <link href="__PUBLIC__/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="__PUBLIC__/admin/css/style.min.css" rel="stylesheet">
<link href="__PUBLIC__/admin/css/login.min.css" rel="stylesheet">
<script src="__PUBLIC__/admin/js/jquery.min.js"></script>
<script src="__PUBLIC__/admin/js/jquery-ui-1.10.4.min.js"></script>
<script src="__PUBLIC__/admin/js/jquery-ui.custom.min.js"></script>
<script src="__PUBLIC__/common/layer/layer.js" type="text/javascript"></script>
<script src="__PUBLIC__/common/laytpl.js" type="text/javascript"></script>
<script src="__PUBLIC__/common/laydate/laydate.js" type="text/javascript"></script>
<link href="__PUBLIC__/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="__PUBLIC__/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="__PUBLIC__/admin/css/animate.min.css" rel="stylesheet">
<link href="__PUBLIC__/admin/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="__PUBLIC__/admin/css/mest.css" rel="stylesheet">
<script src="__PUBLIC__/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="__PUBLIC__/admin/js/admin.js"></script>
<script src="__PUBLIC__/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="__PUBLIC__/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="__PUBLIC__/admin/js/contabs.min.js"></script>
<script src="__PUBLIC__/admin/js/plugins/pace/pace.min.js"></script>


</head>

<body class="gray-bg">

<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content">
                    <a  href="<?=url('manage/create',['miniapp_id'=>$miniapp_id])?>"  style="float: left" type="button" class="btn btn btn-primary"> <i class="fa fa-search"></i>添加管理员</a>
                    <p style="float: left; line-height: 38px; font-size: 2rem;color: #a1a1a1">TIPS:所有管理员对该小程序后台有所有操作的权限请慎重添加 管理员登录地址: <b> <?=$_SERVER['HTTP_HOST']?>/miniapp</b></p>
                    <div style="clear: both"></div>
                    <div class="clients-list">
                        <div class="tab-content">
                            <div class="full-height-scroll">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <tbody>
                                        <?php foreach($list as $val) { ?>
                                        <tr>
                                            <td><a data-toggle="tab" href="" class="client-link"><?=$val->role_name?></a>
                                            <td><a data-toggle="tab" href="" class="client-link"><?=$val->mange_name?></a>
                                            <td><a data-toggle="tab" href="" class="client-link"><?=$val->mobile?></a></td>
                                            <td><a data-toggle="tab" href="" class="client-link"><?=empty($val->last_time) ? '没有登录' : date("Y-m-d H:i:s",$val->last_time) ?></a></td>
                                            <td><a data-toggle="tab" href="" class="client-link"><?=empty($val->last_ip) ? '没有登录' : $val->last_ip?></a></td>
                                            <td class="client-status"><?=$val->is_lock == 1 ? '<span class="label label-warning">已锁定</span>' : '<span class="label label-primary">正常</span>'?>
                                            </td>
                                            <td>
                                                <a title="<?=$val->is_lock == 1 ? '解锁' : '锁定'?>该管理员" mini="act" href="<?=url('manage/lock',['manage_id'=>$val->manage_id])?>"  class="btn btn-xs btn-success"><i class=" fa <?=$val->is_lock == 1 ? 'fa-lock' : 'fa-unlock-alt'?> bigger-120"></i><?=$val->is_lock == 1 ? '解锁' : '锁定'?></a>
                                                <a title="编辑管理员" href="<?=url('manage/edit',['manage_id'=>$val->manage_id])?>" class="btn btn-xs btn-info"><i class=" fa fa-edit bigger-120"></i>编辑</a>
                                                <a title="删除管理员" mini="act" href="<?=url('manage/delete',['manage_id'=>$val->manage_id])?>" class="btn btn-xs btn-warning"><i class="fa fa-trash bigger-120"></i>删除</a>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div>
                                    <?=$list->render()?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

</script>

<style>

    .c-red{color: red;}

</style>

</body>

</html>

