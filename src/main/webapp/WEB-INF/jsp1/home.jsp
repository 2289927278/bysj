<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>合肥市民政业务管理平台 </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="../css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/ace.min.css">
		<link rel="stylesheet" href="../css/ace-rtl.min.css">
		<link rel="stylesheet" href="../css/style.css">
		<script src="../js/ace-extra.min.js"></script>
		<script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
	
		<script src="../js/ace.min.js"></script>
		<script src="../js/layer.js" type="text/javascript"></script>
		<link rel="stylesheet" href="../css/layer.css" id="layui_layer_skinlayercss">
		
		<link rel="stylesheet" href="../css/home.css" />

		<script type="text/javascript">
		 
			$(function(){
				$("[name='checkbox']").attr("checked", "false");
				document.all("iframe").width=iframe.document.body.scrollWidth;
				$('.qx').css("display","none");
				if("${id}"=="11"){
					$('#Sort_link_0 li a').html("信息报送（局属单位用户）");
					$('#Sort_link_0 li a').attr("title","信息报送（局属单位用户）");
					$('#Sort_link_0 li a').attr("name","");//跳转页面
					$("#ggfb").hide();
					$('.fx').css("display","none");
					$('.fx').css("display","none");
					$('.fc').css("display","none");
				}else if("${id}"=="12"){
					$("#ggfb").hide();
					$('.qx').css("display","block");
					$('.fx').css("display","none");
					$('.fc').css("display","none");
					$('.xx').css("display","none");
				}else if("${id}"=="13"){
					 $('#Sort_link_4').append('<li id="ggfb" class="home" style="height: 46px;"><a href="javascript:void(0)" name="../tzgg/publisher" title="公告发布" class="iframeurl"><i class="icon-double-angle-right"></i>公告发布</a></li>');
					$('.fc').css("display","none");
				}else if("${id}"=="14"){
					
					$('.xx').css("display","none");
					$('.fx').css("display","none");
				}
				var cid = $('#nav_list> li>.submenu');
				cid.each(function(i) {
					$(this).attr('id', "Sort_link_" + i);

				});
			});
			jQuery(document).ready(function() {
				$.each($(".submenu"), function() {
					var $aobjs = $(this).children("li");
					var rowCount = $aobjs.size();
					var divHeigth = $(this).height();
					$aobjs.height(divHeigth / rowCount);
				});
				//初始化宽度、高度

				$("#main-container").height($(window).height() - 76);
				$("#iframe").height($(window).height() - 140);

				$(".sidebar").height($(window).height() - 99);
				var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
				$(".submenu").height();
				$("#nav_list").children(".submenu").css("height", thisHeight);

				//当文档窗口发生改变时 触发  
				$(window).resize(function() {
					$("#main-container").height($(window).height() - 76);
					$("#iframe").height($(window).height() - 140);
					$(".sidebar").height($(window).height() - 99);

					var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
					$(".submenu").height();
					$("#nav_list").children(".submenu").css("height", thisHeight);
				});
				$(document).on('click', '.iframeurl', function() {
					var cid = $(this).attr("name");
					var cname = $(this).attr("title");
					$("#iframe").attr("src", cid).ready();
					$("#Bcrumbs").attr("href", cid).ready();
					$(".Current_page a").attr('href', cid).ready();
					$(".Current_page").attr('name', cid);
					$(".Current_page").html(cname).css({
						"color": "#333333",
						"cursor": "default"
					}).ready();
					$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
					$("#parentIfour").html('').css("display", "none").ready();
				});

				//切换窄屏
				$('.ace-checkbox-2').click(function(){
					
					if ($(".ace-checkbox-2").is(":checked")){
						$('#iframe').css("width","950px");
					}else{
						$('#iframe').css("width","1240px");
					}
					
				});
				$('.black-btn').click(function(){
					$('.navbar').css("background","#222A2D");
					$('.black-btn').addClass("selected");
					$('.sky-btn').removeClass("selected");
				});
				$('.sky-btn').click(function(){
					$('.navbar').css("background","#438EB9");
					$('.sky-btn').addClass("selected");
					$('.black-btn').removeClass("selected");
					
				});
				/******/
				$(document).on('click', '.link_cz > li', function() {
					$('.link_cz > li').removeClass('active');
					$(this).addClass('active');
				});

				/*********************点击事件*********************/
				$(document).ready(function() {
					$('#nav_list,.link_cz').find('li.home').on('click', function() {
						$('#nav_list,.link_cz').find('li.home').removeClass('active');
						$(this).addClass('active');
					});
					
					//修改密码
					$('.change_Password').on('click', function() {
						
						layer.open({
							type: 1,
							title: '修改密码',
							area: ['300px', '300px'],
							shadeClose: true,
							content: $('#change_Pass'),
							btn: ['确认修改'],
							yes: function(index, layero) {
								var password=$("#password").val();
								var Nes_pas=$("#Nes_pas").val();
								if ($("#password").val() == "") {
									layer.alert('原密码不能为空!', {
										title: '提示框',
										icon: 0,

									});
									return false;
								}
								if ($("#Nes_pas").val() == "") {
									layer.alert('新密码不能为空!', {
										title: '提示框',
										icon: 0,

									});
									return false;
								}

								if ($("#c_mew_pas").val() == "") {
									layer.alert('确认新密码不能为空!', {
										title: '提示框',
										icon: 0,

									});
									return false;
								}
								if ($("#c_mew_pas").val().length>10) {
									layer.alert('密码长度不能大于10!', {
										title: '提示框',
										icon: 0,

									});
									return false;
								}
								if (!$("#c_mew_pas").val() || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
									layer.alert('密码不一致!', {
										title: '提示框',
										icon: 0,

									});
									return false;
								} else {
									$.post("/HfmzSys/user/updatePass",{"password1":password,"Nes_pas1":Nes_pas},function(data){
										 
										if(data.flag==1){
											 layer.alert('原密码错误！', {
													title: '提示框',
													icon: 0,
											});
											 return false;
										 }else if(data.flag==2){
											 layer.alert('修改成功！请重新登录', {
													title: '提示框',
													icon: 1,
											},function(){
												window.location = "login";
											});
											
											 layer.close(index);
											 
										 } 
										
									});
								}
							}
						});
						
					});
					$('#Exit_system').on('click', function() {
						layer.confirm('是否确定退出系统？', {
								btn: ['是', '否'], //按钮
								icon: 2,
							},
							function() {
								location.href = "login";

							});
					});

					function link_operating(name, title) {
						var cid = $(this).name;
						var cname = $(this).title;
						$("#iframe").attr("src", cid).ready();
						$("#Bcrumbs").attr("href", cid).ready();
						$(".Current_page a").attr('href', cid).ready();
						$(".Current_page").attr('name', cid);
						$(".Current_page").html(cname).css({
							"color": "#333333",
							"cursor": "default"
						}).ready();
						$("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
						$("#parentIfour").html('').css("display", "none").ready();

					}
				});
			});
		</script>
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try {
					ace.settings.check('navbar', 'fixed')
				} catch (e) {}
			</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					 <a href="#" class="navbar-brand"> 
						<small>					
						<img src="../img/logo.png" width="500px" style="display: inline-block;margin-top: 8px;" />
						<h1 style="display: block;margin-top: -50px;margin-left: 160px;font-family: "Microsoft Yahei",Tahoma,Arial,sans-serif;font-weight: bold;">合肥市民政业务管理平台</h1>
						</small>
					</a> 
					<!-- /.brand -->
				</div>
				<!-- /.navbar-header -->
				<div class="navbar-header operating pull-left">

				</div>
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="" class="dropdown-toggle">
								<span class="user-info"><small>合肥市民政局，您好！</small>用户：${name}</span>
								<i class="icon-caret-down"></i>
							</a>
							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li><a href="javascript:void(0" name="" title="修改密码" class="iframeurl change_Password"><i class="icon-cog"></i>修改密码</a></li>
								<li class="divider"></li>
								<li><a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
							</ul>
						</li>

					</ul>
				</div>
			</div>
		</div>
		<div class="main-container" id="main-container" style="height: 778px;">
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar" style="height: 755px;">
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<span style="color: #000000;">上次登录时间<br/>${lastLoginTime }</span>
						</div>

					</div>
					<div id="menu_style" class="menu_style" tabindex="5000" style="overflow: hidden; outline: none;">
						<ul class="nav nav-list" id="nav_list" style="height: 681px;">
							<li class=""><a href="" class="dropdown-toggle"><i class="icon-home"></i><span class="menu-text">通知公告管理 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu" id="Sort_link_4" style="display: none;">
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../tzgg/query" title="公告查询" class="iframeurl"><i class="icon-double-angle-right"></i>公告查询</a></li>
									
								</ul>
							</li>
							<li class="xx"><a href="" class="dropdown-toggle"><i class="icon-desktop"></i><span class="menu-text"> 信息报送 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu" id="Sort_link_0" style="display: none;">
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../dy/fxXBS" title="信息报送" class="iframeurl"><i class="icon-double-angle-right"></i>信息报送（法宣办）</a></li>
								<!-- 	<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="" title="信息报送" class="iframeurl"><i class="icon-double-angle-right"></i>信息报送（局属单位用户）</a></li>
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="" title="信息报送" class="iframeurl"><i class="icon-double-angle-right"></i>信息报送（区/县用户）</a></li>
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="" title="信息报送" class="iframeurl"><i class="icon-double-angle-right"></i>信息报送（福慈处用户）</a></li> -->
								</ul>
							</li>
							<li class="qx"><a href="" class="dropdown-toggle"><i class="icon-desktop"></i><span class="menu-text"> 信息报送 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu" id="Sort_link_0" style="display: none;">
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../qx_chaxunAll" title="信息报送（养老机构）" class="iframeurl"><i class="icon-double-angle-right"></i>信息报送（养老机构）</a></li>
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../qx_sschaxunAll" title="信息报送（社区养老服务设施）" class="iframeurl"><i class="icon-double-angle-right"></i>信息报送（社区养老服务设施）</a></li>
								</ul>
							</li>
							<li class="fx">
								<a href="" class="dropdown-toggle"><i class="icon-picture "></i><span class="menu-text">统计报表</span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu" id="Sort_link_1">
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../fxbcontroller/gaofei" title="稿费统计表" class="iframeurl"><i class="icon-double-angle-right"></i>稿费统计表</a></li>
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../fxbcontroller/caiyong" title="稿件采用明细报表" class="iframeurl"><i class="icon-double-angle-right"></i>稿件采用明细报表</a></li>
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../fxbcontroller/yearmessage" title="机关处室年度投稿统计表" class="iframeurl"><i class="icon-double-angle-right"></i>机关处室年度投稿统计表</a></li>
								</ul>
							</li>
							<li class="fc">
								<a href="" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 数据维护 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu" id="Sort_link_2" style="display: none;">
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../TMzywFccYljgxx/index2" title="养老机构维护" class="iframeurl"><i class="icon-double-angle-right"></i>养老机构维护（福慈处用户）</a></li>
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../TMzywFccSqylfwss/index1" title="社区养老服务设施" class="iframeurl"><i class="icon-double-angle-right"></i>社区养老服务设施</a></li>
								</ul>
							</li>
							<li class="fx">
								<a href="" class="dropdown-toggle"><i class="icon-credit-card"></i><span class="menu-text"> 参数配置 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu" id="Sort_link_3">
									<li class="home" style="height: 46px;"><a href="javascript:void(0)" name="../html/js.html" title="基数配置" class="iframeurl"><i class="icon-double-angle-right"></i>基数配置</a></li>
								</ul>
							</li>

						</ul>
					</div>
					
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
					<script type="text/javascript">
						try {
							ace.settings.check('sidebar', 'collapsed')
						} catch (e) {}
					</script>
				</div>

				<div class="main-content">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {}
					</script>
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="sucess">当前位置：首页</a>
							</li>
							<li class="active"><span class="Current_page iframeurl" name="user_list.html" style="color: rgb(51, 51, 51); cursor: default;">公告查询</span></li>
							<li class="active" id="parentIframe" style="display: none;"><span class="parentIframe iframeurl"> </span></li>
							<li class="active" id="parentIfour" style="display: none;"></li>
						</ul>
					</div>

					<iframe id="iframe" style="border: 0px; width: 1240px; background-color: rgb(255, 255, 255); height: 714px;" name="iframe" frameborder="0" src="../tzgg/query" > </iframe>

				</div>
 				<div class="ace-settings-container" id="ace-settings-container"> 
 				<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                          <i class="icon-cog bigger-150"></i>
                      </div> 
                       <div class="ace-settings-box" id="ace-settings-box">
                       <div>
                              <div class="pull-left">
                                  <select id="skin-colorpicker" class="hide" style="display: none;">
                                      <option data-skin="default" value="#438EB9">#438EB9</option>
                                      <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                  </select>
                                  <div class="dropdown dropdown-colorpicker">
                                  <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                  <span class="btn-colorpicker" style="background-color:#438EB9;">
                                  </span>
                      
                                  </a>
                                  <ul class="dropdown-menu dropdown-caret">
                                  <li><a class="colorpick-btn selected sky-btn" href="#" style="background-color:#438EB9;" data-color="#438EB9"></a>
                                  </li>
                                  <li><a class="colorpick-btn black-btn" href="#" style="background-color:#222A2D;" data-color="#222A2D"></a>
                                  </li>
                                  </ul></div>
                              </div>
                              <span>&nbsp; 选择皮肤</span>
                          </div>
 					<div>
                      <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container">
                      <label class="lbl" for="ace-settings-add-container">切换窄屏
                              <b></b>
                      </label>
                     </div>
                 </div>
				</div>
			</div>

		</div>
		<!--底部样式-->

		<div class="footer_style" id="footerstyle">
			<script type="text/javascript">
				try {
					ace.settings.check('footerstyle', 'fixed')
				} catch (e) {}
			</script>
			<p class="l_f" style="margin-left: 700px;">版权所有：科大讯飞</p>
		</div>
		<!--修改密码样式-->
		<div class="change_Pass_style" id="change_Pass">
			<ul class="xg_style">
				<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class="" id="password"></li>
				<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class="" id="Nes_pas"></li>
				<li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>
			</ul>
		</div>
		<!-- /.main-container -->
		<!-- basic scripts -->

	</body>

</html>