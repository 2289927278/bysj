<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>物流介绍</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/them.css"/>
<!-- <link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/select.css" rel="stylesheet" type="text/css" /> -->

 <link href="../css/layer.css" rel="stylesheet"  type="text/css" id="layui_layer_skinlayercss" /> 
 <script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>

 <script src="../js/layer.js" type="text/javascript"></script>
<style type="text/css">
body .demo-class .layui-layer-title{background:#FFCC66; color:white;}
.kd{
 width:100px;
 height:70px;
}
.tablelist td{
 padding-left:60px;
 width:200px;
 height:200px;
}
.tablelist td:hover{
background-color:#F0F0F0;
} 
	
	label{
	
	padding:5px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 4px;
	font-size: 1em;
	}
	.book{
		height: 800px;
		width: 976px;
		border: 1px solid gold;
		/*background: url(../img/qq1.png);*/
		background-position: 0% 19%;
		/* overflow:auto; */
		margin-top: 15px;
		background-color: #F0F0F0; 
		}
		#layertab{
		
		/* 	border-collapse:collapse; */
			 
			 height:200px;
			 width:650px ;
			 
			}
			
			.bgc{
			background-color: #EEEEEE;
			 float:left; 
			width:190px;
			height:30px;
		 	padding-top: 20px;
			
			/*  padding-left: 30px;
			padding-right: 30px; */ 
			
			
			}
			input{
			border-radius:9px;
			height:30px;
			
			}
			#getup{
  width:200px;
  height:30px;
  margin-bottom: 65px;
   border: 1px solid gold;
  
 }
 #usere{
 
 }
 .f{
 float:left;
 margin: 60px;
 }
 #dd1{
  float:left;
  height:300px;
  width:300px;
 
 }
 #imgbus{
 padding:30px;
   height:200px;
  width:200px;
  
 }
 #b_representative{
 width:125px;
 }
 #b_address{
 width:430px;
 }
 .pjtd td{
 padding-right:30px; 
 }
 #dd2_1{

 height:400px;
 overflow: auto;
 }
 #dd3{
 margin-left: 290px;
 margin-top: 20px;

 }
 .pjl{
  margin-top: 30px;
 }
 
	
	
</style>
<script type="text/javascript">

   $(function(){ 
		   var id=${id};	  
		   var path="../businesser/getBusinessers";
	 		$.post(path,{"id":id},function(data){		 			
	 			 var b_tuname=data.b_tuname	
	 			 $("#imgbus").attr("src",b_tuname);
	 			 var b_name=data.b_name;
	 			$("#b_name").val(b_name);
	 			 var b_phone=data.b_phone; 
	 			$("#b_phone").val(b_phone);
	 			
	 			 var b_telephone=data.b_telephone;
	 			$("#b_telephone").val(b_telephone);
				 var b_companyname=data.b_companyname;
				 $("#b_companyname").val(b_companyname);
				 var b_shorter=data.b_shorter;
				 $("#b_shorter").val(b_shorter);
				 var b_address=data.b_address;
				 $("#b_address").val(b_address);
				 var b_postalcode=data.b_postalcode;
				 $("#b_postalcode").val(b_postalcode);
				 var b_companyphone=data.b_companyphone;
				 $("#b_companyphone").val(b_companyphone);
				 var b_fax=data.b_fax;	
				 $("#b_fax").val(b_fax);
				 var b_representative=data.b_representative;
				 $("#b_representative").val(b_representative);
				 var b_tax=data.b_tax;
				 $("#b_tax").val(b_tax);
				 var b_mail=data.b_mail;
				 $("#b_mail").val(b_mail);
				 var b_introduce=data.b_introduce;
				 $("#b_introduce").val(b_introduce);
				 var b_application=data.b_application;
				 $("#b_application").val(b_application);
				 var b_reputation=data.b_reputation;
				 $("#b_reputation").val(b_reputation);
				 var b_time=data.b_time; 
				 $("#b_time").val(b_time);
	 	        $(".bgc").css("width","90px");
	 		
		   var ids=${id};
		   var paths="../evaluate/lookevaluate";
		   var str="<font>用户评价:</font><br>";
		   $.post(paths,{"id":ids},function(date){
			   for(var i=0;i<date.length;i++){
			   var e_text=date[i].e_text;
			  
			   var e_time=date[i].e_time;
			   var p_id=date[i].deal.d_p_id;
			   str=str+"<p class=pjl><font>用户id:"+p_id+";</font>"+e_time+"<br><textarea  cols=72 rows=6 class=sc readonly=readonly>"+e_text+"</textarea></p>";
			   }
			   $("#dd3").html(str);
		   },"json");
		   
	
	   });
	   
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
        		<a href="../manager/login">管理员登录</a> 
        		</c:if>
        		<c:if test="${falg==1}">
        		<label>${person.p_name}:您好</label><a class="p" href="../CommCon/back">注销</a>
        		</c:if>
            </div>
            <ul class="clearfix">
            	<li ><a href="../CommCon/backindex">首页</a></li>
                <li class="now"><a href="../CommCon/backbusinesser">物流介绍</a></li>
                <li><a href="../CommCon/backpersonal" id="personal">个人设置</a></li>
                <li><a href="../CommCon/backmapperson">网站地图</a></li>
                <li><a href="../CommCon/backnews">帮助</a></li>
                <li ><a href="../CommCon/backabout">关于找物流</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<div class="page">
     <div class="book">
     <div id="dd1">
        <img id="imgbus"/>
        
     </div>
     
     <div id="dd2">
       公司名称:<input name="b_companyname" type="text" id="b_companyname" class="scinput"  readonly="readonly"/>
       公司简称:<input name="b_shorter" type="text" id="b_shorter"class="scinput"  readonly="readonly"/>&nbsp;&nbsp;&nbsp;<label><a href="../CommCon/backbusinesser">返回</a></label>
       <p></p><br>
       公司法定代表人:<input name="b_representative" type="text" id="b_representative"class="scinput"  readonly="readonly"/>
       邮政编码:<input name="b_postalcode" type="text" id="b_postalcode"class="scinput" readonly="readonly"/><p></p><br>
       公司电话:<input name="b_companyphone" type="text" id="b_companyphone"class="scinput" readonly="readonly" />
       公司传真:<input name="b_fax" type="text" id="b_fax"class="scinput" readonly="readonly"/><p></p><br>
     
        办公地址:<input name="b_address" type="text" id="b_address"class="scinput" readonly="readonly"/><p></p><br>
  <!--      公司介绍:<input name="b_introduce" type="text" id="b_introduce"class="scinput" /><p></p>	<br> -->
       公司介绍:<br><textarea name="b_introduce" cols="70" rows="10" id="b_introduce" class="scinput" readonly="readonly">

        </textarea>	
     </div>
     <div id="dd2_1">
        <div id="dd3">
         
         
         
        </div>
        </div>
     </div>
     
     
     
        <!-- <table id="layertab" border="1px">
			<tr><td class="bgc"><span>id号:</span></td><td > <input name="b_phone" type="text" id="b_id" class="scinput"/></td>
			<td class="bgc">公司指定人姓名:</td><td ><input name="b_name" type="text" id="b_name" class="scinput" /></td>
			<td class="bgc">公司指定人手机号:</td><td ><input name="b_phone" type="text" id="b_phone" class="scinput" /></td>
			<td class="bgc">公司名称:</td><td ><input name="b_companyname" type="text" id="b_companyname" class="scinput" /></td></tr>
			
			
			<tr><td class="bgc">公司简称:</td><td ><input name="b_shorter" type="text" id="b_shorter"class="scinput" /></td>
			<td class="bgc">办公地址:</td><td ><input name="b_address" type="text" id="b_address"class="scinput" /></td>
			<td class="bgc">邮政编码:</td><td ><input name="b_postalcode" type="text" id="b_postalcode"class="scinput" /></td>
			<td class="bgc">公司电话:</td><td ><input name="b_companyphone" type="text" id="b_companyphone"class="scinput" /></td></tr>
			
			
			<tr><td class="bgc">公司传真:</td><td ><input name="b_fax" type="text" id="b_fax"class="scinput" /></td>
			<td class="bgc">公司法定代表人:</td><td ><input name="b_representative" type="text" id="b_representative"class="scinput" /></td>
			<td class="bgc">税务登记号:</td><td ><input name="b_tax" type="text" id="b_tax"class="scinput" /></td>
			<td class="bgc">公司指定人邮箱:</td><td ><input name="b_mail" type="text" id="b_mail" class="scinput" /></td></tr>
			
			<tr><td class="bgc">申请状态:</td><td ><input name="b_application" type="text" id="b_application"class="scinput" /></td>
			<td class="bgc">信誉值:</td><td ><input name="b_reputation" type="text" id="b_reputation"class="scinput" /></td>
			<td class="bgc">时间:</td><td ><input name="b_time" type="text" id="b_time"class="scinput" /></td>
			<td class="bgc">公司介绍:</td><td ><input name="b_introduce" type="text" id="b_introduce"class="scinput" /></td></tr>			
	</table> -->
	<!-- <table id="usere" border="1px">
	
	</table> -->
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
