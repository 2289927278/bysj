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

   #managername{
    float:right;
    padding-right:30px;
  }
.xiu{
     background-color: #F4A460;
	color: white;
	border-radius:30px;
	padding: 6px;
   }
    
   .xiu:hover{
     
	 background-color: #FFB90F;
	
   }

body .demo-class .layui-layer-title{background:#FFCC66; color:white;}
 #getup{
  width:200px;
  height:30px;
  margin-bottom: 65px;
   border: 1px solid gold;
 }
 option{
 height:30px;
  border: 1px solid gold;
 }
		#layertab{
		
		/* 	border-collapse:collapse; */
			 display:none; 
			 height:200px;
			 width:650px ;
			 
			}
			#si{
			 display:none;
			}
			.bgc{
			background-color: #EEEEEE;
			float:left;
			width:90px;
			
			height:30px;
			padding-top: 20px;
			/* padding-left: 10px;
			padding-right: 10px; */ 
			
			
			}
			body .demo-class .layui-layer-title{background:#FFCC66; color:white;padding-left: 60px;}
			#liebiao li{
			  padding: 10px;
			}
			input{
			border-radius:9px;
			
			}
		</style>

<script type="text/javascript">
var CurrPage=1;
var Pagenum=6;
var Count;
var CountPage;//总页数

$(function(){	
 a();
 $("#fontpage2").html(CurrPage);
 $("#selectbutton").click(function(){
	/*  alert($("#b_carrier").val()); */
	 a();
	 $("#fontpage2").html(CurrPage);
 })
 });
 
 
	
	function a(){
		
		var path="../businesser/getSelect";
		var app = $('input:radio[name="apply"]:checked').val(); 		
		var name=$("#b_carrier").val();
		
		$.post(path,{"app":app,"name":name},function(data){	
			 Count=data.length;//总数量
			 CountPage=Math.ceil(Count/6);
 			 $("#fontpage1").html(CountPage);
		var string="<thead><tr><th>序号</th><th>编号</th><th>承运商名称</th><th>公司指定人姓名</th><th>公司地址</th><th>公司电话</th><th>申请时间</th><th>审核状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
			for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){	
				if(i<=Count-1&&i>=0){
				var num=i+1;
			    var id=data[i].b_id;				
				var b_companyname=data[i].b_companyname;
				var b_name=data[i].b_name;
				var b_address=data[i].b_address;
				var b_companyphone=data[i].b_companyphone;
				var b_time=data[i].b_time;
				var b_application=data[i].b_application;					    			   
				var look="<td class=look id="+id+"><font class=xiu>查看</font></td>";
				var update="<td class=update id="+id+"><font class=xiu>点击审核</font></td>";
				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
				string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+b_companyname+"</td><td>"+b_name+"</td><td>"+b_address+"</td><td>"+b_companyphone+"</td><td>"+b_time+"</td><td>"+b_application+"</td>"+look+update+delet+"<tr></tbody>";						
			}}
			$(".tablelist").html(string);
			$("td").css("border","solid 1px #d7a372");
			
	    },"json")			 		
 	}
	
	 $(function(){	         					
			$(".page1").on("click",function(){
				var s=$(this).attr("id");
				if(s=="shou"){
					CurrPage=1;
					$("#fontpage2").html(CurrPage);
					a();
				}
				if(s=="wei"){
					CurrPage=CountPage;	
					$("#fontpage2").html(CurrPage);
					a();
				}
				if(s=="shang"){
					if(CurrPage>1){
					
					CurrPage=CurrPage-1;
					$("#fontpage2").html(CurrPage);
					
					a();
					}
				}
				if(s=="xia"){
					if(CurrPage<CountPage){
				
					CurrPage=CurrPage+1;
					$("#fontpage2").html(CurrPage);
					
					a();
					}
				}
				
			});	  		
	});	
	
$(function(){
	
	$(".tablelist").on("click",".look",function(){	
 		var id=$(this).attr("id");	
 		
 		var path="../businesser/getBusinessers";
 		$.post(path,{"id":id},function(data){	
 			
 			 var b_id=data.b_id	;
 			 $("#b_id").val(b_id);
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
			 layer.open({
				  type: 1 //Page层类型
			      , area: '1000px'
				  ,skin: 'demo-class'
			      ,offset: ['10px', '50px']
				  ,title: '详细信息'
				  ,shade: 0.2 //遮罩透明度
				  ,shadeClose: true
				  ,btn:"确定"		
				  ,content:$("#layertab")
				});     
 		},"json")
 	 $(".bgc").css("width","90px");
 		
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
						skin: 'demo-class',
						title:'提示框',				
						offset: ['200px', '400px'],
						shade: 0.2,
						content:'请选择: <select name="getup" id="getup"><option >审请中</option><option >审请通过</option><option >审请不通过</option></select>',
						btn:['确认','取消'],
						yes:function(index, layero){
							var appval=$("#getup").val();						
							var paths="../businesser/updateApplication";
							$.post(paths,{"id":id,"appval":appval},function(data){
								Count=data.length;//总数量
								 CountPage=Math.ceil(Count/6);
					 			 $("#fontpage1").html(CountPage);
		 						var string="<thead><tr><th>序号</th><th>编号</th><th>承运商名称</th><th>公司指定人姓名</th><th>公司地址</th><th>公司电话</th><th>申请时间</th><th>审核状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
		 						for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){	
		 							if(i<=Count-1&&i>=0){
		 							var num=i+1;
		 						    var id=data[i].b_id;				
		 							var b_companyname=data[i].b_companyname;
		 							var b_name=data[i].b_name;
		 							var b_address=data[i].b_address;
		 							var b_companyphone=data[i].b_companyphone;
		 							var b_time=data[i].b_time;
		 							var b_application=data[i].b_application;					    			   
		 							var look="<td class=look id="+id+"><font class=xiu>查看</font></td>";
		 							var update="<td class=update id="+id+"><font class=xiu>点击审核</font></td>";
		 							var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
		 							string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+b_companyname+"</td><td>"+b_name+"</td><td>"+b_address+"</td><td>"+b_companyphone+"</td><td>"+b_time+"</td><td>"+b_application+"</td>"+look+update+delet+"<tr></tbody>";						
		 						}}
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
 						Count=data.length;//总数量
 						 CountPage=Math.ceil(Count/6);
 			 			 $("#fontpage1").html(CountPage);
 						var string="<thead><tr><th>序号</th><th>编号</th><th>承运商名称</th><th>公司指定人姓名</th><th>公司地址</th><th>公司电话</th><th>申请时间</th><th>审核状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
 						for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){	
 							if(i<=Count-1&&i>=0){
 							var num=i+1;
 						    var id=data[i].b_id;				
 							var b_companyname=data[i].b_companyname;
 							var b_name=data[i].b_name;
 							var b_address=data[i].b_address;
 							var b_companyphone=data[i].b_companyphone;
 							var b_time=data[i].b_time;
 							var b_application=data[i].b_application;					    			   
 							var look="<td class=look id="+id+"><font class=xiu>查看</font></td>";
 							var update="<td class=update id="+id+"><font class=xiu>点击审核</font></td>";
 							var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
 							string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+b_companyname+"</td><td>"+b_name+"</td><td>"+b_address+"</td><td>"+b_companyphone+"</td><td>"+b_time+"</td><td>"+b_application+"</td>"+look+update+delet+"<tr></tbody>";						
 						}}
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
     <span id="managername">${manager.m_name}:您 好</span>
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
	<div id="d2_3_1">共<font id="fontpage1"></font>	页;当前为<font id="fontpage2"></font>页 
			   	    <button id="shou" class="page1">首页</button><button id="shang" class="page1">上一页</button>
			   	    <button id="xia" class="page1">下一页</button> <button id="wei" class="page1">尾页</button>
			          
			    </div>
    
    </div>
    <table id="layertab" border="1px">
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
	</table>
	<!-- <div id="si">
		<ul id="liebiao">
			<li><i>&nbsp;</i><em>姓名&nbsp;&nbsp;&nbsp;</em><input name="b_name" type="text" id="b_name" value=""
				class="scinput" />

			</li>
			<li><i>&nbsp;</i><em>邮箱 </em><input name="b_mail" type="text"
				id="b_mail" class="scinput" /></li>

			<li><i>&nbsp;</i><em>手机号码</em> <input name="b_phone" type="text" id="b_phone"
				class="scinput" /></li>
			<li><i>&nbsp;</i><em>公司名称</em> <input name="b_companyname" type="text"
				id="b_companyname" class="scinput" />

			</li>
			<li><i>&nbsp;</i> <em>公司简称</em> <input name="b_shorter"
				type="text" id="b_shorter" class="scinput" /></li>
			<li><i>&nbsp;</i> <em>办公地址</em> <input name="b_address"
				type="text" id="b_address" class="scinput" /></li>
			<li><i>&nbsp;</i> <em>邮政编码</em> <input name="b_postalcode"
				type="text" id="b_postalcode" class="scinput" /></li>

			<li><i>&nbsp;</i> <em>公司电话</em> <input name="b_companyphone"
				type="text" id="b_companyphone" class="scinput" /></li>
			<li><i>&nbsp;</i> <em>公司传真</em> <input name="b_fax" type="text"
				id="b_fax" class="scinput" /></li>
		   <li><i>&nbsp;</i> <em>申请时间</em> <input name="b_time" type="text"
				id="b_time" class="scinput" /></li>
				
			<li><i>&nbsp;</i> <em>法定代表人</em> <input name="b_representative"
				type="text" id="b_representative" class="scinput" /></li>
				

			<li><i>&nbsp;</i> <em>税务登记号</em> <input name="b_tax" type="text"
				id="b_tax" class="scinput" /></li>

			<li><em>公司介绍</em> <textarea name="b_introduce" cols="" rows=""
					id="b_introduce">介绍一下公司的情况！</textarea></li>
		</ul>
	</div> -->


	
    
</body>

</html>
