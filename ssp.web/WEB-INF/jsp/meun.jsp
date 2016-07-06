<!DOCTYPE html PUBliC "-//W3C//dtD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/dtD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

.inputInline {
	display: inline;
	margin: auto;
	width: auto;
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

.disabled {
	border: 0px;
	background: white;
}

.hidden {
	display: none;
}
-->
</style>
<script type="text/javascript">
<!--
	var pre='└————';
	function submitForm(form) {
		$(form).ajaxSubmit(function(message) {
			// 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容   
			alert(message);
		});
		return false;
	}

	$(document).ready(function() {
		getAllAction(addMenuActionList);
		listAllMenu();
	});
	function listAllMenu(){
		getAllAction(renderMenu);
	}
	
	function renderMenu(action){
		var $temp = $('#temp').empty();
		$(action).each(function(index, value) {
			$temp.append('<option value='+value.id+'>'+ value.code + '</option>');
		});
		$.ajax({
			type : "get",
			dataType : "json",
			url : "${pageContext.request.contextPath }/menu/list", //请求的url
			success : function(data) {
				var menu1=[];
				var menu2=[[],[],[]];
				$(data).each(function(index, value) {
					if(!value.isChildMenu){
						menu1.push(value);
					}else{
						value.position=pre+value.position;
						value.name=pre+value.name;
						menu2[value.parentIndex-1].push(value);
					}
				});
				var menu=[];
				$(menu1).each(function(index, value) {
					menu = menu.concat(value,menu2[index]);
				});
				$(menu).each(function(index, value) {
					var option = $temp.children('option[value='+value.actionId+']');
					option.attr('selected',true);
					value.key=$temp.prop('outerHTML');
					option.removeAttr('selected');
				});

				$("#content-left-list").html($("#Template").render(menu));
				$(".disabled").attr("disabled", "disabled");
			}
		});
	}
	function syncMenu() {
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${pageContext.request.contextPath }/menu/sync", //请求的url
			success : function(data) {
				alert(data.errcode+':'+data.errmsg);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('出错了！！');
			}
		});
	}
	function addMenu() {
		var isChild = $('#addMenu>[type=checkbox]').prop("checked");
		var menu = {
			name : $('#addMenu>[name=name]').val(),
			type : $('#addMenu>[name=type]').val(),
			url : $('#addMenu>span>[name=url]').val(),
			actionId : $('#action>[name=actionId]').val(),
			isChildMenu : isChild,
			parentIndex : isChild==true?$('#parentIndex>[name=parentIndex]').val():0,
			position : $('#addMenu>[name=position]').val()
		};
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${pageContext.request.contextPath }/menu/add", //请求的url
			data : menu,
			success : function(data) {
				//alert(data);
				listAllMenu();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('出错了！！');
			}
		});
	}
	function deleteMenu(menuId){
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${pageContext.request.contextPath }/menu/del", //请求的url
			data : {id:menuId},
			success : function(data) {
				listAllMenu();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('出错了！！');
			}
		});
	}
	function updateMenu(id,tag_a){
		var $tr = $('#'+id);
		$(".disabled").attr("disabled", "");
		var $disable = $tr.children().find('.disabled');
		$disable.removeAttr('disabled');
		$disable.removeClass('disabled');
		var $tag_a = $(tag_a);
		console.log($tr.find('input[name=isChildMenu]'));
		var isChild=$tr.find('input[name=isChildMenu]').val();
		console.log(isChild);
		if(isChild){
			var $name =  $tr.find('input[name=name]');
			var $position = $tr.find('input[name=position]');
			$name.val($name.val().replace(pre,''));
			$position.val($position.val().replace(pre,''));
		}
		$tag_a.attr('onclick','updateMenuSubmit('+id+',this)');
		$tag_a.html('确定');
	}
	function updateMenuSubmit(id,tag_a){
		var $tr = $('#'+id);
		var $tag_a = $(tag_a);
		var $disable = $tr.children().children('input,select');
		$disable.attr("disabled", "");
		$disable.addClass('disabled');
		$tag_a.attr('onclick','updateMenu('+id+',this)');
		$tag_a.html('修改');
		var menu = {
				id:$tr.find('[name=id]').html(),
				name : $tr.find('[name=name]').val(),
				type : $tr.find('[name=type]').val(),
				url : $tr.find('[name=url]').val(),
				actionId : $tr.find('[name=actionId]').val(),
				isChildMenu : $tr.find('[name=isChildMenu]').val(),
				parentIndex : $tr.find('[name=parentIndex]').val(),
				position : $tr.find('[name=position]').val()
			};
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${pageContext.request.contextPath }/menu/update", //请求的url
			data : menu,
			success : function(data) {
				//alert(data);
				listAllMenu();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('出错了！！');
			}
		});
	}
	function getAllAction(callback) {
		$.ajax({
			type : "get",
			dataType : "json",
			url : "${pageContext.request.contextPath }/action/listAll", //请求的url
			success : function(data) {
				callback(data);
			}
		});
	}
	function typeChange(select) {
		var type = $(select).val();
		if (type == 'click') {
			$('#action').html('<select name="actionId"></select>');
			getAllAction(addMenuActionList);
		} else {
			$('#action').html('<input name="url">');
		}
	}
	function addMenuActionList(data){
		var $action = $('#action>select');
		$(data).each(
				function(index, value) {
					$action.append('<option value='+value.id+'>'
							+ value.code + '</option>');
				});
	}
	function checkboxClick(checkbox) {
		var box = $(checkbox);
		if (box.prop('checked')) {
			$('#parentIndex').removeClass('hidden');
			$('#addMenu>[name=position]').html($('#template2').html());
		} else {
			$('#parentIndex').addClass('hidden');
			$('#addMenu>[name=position]').html($('#template1').html());
		}
	}
//-->
</script>
</head>
<body>
	<a href="${pageContext.request.contextPath }/welcome">回去</a> menu
	config:
	<p>
	<div></div>
	<div class="hidden">
		<select id="temp"  class="disabled inputInline" name="actionId">
		</select>
	</div>
	<div id="content-left" class="demo">
		<!--显示列表-->
		<table cellspacing="0" cellpadding="3" border="1">
			<thead>
				<tr>
					<th>名称</th>
					<th>位置</th>
					<th>类型</th>
					<th>key/url</th>
					<th>操作</th>
					<th>id</th>
				</tr>
			</thead>
			<tbody id="content-left-list">
			</tbody>
		</table>
		<input type="button" value="同步菜单" onclick="syncMenu();">
		<script id="Template" type="text/html">
		<tr id="${'${'}id}">			
		 	<td><input class="disabled inputInline" value="${'${'}name}" name="name"></td>
			<td><input class="disabled inputInline" value="${'${'}position}" name="position"></td>
			<td><input class="disabled inputInline" value="${'${'}type}" name="type"></td>
			<td>
				{{if url}}
					<input class="disabled inputInline" value="${'${'}url}" name="url">
				{{else actionId}}
					${'${'}key}
				{{/if}}
			</td>
			<td><a href="#" onclick=deleteMenu(${'${'}id})>删除</a> ..<a href="#" onclick=updateMenu(${'${'}id},this)>修改</a></td>
			<td name="id">${'${'}id}</td>
			<td class="hidden"><input value="${'${'}isChildMenu}" name="isChildMenu">
			<input value="${'${'}parentIndex}" name="parentIndex">
			</td>
		</tr>
       </script>
	</div>
	新增菜单：
	<div id="addMenu">
		按钮名称：<input name="name"> 按钮类型: <select name="type"
			onchange="typeChange(this);">
			<option value="click">点击事件</option>
			<option value="view">跳转URL</option>
		</select> 按钮key/url值: <span id="action"> <select name="actionId"></select>
		</span> 子按钮：<input type="checkbox" onclick="checkboxClick(this)"> <span
			id="parentIndex" class="hidden"> 所属父按钮位置： <select
			name="parentIndex">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
		</select>
		</span> 位置： <select name="position">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select> <input type="button" value="新增菜单" onclick="addMenu();">
	</div>

	<div id="template1" class="hidden">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
	</div>
	<div id="template2" class="hidden">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</div>
</body>
</html>

