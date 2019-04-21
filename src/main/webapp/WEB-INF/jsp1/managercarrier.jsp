<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
 <link href="../css/layer.css" rel="stylesheet"  type="text/css" id="layui_layer_skinlayercss" /> 

 <script src="../js/layer.js" type="text/javascript"></script> 
<style type="text/css">
		#layertab{
		
		/* 	border-collapse:collapse; */
			 display:none; 
			 height:200px;
			 width:650px ;
			 
			}
			.bgc{
			background-color: #EEEEEE;
			}
			
		</style>

<script type="text/javascript">
var CurrPage=1;
var Pagenum=6;
var Count;
var CountPage;//总页数

$(function(){	
 a();
 $("#selectbutton").click(function(){
	/*  alert($("#b_carrier").val()); */
	 a();
 })
 });
 
 
	
	function a(){
		
		var path="../businesser/getSelect";
		var app = $('input:radio[name="apply"]:checked').val(); 		
		var name=$("#b_carrier").val();
		
		$.post(path,{"app":app,"name":name},function(data){			
		var string="<thead><tr><th>序号</th><th>编号</th><th>承运商名称</th><th>公司指定人姓名</th><th>公司地址</th><th>公司电话</th><th>申请时间</th><th>审核状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
			for(var  i=0;i<data.length;i++){			
				var num=i+1;
			    var id=data[i].b_id;				
				var b_companyname=data[i].b_companyname;
				var b_name=data[i].b_name;
				var b_address=data[i].b_address;
				var b_companyphone=data[i].b_companyphone;
				var b_time=data[i].b_time;
				var b_application=data[i].b_application;					    			   
				var look="<td class=look id="+id+">查看</td>";
				var update="<td class=update id="+id+">点击审核</td>";
				var delet="<td class=delete id="+id+">删除</td>";
				string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+b_companyname+"</td><td>"+b_name+"</td><td>"+b_address+"</td><td>"+b_companyphone+"</td><td>"+b_time+"</td><td>"+b_application+"</td>"+look+update+delet+"<tr></tbody>";						
			}
			$(".tablelist").html(string);
			$("td").css("border","solid 1px #d7a372");
			
	    },"json")			 		
 	}
	
$(function(){
	
	$(".tablelist").on("click",".look",function(){	
 		var id=$(this).attr("id");		
 		var path="../businesser/getBusinesser";
 		$.post(path,{"id":id},function(data){	
 			
 			 var b_id=data.b_id	
 			 $("#b_id").html(b_id);
 			 var b_name=data.b_name;
 			$("#b_name").html(b_name);
 			 var b_phone=data.b_phone; 
 			$("#b_phone").html(b_phone);
 			 var b_telephone=data.b_telephone;
 			$("#b_telephone").html(b_telephone);
			 var b_companyname=data.b_companyname;
			 $("#b_companyname").html(b_companyname);
			 var b_shorter=data.b_shorter;
			 $("#b_shorter").html(b_shorter);
			 var b_address=data.b_address;
			 $("#b_address").html(b_address);
			 var b_postalcode=data.b_postalcode;
			 $("#b_postalcode").html(b_postalcode);
			 var b_companyphone=data.b_companyphone;
			 $("#b_companyphone").html(b_companyphone);
			 var b_fax=data.b_fax;	
			 $("#b_fax").html(b_fax);
			 var b_representative=data.b_representative;
			 $("#b_representative").html(b_representative);
			 var b_tax=data.b_tax;
			 $("#b_tax").html(b_tax);
			 var b_mail=data.b_mail;
			 $("#b_mail").html(b_mail);
			 var b_introduce=data.b_introduce;
			 $("#b_introduce").html(b_introduce);
			 var b_application=data.b_application;
			 $("#b_application").html(b_application);
			 var b_reputation=data.b_reputation;
			 $("#b_reputation").html(b_reputation);
			 var b_time=data.b_time; 
			 $("#b_time").html(b_time);
			  layer.open({
				  type: 1 //Page层类型
				   /* ,area: ['600px', '600px']  */
			      ,offset: ['30px', '300px']
				  ,title: '详细信息'
				  ,shade: 0.2 //遮罩透明度
				  ,shadeClose: true
				  ,btn:"确定"		
				  ,content:$("#layertab")
				});     
 		},"json")
 	
 		
 	}); 
});
 	
 	
$(function(){
	
	$(".tablelist").on("click",".update",function(){	
 		var id=$(this).attr("id");		
 		var path="../businesser/getBusinesser";
 		$.post(path,{"id":id},function(data){			
 				var falg=confirm("你确定要审核吗？");
 				if(falg==false){
 					return false;
 				}else{
	                   layer.open({						
						type:1,
						title:'提示框',				
						area:['200px','200px'],
						offset: ['200px', '400px'],
						shade: 0.2,
						content:'请选择: <select name="getup" id="getup"><option >审请中</option><option >审请通过</option><option >审请不通过</option></select>',
						btn:['确认','取消'],
						yes:function(index, layero){
							var appval=$("#getup").val();						
							var paths="../businesser/updateApplication";
							$.post(paths,{"id":id,"appval":appval},function(data){
		 						var string="<thead><tr><th>序号</th><th>编号</th><th>承运商名称</th><th>公司指定人姓名</th><th>公司地址</th><th>公司电话</th><th>申请时间</th><th>审核状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
		 						for(var  i=0;i<data.length;i++){			
		 							var num=i+1;
		 						    var id=data[i].b_id;				
		 							var b_companyname=data[i].b_companyname;
		 							var b_name=data[i].b_name;
		 							var b_address=data[i].b_address;
		 							var b_companyphone=data[i].b_companyphone;
		 							var b_time=data[i].b_time;
		 							var b_application=data[i].b_application;					    			   
		 							var look="<td class=look id="+id+">查看</td>";
		 							var update="<td class=update id="+id+">点击审核</td>";
		 							var delet="<td class=delete id="+id+">删除</td>";
		 							string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+b_companyname+"</td><td>"+b_name+"</td><td>"+b_address+"</td><td>"+b_companyphone+"</td><td>"+b_time+"</td><td>"+b_application+"</td>"+look+update+delet+"<tr></tbody>";						
		 						}
		 						$(".tablelist").html(string);						
		 					},"json");
							
						    layer.close(index);   
						},
						cancel:function(index){							
						}
					});
 					
 					
 				}
 			
 			
 		},"json")
 	       
 		
 	}); 
});	
	
	
	
$(function(){
	
	$(".tablelist").on("click",".delete",function(){	
 		var id=$(this).attr("id");			
 		var falg=confirm("你确定删除吗");
 				if(falg==false){
 					return false;
 				}else{
 					var paths="../businesser/deleteBusinesser";
 					$.post(paths,{"id":id},function(data){
 						var string="<thead><tr><th>序号</th><th>编号</th><th>承运商名称</th><th>公司指定人姓名</th><th>公司地址</th><th>公司电话</th><th>申请时间</th><th>审核状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
 						for(var  i=0;i<data.length;i++){			
 							var num=i+1;
 						    var id=data[i].b_id;				
 							var b_companyname=data[i].b_companyname;
 							var b_name=data[i].b_name;
 							var b_address=data[i].b_address;
 							var b_companyphone=data[i].b_companyphone;
 							var b_time=data[i].b_time;
 							var b_application=data[i].b_application;					    			   
 							var look="<td class=look id="+id+">查看</td>";
 							var update="<td class=update id="+id+">点击审核</td>";
 							var delet="<td class=delete id="+id+">删除</td>";
 							string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+b_companyname+"</td><td>"+b_name+"</td><td>"+b_address+"</td><td>"+b_companyphone+"</td><td>"+b_time+"</td><td>"+b_application+"</td>"+look+update+delet+"<tr></tbody>";						
 						}
 						$(".tablelist").html(string);
 										
 					},"json");
 		}
 	});					       
});		

</script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">承运商信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
   <ul class="prosearch">
   <li><label id="ddd">申请状态：</label>
   <input class="apply" name="apply" type="radio" value='审请中'  />&nbsp;审请中&nbsp;&nbsp;
   <input class="apply" name="apply" type="radio" value='审请通过' />&nbsp;审请通过&nbsp;&nbsp;
   <input class="apply" name="apply" type="radio" value='审请不通过' />&nbsp;审请不通过&nbsp;&nbsp;
   <input class="apply" name="apply" type="radio" value=""  checked="checked"/>&nbsp;全部</li>
   <li><label>查询：</label><i>承运商名称</i><input name="b_carrier" type="text" class="scinput" id="b_carrier" value=""/>&nbsp;&nbsp;<input name="" type="button" class="sure" value="查询" id="selectbutton"/></li>
   
   </ul>
  
   <div class="formtitle1"><span>承运商列表</span></div>
   
    <table class="tablelist">
 
           
    </table>
	
    
    </div>
    <table id="layertab" border="1px">
			<tr><td class="bgc">id号:</td><td id="b_id"></td><td class="bgc">公司指定人姓名:</td><td id="b_name"></td><td class="bgc">公司指定人手机号:</td><td id="b_phone"></td><td class="bgc">公司名称:</td><td id="b_companyname"></td></tr>
			<tr><td class="bgc">公司简称:</td><td id="b_shorter"></td><td class="bgc">办公地址:</td><td id="b_address"></td><td class="bgc">邮政编码:</td><td id="b_postalcode"></td><td class="bgc">公司电话:</td><td id="b_companyphone"></td></tr>
			<tr><td class="bgc">公司传真:</td><td id="b_fax"></td><td class="bgc">公司法定代表人:</td><td id="b_representative"></td><td class="bgc">税务登记号:</td><td id="b_tax"></td><td class="bgc">公司指定人邮箱:</td><td id="b_mail"></td></tr>
			<tr><td class="bgc">申请状态:</td><td id="b_application"></td><td class="bgc">信誉值:</td><td id="b_reputation"></td><td class="bgc">时间:</td><td id="b_time"></td><td class="bgc">公司介绍:</td><td id="b_introduce"></td></tr>			
	</table>


	
    
</body>

</html>
