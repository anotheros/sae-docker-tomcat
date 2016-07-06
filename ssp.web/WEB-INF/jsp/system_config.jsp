<!DOCTYPE html PUBliC "-//W3C//dtD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/dtD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="//lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/jquery.form/3.50/jquery.form.js"></script>
<style>
<!--
input,textarea {
	width: 800px;
	display: block;
}

div {
	border: #35a5e5 1px solid;
	transition: all 0.30s ease-in-out;
	-webkit-transition: all 0.30s ease-in-out;
	-moz-transition: all 0.30s ease-in-out;
	border-radius: 4px;
	outline: none;
	box-shadow: 0 0 5px rgba(81, 203, 238, 1);
	-webkit-box-shadow: 0 0 5px rgba(81, 203, 238, 1);
	-moz-box-shadow: 0 0 5px rgba(81, 203, 238, 1);
	margin: 30px auto;
}
-->
</style>
<script type="text/javascript">
<!--
	function submitForm(form) {
		$(form).ajaxSubmit(function(message) {
			// 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容   
			alert(message);
		});
		return false;
	}
//-->
</script>
</head>
<body>
<a href="${pageContext.request.contextPath }/welcome">回去</a>
System config:
<p>
<div>
	<form action="${pageContext.request.contextPath }/config/token"
		method="post" onsubmit="return submitForm(this)">
		token:<input name="token" type="text" value="${token }">
		<input	type="submit" value="提交">
	</form>
</div>
<div>
	<form action="${pageContext.request.contextPath }/config/appInfo"
		method="post" onsubmit="return submitForm(this)">
		appID:<input name="appID" type="text" value="${appID }">
		appsecret:<input name="appsecret" type="text" value="${appsecret }">
		<input type="submit" value="提交">
	</form>
</div>
<div>
	<form action="${pageContext.request.contextPath }/config/welcomeMsg"
		method="post" onsubmit="return submitForm(this)">
		welcomeMessage:<textarea name="welcomeMessage" rows="5">${welcomeMessage }</textarea>
		<input type="submit" value="提交">
	</form>
</div>
</body>
</html>