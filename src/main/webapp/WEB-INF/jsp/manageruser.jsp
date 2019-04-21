<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/select.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
 <link href="../css/layer.css" rel="stylesheet"  type="text/css" id="layui_layer_skinlayercss" /> 
 <script src="../js/layer.js" type="text/javascript"></script> 
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>


<style type="text/css">
 #managername{
    float:right;
    padding-right:30px;
  }

.xiu{
     background-color: #F4A460;
	color: white;
	border-radius:60px;
	text-align:center;
	padding-right: 8px;
	padding: 9px;
   }
   .xiu:hover{
     
	 background-color: #FFB90F;
	
   }
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
/* $(document).ready(function(e) {

	$(".select3").uedSelect({
		width : 152
	});
}); */
   
var CurrPage=1;
var Pagenum=6;
var Count;
var CountPage;//总页数
   
$(function(){	
 a();
 $("#fontpage2").html(CurrPage);
 $(".scbtn").click(function(){
	/*  alert($("#b_carrier").val()); */
	 a();
	 $("#fontpage2").html(CurrPage);
 })
 });
 
 
	
	function a(){	
		var path="../Person/getSelectPerson";
		var username=$("#username").val();
		$.post(path,{"username":username},function(data){
			Count=data.length;//总数量
			 CountPage=Math.ceil(Count/6);
			 $("#fontpage1").html(CountPage);
		var string="<thead><tr><th>序号</th><th>编号</th><th>用户名</th><th>用户名密码</th><th>邮箱</th><th>操作A</th></tr></thead>";
			for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
				if(i<=Count-1&&i>=0){
				var num=i+1;
			    var id=data[i].p_id;							
				var p_name=data[i].p_name;
				var p_password=data[i].p_password;
				var P_mail=data[i].p_mail;							    			   			

				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
				string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+p_name+"</td><td>"+p_password+"</td><td>"+P_mail+"</td>"+delet+"<tr></tbody>";						
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
			
/* $(function(){
	
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
	 */
	
	
 $(function(){
	
	$(".tablelist").on("click",".delete",function(){	
 		var id=$(this).attr("id");			
 		var falg=confirm("你确定删除吗");
 				if(falg==false){
 					return false;
 				}else{
 					var paths="../Person/deletePerson";
 					$.post(paths,{"id":id},function(data){
 						 Count=data.length;//总数量
 						 CountPage=Math.ceil(Count/6);
 			 			 $("#fontpage1").html(CountPage);
 						var string="<thead><tr><th>序号</th><th>编号</th><th>用户名</th><th>用户名密码</th><th>邮箱</th><th>操作A</th></tr></thead>";
 						for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){	
 							if(i<=Count-1&&i>=0){
 							var num=i+1;
 						    var id=data[i].p_id;							
 							var p_name=data[i].p_name;
 							var p_password=data[i].p_password;
 							var P_mail=data[i].P_mail;							    			   			
 							
 							var delet="<td class=delete id="+id+">删除</td>";
 							string+="<tbody><tr><td>"+num+"</td><td>"+id+"</td><td>"+p_name+"</td><td>"+p_password+"</td><td>"+P_mail+"</td>"+delet+"<tr></tbody>";						
 						}}
 						$(".tablelist").html(string);
 										
 					},"json");
 		}
 	});					       
});		 
</script>
</head>

<body class="sarchbody">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">用户信息</a></li>
    </ul>
     <span id="managername">${manager.m_name}:您 好</span>
    </div>
    
    <div class="formbody">
     
    <div id="usual1" class="usual"> 
     <ul class="seachform">   
    <li><label>用户名查询</label><input name="" type="text" class="scinput" id="username" /></li>
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" id="inquirybtn" value="查询"/></li>   
    </ul>
    <div class="formtitle"><span>用户列表</span></div>
    
    <table class="tablelist">
    	
    </table>
       <div id="d2_3_1">共<font id="fontpage1"></font>	页;当前为<font id="fontpage2"></font>页 
			   	    <button id="shou" class="page1">首页</button><button id="shang" class="page1">上一页</button>
			   	    <button id="xia" class="page1">下一页</button> <button id="wei" class="page1">尾页</button>
			          
			    </div>
   
	</div> 
   
    </div>


</body>

</html>
