<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<style>   
.error {   
    color: #ff0000;   
    font-weight: bold;   
}   
</style> 
<script src="//lib.sinaapp.com/js/jquery/1.7.2/jquery.js"></script>

<script type="text/javascript" src="/js/jquery.validate.min.js"></script>


<SCRIPT type="text/javascript">
$().ready(function() {
	 $("#signupForm").validate();
	});

$(document).ready(function(){
	  $("input").focus(function(){
	    $("input").css("background-color","#FFFFCC");
	  });
	  $("input").blur(function(){
	    $("input").css("background-color","#D6D6FF");
	    });
});
</SCRIPT>
</head>
<body>   

 <form:form method="post" modelAttribute="user">   
        <form:errors path="*" cssClass="error" />   
        <table>   
            <tr>   
                <td>密码</td>   
                <td><form:input path="pwd" type="password"/>   
                </td>   
                <td><form:errors path="pwd"  cssClass="error" />   
                </td>   
            </tr>   
            <tr>   
                <td>确认密码</td>   
                <td><input id="pwd2" type="password" name="pwd2">
                </td>   
                </td>   
            </tr>   
       
            <tr>   
                <td colspan="3"><input type="submit" />   
                </td>   
            </tr>   
        </table>   
    </form:form>
</body>   
</html>