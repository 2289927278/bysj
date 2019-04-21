<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上下订单</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" type="text/css" href="../css/them.css"/>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<style type="text/css">
		 #sorcll{
				height:300px;
	         overflow: auto;
	         			 
			} 
	#booklabel{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	font-size: 1.34em;
	}
	#bookli{
	font-size: 1.15em;
	
	}
	.look1{
	
	padding:10px;
	background-color: #DCDCDC;
	color: white;
	border-radius:70px;
	}
	.look1:hover{
	background-color: #FFBB66;
	}
	
	.xiadan{
	padding-right:15px;
	}
	
		
			
		</style>
		
  <script type="text/javascript">
  $(function(){ 
	  
	   var path="../help/getcategoryabout";
	   $.post(path,{"h_category":"其他"},function(date){
		   for(var i=0;i<date.length;i++){
			   var string =date[i].h_text;
			   $("#about").val(string);
		   }
	   },"json")
	   
	  
  });
  $(".p").click(function(){
		return confirm("你确定注销吗");
			
		});  
    
  

			$(function() {
				
				$(".sub").click(function() {
				
					var code1=/^[0-9].*$/;
					  if(!code1.test($("#goodswight").val())){
						  alert("请输入正确物件的重量");
						  return false;
					  }
					  
					 
					  if($("#fromname").val()==""){
						  alert("请输入发货人姓名");
						  return false;
					  }
					  
					  var code4=/^1[3|4|5|8][0-9]\d{4,8}$/;
					  if(!code4.test($("#fromphone").val())){
						  alert("请输入正确格式的发货人手机号");
						  return false;
					  }
					 
					  var code3=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;  
					  if(!code3.test($("#frommail").val())){
						  alert("发货人邮箱不能为空");
						  return false;
					  }
					 								 
					  if($("#fromaddress").val()==""){
						  alert("发货地址不能为空");
						  return false;
					  }
					  
					  if($("#toname").val()==""){
						  alert("请输入收货人姓名");
						  return false;
					  }
					  
					  var code4=/^1[3|4|5|8][0-9]\d{4,8}$/;
					  if(!code4.test($("#tophone").val())){
						  alert("请输入正确格式的收货人手机号");
						  return false;
					  }
					 
					  var code3=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;  
					  if(!code3.test($("#tomail").val())){
						  alert("收货人邮箱不能为空");
						  return false;
					  }
					 								 
					  if($("#toaddress").val()==""){
						  alert("收货地址不能为空");
						  return false;
					  }
					  if($("input[type='checkbox']").is(':checked')==false){
						  alert("请同意统一服务条款");
						  return false;
					  }
					  if($("#c_b_id").val()==""){
						  alert("请选择商家");
						  return false;
					  }
					  
					 alert("下单成功");
					$("form").submit();
				});
				
				
				var path="../charge/getListCharge";												
				$.post(path,function(data){			
				var string="<tr id=tha><td >序号</td><td >物流商</td><td >起步重量(公斤)</td><td >最低收费(元)</td><td >每公斤金额(元/公斤)</td><td class=xiadan>下单</td></tr>";
					for(var  i=0;i<data.length;i++){			
						var num=i+1;
					    var c_id=data[i].c_id;				
						var c_b_id=data[i].c_b_id;
						var c_b_name=data[i].c_b_name;
						var c_pay=data[i].c_pay;
						var c_weight=data[i].c_weight;
						var c_add=data[i].c_add;											    			   
						var look="<td class=look id="+c_b_id+"><font class=look1 id="+c_b_id+">下单</font></td>";
						string+="<tr><td>"+num+"</td><td>"+c_b_name+"</td><td>"+c_pay+"</td><td>"+c_weight+"</td><td>"+c_add+"</td>"+look+"<tr>";						
					}
					$(".tablelist").html(string);
					$("td").css("border","solid 1px #d7a372");
					$("#tha").css("background-color","#FFBB66");
					
			    },"json")	
				
                 
			    $(".tablelist").on("click",".look1",function(){	
			 		var id=$(this).attr("id");	
			 		
			 		var falg=confirm("你确定下单吗");
			 				if(falg==false){
			 					return false;
			 				}else{
			 			$("#c_b_id").val(id);
			 		/* 	alert($("#c_b_id").val()); */
			 			$(".look1").css("background-color","#DCDCDC");
			 			$(this).css("background-color","#FFBB66");
			 			
			 			$(this).css("color","#ffffff");
			 		}
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
        		<c:if test="${falg==0}">
        		<a href="../Person/userLogin">用户登录</a>
        		<a href="../Person/register">用户注册</a>
        		<a href="../businesser/login">承运商登录</a>
        		<a href="../manager/login">管理员登录</a> 
        		</c:if>
        		<c:if test="${falg==1}">
        		<label id="booklabel">${person.p_name}:您好</label><a class="p" href="../CommCon/userMain">注销</a>
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
                <li class="now" ><em id="bookli">网上下单</em><span>&nbsp;</span></li>
              </ul>
              <div class="tabCont" style="display:block;">
              	<div class="book_m">
                	<div class="space_hx">&nbsp;</div>               	
                    <div class="space_hx">&nbsp;</div>
                    <form action="../deal/getdeal" method="post">                    
                    <div class="space_hx">&nbsp;</div>
                    <ul class="xinxi">
                    	<li>
                        	货物总重量
                            <input name="weight" type="text" class="wenben" id="goodswight">
                                                                     公斤
                        </li>
                       
                     
                    </ul>
                    <div class="space_hx">&nbsp;</div>
                    <div id="sorcll">
                    <table  class="tablelist" >                                     
   
                    </table>
                    </div>
                    <div class="space_hx">&nbsp;</div>
                    <div class="txxx clearfix">                   	
                        <div class="txxx_l">
                        	<div class="txxx_h">
                            	<span>发货人信息</span>
                            </div>
                            <ul>
                            	<li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        发货人
                                    </span>
                                
						
					
                 <input name="c_b_id" type="hidden" value="" id="c_b_id" >
                <!--  <input name="c_pay" type="hidden" value="" id="c_pay" >
                 <input name="c_weight" type="hidden" value="" id="c_weight" >
                 <input name="c_add" type="hidden" value="" id="c_add" > -->
                                    <input name="fromname" type="text" id="fromname">
                                </li>
                                <li>
                                	<span>
                                        手机
                                    </span>
                                    <input name="fromphone" type="text" id="fromphone">
                                </li>
                                <li>
                                	<span>
                                       邮箱
                                    </span>
                                    <input name="frommail" type="text" id="frommail">
                                </li>
                                <li>
                                	<span>
                                        固定电话
                                    </span>
                                    <input name="fromtelephone" type="text" id="fromtelephone">                                
                                </li>
                                <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                                                 发货地址
                                    </span>
                                   <input name="fromaddress" type="text" placeholder="请认真填写正确的地址" id="fromaddress">                                  
                                </li>
                            </ul>
                        </div>
                        <!--发货人信息-->
                        
                        <!--收货人信息-->
                        <div class="txxx_r">
                        	<div class="txxx_h">
                            	<span>收货人信息</span>
                            </div>
                            <ul>
                            	<li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        收货人
                                    </span>
                                    <input name="toname" type="text" id="toname">
                                </li>
                                <li>
                                	<span>
                                        手机
                                    </span>
                                    <input name="tophone" type="text" id="tophone">
                                </li>
                                <li>
                                	<span>
                                       邮箱
                                    </span>
                                    <input name="tomail" type="text" id="tomail">
                                </li>
                                <li>
                                	<span>
                                        固定电话
                                    </span>
                                    <input name="totelephone" type="text" id="totelephone">                                  
                                </li>
                                <li>
                                	<span>
                                    	<i>&nbsp;</i>
                                        收货地址
                                    </span>
                                    <input name="toaddress" type="text" placeholder="请认真填写正确的地址" id="toaddress">
                                    
                                </li>
                            </ul>
                        </div>
                        <!--收货人信息-->
                    </div>
                    <div class="space_hx">&nbsp;</div>
                    <div class="tiaok">  
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;备注</span>
                       <textarea name="remark" cols="10" rows="3" id="remark"></textarea>
                    	<span><input name="" type="checkbox" value="">统一服务条款</span>
                        <textarea name="" cols="" rows="" id="about"></textarea>

                        
                    </div>
                    <div class="space_hx">&nbsp;</div>
                    <div class="xiadan_btn">
                     <a class="sub">立即下单</a> 
                        
                        <a  class="qux">取消</a>
                    </div>
                    </form>
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
