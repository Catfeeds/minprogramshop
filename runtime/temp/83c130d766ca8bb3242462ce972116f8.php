<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:67:"D:\soft\Apache24\htdocs/youge/miniapp\view\setting\skin\create.html";i:1504786592;s:54:"D:\soft\Apache24\htdocs/youge/miniapp\view\layout.html";i:1515024814;s:61:"D:\soft\Apache24\htdocs/youge/miniapp\view\public\header.html";i:1515142918;}*/ ?>
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
<link href="/public/admin/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<div class="wrapper wrapper-content animated fadeInRight">
        <div class="col-sm-12">
            <div class="alert alert-success">
               系统设置 设置成功以后 大约10分钟以后生效 具体时间请以实际为准   TIPS:快速预览办法 安卓:请长按小程序然后删除小程序在扫码进入小程序 IOS:请向右滑动再点击删除在扫码进入小程序
            </div>
            <div class="ibox-content">
                <div class="row">
                    <form action="<?=url('setting.skin/create')?>" id="form-create" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>客服电话：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->service_tel)?$detail->service_tel:''?>" placeholder="" id="service_tel" name="service_tel" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>投诉电话：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->complaint_tel)?$detail->complaint_tel:''?>" placeholder="" id="complaint_tel" name="complaint_tel" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>关于本站：</label>
                            <div class="col-sm-9">
                                <textarea name="about" placeholder="说点什么...最少输入10个字符" id="about" cols="50" rows="10" class="form-control"><?=isset($detail->about)?$detail->about:''?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>站点名称：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->app_name)?$detail->app_name:''?>" placeholder="" id="app_name" name="app_name" class="form-control"/>
                            </div>
                        </div>
                        <link rel="stylesheet" type="text/css" href="/public/common/webuploader-0.1.5/webuploader.css">
                        <script type="text/javascript" src="/public/common/webuploader-0.1.5/webuploader.js"></script>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>LOGO：</label>
                            <div class="col-sm-9 ">

                                <div id="uploader-demo" style="max-width: 300px">
                                    <!--用来存放item-->
                                    <div id="logoList" class="uploader-list">
                                        <?php if(isset($detail['logo'])){?>
                                        <div class="file-item thumbnail"><img width="110"
                                                                              src="/attachs/uploads/<?=$detail['logo']?>"><input
                                                type="hidden" value="<?=$detail['logo']?>" name="logo" id="logo"></div>
                                        <?php }?>
                                    </div>
                                    <div id="logoPicker">选择图片</div>
                                </div>
                            </div>
                        </div>
                        <script>

                            var uploaderlogo = WebUploader.create({
                                auto: true,
                                swf: '/public/admin/Widget/webuploader-0.1.5/Uploader.swf',
                                server: '<?=url("upload.upload/index",['mdl'=>"company_logo"])?>',
                                pick: '#logoPicker',
                                resize: false,
                                duplicate: true
                            });

                            $(document).on('click', '.file-item', function () {
                                $(this).remove();
                            });

                            // 当有文件添加进来的时候
                            uploaderlogo.on('fileQueued', function (file) {
                                var $li = $(
                                    '<div id="' + file.id + '" class="file-item thumbnail">' +
                                    '<img>' +
                                    '<input type="hidden" value="" name="logo" id="logo">' +
                                    '<div class="info">' + file.name + '</div>' +
                                    '</div>'
                                    ),
                                    $img = $li.find('img');


                                // $list为容器jQuery实例
                                $("#logoList").html($li);

                                // 创建缩略图
                                // 如果为非图片文件，可以不用调用此方法。
                                // thumbnailWidth x thumbnailHeight 为 100 x 100
                                uploaderlogo.makeThumb(file, function (error, src) {
                                    if (error) {
                                        $img.replaceWith('<span>不能预览</span>');
                                        return;
                                    }

                                    $img.attr('src', src);
                                }, 100, 100);
                            });


                            // 文件上传过程中创建进度条实时显示。
                            uploaderlogo.on('uploadProgress', function (file, percentage) {
                                var $li = $('#' + file.id),
                                    $percent = $li.find('.progress span');

                                // 避免重复创建
                                if (!$percent.length) {
                                    $percent = $('<p class="progress"><span></span></p>')
                                        .appendTo($li)
                                        .find('span');
                                }

                                $percent.css('width', percentage * 100 + '%');
                            });

                            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
                            uploaderlogo.on('uploadSuccess', function (file, response) {
                                $('#' + file.id).addClass('upload-state-done');
                                $("#logo").val(response._raw);
                            });

                            // 文件上传失败，显示上传出错。
                            uploaderlogo.on('uploadError', function (file) {
                                var $li = $('#' + file.id),
                                    $error = $li.find('div.error');

                                // 避免重复创建
                                if (!$error.length) {
                                    $error = $('<div class="error"></div>').appendTo($li);
                                }

                                $error.text('上传失败');
                            });

                            // 完成上传完了，成功或者失败，先删除进度条。
                            uploaderlogo.on('uploadComplete', function (file) {
                                $('#' + file.id).find('.progress').remove();
                            });

                        </script>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>系统皮肤（颜色设置）：</label>
                            <div class="col-sm-3">
                                <div class="input-group colorpicker-demo3">
                                    <input type="text" name="skin" value="<?=isset($detail->skin)?$detail->skin:''?>" class="form-control" />
                                    <span class="input-group-addon"><i></i></span>
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
<script src="/public/admin/js/plugins/switchery/switchery.js"></script>
<script src="/public/admin/js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="/public/admin/js/plugins/cropper/cropper.min.js"></script>
<script>
    $(document).ready(function () {
        function e() {
            var e = $("body")[0].style;
            $("#demo_apidemo").colorpicker({color: e.backgroundColor}).on("changeColor", function (o) {
                e.backgroundColor = o.color.toHex()
            }), $("#demo_forceformat").colorpicker({
                format: "rgba",
                horizontal: !0
            }), $(".demo-auto").colorpicker(), $(".disable-button").click(function (e) {
                e.preventDefault(), $("#demo_endis").colorpicker("disable")
            }), $(".enable-button").click(function (e) {
                e.preventDefault(), $("#demo_endis").colorpicker("enable")
            })
        }

        var o = $(".image-crop > img");
        $(o).cropper({
            aspectRatio: 1.618, preview: ".img-preview", done: function () {
            }
        });

        $(".i-checks").iCheck({
            checkboxClass: "icheckbox_square-green",
            radioClass: "iradio_square-green"
        }), $(".colorpicker-demo1").colorpicker(), $(".colorpicker-demo2").colorpicker(), $(".colorpicker-demo3").colorpicker(), e(), $(".demo-destroy").click(function (e) {
            e.preventDefault(), $(".demo").colorpicker("destroy"), $(".disable-button, .enable-button").off("click")
        }), $(".demo-create").click(function (o) {
            o.preventDefault(), e()
        });

    });

</script>

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
