<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:81:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\user\address\index.html";i:1504771754;s:69:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\layout.html";i:1529652117;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;}*/ ?>
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
                            <form class="form-search" method="get"  action="<?=url('user.address/index')?>" role="form">
                                <table>
                                    <tr>
                                        <td>会员:<input class="form-control" name="user_id" id="user_id"  value="<?=$search['user_id']?>" type="text"  placeholder="请输入会员"  style=" width:200px"/></td>
                                        <td>联系人:<input class="form-control" name="name" id="name"  value="<?=$search['name']?>" type="text"  placeholder="请输入联系人"  style=" width:200px"/></td>
                                        <td>手机号码:<input class="form-control" name="mobile" id="mobile"  value="<?=$search['mobile']?>" type="text"  placeholder="请输入手机号码"  style=" width:200px"/></td>
                                        <td>具体地址:<input class="form-control" name="address" id="address"  value="<?=$search['address']?>" type="text"  placeholder="请输入具体地址"  style=" width:200px"/></td>

                                        <td>
                                            <div class="input-group">
                                                <button type="submit" style="margin-top: 42%" class="btn form-control btn-sm btn-primary">
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
                        <a title="添加会员地址" href="<?=url('user.address/create')?>"  class="btn btn-sm btn-success"><i class=" fa fa-plus"></i>添加会员地址</a>
                    </div>



                    <div class="table-responsive">

                        <table id="simple-table"  class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>会员</th>
                                    <th>联系人</th>
                                    <th>手机号码</th>
                                    <th>具体地址</th>
                                    <th>是否默认</th>
                                    <th>是否删除</th>

                                    <th >操作</th>


                                </tr>
                            </thead>
                            <form  id="mini_list">
                                <tbody>
                                    <?php foreach($list as $val){ ?>
                                    <tr>
                                        <td><?= $val->address_id ?></td>
                                        <td><?=$val->user_id?></td>
                                        <td><?=$val->name?></td>
                                        <td><?=$val->mobile?></td>
                                        <td><?=$val->address?></td>
                                        <td><?=$val->is_default==1?'是':'否'?></td>
                                        <td><?=$val->is_delete==1?'已删除':'正常'?></td>


                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <a title="编辑会员地址"  href="<?=url('user.address/edit','address_id='.$val->address_id)?>"  class="btn btn-xs btn-info" ><i class=" fa fa-edit bigger-120"></i>编辑</a>
                                                <a title="删除会员地址" mini="act"  href="<?=url('user.address/delete','address_id='.$val->address_id)?>"  class="btn btn-xs btn-warning"><i class="fa fa-trash bigger-120"></i>删除</a>
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
