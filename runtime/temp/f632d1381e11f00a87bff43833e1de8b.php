<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:55:"D:\soft\Apache24\htdocs/youge/home\view\shop\index.html";i:1513415594;s:51:"D:\soft\Apache24\htdocs/youge/home\view\layout.html";i:1529571159;}*/ ?>
﻿<!DOCTYPE html>
<html dir="ltr">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>微点应用</title>
		<meta name="keywords" content="微点应用,微信小程序,小程序,小程序源码,小程序开发,拼团小程序,商城小程序,门店小程序,小程序代理,小程序加盟,微信小程序开发" />
		<meta name="description" content="微点应用-微信小程序生成平台|微信小程序开发|微信小程序源码|小程序代理" />
		<link type="text/css" rel="stylesheet" href="/public/styles/css/welcome.css">
		<link type="text/css" rel="stylesheet" href="/public/styles/css/common.css">
		<link type="text/css" rel="stylesheet" href="/public/styles/css/joincss.css">
		<link type="text/css" rel="stylesheet" href="/public/styles/css/aboutcss.css">
		<link type="text/css" rel="stylesheet" href="/public/styles/css/welcome2.css">
		<link type="text/css" rel="stylesheet" href="/public/styles/css/welcome3.css">
		<link type="text/css" rel="stylesheet" href="/public/styles/css/layer.css">
		<script type="text/javascript" src="/public/styles/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="/public/styles/js/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="/public/js/layer.js"></script>
	</head>
	<body>
		<style>
			.m-topLogo{width: 111px;height: 35px;background: url(/public/styles/images/vvez7fzn5nt5fn6yc2nvjt5nyv6tq1.png) no-repeat;background-size: 111px auto;}
			.m-topLogo.solid{background: url(/public/styles/images/m6imenbfx85rllz5jnlixx76finzjm.png) no-repeat;background-size: 111px auto;height: 35px;}
		</style>
		<div class="g-topNav moveDown" style="top: 0px;">
			<div class="wrapper">
				<a href="#" target="_self">
					<div class="m-topLogo ">
						<h1> 微点应用</h1>
					</div>
				</a>
				<div class="m-topNav ">
					<ul class="menu">
						<li class="product">
							<a href="<?=url('index/index')?>">
								首页<?=$footer == 1 ? '<span class="u-icon-caret"></span>' : ''?>
							</a>
						</li>
						<li class="product">
							<a href="<?=url('shop/index')?>">
								应用大厅<?=$footer == 2 ? '<span class="u-icon-caret"></span>' : ''?>
							</a>
						</li>
						<li class="kehu">
							<a href="<?=url('news/index')?>">
								最新动态<?=$footer == 3 ? '<span class="u-icon-caret"></span>' : ''?>
							</a>
						</li>
						<li >
							<a href="<?=url('faq/index')?>">
								帮助中心<?=$footer == 4? '<span class="u-icon-caret"></span>' : ''?>
							</a>
						</li>
						<li >
							<a href="<?=url('member/index')?>">
								招商加盟<?=$footer == 6 ? '<span class="u-icon-caret"></span>' : ''?>
							</a>
						</li>
						<!--<li class="qa">
							<a href="javascript:;" onclick="help();">
								帮助中心
								<span class="u-icon-caret"></span>
							</a>
						</li>-->
												<li >
							<a href="<?=url('about/index')?>">
								关于我们<?=$footer == 6 ? '<span class="u-icon-caret"></span>' : ''?>
							</a>
						</li>
											</ul>
				</div>
								<div class="m-login ">
					<a href="/manage/passport/login.html" class="u-btn signin">登录</a>
					<a href="/manage/passport/register.html" class="u-btn signup">注册</a>
				</div>
							</div>
		</div>
		<!--<script type="text/javascript">
			function help() {
				layer.open({
					type: 2,
					title: '帮助中心',
					shadeClose: true,
					shade: 0.8,
					area: ['90%', '90%'],
					content: "faq/index"
				});
			}
		</script>--><style type="text/css">
	.m-swiper-main .swiper-slide.view_left .group_bg {
	    position: absolute;
	    right: -370px;
	    top: 0;
	    text-align: right;
	    z-index: 1;
	}
</style>
<link rel="stylesheet" href="/public/home/plugs/swiper/dist/css/swiper.css">
<link rel="stylesheet" href="/public/home/css/comment.css?v=20170831"/>
<link rel="stylesheet" href="/public/home/css/index.css?v=201708230932"/>
<link rel="stylesheet" href="/public/home/css/wdetails.css"/>
<div class="wdetails-top">
        <span>应用中心</span>
    </div>
<div class="baottms_wrap clearfix">
    
    <div class="ms_topwrap clearfix">
        <div class="ms_content clearfix">
            <ul>
                <?php foreach($list as $val) { ?>
                <li>
                    <?php if(!empty($val->qrcode)){?>
                    <div style="display: none;" class="wxb_app_qrcode">
                          <a  href="<?=url('/home/shop/detail',['miniapp_id'=>$val->miniapp_id])?>" >
                            <img width="200" src="/attachs/uploads/<?=getImg($val->qrcode)?>"/>
                             </a>
                        </div>
                    <?php }?>
                
                    <div class="wxb_app_img">
                       <a  href="<?=url('/home/shop/detail',['miniapp_id'=>$val->miniapp_id])?>" >
                           <img src="/attachs/uploads/<?=getImg($val->photo)?>" style="width: 280px; height: 188px;"></img>
                        </a>
                    </div>
                    <div class="wxb_app_header">
                        <div class="title overflow_clear"><a  href="<?=url('/home/shop/detail',['miniapp_id'=>$val->miniapp_id])?>" ><?=$val->title?></a></div>
                        <a class="use" href="<?=url('/home/shop/detail',['miniapp_id'=>$val->miniapp_id])?>" >使用
                    </div>
                    <div class="wxb_app_details">
                        <?=$val->describe?>
                    </div>
                    
                </li>
                <?php } ?>
          
            </ul>
            <script>
                $(".ms_content li").mouseover(function(){
                    $(this).find('.wxb_app_qrcode').show();
                }).mouseout(function(){
                    $(this).find('.wxb_app_qrcode').hide();
                });
            </script>
        </div>
    </div>
</div>



<script>
	window.onload = function() {
		var xpadFlag = false;
		$(document).on("touchend", function() {
			$(".m-topNav .panel").hide();
		});
		$(".m-topNav li").on('touchend', function(e) {
			xpadFlag = true;
			e.stopPropagation();
			$(this).toggleClass("open");
			$(".m-topNav .panel").hide();
			$(this).children(".panel").show();
		}).children("a").on("click", function(e) {
			e.stopPropagation();
			if($(this).next(".panel").length && xpadFlag) {
				e.preventDefault();
			}
		});
	}
</script>
<script>
	/* 顶部导航动画 */
	$(window).on('scroll', function() {
		if($(document).scrollTop() > 10) {
			$('.g-topNav').addClass('solid');
			$('.g-topNav .m-topLogo').addClass('solid');
			$('.g-topNav .m-topNav').addClass('solid');
			$('.g-topNav .m-login').addClass('solid');
			$('.g-topNav').removeClass('moveDown');
			$('.g-yixin').addClass('moveUp');
		} else {
			$('.g-topNav').removeClass('solid');
			$('.g-topNav .solid').removeClass('solid');
			$('.g-topNav').addClass('moveDown');
			$('.g-yixin').removeClass('moveUp');
		}
	});
</script>
<script>
	$(".m-modalTipDemo .close").on("click", function() {
		$(".m-modalTipDemo").hide();
		$(document.body).css("overflow", "auto");
	});
	$(document).on("keydown", function(event) {
		if(event.keyCode == 27) {
			$(".m-modalTipDemo").hide();
			$(document.body).css("overflow", "auto");
		}
	});
</script>
<link rel="stylesheet" href="/public/styles/css/global.css">
<div class="qc-footer-service"  style="background-color: #191b1f"  >
	<div class="footer-service" >
		<div class="fs-list">
			<div class="fs-ct">
				<p href="" class="item" target="_blank">
					<span class="icon icon-1"></span>
					<span class="term">百倍故障赔偿</span>
				</p>
			</div>
			<div class="fs-ct">
				<p href="" class="item" target="_blank">
					<span class="icon icon-2"></span>
					<span class="term">5天无理由退款</span>
				</p>
			</div>
			<div class="fs-ct">
				<p href="" class="item" target="_blank">
					<span class="icon icon-3"></span>
					<span class="term">阿里云异地灾备</span>
				</p>
			</div>
			<div class="fs-ct">
				<p href="" class="item" target="_blank">
					<span class="icon icon-4"></span>
					<span class="term">1V1大客户服务</span>
				</p>
			</div>
			<div class="fs-ct item-last">
				<p href="" class="item" target="_blank">
					<span class="icon icon-5"></span>
					<span class="term">7x24小时服务</span>
				</p>
			</div>
		</div>
	</div>
</div>


<footer id="footer">
			<div class="footer-top" style="background-color: #191b1f;padding-top: 25px;padding-bottom: 25px;" >
				<div class="wrap">
					<dl>
						<dt>产品服务</dt>
												<dd>
							<a href="">微站</a>
						</dd>
												<dd>
							<a href="">门店</a>
						</dd>
												<dd>
							<a href="">商城</a>
						</dd>
												<dd>
							<a href="">拼团</a>
						</dd>
											</dl>
					<dl>
						<dt>关于</dt>
							<dd><a href="<?=url('index/index')?>">官网首页</a></dd>
							<dd><a href="<?=url('shop/index')?>">应用大厅</a></dd>
							<dd><a href="<?=url('news/index')?>" >最新动态</a></dd>
							<dd><a href="<?=url('faq/index')?>" >帮助中心</a></dd>
							<dd><a href="<?=url('member/index')?>" >招商加盟</a></dd>
							<dd><a href="<?=url('about/index')?>" >关于我们</a></dd>
			
					</dl>
					<dl>
						<dt>联系我们</dt>
						<dd>
							<a href="javascript:;">联系电话：15169991113</a>
						</dd>
						<dd>
							<a href="javascript:;">QQ：67930603</a>
						</dd>
						<dd>
							<a href="javascript:;">微信：yanervip</a>
						</dd>
						<dd>
							<a href="javascript:;">地址：微点应用小程序研发中心</a>
						</dd>
					</dl>
				</div>
			</div>

		</footer>

<div class="qc-footer J-qc-footer">
	<div class="qc-footer-blogroll" style="background-color: #15161a;padding-bottom: 15px;padding-top: 15px;" >
			<div class="blogroll-inner" style="text-align: center">
				<div class="link-set">

					<div class="links">
						<p class="line copyright">
							<span class="slide">
							Copyright (c)2015 - 2017 微点应用版权所有 版权所有 | 鲁ICP备16033895号-1						</span>
						</p>
					</div>
				</div>
				<div class="locale J-footerSwitchLang">
					<a href="" class="locale-link">   </a>
				</div>
			</div>
	</div>
</div>






		<div id="toolitembar">
			<a href="http://wpa.qq.com/msgrd?v=3&uin=67930603&site=qq&menu=yes" id="toolitembar-support"><i class="icon-live-help"></i>
				<span>在线客服</span>
			</a>
			<a href="tel:15169991113" id="toolitembar-phone"><i class="icon-call"></i>
				<span>电话咨询</span>
			</a>
			<a href="javascript:;" id="toolitembar-info"><i class="icon-info"></i>
				<span>查看演示</span>
			</a>
			<a href="/manage/passport/register.html" id="toolitembar-signin"><i class="icon-description"></i>
				<span>免费注册</span>
			</a>
			<a href="javascript:;" id="back-top"><i class="icon-chevron-thin-up"></i>
				<span>返回顶部</span>
			</a>
		</div>
	</body>
</html>