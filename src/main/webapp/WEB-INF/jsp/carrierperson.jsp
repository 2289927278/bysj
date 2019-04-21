<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单中心</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/them.css"/>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/select.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
<style type="text/css">
#label{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	font-size: 1.34em;
	}
</style>
<script type="text/javascript">
$(function(){
	var path="../html/carrierperson.html";
	$.post(path,function(date){
		$("#divcontext").html(date);
	});	
	 $(".p").click(function(){
			return confirm("你确定注销吗");
				
			});  
	
	$("#left_menu li ul").css("display","none");
	$("#left_menu li:first ul").css("display","block");
	$("#left_menu li .yiji").click(function(){
		$(this).parents("li").find(".erji").css("display","block");
		$(this).parent("li").siblings("li").find(".erji").css("display","none");
	});
	$("#carrierperson").click(function(){
		var path="../html/carrierperson.html";
		$.post(path,function(date){
			$("#divcontext").html(date);
		});		
	});
	$("#carriers").click(function(){
		var path="../html/carriers.html";
		$.post(path,function(date){
			$("#divcontext").html(date);
		});		
	});
	$("#charge").click(function(){
		var path="../html/charge.html";
		$.post(path,function(date){
			$("#divcontext").html(date);
		});		
	});
	$("#personevalu").click(function(){
		var path="../html/personevalu.html";
		$.post(path,function(date){
			$("#divcontext").html(date);
		});		
	});
	$("#carrierinfor").click(function(){
		var path="../html/carrierinfor.html";
		$.post(path,function(date){
			$("#divcontext").html(date);
		});		
	});
	
})
</script>
</head>

<body>
<!--头部-->
<div class="head_bg">
	<div class="head clearfix">
    	<div class="logo"><a href=""><img src="../images/logo.png" alt=""/></a></div>
        <div class="menu">
        	<div class="head_top">
            	<c:if test="${falg==2}">
        		<label id="label">${businesser.b_name}:您好</label><a class="p" href="../CommCon/userMain">注销</a>
        		</c:if>
            </div>
            <ul class="clearfix">
            	<li ><a href="../CommCon/carriermain">首页</a></li>           	
            	<li class="now"><a href="../CommCon/carrierperson">个人信息</a></li> 
                <li ><a href="../CommCon/carrierdeal">业务消息</a></li>
                <li ><a href="../CommCon/carrierinquiry">物流管理</a></li>
                <li ><a href="../CommCon/carriertouser">通知用户</a></li>
                <li><a href="../CommCon/carriernews">消息发布</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<!--订单中心-->
    <div class="order clearfix">
    	<div class="order_l" >
        	<ul id="left_menu" class="left_menu"  >
            	<li >
                	<a class="yiji"><span >个人中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li id="carrierperson">
                        	<i>&nbsp;</i>
                            <strong><a>个人资料</a></strong>
                        </li>
                        <li id="carriers">
                        	<i>&nbsp;</i>
                            <strong><a >公司信息</a></strong>
                        </li>
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span>订单中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li id="charge">
                        	<i>&nbsp;</i>
                            <strong><a>收费标准</a></strong>
                        </li>
                        
                        <li id="carrierinfor">
                        	<i>&nbsp;</i>
                            <strong><a >收费记录</a></strong>
                        </li>
                        <li id="personevalu">
                        	<i>&nbsp;</i>
                            <strong><a >用户评价</a></strong>
                        </li>
                      
                       
                    </ul>
                </li>
            </ul>
        </div>
        <div class="order_r">
        	<div class="order_h">
            	<span>欢迎光临找物流</span>
            </div>
            <div id="divcontext">
            
            </div>

        </div>
    </div>
    <!--订单中心-->
    <div class="space_hx">&nbsp;</div>
</div>
<!--中间部分-->
<div class="space_hx">&nbsp;</div>
<!--底部-->
<div class="foot_bg">
	<div class="foot">
    	<div class="foot_t">
        	<a href="">业务介绍</a>
            <a href="">联系我们</a>
            <a href="">找物流有限责任公司</a>
                                      
        </div>  
    </div>	
</div>
<!--底部-->
</body>
</html>
