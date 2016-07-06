﻿<!DOCTYPE html PUBliC "-//W3C//dtD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/dtD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%-- <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script> --%>
<script src="//lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath }/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.tmpl.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.pagination.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pagination.css" />

<style>
<!--
input,select,textarea {
	width: 800px;
	display: block;
	margin-left: 20px;
}

.action {
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

.cover {
    display: none; 
    position: absolute;  
    top: 0%;  
    left: 0%;  
    width: 100%;  
    height: 100%;  
    background-color: black;  
    z-index:8888;  
    -moz-opacity: 0.6;  
    opacity:.60;  
    filter: alpha(opacity=60);  
 } 
 
 .center{
 	display: none; 
 	position: absolute;  
 	top: 0%;  
    left: 0%;  
    width: 100%;  
    height: 100%;
 }
 .content{
  	margin: 0 auto;
	text-align: left;
 	vertical-align: middle;
  	width: 900px;  
 	background: white;
 	position:relative;
 	z-index:9999; 
 }
 .close{
 	position:absolute;
 	top: 0;
 	right: 0;
 	width: 33px;
 	height: 18px;
 	border:dotted 2px red;
 	cursor:pointer;
 	z-index:9999;
 }
 
-->
</style>
<script type="text/javascript">
<!--
	var currentPage=0;
	function submitForm(form) {
		//	alert(document.getElementById('aa').checked);
		console.log(form);
		$('#'+form).ajaxSubmit(function(message) {
			hideupdate();
			pageselectCallback(currentPage);
		});
		return false;
	}
	
	$(document).ready(function () {
	    //var TotalNum = ${actionCount };
	    //首次加载
	    pageselectCallback(0);
	    //弹出层 
	    $('.cover,.close').on('click',hideupdate);
	    
	});
	function hideupdate(){
    	$('.cover').hide();
    	$('#update').hide();
    }
    function pageselectCallback(page) {
    	currentPage = page;
    	var totalNum=0;
    	var pageSize=3;
        $.ajax({
            type: "get",
            dataType: "json",
            url: "${pageContext.request.contextPath }/action/list", //请求的url
            data: { "page": page },
            success: function (req) {
            	console.log(req);
            	totalNum=req.totalElements;
            	pageSize= req.size;
                //使用微软jQuery Templates绑定数据列表,实现了HTML与js分离,使得页面整洁
                $(req.content).each(function(index,value) {
                	var option = $("#type").find("option").get(value.type);
                	req.content[index].type=$(option).text();
	            });
                $("#Pagination").pagination(totalNum, {
                	maxentries:totalNum,
        	        prev_text: "上一页",
        	        next_text: "下一页",
        	        num_edge_entries: 2,
        	        current_page:currentPage,
        	        items_per_page:pageSize,
        	        num_display_entries: pageSize,
        	        //回调
        	        callback: pageselectCallback
        	    });
                $("#content-left-list").html($("#Template").render(req.content));
            }
        });
       
    }
	function deleteAction(id){
		$.ajax({
            type: "post",
            dataType: "json",
            url: "${pageContext.request.contextPath }/action/del", //请求的url
            data: { "id": id },
            success: function (data) {
            	console.log(data);
            	pageselectCallback(currentPage);	
            },
            error : function(XMLHttpRequest, statusText, errorThrown) {
				console.log(XMLHttpRequest);
				console.log(statusText);
				console.log(errorThrown);
				alert(XMLHttpRequest);
				alert(statusText);
				alert(errorThrown);
			}
        });
	}
	
	function checkboxClick(checkbox,status){
		if ($(checkbox).prop("checked")) {
			$(status).val(1);
		} else {
			$(status).val(0);
		}
	}
	
	function updateActoin(id){
		$tr = $('#'+id);
		$('.cover').show();
		$('#update').show();
		var top = ($('#update').height()-$('#content').height())/2;
		$('#content').css("top",top);
		$('#content>[name=code]').val($tr.children("[name=code]").html());
		$('#content>[name=regex]').val($tr.children("[name=regex]").html());
		$('#content>[name=action]').val($tr.children("[name=action]").html());
		$('#content>[name=type]').find("option[text='"+$tr.children("[name=type]").html()+"']").attr("selected","selected");
		$('#content>[name=id]').val($tr.children("[name=id]").html());
		var status = $tr.children("[name=status]").html();
		if(status==1){
			$('#content>[type=checkbox]').prop("checked",true);
		}else{
			$('#content>[type=checkbox]').prop("checked",false);
		}
	}
	
		
//-->
</script>
</head>
<a href="${pageContext.request.contextPath }/welcome">回去</a> action
config:
<p>
<div class="action">
	<form id="form" action="${pageContext.request.contextPath }/action/add"
		method="post">
		code:<input name="code" placeholder="如：top10"> 
		regex:<input name="regex"> 
		value:<textarea name="action" rows="5"></textarea>
		回复类型：<select id="type" name="type">
					<option value="0" text="">回复文本消息</option>
					<option value="1">回复图文消息</option>
					<option value="2">回复图片消息</option>
					<option value="3">回复语音消息</option>
					<option value="4">回复视频消息</option>
					<option value="5">回复音乐消息</option>
			   </select>
		是否启用：<input type="checkbox" checked="checked" onclick="checkboxClick(this,status);"> 
		<input id="status" type="hidden" name="status" value="1">
	</form>
	<input type="button" value="添加" onclick="submitForm('form');">
</div>
<div> 
	 <div id="content-left" class="demo">
        <!--显示列表-->
        <table cellspacing="0" cellpadding="3" border="1"> 
        <thead>
        	<tr>
        		<th>code</th>
        		<th>regex</th>
        		<th>action</th>
        		<th>status</th>
        		<th>type</th>
        		<th>操作</th>
        		<th>id</th>
        	</tr>
        </thead>
		<tbody id="content-left-list"> 
		</tbody> 
		</table> 
        <!--分页样式显示-->
        <div id="Pagination" class="pagination"></div>
        <!--jQuery Template-->
       <script id="Template" type="text/html">
		<tr id="${'${'}id}">			
		 	<td name="code">${'${'}code}</td>
			<td name="regex">${'${'}regex}</td>
			<td name="action">${'${'}action}</td>
			<td name="status">${'${'}status}</td>
			<td name="type">${'${'}type}</td>
			<td><a href="#" onclick=deleteAction(${'${'}id})>删除</a> ..<a href="#" onclick=updateActoin(${'${'}id})>修改</a></td>
			<td name="id">${'${'}id}</td>
		</tr>
       </script>
      </div>
</div>

<div id="cover" class="cover">
</div>
<div id="update" class="center">
<form id="form2" action="${pageContext.request.contextPath }/action/update"
		method="post">
	<div id="content" class="content">
		<div class="close">关闭</div>
		code:<input name="code" placeholder="如：top10"> 
		regex:<input name="regex">
		value:<textarea name="action" rows="5"></textarea>
		回复类型：<select id="type" name="type">
					<option value="0" text="回复文本消息">回复文本消息</option>
					<option value="1" text="回复图文消息">回复图文消息</option>
					<option value="2" text="回复图片消息">回复图片消息</option>
					<option value="3" text="回复语音消息">回复语音消息</option>
					<option value="4" text="回复视频消息">回复视频消息</option>
					<option value="5" text="回复音乐消息">回复音乐消息</option>
			   </select>
		是否启用：<input type="checkbox" checked="checked" onclick="checkboxClick(this,status2);"> 
		<input id="status2" type="hidden" name="status" value="1">
		<input id="id" type="hidden" name="id" value="">
		<input type="button" value="修改" onclick="submitForm('form2');">
	</div>
	</form>
</div>
</html>
