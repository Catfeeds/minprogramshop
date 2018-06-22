<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:79:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\shop\order\index.html";i:1508462446;s:69:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\layout.html";i:1529652117;s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/miniapp\view\public\header.html";i:1529651519;}*/ ?>
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
                            <form class="form-search" method="get" action="<?=url('miniapp/shop.order/index')?>"
                                  role="form">
                                <table>
                                    <tr>
                                        <td>
                                            会员:
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
                                            </script>
                                        </td>
                                        <td>下单日期:
                                            <input style="height: 34px;" value="<?=empty($search['date']) ? '' :$search['date'] ?>" placeholder="下单日期" name="date" id="decoration_time" class="laydate-icon form-control layer-date">
                                            <script>
                                                laydate({
                                                    elem: '#decoration_time',
                                                    event: 'focus',
                                                    format: 'YYYY-MM-DD',
                                                    istime: true
                                                });
                                            </script>
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
                    <div class="table-responsive">
                        <table id="simple-table" class="table table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>会员</th>
                                <th>订单金额</th>
                                <th>收货地址</th>
                                <th>支付</th>
                                <th>创建时间</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <form id="mini_list">
                                <tbody>
                                <?php foreach($list as $val){ ?>
                                <tr>
                                    <td><?= $val->order_id ?></td>
                                    <td>
                                        <?=empty($user[$val->user_id]) ? '' : $user[$val->user_id]->nick_name  ?><br>
                                        <!--<?=empty($user[$val->user_id]) ? '' :  $user[$val->user_id]->mobile?>-->
                                    </td>
                                    <td>
                                        总价格：<?=sprintf("%.2f",$val->total_price/100)?>￥<br>
                                        实际需要支付：<?=sprintf("%.2f",($val->total_price-$val->pay_coupon)/100 )?>￥<br>
                                    </td>
                                    <td>
                                        联系人:<?=$val->name?><br>
                                        手机号:<?=$val->mobile?><br>
                                        地址:<?=$val->gps_addr?> <?=$val->address?>
                                    </td>
                                    <td>
                                        已支付：<?=sprintf("%.2f",$val->pay_money/100)?><br>
                                        优惠券：<?=sprintf("%.2f",$val->pay_coupon/100)?><br>
                                    </td>
                                    <td>
                                        创建时间：<?=date("Y-m-d H:i:s",$val->add_time)?><br>
                                        支付时间：<?=empty($val->pay_time) ? '未支付' : date("Y-m-d H:i:s",$val->pay_time)?>
                                    </td>
                                    <td>
                                        <?php if($val->status == 0 ){?>
                                        <span class="label label-sm label-warning">等待支付</span>
                                        <?php }if($val->status == 1 ){?>
                                        <span class="label label-sm label-info">等待发货</span>
                                        <?php }if($val->status == 2 ){?>
                                        <span class="label label-sm label-info">已发货</span>
                                        <?php }if($val->status == 3) { ?>
                                        <span class="label label-sm label-default">申请取消</span>
                                        <?php } if($val->status == 4 ) { ?>
                                        <span class="label label-sm label-default">已退款</span>
                                        <?php } if($val->status == 8){?>
                                        <span class="label label-sm label-success">订单已完成</span>
                                        <?php }?>
                                    </td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <a title="取消订单" mini="load" w="50%" h="50%"  href="<?=url('shop.order/cancel','order_id='.$val->order_id)?>" class="btn btn-xs btn-warning"><?=$val->status == 3 ? '查看取消理由' : '取消订单' ?></a>
                                            <?php if($val->status == 1 || $val->status == 2 || $val->status == 8) { ?>
                                            <a title="取消订单" mini="load" w="50%" h="50%"  href="<?=url('shop.order/fahuo','order_id='.$val->order_id)?>" class="btn btn-xs btn-info"><?=$val->status == 1 ? '发货' : '查看发货信息' ?></a>
                                            <?php } ?>
                                            <a title="查看商品列表" mini="load" w="90%" h="90%"  href="<?=url('shop.order/goodslist','order_id='.$val->order_id)?>" class="btn btn-xs btn-success">查看商品列表</a>
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
