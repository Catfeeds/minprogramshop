<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:69:"D:\soft\Apache24\htdocs/youge/miniapp\view\shop2\category\create.html";i:1508729680;s:54:"D:\soft\Apache24\htdocs/youge/miniapp\view\layout.html";i:1515024814;s:61:"D:\soft\Apache24\htdocs/youge/miniapp\view\public\header.html";i:1515142918;}*/ ?>
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
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox-content">
                <div class="row">
                    <form action="<?=url('shop2.category/create',['pid'=>$category_id])?>" id="form-create" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>父级分类：</label>
                            <div class="col-sm-3">
                                <select id="pid" name="pida" class="form-control">
                                    <option   value="0" >顶级分类</option>
                                    <?php foreach($pid as $val) { ?>
                                       <option  <?=$val->category_id == $category_id ? 'selected' : ''?> value="<?=$val->category_id?>"><?=$val->type_name?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <script>
                            $("#pid").change(function () {
                                 var status = $(this).val();
                                 if(status == 0){
                                     $("#hot").hide();
                                 }else{
                                     $("#hot").show();
                                 }
                            })
                        </script>
                        <div style="<?=empty($category_id) ? 'display: none' : ''?>" id="hot" class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>是否推荐到首页：</label>
                            <div class="col-sm-3">
                                <select id="is_hot" name="is_hot" class="form-control">
                                    <option value="0">否</option>
                                    <option value="1">是</option>
                                </select>
                            </div>
                        </div>
                        <link rel="stylesheet" type="text/css" href="/public/common/webuploader-0.1.5/webuploader.css">
                        <script type="text/javascript" src="/public/common/webuploader-0.1.5/webuploader.js"></script>
                        <div id="ico" class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span
                                    class="c-red">*</span>图片：</label>
                            <div class="col-sm-2 ">
                                <div id="uploader-demo" style="max-width: 300px">
                                    <!--用来存放item-->
                                    <div id="photoList" class="uploader-list">
                                        <?php if(isset($detail['photo'])){?>
                                        <div class="file-item thumbnail"><img width="110" src="/attachs/uploads/<?=$detail['photo']?>"><input type="hidden" value="<?=$detail['photo']?>" name="photo" id="photo">
                                        </div>
                                        <?php }?>
                                    </div>
                                    <div id="photoPicker">选择图片</div>
                                </div>
                            </div>
                            <div class="clo-sm-2">
                                <a target="_blank" style="line-height: 50px;" href="http://www.iconfont.cn/">推荐使用阿里图标库</a>
                            </div>
                        </div>
                        <script>
                            var uploaderphoto = WebUploader.create({
                                auto: true,
                                swf: '/public/admin/Widget/webuploader-0.1.5/Uploader.swf',
                                server: '<?=url("upload.upload/index",['mdl'=>"category_photo"])?>',
                                pick: '#photoPicker',
                                resize: false,
                                duplicate: true
                            });

                            $(document).on('click', '.file-item', function () {
                                $(this).remove();
                            });

                            // 当有文件添加进来的时候
                            uploaderphoto.on('fileQueued', function (file) {
                                var $li = $(
                                    '<div id="' + file.id + '" class="file-item thumbnail">' +
                                    '<img>' +
                                    '<input type="hidden" value="" name="photo" id="photo">' +
                                    '<div class="info">' + file.name + '</div>' +
                                    '</div>'
                                    ),
                                    $img = $li.find('img');


                                // $list为容器jQuery实例
                                $("#photoList").html($li);

                                // 创建缩略图
                                // 如果为非图片文件，可以不用调用此方法。
                                // thumbnailWidth x thumbnailHeight 为 100 x 100
                                uploaderphoto.makeThumb(file, function (error, src) {
                                    if (error) {
                                        $img.replaceWith('<span>不能预览</span>');
                                        return;
                                    }

                                    $img.attr('src', src);
                                }, 100, 100);
                            });


                            // 文件上传过程中创建进度条实时显示。
                            uploaderphoto.on('uploadProgress', function (file, percentage) {
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
                            uploaderphoto.on('uploadSuccess', function (file, response) {
                                $('#' + file.id).addClass('upload-state-done');
                                $("#photo").val(response._raw);
                            });

                            // 文件上传失败，显示上传出错。
                            uploaderphoto.on('uploadError', function (file) {
                                var $li = $('#' + file.id),
                                    $error = $li.find('div.error');

                                // 避免重复创建
                                if (!$error.length) {
                                    $error = $('<div class="error"></div>').appendTo($li);
                                }

                                $error.text('上传失败');
                            });

                            // 完成上传完了，成功或者失败，先删除进度条。
                            uploaderphoto.on('uploadComplete', function (file) {
                                $('#' + file.id).find('.progress').remove();
                            });

                        </script>
                        <div id="color"  class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>背景颜色：</label>
                            <div class="col-sm-3">
                                <div class="input-group colorpicker-demo3">
                                    <input type="text" name="color" value="<?=isset($detail->color)?$detail->color:''?>" class="form-control" placeholder="顶级分类不需要 上传图片以及设置背景颜色" />
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                            </div>
                        </div>
                        <div  class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>名称：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->category_name)?$detail->category_name:''?>" placeholder="" id="category_name" name="category_name" class="form-control"/>
                            </div>
                        </div>
                        <div  class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"><span class="c-red">*</span>排序：</label>
                            <div class="col-sm-9">
                                <input type="text" value="<?=isset($detail->orderby)?$detail->orderby:''?>" placeholder="" id="orderby" name="orderby" class="form-control"/>
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
