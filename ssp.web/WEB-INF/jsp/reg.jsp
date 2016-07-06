<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请内测</title>
<style>   
.error {   
    color: #ff0000;   
    font-weight: bold;   
}   
</style> 
<script src="//lib.sinaapp.com/js/jquery/1.7.2/jquery.js"></script>

<script type="text/javascript" src="/js/jquery.validate.min.js"></script>


<SCRIPT type="text/javascript">


var wait=60; 
function time(o) { 
        if (wait == 0) { 
            o.removeAttribute("disabled");           
            o.value="申请内测"; 
            wait = 60; 
        } else { 
            o.setAttribute("disabled", true); 
            o.value=wait+"秒后可以重新发送"; 
            wait--; 
            setTimeout(function() { 
                time(o) 
            }, 
            1000) 
        } 
 } 

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
		function sendemail(){
			var email = $("#email").val();
			var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
		    if (!pattern.test(email)) {
				$("#span1").html("<font color=\"red\">请输入正确的邮箱地址。</font>");
				return;
			}
			var data2 = { "email": email};
			time(document.getElementById("button"));
			$.ajax({
				type : "POST",
				url : "/email/send",
				dataType : "json",
				data: {email:email},
				/* contentType: "application/json; charset=utf-8", */
				success : function(data) {
					if(data.message=="true"){
						
					}if(data.message=="false") {
						$("#span1").html("<font color=\"red\">发生意外</font>");
					}else{
						$("#span1").html("<font color=\"red\">"+data.message+"</font>");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});	
		}

</SCRIPT>
</head>
<body>   



<div align="center" id="emaildiv">
<table  width="400" border="1">
    <tr>
      <td height="78"><div align="center">
  
         <input id="email" type="text" name="email" class="required email">
         <span id="span1">${error }</span> 
        <input onclick="sendemail()" type="button" id="button" value="申请内测">
      </div></td>
    </tr>
  </table>
</div>

</body>   
</html>