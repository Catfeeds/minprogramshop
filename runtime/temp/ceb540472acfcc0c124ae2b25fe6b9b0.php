<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:79:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\setting\skin\pay.html";i:1508745772;s:69:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\layout.html";i:1530084950;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>温格科技模板应用中心后台管理中心</title>
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
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox-content">
                <div class="row">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="alert alert-block alert-success">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>
                        <i class="ace-icon fa fa-check green"></i>
                        这里是小程序支付设置
                    </div>
                    <form action="<?=url('/miniapp/setting.skin/pay')?>" id="form-create" method="post" class="form-horizontal"
                          role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>APPID：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=empty($detail->mini_appid) ? '' : $detail->mini_appid?>"
                                       placeholder="请填写您申请的APPID" id="data[mini_appid]" name="mini_appid"
                                       class="col-xs-10 form-control col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>APPSECREPT：</label>
                            <div class="col-sm-9">
                                <input type="password"
                                       value="<?=empty($detail->mini_appsecrept) ? '' : $detail->mini_appsecrept?>"
                                       placeholder="请填写您申请的APPSECREPT" id="data[mini_appsecrept]" name="mini_appsecrept"
                                       class="col-xs-10 form-control col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>商户ID：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=empty($detail->mini_mid) ? '' : $detail->mini_mid?>"
                                       placeholder="请填写您申请的商户ID" id="data[mini_mid]" name="mini_mid"
                                       class="col-xs-10 form-control col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>商户密钥：</label>
                            <div class="col-sm-9">
                                <input type="password"
                                       value="<?=empty($detail->mini_apicode) ? '' : $detail->mini_apicode?>"
                                       placeholder="请填写您申请的商户密钥" id="data[mini_apicode]" name="mini_apicode"
                                       class="col-xs-10 form-control col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>证书pem格式：</label>
                            <div class="col-sm-9 ">
                                <input type="hidden"
                                       value="<?=empty($detail->apiclient_cert)?'':$detail->apiclient_cert?>"
                                       name="apiclient_cert">
                                <a upload="file" class="btn btn-white btn-bitbucket">
                                    <i class="fa fa-bookmark"></i><?=empty($detail->apiclient_cert)?'请上传':'已上传 单击重新上传'?>
                                </a>
                                <p style="display: none;color: red"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>证书秘钥key文件pem格式：</label>
                            <div class="col-sm-9 ">
                                <input type="hidden"
                                       value="<?=empty($detail->apiclient_cert_key)?'':$detail->apiclient_cert_key?>"
                                       name="apiclient_cert_key">
                                <a upload="file" class="btn btn-white btn-bitbucket">
                                    <i class="fa fa-bookmark"></i> <?=empty($detail->apiclient_cert_key)?'请上传':'已上传
                                    单击重新上传'?>
                                </a>
                                <p style="display: none;color: red"></p>
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
    <input id="files" name="file" type="file"  style="display: none">
</div>
<script src="/public/common/ajaxfileupload.js"></script>
<script>
    function ajaxupload(_this) {
        $("#files").click();
        $("#files").change(function () { //上传图片
            $.ajaxFileUpload({
                type: 'POST',
                url: '/miniapp/upload.upload/file',
                fileElementId: 'files', //与html代码中的input的id值对应
                dataType: 'html',
                success: function (data, status) {
                    var obj = JSON.parse(data);
                    if (obj.error == 1) {
                        _this.next().show();
                        _this.next().text(obj.info);
                    } else {
                        $("#files").val('');
                        _this.prev().val(obj.info);
                        _this.next().hide();
                        _this.css('color', 'green');
                        _this.text('上传成功');
                    }
                    ajaxupload();
                },
                error: function (data, status, e) {
                    ajaxupload();
                }
            });
        });
    }
    $("[upload='file' ]").click(function () {
        ajaxupload($(this));
    })
</script>

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
