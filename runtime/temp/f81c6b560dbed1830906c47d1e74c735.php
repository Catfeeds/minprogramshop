<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:76:"D:\soft\Apache24\htdocs\minprogramshop/youge/admin\view\news\news\index.html";i:1503555818;s:67:"D:\soft\Apache24\htdocs\minprogramshop/youge/admin\view\layout.html";i:1529650601;s:74:"D:\soft\Apache24\htdocs\minprogramshop/youge/admin\view\public\header.html";i:1529650715;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<title>微点应用后台管理中心</title>
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
<!--link href="__PUBLIC__/admin/css/mest.css" rel="stylesheet"-->
<script src="__PUBLIC__/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="__PUBLIC__/admin/js/admin.js"></script>
<script src="__PUBLIC__/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="__PUBLIC__/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="__PUBLIC__/admin/js/contabs.min.js"></script>
<script src="__PUBLIC__/admin/js/plugins/pace/pace.min.js"></script>

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
                            <form class="form-search" method="get" action="<?=url('news.news/index')?>" role="form">
                                <table>
                                    <tr>
                                        <td>动态标题:<input class="form-control" name="title" id="title" value="" type="text" placeholder="请输入动态标题" style=" width:200px"/></td>
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
                        <a title="添加动态管理" href="<?=url('news.news/create')?>" class="btn btn-sm btn-success"><i
                                class=" fa fa-plus"></i>添加动态管理</a>
                        <a mini="list" for="mini_list" title="批量删除动态管理" href="<?=url('news.news/delete')?>"
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
                                <th>标题</th>
                                <th>标题2（显示在列表页）</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <form id="mini_list">
                                <tbody>
                                <?php foreach($list as $val){ ?>
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input id="news_id_<?=$val->news_id;?>" name="news_id[]"
                                                   value="<?=$val->news_id;?>" type="checkbox" class="ace"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td><?= $val->news_id ?></td>
                                    <td><?=$val->title2?></td>
                                    <td><?=$val->title?></td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <a title="编辑动态管理" href="<?=url('news.news/edit','news_id='.$val->news_id)?>"
                                               class="btn btn-xs btn-info"><i class=" fa fa-edit bigger-120"></i>编辑</a>
                                            <a title="删除动态管理" mini="act"
                                               href="<?=url('news.news/delete','news_id='.$val->news_id)?>"
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

        
        
        <script src="__PUBLIC__/admin/js/content.min.js?v=1.0.0"></script>
        <script src="__PUBLIC__/admin/js/plugins/iCheck/icheck.min.js"></script>
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
