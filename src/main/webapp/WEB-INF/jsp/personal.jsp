<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人资料</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/them.css"/>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/select.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<link href="../css/layer.css" rel="stylesheet"  type="text/css" id="layui_layer_skinlayercss" />
<script src="../js/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
<style type="text/css">
    label{
	
	padding-top:4px;
   padding-left:7px;
   padding-right:7px;
	padding-bottom:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	font-size: 1.20em;
	}
   
		#layertab{
			 display:none; 
			 height:200px;
			 width:650px ; 
			} 
			.bgc{
			background-color: #EEEEEE;
			}

</style>

<script type="text/javascript">
$(function(){
	$(".p").click(function(){
		return confirm("你确定注销吗");
			
		});
	
	
	$("#left_menu li ul").css("display","none");
	$("#left_menu li:first ul").css("display","block");
	$("#left_menu li .yiji").click(function(){
		$(this).parents("li").find(".erji").css("display","block");
		$(this).parent("li").siblings("li").find(".erji").css("display","none");
	});
	
	$("#mydeal").click(function(){
		var path="../html/personaldeal.html";
		$.post(path,function(date){
			$(".rightinfo").html(date);
		});
	});
	
	var path="../html/personal.html";
	$.post(path,function(date){
		$(".rightinfo").html(date);
	});
	
	$("#personalinfor").click(function(){
		var path="../html/personal.html";
		$.post(path,function(date){
			$(".rightinfo").html(date);
		});
	});
     
	$("#myevaluate").click(function(){
		var path="../html/myevaluate.html";
		$.post(path,function(date){
			$(".rightinfo").html(date);
		});
	});
	
	$("#myinfor").click(function(){
		var path="../html/myinfor.html";
		$.post(path,function(date){
			$(".rightinfo").html(date);
		});
	});
	
	$("#myadvise").click(function(){
		var path="../html/myadvise.html";
		$.post(path,function(date){
			$(".rightinfo").html(date);
		});
	});

});


</script>
</head>

<body>
<!--头部-->
<div class="head_bg">
	<div class="head clearfix">
    	<div class="logo"><a href=""><img src="../images/logo.png" alt=""/></a></div>
        <div class="menu">
        	<div class="head_top">
            	<c:if test="${falg==0}">
        		<a href="../Person/userLogin">用户登录</a>
        		<a href="../Person/register">用户注册</a>
        		<a href="../businesser/login">承运商登录</a>
        		<a href="../manager/">管理员登录</a> 
        		</c:if>
        		<c:if test="${falg==1}">
        		<label>${person.p_name}:您好</label><a class="p" href="../CommCon/back">注销</a>
        		</c:if>
            </div>
            <ul class="clearfix">
            	<li ><a href="../CommCon/backindex">首页</a></li>
                <li><a href="../CommCon/backbusinesser">物流介绍</a></li>
                <li class="now"><a href="../CommCon/backpersonal">个人设置</a></li>
                <li><a href="../CommCon/backmapperson">网站地图</a></li>
                <li><a href="../CommCon/backnews">帮助</a></li>
                <li><a href="../CommCon/backabout">关于找物流</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<!--订单中心-->
    <div class="person clearfix">
    	<div class="order_l person_l">
        	<ul id="left_menu" class="left_menu">
            	<li>
                	<a class="yiji"><span>个人中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li id="personalinfor">
                        	<i>&nbsp;</i>
                            <strong><a >个人资料</a></strong>
                        </li>                    
                    </ul>
                </li>
                <li>
                	<a class="yiji"><span>订单中心</span><em>&nbsp;</em></a>
                    <ul class="erji">
                    	<li id="mydeal">
                        	<i>&nbsp;</i>
                            <strong><a >我的订单</a></strong>
                        </li>
                         <li id="myevaluate">
                        	<i>&nbsp;</i>
                            <strong><a >我的评价</a></strong>
                        </li>
                        <li id="myinfor">
                        	<i>&nbsp;</i>
                            <strong><a >我的消息</a></strong>
                        </li>
                         <li id="myadvise">
                        	<i>&nbsp;</i>
                            <strong><a >投诉</a></strong>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="person_r">
        	<div class="person_h">
            	<span>个人资料设置</span>
            </div>
            <div class="person_rmain">
					<div class="rightinfo">
					  
					</div>

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
