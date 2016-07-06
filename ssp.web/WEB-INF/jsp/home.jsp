<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html PUBliC "-//W3C//dtD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/dtD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<META http-equiv="content-type" content="text/html; charset=utf-8">
<TITLE>流量主</TITLE>
<LINK href="favicon.ico" rel="icon" type="image/x-icon">
<LINK href="<%=contextPath %>/css/reset.css" rel="stylesheet" type="text/css">
<LINK href="<%=contextPath %>/css/member_center_info.css" rel="stylesheet" type="text/css">
<LINK href="<%=contextPath %>/css/top.css" rel="stylesheet" type="text/css">
<LINK href="<%=contextPath %>/css/left.css" rel="stylesheet" type="text/css">
<LINK href="<%=contextPath %>/css/bins.css" rel="stylesheet" type="text/css">
<SCRIPT src="<%=contextPath %>/js/jquery-1.11.1.min.js"></SCRIPT>
<SCRIPT src="<%=contextPath %>/js/layer.js" type="text/javascript"></SCRIPT>
<!--[if lte IE 6]>
    <script type="text/javascript" src="<%=contextPath %>/js/belatedPNG.js"></script>
    <script type="text/javascript">
        // 解决IE6透明PNG图片BUG
        DD_belatedPNG.fix(".belatedPNG");
    </script>
    <![endif]-->
</HEAD>
<BODY class="memberCenter">
	<SCRIPT src="<%=contextPath %>/js/browser.js" type="text/javascript"></SCRIPT>
	 <jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/left_menu.jsp"></jsp:include>
 
	<DIV class="personal_right">
		<DIV class="personal_right_box mini">
			</DIV>
			</DIV>

<jsp:include page="include/footer.jsp"></jsp:include>

</BODY>
</HTML>
