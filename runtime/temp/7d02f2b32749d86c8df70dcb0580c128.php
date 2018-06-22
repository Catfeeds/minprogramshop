<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:83:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\shop2\category\index.html";i:1508567812;s:69:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\layout.html";i:1529652117;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;}*/ ?>
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
            <div class="ibox-content">
                <div class="row">
                    <div class="tableTools-container"><a title="添加商品分类" href="<?=url('shop2.category/create')?>" class="btn btn-sm btn-success"><i class=" fa fa-plus"></i>添加商品分类</a></div>
                    <div id="nestable-menu">
                        <button type="button" data-action="expand-all" class="btn btn-white btn-sm">展开所有</button>
                        <button type="button" data-action="collapse-all" class="btn btn-white btn-sm">收起所有</button>
                    </div>
                    <div class="dd" id="nestable2">
                        <?php $i=0; foreach($tree as $val) {$i++; ?>
                        <ol class="dd-list">
                            <li class="dd-item dd-nodrag" data-id="<?=$i?>">
                                <div class="dd-handle  ">
                                    <span class="label label-info"></span> <?=$val['category_name']?>
                                    <a title="删除父类会删除所有子类 你确定要删除吗？" mini="act" href="<?=url('shop2.category/delete',['category_id'=>$val['category_id']])?>" style="float: right;margin-left: 10px; color: red">删除</a>
                                    <a mini="load" w="80%" h="80%" href="<?=url('shop2.category/edit',['category_id'=>$val['category_id']])?>" style="float: right;margin-left: 10px;">修改</a>
                                    <a mini="load" w="80%" h="80%" href="<?=url('shop2.category/create',['pid'=>$val['category_id']])?>" style="float: right;margin-left: 10px;">添加子类</a>
                                </div>
                                <ol class="dd-list">
                                    <?php $j=0; foreach($val['children'] as $v) {$j++; ?>
                                    <li class="dd-item" data-id="<?=$j?>">
                                        <div class="dd-handle">
                                            <span class="label label-info"></span> <?=$v['category_name']?>
                                            <a title=" 你确定要删除该子分类吗？" mini="act" href="<?=url('shop2.category/delete',['category_id'=>$v['category_id']])?>" style="float: right;margin-left: 10px; color: red">删除</a>
                                            <a mini="load" w="80%" h="80%" href="<?=url('shop2.category/edit',['category_id'=>$v['category_id']])?>" style="float: right;margin-left: 10px;">修改</a>
                                        </div>
                                    </li>
                                    <?php } ?>
                                </ol>
                            </li>
                        </ol>
                        <?php } ?>

                    </div>
                </div><!-- /.row -->
            </div><!-- /.main-container -->
        </div>
    </div>
</div>
</div>
<script src="/public/admin/js/plugins/nestable/jquery.nestable.js"></script>
<script>
    $(document).ready(function () {
        var updateOutput = function (e) {
            var list = e.length ? e : $(e.target), output = list.data("output");
            if (window.JSON) {
                output.val(window.JSON.stringify(list.nestable("serialize")))
            } else {
                output.val("浏览器不支持")
            }
        };
        $("#nestable").nestable({group: 1}).on("change", updateOutput);
        $("#nestable2").nestable({group: 1}).on("change", updateOutput);
        $("#nestable").data("output", $("#nestable-output"));
        $("#nestable2").data("output", $("#nestable2-output"));
        $('.dd').nestable({itemNodeName:'lli'});
        $("#nestable-menu").on("click", function (e) {
            var target = $(e.target), action = target.data("action");
            if (action === "expand-all") {
                $(".dd").nestable("expandAll")
            }
            if (action === "collapse-all") {
                $(".dd").nestable("collapseAll")
            }
        })
    });
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
