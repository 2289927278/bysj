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
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
<!--<script type="text/javascript" src="editor/kindeditor.js"></script>-->

<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});

$(function(){
	$(".btn").click(function(){
		if($(".dfinput").val()==""){
			alert("标题不能为空");
			return false;
		}
		if($("#h_text").val()==""){
			alert("内容不能为空");
			return false;
		}
		$("form").submit();
		alert("填写成功");
	});
})



 $(function(){	
	   a();
	   $("#inquirybtn").click(function(){
	  	 a();
	   })
	   });
	   

	  	
	  	function a(){	
	  		var path="../help/getSelect"; 				
	  		var help_title=$("#help_title").val();  		 
	  		$.post(path,{"help_title":help_title},function(data){		  			
	  		var string="<thead><tr><th>序号</th><th>标题</th><th>范畴</th><th>内容</th><th>时间</th><th>操作</th></tr></thead>";
	  			for(var  i=0;i<data.length;i++){			
	  				var num=i+1;
	  			    var id=data[i].h_id;				
	  				var h_title=data[i].h_title;
	  				var h_category=data[i].h_category;  			
	  				var h_text=data[i].h_text;	
	  				var h_time=data[i].h_time;			
	  				var delet="<td class=delete id="+id+">删除</td>";
	  				string+="<tbody><tr><td>"+num+"</td><td>"+h_title+"</td><td>"+h_category+"</td><td>"+h_text+"</td><td>"+h_time+"</td>"+delet+"<tr></tbody>";	
	  			}
	  			$(".tablelist").html(string);
	  			$("td").css("border","solid 1px #d7a372");
	  			
	  	    },"json")			 		
	   	}
	  	
	  	
	  	$(function(){
	  		$(".tablelist").on("click",".delete",function(){	
	  	 		var id=$(this).attr("id");			
	  	 		var falg=confirm("你确定删除吗");
	  	 				if(falg==false){
	  	 					return false;
	  	 				}else{
	  	 					var paths="../help/deleteHelp";
	  	 					$.post(paths,{"id":id},function(data){
	  	 						var string="<thead><tr><th>序号</th><th>标题</th><th>范畴</th><th>内容</th><th>时间</th><th>操作</th></tr></thead>";
	  	 			  			for(var  i=0;i<data.length;i++){			
	  	 			  				var num=i+1;
	  	 			  			    var id=data[i].h_id;				
	  	 			  				var h_title=data[i].h_title;
	  	 			  				var h_category=data[i].h_category;  			
	  	 			  				var h_text=data[i].h_text;	
	  	 			  				var h_time=data[i].h_time;			
	  	 			  				var delet="<td class=delete id="+id+">删除</td>";
	  	 			  				string+="<tbody><tr><td>"+num+"</td><td>"+h_title+"</td><td>"+h_category+"</td><td>"+h_text+"</td><td>"+h_time+"</td>"+delet+"<tr></tbody>";	
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
    <li><a href="#">系统设置</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">发布通知</a></li> 
    <li><a href="#tab2">查看信息</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <div class="formtext">Hi，<b>admin</b>，欢迎您试用信息发布功能！</div>
    <form action="../help/addhelp" method="post">
    <ul class="forminfo">
    <li><label>信息标题<b>*</b></label><input name="h_title" type="text" class="dfinput" value=""  style="width:343px;"/></li>
   
    <li><label>范畴<b>*</b></label>  
    <div class="vocation">
    <select class="select1" name="h_category">
    <option>关于物流</option>
    <option>发布通知</option>
    <option>新手问题</option>
    <option>常见问题</option>
    <option>投诉/建议</option>
    <option>其他</option>
    </select>
    </div>  
    </li>
 
    <li><label>公告内容<b>*</b></label>
   <textarea id="h_text" name="h_text" style="width:343px;height:100px;border: 1px solid gainsboro;"></textarea> 
    </li>
    <li><label>&nbsp;</label><input name="" type="button" class="btn" value="马上发布"/></li>
    </ul>
    </form>
    </div> 
    
    
  	<div id="tab2" class="tabson">
  
    <ul class="seachform">   
    <li><label>标题查询</label><input name="" type="text" class="scinput" id="help_title" /></li>
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" id="inquirybtn" value="查询"/></li>   
    </ul>
    
    
       <table class="tablelist">
    	
       </table>
    
   
    </div>  
      
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>


</body>

</html>
