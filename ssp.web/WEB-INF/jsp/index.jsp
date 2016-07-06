<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% if(request.getSession().getAttribute("user")!=null){
	response.sendRedirect("/ssp/wechat");
}
%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<META http-equiv="content-type" content="text/html; charset=utf-8">
<TITLE>会员登录 ${error }</TITLE>
<LINK href="favicon.ico" rel="icon" type="image/x-icon">
<LINK href="<%=contextPath %>/css/reset.css" rel="stylesheet" type="text/css">
<LINK href="<%=contextPath %>/css/style.css" rel="stylesheet" type="text/css">
<LINK href="<%=contextPath %>/css/bins.css" rel="stylesheet" type="text/css">
<SCRIPT src="<%=contextPath %>/js/jquery-1.11.1.min.js"></SCRIPT>
<!--[if lte IE 6]>
	<script type="text/javascript" src="<%=contextPath %>/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
</HEAD>
<BODY class="body">
	<DIV class="logins" style="height: 406px;">
		<H2>
			<A href="http://ssp.laozapp.com/"><IMG src="<%=contextPath %>/img/login_logo.png"></A>
		</H2>
		<DIV class="form_box row">
			<FORM id="loginWindowForm" action="<%=contextPath %>/login/dologin" method="post">
				<DIV class="left">
					<UL>
						<LI>

							<INPUT name="email" id="email" type="email" placeholder="请输入登录邮箱" value="">

							<SPAN>请输入正确的邮箱</SPAN>
						</LI>
						<LI>
							<INPUT name="password" id="pwd" type="password" placeholder="请输入登录密码" value="">
							<SPAN>密码格式不正确</SPAN>
							<div>${error }</div>
						</LI>
					</UL>
					<DIV class="wangjimima">
						<DIV class="left_pw">
							<INPUT id="pw" type="checkbox"> <LABEL for="pw">记住密码</LABEL>
						</DIV>
						<A href="/register" target="_blank">忘记密码</A>
					</DIV>
					<DIV class="btns">
						<INPUT id="submitBt" type="button" value="登录">
						<!-- <a href="javascript::" id="submitBt">登录</a> -->
					</DIV>
				</DIV>
				<DIV class="right">
					<P style="margin-top: 0px; margin-bottom: 30px;">还没有微信联盟 媒体账号？</P>
					<P style="margin-bottom: 30px;">
						<A href="/register">立即注册</A>
					</P>
					<P style="margin-bottom: 30px;">
						<A href="http://blog.laozapp.com/ssp">使用方法及其原理</A>
					</P>
					<P style="margin-bottom: 22px;">也可以加群讨论</P>
					<UL>
						<LI>
							<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=87b9ac62f5419d69e6428a7111fab726b11c67a6fc664b14a6d4989f5ce6dc43"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="微信公众号" title="微信公众号"></a>
						</LI>
					</UL>	
					<%-- <P style="margin-bottom: 22px;">也可以通过以下账号登录</P>
					<UL>
						<LI>
							<A href="">
							<IMG src="<%=contextPath %>/img/icon-qq.png"></A>
						</LI>
						<LI>
							<A href="">
							<IMG src="<%=contextPath %>/img/icon-weixin.png"></A>
						</LI>
						<LI>
							<A href="">
							<IMG src="<%=contextPath %>/img/icon-weibo.png"></A>
						</LI>
					</UL> --%>
				</DIV>
			</FORM>
		</DIV>
	</DIV>
	<DIV class="di_yun"></DIV>
	<SCRIPT>
		$(function() {
			var $loginWindowForm = $('#loginWindowForm');
			var $email = $('#email');
			var $pwd = $('#pwd');
			var $submitBt = $('#submitBt');
			//var $captchaImage = $("#captchaImage");
			var fUsername = false;
			var fPwd = false;
			var fcap = true;
			$(':text').val('');

			$email.blur(function() {
				var email = $.trim($(this).val());
				var emailReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
				//var mobileReg = /^[1][3,4,5,7,8][0-9]{9}$/;
				//if(!reg.test(username)){
				if ($.trim(email).length >= 7 && (emailReg.test(email) /* || mobileReg.test(username) */)) {
					//格式正确
					fUsername = true;
					$email.next().css('visibility', 'hidden');
				} else {
					//显示错误弹框
					$(this).next().text('请输入正确的邮箱');
					$(this).next().css('visibility', 'visible');
					fUsername = false;

				}
			});

			$pwd.blur(function() {
				if (!fUsername) {
					$email.blur();
					return;
				}
				//var reg=/[a-zA-Z0-9_]{6,16}/;
				if (!($.trim($(this).val()).length > 5 && $.trim($(this).val()).length < 17)) {
					//显示错误弹框
					//$pwd.next().text('密码格式不正确');
					$(this).next().css('visibility', 'visible');
					fPwd = false;
				} else {
					//格式正确
					$(this).next().css('visibility', 'hidden');
					fPwd = true;
				}
			});

			// 刷新验证码图片
			//$captchaImage.click(function() {
			//	$captchaImage.attr("src", "/captcha.jpeg?timestamp" + (new Date()).valueOf());
			//});

			$submitBt.click(function() {
				//alert('fUsername:'+fUsername + '  fPwd:'+fPwd +'  fcap:'+fcap);
				if (fUsername == true && fPwd == true) {
					if (!fcap) {
						$('#cap').blur();
						return;
					}
					$loginWindowForm.submit();
				} else {
					$pwd.blur();
					$submitBt.click();
					return;
				}

			});

			$('input').keydown(function(e) {
				if (e.keyCode == 13) {
					$submitBt.click();
				}
			});

		});

		var webtuling = {
			newHeight : function() {
				var newheight = 0;
				var d = document.documentElement, b = document.body;
				var vp = d && d.clientWidth && d.clientWidth != 0 ? {
					width : d.clientWidth,
					height : d.clientHeight
				} : {
					width : b.clientWidth,
					height : b.clientHeight
				};

				if (newheight < vp.height) {
					newheight = vp.height - 1;
				}
				$('html,body').height(newheight);
				$('.bins .bg').height(newheight);
				return this;
			},
			ize_x : function() {
				var t = this;
				$(window).bind("ize.xxx", function() {
					t.newHeight();
				});
				return this;
			},
			center : function(dom) {
				w = $(dom).width();
				h = $(dom).height();
				$(dom).css({
					'marginLeft' : -w / 2,
					'marginTop' : (-h / 2) - 84
				});
				return this;
			}
		}
		webtuling.newHeight().ize_x().center('.logins');
	</SCRIPT>
</BODY>
</HTML>