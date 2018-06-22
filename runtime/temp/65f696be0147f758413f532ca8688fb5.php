<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"D:\soft\Apache24\htdocs/youge/manage\view\member\edit.html";i:1503555820;s:53:"D:\soft\Apache24\htdocs/youge/manage\view\layout.html";i:1514694776;s:60:"D:\soft\Apache24\htdocs/youge/manage\view\public\header.html";i:1514653468;}*/ ?>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="/public/home/plugs/swiper/dist/css/swiper.css">
    <link rel="stylesheet" href="/public/home/css/comment.css"/>
    <link rel="stylesheet" href="/public/home/css/register.css"/>
    <script src="/public/admin/js/jquery.min.js"></script>
    <script src="/public/common/layer/layer.js" type="text/javascript"></script>
    <script src="/public/admin/js/admin.js"></script>
</head>
<body>
<div class="register-body">
    <div class="join_table">
        <div class="register-title">修改密码:</div>
        <form role="form"  id="login" action="<?=url('passport/edit')?>" method="post" >
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tbody>
                <tr>
                    <td class="controls">
                        <input type="text" disabled value="<?=$moblie?>" class="text_01 b_r3" id="mobile" data-rule-required="true" data-rule-mobile="true" name="mobile" placeholder="">
                    </td>
                </tr>
                <tr>
                    <td class="controls">
                        <input type="password" class="text_01 b_r3" id="password" data-rule-required="true" data-rule-yzpassword="true" name="password" placeholder="请输入密码">
                    </td>
                </tr>
                <tr>
                    <td class="controls">
                        <input type="password" class="text_01 b_r3" data-rule-required="true" equalto="#password"  name="password2" placeholder="请确认密码">
                    </td>
                </tr>
                <tr>
                    <td class="controls">
                        <a class="s_btn b_r3 bg_base fr jq_get_code" id="captcha" href="<?=url('passport/sendSms')?>" type="button" onclick="get_yzm(this)">获取短信验证码</a>
                        <div class="yzm">
                            <input type="text" class="text_01 b_r3" name="code" id="phone" placeholder="请输入短信验证码">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input mini="submit" type="submit" class="s_btn tj_btn bg_orange b_r24 jq_reg" name="submit" value="立即修改">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>
<script>
    var time_djs = 180;
    //获取验证码
    $(document).on('click', "#captcha", function (e) {
        if (time_djs !== 180) {
            return false;
        }
        var miniAct = $(this);
        var href = $(this).attr('href');
        var data = {mobile: $("#mobile").val(), countryCode: $("#countryCode").val()};
        e.preventDefault();
        layer.closeAll();//关闭所有的窗口
        if (miniAct.attr('lock') != 1) {
            miniAct.attr('lock', 1);
            var load = layer.load(1);
            $.get(href, data, function (data) {
                miniAct.attr('lock', 0);
                layer.close(load);//关闭所有的窗口
                if (data.data !== 200) {
                    layer.msg(data.msg);

                } else {
                    var t_obj = $("#captcha");
                    t_obj.attr("disabled", "disabled");
                    t_obj.text(time_djs + "s");
                    var my_set = setInterval(function () {
                        if (time_djs > 0) {
                            time_djs--;
                            t_obj.text(time_djs + "s");
                        } else {
                            t_obj.attr("disabled", "false");
                            t_obj.text('重新获取');
                            clearInterval(my_set);
                            time_djs = 180;
                        }
                    }, 1000);
                }

            }, 'json');
        }
    });
</script>

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
