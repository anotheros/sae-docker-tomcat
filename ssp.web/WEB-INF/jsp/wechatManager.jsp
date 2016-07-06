<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<LINK href="<%=contextPath %>/css/wechat_list.css" rel="stylesheet" type="text/css">
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
			<DIV class="personal_head">
				<SPAN>列表信息</SPAN>
			</DIV>
			<DIV class="nlp_header">
				<DIV class="nlp_header_left bins_btn2">新增</DIV>
			</DIV>
			<DIV class="sousuo_text">
				<DIV class="biaoge active">
					<TABLE class="table1">
						<TBODY id="tbody_class">
							<TR>
								<TH>名称</TH>
								<TH>应用ID</TH>
								<TH>EncodingAESKey<br>(消息加解密密钥)</TH>
								<TH>所属<br>分类</TH>
								<TH>描述</TH>
								<TH>关键字</TH>
								<TH>微信号</TH>
								<TH>原始ID</TH>
								<TH>代理<br>转发</TH>
								<TH>是否<br>回调</TH>
								<TH>TOKEN</TH>
								<TH>操作</TH>
							</TR>
							<c:forEach items="${weList}" var="chat">
							<TR>
								<TD class="td2">${chat.name }</TD>
								<TD class="td3">${chat.appId }</TD>
								<TD class="td2">${chat.encodingAESKey }</TD>
								<TD class="td2">${chat.cat }</TD>
								<TD class="td2">${chat.description }</TD>
								<TD class="td2">${chat.keywords }</TD>
								<TD class="td2">${chat.wechatId }</TD>
								<TD class="td2">${chat.originalId }</TD>
								<TD class="td2">${chat.callBackUrl }</TD>
								<TD class="td3">${chat.proxyCallbackInfo eq '1'? '是': '否' }</TD>
								<TD class="td2">${chat.token }</TD>
								<TD class="td5">
									<SPAN class="we_edit" data="${chat.id}">
										<IMG src="<%=contextPath %>/img/icon2.png">编辑
									</SPAN>
									<SPAN class="we_del" data="${chat.id}" >
										<IMG src="<%=contextPath %>/img/icon4.png">删除
									</SPAN>
								</TD>
							</TR>
							</c:forEach>
						</TBODY>
					</TABLE>
					<DIV class="sousuo_btns row">
						<INPUT id="pageindex_id" type="hidden">
						<DIV class="nav_btns"></DIV>
					</DIV>
				</DIV>
			</DIV>
			
		</DIV>
	</DIV>
<DIV class="bins">
		<DIV class="bins_content1"></DIV>
		<DIV class="xinzeng bins_content2" style="height: auto; margin-top: -222px; margin-left: -250px;">
			<FORM id="form1" action="<%=contextPath %>/ssp/wechat/add" method="post">
				<H1>
					<SPAN style="font-size: 14px; font-weight: bolder;">新增</SPAN>
					<P class="btn-default">
						<IMG src="<%=contextPath %>/img/icon212.png">
					</P>
				</H1>
				<DIV class="xinzeng_box bianji_box">
					<UL class="add_ul">
						<LI><SPAN class="left">名称</SPAN>
							<DIV class="rg"><INPUT name="name" type="text"></DIV>
						</LI>
				 		<LI><SPAN class="left">应用ID</SPAN>
							<DIV class="rg"><INPUT name="appId" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">EncodingAESKey(消息加解密密钥)</SPAN>
							<DIV class="rg"><INPUT name="encodingAESKey" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">所属分类</SPAN>
							<DIV class="rg"><INPUT name="cat" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">描述</SPAN>
							<DIV class="rg"><INPUT name="description" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">关键字</SPAN>
							<DIV class="rg"><INPUT name="keywords" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">微信号</SPAN>
							<DIV class="rg"><INPUT name="wechatId" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">原始ID</SPAN>
							<DIV class="rg"><INPUT name="originalId" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">代理转发地址</SPAN>
							<DIV class="rg"><INPUT name="callBackUrl" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">是否回调</SPAN>
							<DIV class="rg1">
							<select name="proxyCallbackInfo">
								<option value="0">否</option>
								<option value="1" checked>是</option>
							</select>
							</DIV>
						</LI>
						<LI><SPAN class="left">TOKEN</SPAN>
							<DIV class="rg"><INPUT name="token" type="text"></DIV>
						</LI>
					</UL>
					<DIV class="btns" style="padding: 6px;">
						<A id="addBtn" class="queding">确 定</A> <A class="btn-default">取 消</A>
					</DIV>
				</DIV>
			</FORM>
		</DIV>
		
		
		<DIV class="bianji bins_content5" style="height: auto; margin-top: -222px; margin-left: -250px;">
			<FORM id="form2" action="<%=contextPath %>/ssp/wechat/modify" method="post">
				<H1>
					<SPAN style="font-size: 14px; font-weight: bolder;">编辑</SPAN>
					<P class="btn-default">
						<IMG src="<%=contextPath %>/img/icon212.png">
					</P>
				</H1>
				<DIV class="bianji_box">
					<INPUT id="sspid" name="id" type="hidden">
					<INPUT id="sspuid" name="userId" type="hidden">
					<UL class="edit_ul">
						<LI><SPAN class="left">名称</SPAN>
							<DIV class="rg"><INPUT id="name" name="name" type="text"></DIV>
						</LI>
				 		<LI><SPAN class="left">应用ID</SPAN>
							<DIV class="rg"><INPUT id="appId" name="appId" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">EncodingAESKey(消息加解密密钥)</SPAN>
							<DIV class="rg"><INPUT id="encodingAESKey" name="encodingAESKey" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">所属分类</SPAN>
							<DIV class="rg"><INPUT id="cat" name="cat" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">描述</SPAN>
							<DIV class="rg"><INPUT id="description" name="description" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">关键字</SPAN>
							<DIV class="rg"><INPUT id="keywords" name="keywords" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">微信号</SPAN>
							<DIV class="rg"><INPUT id="wechatId" name="wechatId" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">原始ID</SPAN>
							<DIV class="rg"><INPUT id="originalId" name="originalId" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">代理转发地址</SPAN>
							<DIV class="rg"><INPUT id="callBackUrl" name="callBackUrl" type="text"></DIV>
						</LI>
						<LI><SPAN class="left">是否回调</SPAN>
							<DIV class="rg1">
							<select id="proxyCallbackInfo" name="proxyCallbackInfo">
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
							</DIV>
						</LI>
						<LI><SPAN class="left">TOKEN</SPAN>
							<DIV class="rg"><INPUT id="token" name="token" type="text"></DIV>
						</LI>
					</UL>
				</DIV>
				<DIV class="btns" style="padding: 6px;">
					<A id="modifyBtn" class="queding">确 定</A> <A class="btn-default">取 消</A>
				</DIV>
			</FORM>
		</DIV>
		<DIV class="qingkong bins_content6" style="margin-top: -125px; margin-left: -250px;">
			<H1>
				<SPAN>删除</SPAN>
				<P class="btn-default">
					<IMG src="<%=contextPath %>/img/icon212.png">
				</P>
			</H1>
			<INPUT id="deleteid" type="hidden">

			<DIV class="qingkong_box">
				<P id="shanchuquedingyu">你确定删除吗？</P>
			</DIV>
			<DIV class="btns" style="padding-top: 15px;">
				<A id="delBtn" class="queding">确 定</A> <A class="btn-default">取 消</A>
			</DIV>
		</DIV>
		
		
		<DIV class="bg"></DIV>
	</DIV>
<jsp:include page="include/footer.jsp"></jsp:include>
<SCRIPT>
	function setPage(container, count, pageindex) {
			$('#pageindex_id').val(pageindex);
			var container = container;
			var count = count;
			var pageindex = pageindex;
			var a = [];
			//总页数少于10 全部显示,大于10 显示前3 后3 中间3 其余....
			if (pageindex == 1) {
				a[a.length] = "<a href=\"#\" class=\"prev unclick\">上一页</a>";
			} else {
				a[a.length] = "<a href=\"#\" class=\"prev\">上一页</a>";
			}
			function setPageList() {
				if (pageindex == i) {
					a[a.length] = "<a href=\"#\" class=\"on\">" + i + "</a>";
				} else {
					a[a.length] = "<a href=\"#\">" + i + "</a>";
				}
			}
			//总页数小于10
			if (count <= 10) {
				for (var i = 1; i <= count; i++) {
					setPageList();
				}
			}
			//总页数大于10页
			else {
				if (pageindex <= 4) {
					for (var i = 1; i <= 5; i++) {
						setPageList();
					}
					a[a.length] = "<span>...</span><a href=\"#\">" + count
							+ "</a>";
				} else if (pageindex >= count - 3) {
					a[a.length] = "<a href=\"#\">1</a><span>...</span>";
					for (var i = count - 4; i <= count; i++) {
						setPageList();
					}
				} else { //当前页在中间部分
					a[a.length] = "<a href=\"#\">1</a><span>...</span>";
					for (var i = pageindex - 2; i <= pageindex + 2; i++) {
						setPageList();
					}
					a[a.length] = "<span>...</span><a href=\"#\">" + count
							+ "</a>";
				}
			}
			if (pageindex == count) {
				a[a.length] = "<a href=\"#\" class=\"next unclick\">下一页</a>";
			} else {
				a[a.length] = "<a href=\"#\" class=\"next\">下一页</a>";
			}
			container.innerHTML = a.join("");
			//事件点击
			var pageClick = function() {
				var oAlink = container.getElementsByTagName("a");
				var inx = pageindex; //初始的页码
				oAlink[0].onclick = function() { //点击上一页
					if (inx == 1) {
						return false;
					}
					inx--;
					setPage(container, count, inx);
					//重新绑定数据
					var key = getFindKey();
					ajaxqingqiushuju(inx, key);
					return false;
				}
				for (var i = 1; i < oAlink.length - 1; i++) { //点击页码
					oAlink[i].onclick = function() {
						inx = parseInt(this.innerHTML);
						setPage(container, count, inx);
						//重新绑定数据
						var key = getFindKey();
						ajaxqingqiushuju(inx, key);
						return false;
					}
				}
				oAlink[oAlink.length - 1].onclick = function() { //点击下一页
					if (inx == count) {
						return false;
					}
					inx++;
					setPage(container, count, inx);
					//重新绑定数据
					var key = getFindKey();
					ajaxqingqiushuju(inx, key);
					return false;
				}
			}()
		};
		setPage(document.getElementsByClassName("nav_btns")[0], 1, 1);

		$('.bins_btn2').on('click', function() {
			$('.bins_content2 #wentival').val('');
			$('.bins_content2 #daanval').val('');
			$('.bins').show();
			$('.bins .bins_content2').show().siblings().hide();
			$('.bins .bg').show();
		});

		$('.bins .btn-default').on('click', function() {
			$('.bins').hide();
			$('.bins').children().hide();
			$('.bins .bg').hide();
		});

		//编辑绑值弹窗
		$('.we_edit').click(function(){
			 var id = $(this).attr('data');
			 $.ajax({
					url : "<%=contextPath%>/ssp/wechat/ajax",
					data : {"id" : id},
					type : "POST",
					dataType : "json",
					cache : false,
					success : function(data) {
						if(data.result){
							//赋值
							$('#sspid').val(data.ssp.id);
							$('#sspuid').val(data.ssp.userId);
							$('#name').val(data.ssp.name);
							$('#appId').val(data.ssp.appId);
							$('#encodingAESKey').val(data.ssp.encodingAESKey);
							$('#cat').val(data.ssp.cat);
							$('#description').val(data.ssp.description);
							$('#keywords').val(data.ssp.keywords);
							$('#wechatId').val(data.ssp.wechatId);
							$('#originalId').val(data.ssp.originalId);
							$('#callBackUrl').val(data.ssp.callBackUrl);
							$('#proxyCallbackInfo').val(data.ssp.proxyCallbackInfo);
							$('#token').val(data.ssp.token);
							//弹窗
							$('.bins').show();
							$('.bins .bianji').show().siblings().hide();
							$('.bins .bg').show();
						}
					}
			 });
		});
		
		
		
		
		//单个删除操作弹窗
		$('.we_del').click(function(){
			 var id = $(this).attr('data');
			 $('#deleteid').val(id);
				$('#shanchuquedingyu').html('确定删除该条内容吗？');
				$('.bins').show();
				$('.bins .bins_content6').show().siblings().hide();
				$('.bins .bg').show();
		});
		

			//新增操作
			$('#addBtn').on('click', function(){
				var flag = false;
				$('.add_ul').find('input[type=text]').each(function(i, obj){
					if($(obj).val() == ''){
						flag = true;
						alert("信息填写不完整！");
						return false;
					}
				});
				if(flag) return;
				$('#form1').submit();
			});
		
			//点击编辑的提交
			$('#modifyBtn').on('click', function(){
				var flag = false;
				$('.edit_ul').find('input[type=text]').each(function(i, obj){
					if($(obj).val() == ''){
						flag = true;
						alert("信息填写不完整！");
						return false;
					}
				});
				if(flag) return;
				$('#form2').submit();					
			});
			
			//删除提交
			$('#delBtn').on('click', function() {
				window.location.href = '<%=contextPath%>/ssp/wechat/del/'+$('#deleteid').val();
			});
	</SCRIPT>
</BODY>
</HTML>
