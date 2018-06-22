<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:62:"D:\soft\Apache24\htdocs/youge/manage\view\miniappshop\buy.html";i:1508556426;s:53:"D:\soft\Apache24\htdocs/youge/manage\view\layout.html";i:1514694776;s:60:"D:\soft\Apache24\htdocs/youge/manage\view\public\header.html";i:1514653468;}*/ ?>
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
<link href="/public/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="/public/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/public/admin/css/animate.min.css" rel="stylesheet">
<link href="/public/admin/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="/public/admin/css/mest.css" rel="stylesheet">
<script src="/public/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/public/admin/js/admin.js"></script>
<script src="/public/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/public/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="/public/admin/js/contabs.min.js"></script>
<script src="/public/admin/js/plugins/pace/pace.min.js"></script>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox-content">
                <div class="row">
                    <form action="<?=url('miniappshop/buy2',['miniapp_id'=>$miniapp_id])?>"  id="form-create" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">购买模版：</label>
                            <div class="col-sm-9">
                                 <img width="200" href="200" alt="image" class="img-responsive"
                         src="/attachs/uploads/<?=getImg($detail->photo)?>">
                            </div>
                        </div>
                          <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">模板名称：</label>
                            <div class="col-sm-9">
                                <?=$detail->title?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">模版价格：</label>
                            <div class="col-sm-9">
                                <?php if(!empty($agent[$member->type])) {?>
                                <span style="color: red;margin-left: 2%">￥<?= sprintf("%.2f",$detail->price * ($agent[$member->type]['discount']/100) /100)?></span></p>
                                <?php }else{ ?>
                                    <span style="color: red;margin-left: 2%"> ￥<?= sprintf("%.2f",$detail->price/100)?></span>
                                <?php }?>
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">账户余额：</label>
                            <div class="col-sm-9">
                                
                               <span style="color: red;margin-left: 2%"> ￥<?= sprintf("%.2f",$member->money/100)?></span>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">购买服务时间：</label>
                            <div class="col-sm-9">
                                
                              <?=config('setting.service_day');?>天
                                
                            </div>
                        </div>
                        <?php if(!$member_miniapp_id){?>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">选择我小程序：</label>
                            <div class="col-sm-9">
                                <select  class="form-control"  id="member_miniapp_id" name="member_miniapp_id">
                                    <?php foreach($myApp as $val){?>
                                    <option  value="<?=$val->member_miniapp_id;?>"><?=$val->nick_name;?></option>
                                    <?php }?>
                                </select>
                            </div>
                        </div>
                        <?php }else{?>
                        <input type="hidden" name='member_miniapp_id' id='member_miniapp_id' value="<?=$member_miniapp_id;?>"/>
                        <?php }?>
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button mini="submit" for="form-create" class="btn btn-info" type="submit">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    <?php echo $type==2?'确定续费':'确定购买';?>
                                </button>
                            </div>
                        </div>
                    </form>

                </div></div>
        </div>
    </div>
</div>
<script src="/public/admin/js/content.min.js?v=1.0.0"></script>
<script src="/public/admin/js/plugins/iCheck/icheck.min.js"></script>
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
