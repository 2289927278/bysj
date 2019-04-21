<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/thems.css"/>
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">

	

	#d1{
		height: 400px;
		width: 930px;
		padding-top:100px;								
		
		background: url(../img/loginbeij.jpg);
		background-position: 10% 50%; 
	
	}

	
	
	
</style>
<script type="text/javascript">

	


   $(function(){
	  
		$("#personal").click(function(){
			var f=${falg};
			if(f==0){
			  alert("亲，请先登录");	
			  return false;
			}else{
				return true;
			}
		});
	   
	   
	   var number;
	   $("#hqyzm").click(function(){
	
			  var phone=$("#phone").val();
			  var p="../Person/getListPerson";
			   $.post(p,function(date){
				   for(var i=0;i<date.length;i++){
					   var m=date[i].p_phone;
					   if(m==phone){
						   alert("该账号已经被注册过啦");
						   return false;
					   }
				   }				   
				   if(phone==""){
					   alert("请输入正确的手机号");
						  return false;
					  }	else{
						  alert("验证码已发送,请查收");
					  }  				 
				   var path="../Person/setmail";
				   $.post(path,{"phone":phone},function(data){
					   number=data;				  
				   },"json");
			   },"json")
	
		   });
	     
	   $("#reg").click(function(){
 
		  var code1=/^[A-Za-z0-9\u4e00-\u9fa5]{2,8}$/;
		  if(!code1.test($("#username").val())){
			  alert("用户名为2-8个字符");
			  return false;
		  }
		  
		  var code2=/^[A-Za-z0-9]{5,10}$/;
		  if(!code2.test($("#userpassword").val())){
			  alert("密码为5-10个非汉字组成");
			  return false;
		  }
		  var pas1=$("#userpassword").val();
		  var pas2=$("#userpasswords").val();
		  if(pas1!=(pas2)){
			  alert("两次密码必须一致");
			  return false;
		  }
          var ma=$("#mails").val();
		  if(ma==""){
			  alert("邮箱不能为空");
			  return false;
		  }
		  var value=$("#mailcode").val();
		  if(value!=number){
			  alert("验证码不正确");
			  return false;
		  }
		  else{
			  alert("注册成功");
		  }
		  
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

<div class="main clearfix">
 
    <div class="login_reg clearfix">
    	<!--邮箱注册-->
    	<div id="d1">
        <div class="reg">
       
        	<div class="lore_top">
            	<span>
                	<em>用户注册</em>
                </span>
            </div>
        	<form action="../Person/registers" method="post">
        	<ul>
        		<li>
                	<span>用户名：</span>
                    <input name="name" type="text" placeholder="2-8个字符" id="username">
                </li>  
                         	
                <li>
                	<span>密码：</span>
                    <input name="password" type="password" placeholder="5-10个字符" id="userpassword">
                </li>
                <li>
                	<span>确认密码：</span>
                    <input name="passwords" type="password" placeholder="和密码一致" id="userpasswords">
                </li>
                <li>
                	<span>电子邮箱：</span>
                    <input name="mail" type="text" placeholder="请输入常用邮箱，用于用户登录" id="mails">
                </li>
                 <li>
                	<span>手机号：</span>
                    <input name="phone" type="text" placeholder="请正确填写手机号" id="phone">
                </li> 
                <li>
                	<span>验证码：</span>
                    <input name="yzm" type="text" placeholder="" value="" id="mailcode">
                    <font class="yzm"  id="hqyzm">获取验证码</font>
                </li>
               
                <li class="tijiao">
                	 <input type="submit" value="注册" class="submit" id="reg"/>
                </li>
                
                
            </ul>
            </form>
        </div>
        <!--邮箱注册-->
    	 </div>
    </div>
    <div class="space_hx">&nbsp;</div>
   
    <!--  <div class="f_main clearfix">
    	  <img alt="../img/beij" src="../img/zc.png" id="img11">	  
    </div> -->
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
