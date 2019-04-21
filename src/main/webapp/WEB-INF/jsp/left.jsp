<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>菜单选项</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="../img/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        
        <li>
            <div class="header">
            <cite></cite>
            <a href="../CommCon/index" target="rightFrame">管理首页</a>
            <i></i>
            </div>
        </li>
        
        <li ><div class="header"><cite></cite><a href="http://kefu.easemob.com/mo/agent/webapp/sessions/chat" target="rightFrame">客服服务</a><i></i> </div> </li>             
      <%--   <li ><div class="header"><cite></cite><a href="../CommCon/service" target="rightFrame">客服服务</a><i></i> </div> </li>   --%>           
        <li><div class="header"><cite></cite><a href="../CommCon/tab" target="rightFrame">发布消息</a><i></i> </div> </li>
        <li><div class="header"><cite></cite><a href="../CommCon/project" target="rightFrame">承运商信息</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="../CommCon/search" target="rightFrame">用户信息</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="../CommCon/form" target="rightFrame">个人信息</a><i></i> </div> </li>
        <li><div class="header"><cite></cite><a href="../CommCon/advise" target="rightFrame">投诉消息</a><i></i> </div> </li>
        
        </ul>    
    </dd>
        
    
   <%--  <dd>
    <div class="title">
    <span><img src="../img/leftico02.png" /></span>其他设置
    </div>
    <ul class="menuson">
       
        <li><div class="header"><cite></cite><a href="../CommCon/project" target="rightFrame">承运商信息</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="../CommCon/search" target="rightFrame">用户信息</a><i></i> </div></li>
      
        </ul>     
    </dd>  --%>
    
    
   <%--  <dd><div class="title"><span><img src="../img/leftico03.png" /></span>编辑器</div>
    <ul class="menuson">
        <li><div class="header"><cite></cite><a href="#">自定义</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="#">常用资料</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="#">信息列表</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="#">其他</a><i></i> </div></li>
    </ul>    
    </dd>   --%>
    
    
    <%-- <dd><div class="title"><span><img src="../img/leftico04.png" /></span>日期管理</div>
    <ul class="menuson">
        <li><div class="header"><cite></cite><a href="#">自定义</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="#">常用资料</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="#">信息列表</a><i></i> </div></li>
        <li><div class="header"><cite></cite><a href="#">其他</a><i></i> </div></li>
    </ul>
    
    </dd>    --%>
    
    </dl>
    
</body>
</html>
