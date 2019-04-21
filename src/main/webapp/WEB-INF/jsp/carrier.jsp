<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>承运商申请</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/them.css"/>
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
#tu{
position:absolute;
  height:100px;
  width:100px;
  margin-left: 246px;
  margin-top: -70px;
}
#fileupload{
 position: absolute;
 margin-left: 310px;
 margin-top: -460px;
}
#buinesserpersonal{
 position: absolute;
 margin-top: 130px;
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
	 
	   $(".get_submit").click(function(){		 
			  var b_phone=$("#b_phone").val();
				  if(b_phone==""){
				   alert("请输入正确的手机号");
					  return false;
				  }	else{
					  alert("验证码已发送,请查收");
				  }  				 
			   var path="../Person/setmail";
			   $.post(path,{"phone":b_phone},function(data){
				   number=data;	
				  
			   },"json");
		   });
	     
	   $(".b_submit").click(function(){
		  var code1=/^[A-Za-z0-9\u4e00-\u9fa5]{2,8}$/;
		  if(!code1.test($("#b_name").val())){
			  alert("用户名为2-8个字符");
			  return false;
		  }
		  
		  var code2=/^[A-Za-z0-9]{5,8}$/;
		  if(!code2.test($("#b_password").val())){
			  alert("密码为5-8个非汉字组成");
			  return false;
		  }
		  
		  var code4=/^1[3|4|5|8][0-9]\d{4,8}$/;
		  if(!code4.test($("#b_phone").val())){
			  alert("请输入正确格式的手机号");
			  return false;
		  }
		 
		  var code3=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;  
		  if(!code3.test($("#b_mail").val())){
			  alert("邮箱不能为空");
			  return false;
		  }
		  var value=$("#mailcode").val();
		  if(value!=number){
			  alert("验证码不正确");
			  return false;
		  }
		  
		  //公司申请表单验证
		 
		  if($("#b_companyname").val()==""){
			  alert("公司名不能为空");
			  return false;
		  }
		  
		  if($("#b_shorter").val()==""){
			  alert("公司简介不能为空");
			  return false;
		  }
		 
		  if($("#b_address").val()==""){
			  alert("办公地址不能为空");
			  return false;
		  }
		 /*  var code5=/^[1-9]\d{5}(?!\d)$/;	 */
		  if($("#b_postalcode").val()==""){
			  alert("请输入正确的邮政编码");
			  return false;
		  }
		  var code6=/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/;
		  if(!code6.test($("#b_companyphone").val())){
			  alert("输入正确的电话号码");
			  return false;
		  }
		 
		  if($("#b_fax").val()==""){
			  alert("请输入正确的传真");
			  return false;
		  }
		 
		  if($("#b_representative").val()==""){
			  alert("请输入公司法定代表人");
			  return false;
		  }
		
		  if($("#b_tax").val()==""){
			  alert("请输入税务登记号");
			  return false;
		  }
		  	  
		  else{
			  alert("信息提交成功,管理员审核中");
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
<div class="main">
	<div class="main_top">
    	<img src="../images/pic1.jpg" alt=""/>
    </div>
    <div class="space_hx">&nbsp;</div>

    <div class="chengyun clearfix">
    	<!--个人信息-->
     <form action="../businesser/addbusinesser" method="post">  
        <div class="cy_left">
          
        	<div class="cy_head">
            	<span>个人信息</span>
            </div>                
                  
            <ul class="cy_body" id="buinesserpersonal">
                <li>
                
                	<span>
                        <i>&nbsp;</i>
                        <em>姓名</em>
                    </span>	
                    <input name="b_name" type="text" id="b_name">
                   
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>登录密码</em>
                    </span>	
                    <input name="b_password" type="password" id="b_password">
                </li>
                
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>固定电话</em>
                    </span>	
                    <input name="b_telephone" type="text" id=" b_telephone">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>邮箱</em>
                    </span>	
                    <input name="b_mail" type="text" id="b_mail">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>手机号码</em>
                    </span>	
                    <input name="b_phone" type="text" id="b_phone">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>手机验证码</em>
                    </span>	
                    <input name="b_mail" type="text" id="mailcode">
                </li>
                 <li>
                <span>
                     <em>    </em>
                 </span>
                 <input type="button" value="获取验证码" class="get_submit">          	               	
                </li>
                                             
            </ul>
           
         
        </div>
        <!--个人信息-->
    	<!--公司信息-->
        <div class="cy_right">
        	<div class="cy_head">
            	<span>公司信息</span>
            </div>
            <ul class="cy_body">
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司名称</em>
                    </span>	
                    <input name="b_companyname" placeholder="公司名称必须与营业执照完全相同" type="text" id="b_companyname">
                    <p></p>
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司简称</em>
                    </span>	
                    <input name="b_shorter" type="text" id="b_shorter">
                   
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>办公地址</em>
                    </span>	
                    <input name="b_address" type="text" id="b_address">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>邮政编码</em>
                    </span>	
                    <input name="b_postalcode" type="text" id="b_postalcode">
                </li>
               
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司电话</em>
                    </span>	
                    <input name="b_companyphone" type="text" id="b_companyphone">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>公司传真</em>
                    </span>	
                    <input name="b_fax" type="text" id="b_fax">
                </li>
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>法定代表人</em>
                    </span>	
                    <input name="b_representative" type="text" id="b_representative">
                </li>             
               
                <li>
                	<span>
                        <i>&nbsp;</i>
                        <em>税务登记号</em>
                    </span>	
                    <input name="b_tax" type="text" id="b_tax">                 
                </li>
                
                <li>
                	<span>
                        <em>公司介绍</em>
                    </span>	
                    <textarea name="b_introduce" cols="" rows="" id="b_introduce">介绍一下公司的情况！</textarea>
                </li>
               
                <li>
                <span>
                        <em>    </em>
                    </span>
                	<!-- <a href="" class="submit">提交</a> -->
                	<input type="submit" value="提交" class="b_submit">
                	
                </li>
            </ul>
           
        </div>
        <!--公司信息-->
       </form>
    </div>
    <div class="space_hx">&nbsp;</div>
</div>
<!--中间部分-->
<div class="space_hx">&nbsp;</div>
    <div id="fileupload">
    
     
        <form  action="../businesser/File" method="post" enctype="multipart/form-data"> 		      		    	       
		       <input type="file" name="head" /><br />
		      <input type="submit" value="提交"  id="d"/>
		  </form> 
		  <img alt="上传图像" src="${fileUrl}" id="tu"/>  
    </div>
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
