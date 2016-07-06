<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
	<DIV class="personal_left">
		<DIV class="sidebar">
			<DIV class="sidebar_header"></DIV>
			<DIV class="sidebar_nav">
				<UL class="uls">
					<LI>
						<DIV class="uls_header text_name" text_name="仪表盘">
							<!-- active  展开 -->

							<DIV class="newFeatu_z active" id="planet" style="display: none;">
								<I></I>
								<SPAN class="circle1"></SPAN>
								<SPAN class="circle2"></SPAN>
								<SPAN class="circle3"></SPAN>
								<SPAN class="circle4"></SPAN>
								<SPAN class="circle5"></SPAN>
							</DIV>
							<SPAN class="left"></SPAN>
							<SPAN class="center mini_hide">我的媒体</SPAN>
						</DIV>
						<UL class="lis">
							<LI class="active" id="l_01" num="1">
								<A class="text_name" href="javascript:void(0)" text_name="媒体管理">
									<EM class="aClick" data_href="/ssp/wechat"></EM>
									<DIV class="icon">
										<SPAN><IMG src="<%=contextPath %>/img/icon70.png"></SPAN>
									</DIV>
									<SPAN class="name mini_hide">数据概览</SPAN>
								</A>
							</LI>
							
						</UL>
					</LI>
					
					<LI>
						<DIV class="uls_header text_name" text_name="用户中心">
							<DIV class="newFeatu_z active" id="user" style="display: none;">
								<I></I>
								<SPAN class="circle1"></SPAN>
								<SPAN class="circle2"></SPAN>
								<SPAN class="circle3"></SPAN>
								<SPAN class="circle4"></SPAN>
								<SPAN class="circle5"></SPAN>
							</DIV>
							<SPAN class="left"></SPAN>
							<SPAN class="center mini_hide">用户中心</SPAN>
						</DIV>
						<UL class="lis">
							<LI id="l_08" num="8">
								<A href="javascript:void(0)" text_name="基本资料">
									<EM class="aClick" data_href="/ssp/wechat"></EM>
									<DIV class="icon">
										<SPAN><IMG src="<%=contextPath %>/img/icon77.png"></SPAN>
									</DIV>
									<SPAN class="name mini_hide">基本资料</SPAN>
								</A>
							</LI>
							<LI id="l_09" num="9">
								<A class="text_name" href="javascript:void(0)" text_name="安全设置">
									<EM class="aClick" data_href="/ssp/wechat"></EM>
									<DIV class="icon">
										<SPAN><IMG src="<%=contextPath %>/img/icon78.png"></SPAN>
									</DIV>
									<SPAN class="name mini_hide">安全设置</SPAN>
								</A>
							</LI>
							<LI id="l_10" num="10">
								<A class="text_name" href="javascript:void(0)" text_name="实名认证">
									<EM class="aClick" data_href="/ssp/wechat"></EM>
									<DIV class="icon">
										<SPAN><IMG src="<%=contextPath %>/img/icon79.png"></SPAN>
									</DIV>
									<SPAN class="name mini_hide">实名认证</SPAN>
								</A>
							</LI>
							
						</UL>
					</LI>
				</UL>
			</DIV>
		</DIV>
		<DIV class="move_text">
			<DIV class="move_text_bg">
				<SPAN></SPAN>
			</DIV>
			<DIV class="text"></DIV>
		</DIV>
	</DIV>
	<SCRIPT>
	
	$(function () {
        var cur = "${cur}";
        $('.lis li').removeClass('active');
        $('#' + cur).addClass('active');
        $('#' + cur).parent().show().prev().addClass('active');
        var lislen = $('.lis').length;
        for (var j = 0; j < lislen; j++) {
            if ($('.lis').eq(j).css('display') == 'block') {
                $('.lis').eq(j).find('a').addClass('text_name');
            } else {
                $('.lis').eq(j).find('a').removeClass('text_name');
            }
            ;
        }
        ;
        var text_name = $('.sidebar_nav .text_name');
        var lens = text_name.length;
        for (var q = 0; q < lens; q++) {
            text_name.eq(q).attr({
                y: (q + 1) * 40
            });
        }
        ;
    });
	
    $('.lis li').click(function () {
        var $_this = $(this);
        if($(this).find('.newFeatu_z').css('display')=='block'){
            jQuery.post("/web/member!hasClicked.action", {num: $(this).attr('num')}, function () {
                window.location = $_this.find('em').attr('data_href');
            })
        }else{
            window.location = $_this.find('em').attr('data_href');
        }

        circle($(this))
    })

    var webtuling = {
        //菜单滚动功能
        navScroll: function () {
            $('.sidebar_nav').height($(window).height() - 89 - 40);
            $(window).on('resize', function () {
                $('.sidebar_nav').height($(window).height() - 89 - 40);
            })
            return this;
        },
        // 知识库左边菜单的高度
        personalh: function () {
            var html_h = $('html').height() - 89;
            $('.personal_left').height(html_h);
            return this;
        },
        // personal_left 内容
        sidebar: function () {
            var i = 0;
            var w = null;
            var textname = $('.sidebar_nav .text_name');
            var len = textname.length;
            var lislen = $('.lis').length;
            $('.sidebar .sidebar_header').on('click', function () {
                $('.newFeatu_z').toggleClass('active') // 新功能标识，红点的显示隐藏
                $('.personal_left').toggleClass('mini');
                $('.personal_right').toggleClass('mini');
                w = $('.personal_left').width();
            });
            //获取 top的值
            for (var j = 0; j < lislen; j++) {
                if ($('.lis').eq(j).css('display') == 'block') {
                    $('.lis').eq(j).find('a').addClass('text_name');
                } else {
                    $('.lis').eq(j).find('a').removeClass('text_name');
                }
                ;
            }
            ;

            $('.sidebar_nav .uls_header .right').on('click', function () {
                return false;
            });
            // 重新获取top的值
            // 以下是菜单互不影响的实现
            $('.sidebar_nav .uls_header').on('click', function () {


                if ($(this).next().css('display') == 'block') {
                    $(this).removeClass('active');
                    $(this).next().slideUp();
                    $('.uls').find('a').addClass('text_name');
                    $(this).next().find('a').removeClass('text_name');
                } else {
                    $(this).addClass('active');
                    $(this).next().slideDown();
                    $('.uls').find('a').removeClass('text_name');
                    $(this).next().find('a').addClass('text_name');
                }
                var text_name = $('.sidebar_nav .text_name');
                var lens = text_name.length;

                move_text(text_name);
            });

            function move_text(textname) {
                textname.on('mouseover', function () {
                    if (w == 55) {
                        var name = $(this).attr('text_name');
                        var y = $(this).attr('y');
                        $('.move_text .text').html(name);
                        $('.move_text').css({
                            'right': '-125px',
                            'top': $(this).offset().top - 85 + 'px',
                            display: 'block'
                        });
                    } else {
                        return false;
                    }
                    ;
                });
                textname.on('mouseout', function () {
                    if (w == 55) {
                        $('.move_text').hide();
                        $('.move_text .text').html(' ');
                    } else {
                        return false;
                    }
                    ;
                });
            }

            move_text(textname);
            return this;
        },
        // 三级导航
        bins: function () {
            // bins 弹出框
            var binslen = $('.bins').children().not('.bg').length;
            var m = 0;
            var n = 0;
            var objw = [];
            var objh = [];
            for (n; n < binslen; n++) {
                m++;
                objw[n] = $('.bins_content' + m).width();
                objh[n] = $('.bins_content' + m).height();
                $('.bins_content' + m).css({
                    'marginLeft': -objw[n] / 2,
                    'marginTop': -objh[n] / 2
                });
            }
            ;
            // bins 弹出框
            var i = 1;
            var j = 0;
            var binslen = $('.bins_btn').length;
            for (i; i <= binslen; i++) {
                $('.bins_btn' + i).attr('index', i);
                $('.bins_btn' + i).click(function () {
                    j = $(this).attr('index');
                    $('.bins').show();
                    $('.bins_content' + j).show().siblings().hide();
                    $('.bins .bg').show();
                });
                $('.bins .btn-default').on('click', function () {
                    $('.bins').hide();
                    $('.bins_content' + j).show().siblings().hide();
                    $('.bins .bg').hide();
                });
            }
            ;
            return this;
        }
    }

    webtuling.navScroll().personalh().sidebar().bins();
    //左侧导航高度自适应
    $(window).on('<%=contextPath %>ize', function () {
        var h = $(window).height() - 89;
        $('.personal_left').height(h);
    })

</SCRIPT>