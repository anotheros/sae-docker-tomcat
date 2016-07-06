<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<DIV id="header">
		<DIV class="header row">
			<DIV class="header_logo">
				<A href="#"><IMG src="<%=contextPath %>/img/logo.png"></A>
			</DIV>
			<DIV class="header_nav">
				<UL class="gerenzhongxin userCenter_zxy ">
					<LI class="news"><I id="userType" style="display: none;"></I>
						<H1></H1>
						<DIV class="uls">
							<UL class="geren">
								<LI><A href="">个人中心</A></LI>
								<LI><A href="<%=contextPath%>/logout">退出登录</A></LI>
							</UL>
							<SPAN class="pos">
								<DIV>
									<IMG src="<%=contextPath %>/img/icon118.png">
								</DIV>
							</SPAN>
						</DIV></LI>
					<LI class="newLi">
						<DIV class="clearfix navlist">
							<I></I> <A href="javascript:void(0)">消息</A><SPAN id="zxx" style="display: none;"></SPAN>
						</DIV>
						
					</LI>
					
				</UL>
			</DIV>
		</DIV>
	</DIV>
	<SCRIPT>
	$('#navlist1').hover(
		function(){
			$('.navlistIcon').css('background','url(/template/web/img/icon189.png) center no-repeat');
		},
		function(){
			$('.navlistIcon').css('background','url(/template/web/img/icon183.png) center no-repeat');
		}
	);
 
 $( function(){
	$.ajax({
		url: "/web/instation_message!getUnreadIMMCount.action",
		type: "POST",
		dataType: "json",
		cache: false,
		success: function(data) {
			if(data.sumCount > 99){
				$('#zxx').show();
				$('#zxx').html('99+');
			} else if (data.sumCount > 0) {
				$('#zxx').show();
				$('#zxx').append("" + data.sumCount + "");
			}
			if (data.immCount > 99) {
				$('#znx').html('(99+)');
			} else if (data.immCount > 0){
				$('#znx').append("(" + data.immCount + ")");
			}
			if (data.amCount > 99) {
				$('#xtgg').html('(99+)');
			} else if (data.amCount > 0) {
				$('#xtgg').append("(" + data.amCount + ")");
			}
			
		},
		error: function(){
			console.log('error');
		}
	});
 });
 

	
		//判断会员是否登录
		/*$.ajax({
			url: "/web/member!ajaxMemberVerify.action",
			type: "POST",
			dataType: "json",
			//async: false,
			cache: false,
			success: function(data) {
				if (data.status) {
					//已登录
					$('.login').remove();
					$('.zhuce').remove();
					$('.gerenzhongxin').show();
				} else {
					//未登录
					$('.gerenzhongxin').hide();
				}
			}
		});*/
		
		
		$(window).scroll( function( ){
			top = $('body').scrollTop();
			if( top >= '110' ){
				$('#header').css({
					'background':'rgba(255,255,255,0.95)'
				});
			}else{
				$('#header').css({
					'background':'rgba(255,255,255,1)'
				});
			}
		})
		

	var webtuling = {
		header: function() {
			$('.news').on('mouseover', function() {
				$(this).addClass('on');
				$(this).children('.uls').show();
			});
			$('.news').on('mouseout', function() {
				$(this).removeClass('on');
				$(this).children('.uls').hide();
			});
			return this;
		}
	}
	webtuling.header();
</SCRIPT>
	