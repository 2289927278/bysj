<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>货物追踪</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/them.css"/>
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	
	label{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	font-size:1.2em;
	}
	.follow_main{
	height:350px;
	overflow: scroll;
	}
	
	
</style>
<script type="text/javascript">
$(function(){
	 $("#em").css("font-size","1.06em");
	$(".p").click(function(){
		return confirm("你确定注销吗");
			
		});
	
$("#personal").click(function(){
	var f=${falg};
	if(f==0){
	  alert("亲，请先登录");	
	  return false;
	}else{
		return true;
	}
});
 $("#followbutton").click(function(){
	 var val=$("#numb").val();
	 if(val==""){
		 alert("请输入订单编号");
		 return false;
	 }
	 path="../inquiry/getI_number";
	 $.post(path,{"i_number":val},function(date){
		 if(date==""){
			 alert("该订单号暂时没有任何消息");
			 return false;
		 } else{
		 
		var s="<tr><th>订单编号 </th><th>物流配送</th><th>时间</th></tr>";
		 for(var i=0;i<date.length;i++){
			 var i_number=date[i].i_number;			
			 var i_instruction=date[i].i_instruction;
			 var i_time=date[i].i_time;
			
			s=s+"<tr><td>"+i_number+"</td><td>"+i_instruction+"</td><td>"+i_time+"</td></tr>";
		 }
		 $(".tablelist").html(s);
		  $(".tablelist").css("border","0px"); 
		  $("tr").css("border","0px"); 
		  $("td").css("border","0px"); 
		 $("td").css("padding","10px");
		 }
		
	 },"json");
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
                <li><a href="../CommCon/backpersonal" id="personal">个人设置</a></li>
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
	<div class="book">
    	<div class="tabBox_t">
            <div class="tabBox">
              <ul class="tabNav">          
                <li class="now"><em id="em">货物追踪</em><span>&nbsp;</span></li>
              </ul>
              <div class="tabCont" style="display:block;">
              	<div class="follow_m">
                	<div class="space_hx">&nbsp;</div>
                	<div class="follow_mtop">
                    	<form action="">
                        	<input name="number" type="text" placeholder="请输入订单编号" id="numb">
                            <a  id="followbutton">查询</a>
                       </form>
                    </div>
                    <div class="space_hx">&nbsp;</div>
                    <div class="follow_main">
                    	<table class="tablelist">
                    	
                    	</table>
                    </div>
                </div>	
              </div>
            </div>
        </div>
    </div>
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
