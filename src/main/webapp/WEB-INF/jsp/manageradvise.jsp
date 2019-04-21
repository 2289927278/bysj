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
		#layertab{
		
		/* 	border-collapse:collapse; */
			 display:none; 
			 height:200px;
			 width:650px ;
			 
			}
			.bgc{
			background-color: #EEEEEE;
			}
			#read{
			float:left;
			width:200px;
			height:30px;
			
			
			}
			.xiu{
     background-color: #F4A460;
	color: white;
	border-radius:50px;
	text-align:center;
	padding-right: 8px;
	padding: 7px;
   }
   .xiu:hover{
     
	 background-color: #FFB90F;
	 text-align:center;
	
   }
			
		</style>

<script type="text/javascript">
/* $(document).ready(function(e) {

	$(".select3").uedSelect({
		width : 152
	});
}); */

$(function(){	
	var path="../advise/getusernameListAdvise";
	/* var username=$("#username").val(); */
	$.post(path,function(data){			
	var string="<thead><tr><th>序号</th><th>用户名</th><th>消息内容</th><th>时间</th><th>操作A</th></tr></thead>";
		for(var  i=0;i<data.length;i++){			
			var num=i+1;
		    var id=data[i].a_id;							
			var p_name=data[i].person.p_name
          				
			var text=data[i].a_text;
			var time=data[i].a_time;

			var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
			string+="<tbody><tr><td>"+num+"</td><td>"+p_name+"</td><td><textarea  cols=55 rows=4 id=textr readonly=readonly>"+text+"</textarea></td><td>"+time+"</td>"+delet+"<tr></tbody>";						
		}
		$(".tablelist").html(string);
		$("td").css("border","solid 1px #d7a372");
		
    },"json")	;	
 
 });
 
 

  $(function(){
	
	$(".tablelist").on("click",".delete",function(){	
 		var id=$(this).attr("id");			
 		var falg=confirm("你确定删除吗");
 				if(falg==false){
 					return false;
 				}else{
 					var paths="../advise/delete";
 					$.post(paths,{"id":id},function(data){
 						var string="<thead><tr><th>序号</th><th>用户名</th><th>消息内容</th><th>时间</th><th>操作A</th></tr></thead>";
 						for(var  i=0;i<data.length;i++){			
 							var num=i+1;
 						    var id=data[i].a_id;							
 							var p_name=data[i].person.p_name 				         				
 							var text=data[i].a_text;
 							var time=data[i].a_time;

 							var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
 							string+="<tbody><tr><td>"+num+"</td><td>"+p_name+"</td><td><input  value="+text+"  readonly=readonly id=read /></td><td>"+time+"</td>"+delet+"<tr></tbody>";						
 						}
 						$(".tablelist").html(string);
 						$("td").css("border","solid 1px #d7a372");
 										
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
    <li><a href="#">投诉消息</a></li>
    </ul>
    <span id="managername">${manager.m_name}:您 好</span>
    </div>
    
    <div class="formbody">
     
    <div id="usual1" class="usual"> 
    
    <div class="formtitle"><span>投诉消息列表</span></div>
    
    <table class="tablelist">
    	
    </table>
      
   
	</div> 
   
    </div>


</body>

</html>
