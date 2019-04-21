<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<style type="text/css">
  #managername{
    float:right;
    padding-right:30px;
  }
</style>
 <script type="text/javascript">
 Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
  $(function(){
 setInterval( "T()" ,1000);  

T();
  });
	
	 
  function T(){
   var time1 = new Date().Format("yyyy-MM-dd hh:mm:ss");
  $("#time").html(time1);

}  
 </script>

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
     <span id="managername">${manager.m_name}:您 好</span>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="../img/sun.png" alt="天气" /></span>
    <b>${manager.m_name}</b><b>欢迎使用在线下单后台管理系统</b>
    <a href="../CommCon/form">帐号设置</a>
    </div>
    
    <div class="welinfo">
    <span><img src="../img/time.png" alt="时间" /></span>
    <i>现在的时间是:</i><i id="time"></i> 
    </div>
    
    <div class="xline"></div>
    
    <ul class="iconlist">
    
    <li><img src="../img/ico01.png" /><p><a href="#">客服服务</a></p></li>
    <li><img src="../img/ico02.png" /><p><a href="#">发布消息</a></p></li>
    <li><img src="../img/ico03.png" /><p><a href="#">个人信息</a></p></li>
    <li><img src="../img/ico05.png" /><p><a href="#">用户信息</a></p></li>
    <li><img src="../img/ico05.png" /><p><a href="#">承运商信息</a></p></li>
    <li><img src="../img/ico06.png" /><p><a href="#">查询</a></p></li> 
            
    </ul>
    
   
    
    <div class="xline"></div>
    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="../img/dp.png" alt="提醒" /></span>
    <b>在线下单系统使用指南</b>
    </div>
    
    <ul class="infolist">
    <li><span>您可以快速进行承运商的审批操作</span><a class="ibtn">审批操作</a></li>
    <li><span>您可以快速发布消息</span><a class="ibtn">发布消息</a></li>
    <li><span>您可以进行密码修改、账户设置等操作</span><a class="ibtn">账户管理</a></li>
    </ul>

    </div>
    
    

</body>

</html>
