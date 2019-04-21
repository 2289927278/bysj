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
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
	
})	
</script>
 

</head>

<!--<body style="background:url(images/topbg.gif) repeat-x;">-->
	<body style="background-color: #FFCC66;">
<!--	<body style="background:url(img/na_bg.png) repeat-x;">-->

    <div class="topleft">
    <!--<a href="main.html" target="_parent"><img src="images/logo.png" title="系统首页" /></a>-->
    <font class="f1">在线下单后台管理</font>
    </div>
        
    <ul class="nav">
    </ul>
            
    <div class="topright">    
    <ul>
  <!--  <li><a href="login.html" target="_parent">退出</a></li>-->
    </ul>  
    <div class="user">
  <%--   <span>${manager.m_name}</span> --%>
    <i><a  id="over" href= "javascript:void(0)">退出</a></i> 
    <!-- <i><a href="../CommCon/userMain" id="over">退出</a></i>  -->
   
    </div>    
    
    </div>

</body>
</html>
