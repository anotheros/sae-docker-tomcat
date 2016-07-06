<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!-- 意见反馈 -->
	<DIV class="sideFeedback_z"></DIV>
	<!-- 意见反馈弹出层 -->
	<DIV class="bgFeedback_z" style="display: none;">
		<DIV class="opinion opinion1">
			<SPAN class="delet"></SPAN>
			<H3>意见反馈</H3>
			<TEXTAREA maxlength="600" placeholder="需登录后才可提交意见反馈...">需登录后才可提交意见反馈...</TEXTAREA>
			<SPAN class="sub">提 交</SPAN>
		</DIV>
		<DIV class="opinion opinion2" style="display: none;">
			您的意见已收到，感谢您的关注。</DIV>
		<DIV class="opinion opinion3" style="display: none;">请5分钟之后再提哦~
		</DIV>
	</DIV>
	<!-- 底部banner 宣传 -->
	<!-- <div class="adWapper_z">
	<div class="del">×</div>
	<a class="adBanner_z" target="_blank" href="/html/extension.html">
		<img src="/template/web/img/banner(ad1).png" alt="">
	</a>
</div>
<div class="adWapper_z1">
</div> -->

<script>
var loginStatus = true;
	// 意见反馈
	function sideFeedback_z(){
		//意见反馈按钮，点击弹出
		$('.sideFeedback_z').click(function(){
			$('.bgFeedback_z').show();
			$('.opinion1').show();
			$('.opinion1 textarea').val('');
			$('.opinion2').hide();
			$('.opinion3').hide();
			if (loginStatus) {
				$('.sub').css('background','#3cb1e7');
                $('.opinion1 textarea').attr('disabled',false);
                $('.opinion1 textarea').attr('placeholder','请随意吐槽...');  
				$('.sub').on('mouseover',function(){
                    $(this).css('background','#54c4f8')
                })
                $('.sub').on('mouseout',function(){
                    $(this).css('background','#3cb1e7')
                })
			}else{
				/*未登录*/
				$('.sub').css('background','#cbcdce');
                $('.opinion1 textarea').attr('disabled',true);
                $('.opinion1 textarea').attr('placeholder','需登录后才可提交意见反馈...');
			}
		})
		//弹出层右上角关闭按钮
		$('.opinion1 .delet').click(function(){
			$('.bgFeedback_z').hide();
		})
		//弹出层登录按钮
		var onOff = true;
		$('.sub').click(function(){
			if (loginStatus&&onOff) {
				var $val = $('.opinion1 textarea').val();
				val = $.trim($val);
                //发送反馈
				if (val!='') {
					onOff = false;
                    var feedbackSendStatus = false;//发送成功标识
                    $.ajax({//同步ajax方法
                        url: "/web/feedback!ajaxAddFeedback.action",
                        type: "POST",
                        dataType: "json",
                        data:{"feedback.info":val},
                        async: true,
                        cache: false,
                        success: function(data) {
                            feedbackSendStatus=data.status;
                            if (data.status) {
                            	$('.opinion2').show();
								$('.opinion1').hide();
								$('.opinion3').hide();
								setTimeout(function(){
									$('.bgFeedback_z').hide();
									$('.opinion2').hide();
								},2000)
                            }else{
                            	$('.opinion3').show();
								$('.opinion1').hide();
								$('.opinion2').hide();
								setTimeout(function(){
									$('.bgFeedback_z').hide();
									$('.opinion3').hide();
								},2000)
                            }
                            onOff = true;
                        }
                    });
	
					
				}
			}
			
		})
	};
	sideFeedback_z();
	//底部广告
	/*function adBanner_z(){
		$('.adWapper_z').css('left',$(window).width());

		$('.del').click(function(){
			$('.adWapper_z').animate({
				'left':$(window).width()
			},500,function(){
				$('.adWapper_z').hide();
				$('.adWapper_z1').animate({
					'bottom':112
				},300)
			});
		})
		$('.adWapper_z1').click(function(){
			$('.adWapper_z1').animate({
				'bottom':0
			},300,function(){
				$('.adWapper_z').show();
				$('.adWapper_z').animate({
					'left':0
				},500);
			});
		})	
	};
	adBanner_z();*/

</SCRIPT>