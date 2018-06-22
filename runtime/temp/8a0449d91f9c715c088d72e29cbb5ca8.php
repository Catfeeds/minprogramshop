<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:80:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\shop\banner\photo.html";i:1505135076;s:69:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\layout.html";i:1529652117;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;}*/ ?>
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
<link rel="stylesheet" href="/public/common/zyupload/skins/zyupload-1.0.0.css " type="text/css">
<script type="text/javascript" src="/public/common/zyupload/zyupload.basic-1.0.0.js"></script>

<div class="wrapper wrapper-content animated fadeInRight">
    <!-- PAGE CONTENT BEGINS -->
    <div class="row">
        <div class="col-xs-12">
            <div class="ibox-content">
                <div id="zyupload" class="zyupload"></div>
                <script type="text/javascript">
                    $(function () {
                        // 初始化插件
                        $("#zyupload").zyUpload({
                            width: "650px", // 宽度
                            height: "auto", // 宽度
                            itemWidth: "140px", // 文件项的宽度
                            itemHeight: "115px", // 文件项的高度
                            url: "<?=url('miniapp/shop.banner/photosave',['mdl'=>'goods_photo'])?>", // 上传文件的路径
                            fileType: ["jpg", "png", 'gif', 'jpeg', 'bmp'], // 上传文件的类型
                            fileSize: 51200000, // 上传文件的大小
                            multiple: true, // 是否可以多个文件上传
                            dragDrop: false, // 是否可以拖动上传文件
                            tailor: false, // 是否可以裁剪图片
                            del: true, // 是否可以删除文件
                            finishDel: false, // 是否在上传文件完成后删除预览
                            /* 外部获得的回调接口 */
                            onSelect: function (selectFiles, allFiles) {    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
                                console.info("当前选择了以下文件：");
                                console.info(selectFiles);
                            },
                            onDelete: function (file, files) {              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
                                console.info("当前删除了此文件：");
                                console.info(file.name);
                            },
                            onSuccess: function (file, response) {          // 文件上传成功的回调方法
                                console.info("此文件上传成功：");
                                console.info(file.name);
                                console.info("此文件上传到服务器地址：");
                                console.info(response);
                                //$("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
                            },
                            onFailure: function (file, response) {          // 文件上传失败的回调方法
                                console.info("此文件上传失败：");
                                console.info(file.name);
                            },
                            onComplete: function (response) {           	  // 上传完成的回调方法
                                location.href = "<?=url('/miniapp/shop.banner/photo')?>";
                            }
                        });

                    });

                </script>
                <div class="page-header">
                    <h1>
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            Banner设置
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <!-- PAGE CONTENT BEGINS -->
                    <table id="simple-table" class="table  table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>图片</th>
                            <th>排序</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <form id="mini_list">
                            <tbody>
                            <?php foreach($photos as $val){?>
                            <tr>
                                <td><?=$val->banner_id?></td>
                                <td><img width="50" src="/attachs/uploads/<?=$val->photo?>"/></td>
                                <td>
                                    <input type="text" name="orderby[<?=$val->banner_id;?>]" id="orderby[<?=$val->banner_id;?>]" value="<?=$val->orderby;?>"/>
                                </td>

                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <a title="删除图片" mini="act"
                                           href="<?=url('/miniapp/shop.banner/photodelete','banner_id='.$val->banner_id)?>"
                                           class="btn btn-xs btn-warning"><i class="fa fa-trash bigger-120"></i>删除</a>
                                    </div>
                                </td>
                            </tr>
                            <?php }?>
                            </tbody>
                        </form>
                    </table>
                    <div class="tableTools-container">
                        <a mini="list" for="mini_list" title="更新排序" href="<?=url('/miniapp/shop.banner/photoupdate')?>"
                           class="btn btn-sm btn-danger">更新排序</a>
                    </div>
                </div>
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->


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
