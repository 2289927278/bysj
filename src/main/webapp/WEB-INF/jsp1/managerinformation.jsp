<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
$(function() {
var path = "../manager/getManager";
$.post(path, function(date) {
	var name = date.m_name;
	
	$("#name").val(name);
	var password = date.m_password;
	$("#password").val(password);
	 var passwords = date.m_password;
	$("#passwords").val(passwords); 
	var mail = date.m_mail;
	$("#mail").val(mail);
}, "json");

$(".btn").click(function() {
	var code1 = /^[A-Za-z0-9\u4e00-\u9fa5]{2,8}$/;
	if (!code1.test($("#name").val())) {
		alert("用户名为2-8个字符");
		return false;
	}

	var code2 = /^[A-Za-z0-9]{5,10}$/;
	if (!code2.test($("#password").val())) {
		alert("密码为5-10个非汉字组成");
		return false;
	}
	var pas1 = $("#password").val();
	var pas2 = $("#passwords").val();
	if (pas1 != (pas2)) {
		alert("两次密码必须一致");
		return false;
	}
	return confirm("你确定要修改信息吗");
	$("form").submit();
});
});


</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">表单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>个人信息</span></div>
    <form action="../manager/updateManager">
    <ul class="forminfo">
    <li><label>姓名</label><input name="name" type="text" class="dfinput"  id="name"/><i></i></li>
    <li><label>密码</label><input name="password" type="password" class="dfinput" id="password" /><i></i></li>
     <li><label>确认密码</label><input name="passwords" type="password" class="dfinput" id="passwords" /><i></i></li>
    <li><label>邮箱</label><input name="mail" type="text" class="dfinput" id="mail" /><i></i></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
    </ul>
    </form>
    
    </div>


</body>

</html>
