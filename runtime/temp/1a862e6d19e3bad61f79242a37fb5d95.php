<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:75:"D:\soft\Apache24\htdocs\minprogramshop/youge/manage\view\manage\create.html";i:1513669204;s:68:"D:\soft\Apache24\htdocs\minprogramshop/youge/manage\view\layout.html";i:1530062533;s:75:"D:\soft\Apache24\htdocs\minprogramshop/youge/manage\view\public\header.html";i:1529636749;}*/ ?>
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

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox-content">
                <div class="row">
                    <form action="<?=url('manage/create',['miniapp_id'=>$miniapp_id])?>" id="form-create" method="post" class="form-horizontal" role="form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>管理员账号：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->mobile)?$detail->mobile:''?>" placeholder=""
                                       id="mobile" name="mobile" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>授权人密码：</label>
                            <div class="col-sm-9">
                                <input type="password" value="<?=isset($detail->password)?$detail->password:''?>"
                                       placeholder="" id="password" name="password" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>授权人角色名称：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->role_name)?$detail->role_name:''?>"
                                       placeholder="" id="role_name" name="role_name" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>授权人姓名：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->mange_name)?$detail->mange_name:''?>"
                                       placeholder="" id="mange_name" name="mange_name" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>是否锁定：</label>
                            <div class="col-sm-9">
                                <div class="radio i-checks">
                                    <label>
                                        <input name="is_lock" id="is_lock" value="1"
                                               type="radio" <?php if(isset($detail->is_lock)&&
                                        $detail->is_lock==1){?>checked="checked"<?php }?> > <i></i> 是</label>
                                    <label>
                                        <input name="is_lock" id="is_lock" value="0"
                                               type="radio" <?php if(isset($detail->is_lock)&&
                                        $detail->is_lock==0){?>checked="checked"<?php }?> > <i></i> 否</label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button mini="submit" for="form-create" class="btn btn-info" type="button">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    保存
                                </button>
                            </div>
                        </div>
                    </form>

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

