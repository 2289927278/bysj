<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/thems.css"/>
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">

	

	#d1{
		height: 400px;
		width: 650px;
		padding-left: 280px;
		padding-top: 100px;
		border:1px soild red;
		background: url(../img/loginbeij.jpg);
	   background-position: 10% 50%; 
	
	}
	#dd{
	font-family:"华文仿宋";
        font-size : 1.2em;
         color : #f00;
	
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
});


	var code;
	$(function() {
		chan();
		$('#dd').click(function() {
			chan();
		});

		$("#usersub").click(function() {
			var value = $("#zf").val();
			var name=$("#username").val();
			var password=$("#password").val();
			/* var value  = $('input[name="radioName"]:checked').val(); */
			
			if (code.toLowerCase() == value.toLowerCase()) {								
			} else {
				alert("验证码错误");
				chan();
				return false;

			}
			
		    var path="../Person/login";
		    $.post(path,{"password":password,"name":name},function(data){
		    	if(data==null){
		    		alert("用户名或密码不正确");
		    		chan();
		    		return false;
		    	}else{
		    		
		    		window.location="../Person/back";
		    	}
		    },"json");
		});

	});
	function chan() {
		code = "";
		var sum = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd',
				'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
				'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B',
				'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		for (var i = 0; i < 4; i++) {
			code += sum[Math.floor(Math.random() * 62)];
		}
		$("#dd").html(code);
	}
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
    <div id="d1">
    	  <div class="login">
        	<div class="lore_top" style="background-color:#DDDDDD">	   
            	<span>
                	<em>用户登录</em>
                </span>
            </div>
            
            
        	
        	<ul>
            	<li>
                	<span>用户名:</span>
                    <input name="username" type="text" placeholder="请输入邮箱号" id="username">
                </li>
                <li>
                	<span>密码:</span>
                    <input name="password" type="password" placeholder="请输入密码" id="password">
                </li>
                 <li>
                	<span>验证码:</span>
                    <input name="zf" id="zf" type="text" placeholder="请填入有效字符">
                     <font class="yzm" id="dd" >获取验证码</font>
                </li>
                  
                  <!--  <span>&nbsp;您的身份:</span>
                     用户<input name="na"  type="radio" value="1" checked/>
                     承运商<input name="na"  type="radio" value="2" />
                     管理员<input name="na"  type="radio" value="3" /> </br>  -->
               
                <li class="tijiao">
                        
                	<input type="submit" name="" id="usersub" value="登录" class="submit" />
                </li>
            </ul>
              
        
                 
             </div>  
            
        </div>
    	
    </div>
   
    <!--  <div class="space_hx">&nbsp;</div> -->
   
    <!-- <div class="f_main clearfix">
    	  <img alt="../img/beij" src="../img/zc.png" id="img11">	  
    </div>  -->
</div>
<!--中间部分-->

<!--  <div class="space_hx">&nbsp;</div>-->
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
