<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:80:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\user\coupon\index.html";i:1508746192;s:69:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\layout.html";i:1529652117;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;}*/ ?>
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
                            <form class="form-search" method="get" action="<?=url('user.coupon/index')?>" role="form">
                                <table>
                                    <tr>
                                        <td> 会员:
                                            <input id="username" type="text" name="username"  value="<?=input('get.username')?>" placeholder="请单击选择会员"  class="form-control"/>
                                            <input type="hidden" value="<?=$search['user_id']?>" name="user_id" id="user_id">
                                            <button id="show-btn1" style="display: none" type="button" mini="load" w="95%" h="95%" href="<?=url('miniapp/user.user/select')?>" class="btn btn-w-m btn-info">选择酒店</button>
                                            <script>
                                                $("#username").focus(function () {
                                                    $("#show-btn1").click();
                                                })
                                                function seleUser(user_name,user_id){
                                                    layer.closeAll();
                                                    layer.msg('操作成功！');
                                                    $("#username").val(user_name);
                                                    $("#user_id").val(user_id);
                                                }
                                            </script></td>
                                        <!--<td>获得途径:-->
                                                   <!--<select class="form-control" name="way">-->
                                                       <!--<option value="0" >请选择</option>-->
                                                       <!--<?php foreach(config("dataattr.couponwaynames") as $key => $val) {?>-->
                                                                       <!--<option  <?=$search['way'] == $key ? 'selected' : ''?> value="<?=$key?>"><?=$val?></option>-->
                                                       <!--<?php } ?>-->
                                                   <!--</select>-->
                                        <td>是否已使用:
                                                <select class="form-control" name="is_can">
                                                        <option  <?=$search['is_can'] == 0 ? 'selected' : ''?> value="0">请选择</option>
                                                        <option  <?=$search['is_can'] == 1 ? 'selected' : ''?> value="1" >已使用</option>
                                                        <option   <?=$search['is_can'] == 2  ?'selected' : ''?> value="2" >未使用</option>
                                                </select>
                                        </td>
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
                    <div class="tableTools-container">
                        <a title="添加用户红包" href="<?=url('user.coupon/create')?>" class="btn btn-sm btn-success"><i class=" fa fa-plus"></i>添加用户红包</a>
                    </div>
                    <div class="table-responsive">
                        <table id="simple-table" class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>会员</th>
                                <th>获得途径</th>
                                <th>面额</th>
                                <th>最低消费</th>
                                <th>过期时间</th>
                                <th>可以使用时间</th>
                                <th>是否已使用</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <form id="mini_list">
                                <tbody>
                                <?php foreach($list as $val){ ?>
                                <tr>
                                    <td><?= $val->coupon_id ?></td>
                                    <td><?=empty($users[$val->user_id]) ? '' : $users[$val->user_id]->nick_name ?></td>
                                    <td><?=empty(config("dataattr.couponwaynames")[$val->way]) ? '' : config("dataattr.couponwaynames")[$val->way]?></td>
                                    <td><?=sprintf("%.2f",$val->money/100)?>元</td>
                                    <td><?=sprintf("%.2f",$val->need_money/100)?>元</td>
                                    <td><?=date("Y-m-d H:i:s",$val->expir_time)?></td>
                                    <td><?=date("Y-m-d H:i:s",$val->can_use_time)?></td>
                                    <td><?=$val->is_can == 1  ? '<span class="label label-warning">已使用</span>' : '<span class="label label-primary">未使用</span>' ?></td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <a title="编辑用户红包"
                                               href="<?=url('user.coupon/edit','coupon_id='.$val->coupon_id)?>"
                                               class="btn btn-xs btn-info"><i class=" fa fa-edit bigger-120"></i>编辑</a>
                                            <a title="删除用户红包" mini="act"
                                               href="<?=url('user.coupon/delete','coupon_id='.$val->coupon_id)?>"
                                               class="btn btn-xs btn-warning"><i
                                                    class="fa fa-trash bigger-120"></i>删除</a>
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
