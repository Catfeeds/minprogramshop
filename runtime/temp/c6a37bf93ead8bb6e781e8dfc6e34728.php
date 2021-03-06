<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"D:\soft\Apache24\htdocs/youge/admin\view\miniapp\authorizer\index.html";i:1505886216;s:52:"D:\soft\Apache24\htdocs/youge/admin\view\layout.html";i:1513522666;s:59:"D:\soft\Apache24\htdocs/youge/admin\view\public\header.html";i:1514657875;}*/ ?>
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
<!--link href="/public/admin/css/mest.css" rel="stylesheet"-->
<script src="/public/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/public/admin/js/admin.js"></script>
<script src="/public/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/public/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="/public/admin/js/contabs.min.js"></script>
<script src="/public/admin/js/plugins/pace/pace.min.js"></script>

</head>
<body class="gray-bg">
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
                            <form class="form-search" method="get" action="<?=url('miniapp.authorizer/index')?>"
                                  role="form">
                                <table>
                                    <tr>
                                        <td>
                                            用户:
                                            <input id="username" type="text" name="username"  value="<?=input('get.username')?>" placeholder="请单击选择用户"  class="form-control"/>
                                            <input type="hidden" value="<?=$search['member_id']?>" name="member_id" id="member_id">
                                            <button id="show-btn1" style="display: none" type="button" mini="load" w="95%" h="95%" href="<?=url('admin/member.member/select')?>" class="btn btn-w-m btn-info">选择酒店</button>
                                            <script>
                                                $("#username").focus(function () {
                                                    $("#show-btn1").click();
                                                })
                                                function selMember(user_name,user_id){
                                                    layer.closeAll();
                                                    layer.msg('操作成功！');
                                                    $("#username").val(user_name);
                                                    $("#member_id").val(user_id);
                                                }
                                            </script>
                                        </td>
                                        <td>
                                            模板:
                                            <input id="title" type="text" name="title"  value="<?=input('get.title')?>" placeholder="请单击选择模板"  class="form-control"/>
                                            <input type="hidden" value="<?=$search['miniapp_id']?>" name="miniapp_id" id="miniapp_id">
                                            <button id="show-btn" style="display: none" type="button" mini="load" w="95%" h="95%" href="<?=url('admin/miniapp.miniapp/select')?>" class="btn btn-w-m btn-info">选择酒店</button>
                                            <script>
                                                $("#title").focus(function () {
                                                    $("#show-btn").click();
                                                })
                                                function selMiniapp(title,miniapp_id){
                                                    layer.closeAll();
                                                    layer.msg('操作成功！');
                                                    $("#title").val(title);
                                                    $("#miniapp_id").val(miniapp_id);
                                                }

                                            </script>
                                        </td>
                                        <td>昵称:<input class="form-control" name="nick_name" id="nick_name" value="<?=$search['nick_name']?>" type="text" placeholder="请输入小程序名" style=" width:200px"/></td>
                                        <td>过期时间:
                                                <select class="form-control" name="expir">
                                                    <option  <?=$search['expir'] == 0 ? 'selected' : ''?> value="0" class="form-control">请选择</option>
                                                    <option  <?=$search['expir'] == 1 ? 'selected' : ''?> value="1"  class="form-control">已过期</option>
                                                    <option  <?=$search['expir'] == 2 ? 'selected' : ''?> value="2" class="form-control">即将过期（30天内）</option>
                                                    <option  <?=$search['expir'] == 3 ? 'selected' : ''?> value="3" class="form-control">时间充足</option>
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
                        <a title="添加小程序授权管理" href="<?=url('miniapp.authorizer/create')?>"
                           class="btn btn-sm btn-success"><i class=" fa fa-plus"></i>添加小程序授权管理</a>
                        <a mini="list" for="mini_list" title="批量删除小程序授权管理" href="<?=url('miniapp.authorizer/delete')?>"
                           class="btn btn-sm btn-danger"><i class="fa fa-trash"></i>批量删除</a>
                    </div>
                    <div class="table-responsive">
                        <table id="simple-table" class="table table-striped">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>ID</th>
                                <th>平台APPKEY</th>
                                <th>用户</th>
                                <th>手机号</th>
                                <th>模板名称</th>
                                <th>短信条数</th>
                                <th>TOKEN过期时间</th>
                                <th>头像</th>
                                <th><昵称></昵称></th>
                                <th>过期时间</th>
                                <th>授权时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <form id="mini_list">
                                <tbody>
                                <?php foreach($list as $val){ ?>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input id="member_miniapp_id_<?=$val->member_miniapp_id;?>"
                                                   name="member_miniapp_id[]" value="<?=$val->member_miniapp_id;?>"
                                                   type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td><?=$val->member_miniapp_id ?></td>
                                    <td><?=$val->appkey?></td>
                                    <td><?=empty($member[$val->member_id]) ? '' : $member[$val->member_id]->nick_name?>(<?=$val->member_id?>)</td>
                                    <td><?=empty($member[$val->member_id]) ? '' : $member[$val->member_id]->mobile?></td>
                                    <td><?=empty($miniapp[$val->miniapp_id]) ? '' : $miniapp[$val->miniapp_id]->title?></td>
                                    <td><?=$val->sms_num?></td>
                                    <td><?=date("Y-m-d H:i:s",$val->authorizer_refresh_token_expir_time)?></td>
                                    <td><img width="50" src="<?=$val->head_img?>"/></td>
                                    <td><?=$val->nick_name?></td>
                                    <td><?=date("Y-m-d H:i:s",$val->expir_time)?></td>
                                    <td><?=date("Y-m-d H:i:s",$val->add_time)?></td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <a title="编辑小程序授权管理"
                                               href="<?=url('miniapp.authorizer/edit','member_miniapp_id='.$val->member_miniapp_id)?>"
                                               class="btn btn-xs btn-info"><i class=" fa fa-edit bigger-120"></i>编辑</a>
                                            <a title="删除小程序授权管理" mini="act"
                                               href="<?=url('miniapp.authorizer/delete','member_miniapp_id='.$val->member_miniapp_id)?>"
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

        
        
        <script src="/public/admin/js/content.min.js?v=1.0.0"></script>
        <script src="/public/admin/js/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(document).ready(function(){
                $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})
            });
        </script>
        <style>
            .c-red{color: red;};
        </style>
</body>
</html>
