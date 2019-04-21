<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知用户</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/select.css" rel="stylesheet" type="text/css" />
 <link href="../css/layer.css" rel="stylesheet"  type="text/css" id="layui_layer_skinlayercss" />
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
 

 <script src="../js/layer.js" type="text/javascript"></script>


<!--<link rel="stylesheet" type="text/css" href="../css/thems.css"/>-->
<style type="text/css">
  #imgbackground{
  position: absolute;
  width:720px;
  height:408px;
  margin-top:-397px;
  margin-left:240px;
  }
	.book{
		height: 500px;
		width: 976px;
		border: 1px solid gold;
		/*background: url(../img/qq1.png);*/
		background-position: 0% 19%;
		margin-top: 40px;
	}
	
	#dto_user{
	 height:380px;
	 width:250px;
	
	 overflow: scroll;
	}
	#hide{
	 display:none;
	}
	#label{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	font-size: 1.34em;
	
	}
	#lab1{
	  padding: 20px;
	}#lab2{
	 margin-left:-45px;
	  position: absolute;
	  
	}
	.li1{
	  padding: 20px;
	}
	.xiu{
     background-color: #F4A460;
	color: white;
	border-radius:10px;
	text-align:center;
	padding-right: 8px;
	padding: 7px;
   }
   .xiu:hover{
     
	 background-color: #FFB90F;
	
   }
	
body .demo-class .layui-layer-title{background:#FFCC66; color:white; padding-right: 220px}
body .demo-class .layui-layer-btn{border-top:1px solid #E9E7E7}

	
</style>
<script type="text/javascript">
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
var CurrPage=1;
var Pagenum=6;
var Count;
var CountPage;//总页数

$(function(){
	 $(".p").click(function(){
			return confirm("你确定注销吗");
				
			});  
	var  path="../Person/getListPerson";
		$.post(path,function(data){			
		var string="<thead><tr><th>序号</th><th>用户名</th></tr></thead>";
			for(var  i=0;i<data.length;i++){			
				var num=i+1;
			    var id=data[i].p_id;				
				var name=data[i].p_name;
				string+="<tbody><tr class=touser id="+id+"><td>"+num+"</td><td>"+name+"</td><tr></tbody>";
			}
			$(".tablelistuser").html(string);
			$("td").css("border","solid 1px #d7a372");
			
	    },"json")
});


$(function(){
		$(".tablelistuser").on("click",".touser",function(){	
	 		var p_id=$(this).attr("id");
	 		
	 		 layer.open({						
					type:1,
					title:'发信息',
					skin: 'demo-class',
					/* area:['460px','300px'],  */
					offset: ['104px', '530px'],
					shade: 0.2,
					content:$("#hide"),
					btn:['确认','取消'],
					yes:function(index, layero){
					
						$("#p_id").val(p_id);
							$("#talks").submit();

					    layer.close(index);   
					},
					cancel:function(index){	
						
					}
				});			
	 				
		
	 	});					       
	});


$(function(){	
	   a();
	   $("#fontpage2").html(CurrPage);
	   $(".scbtn").click(function(){
		   var name=$(".scinput").val();
		   var path="../talk/getSelectTalk"; 					  		 
	  		$.post(path,{"name":name},function(data){
	  			 Count=data.length;//总数量
				 CountPage=Math.ceil(Count/6);
	 			 $("#fontpage1").html(CountPage);
	  		var string="<thead><tr><th>序号</th><th>用户名</th><th>标题</th><th>内容</th><th>时间</th><th>操作</th></tr></thead>";
	  			for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
	 				if(i<=Count-1&&i>=0){		
	  				var num=i+1;
	  				var id=data[i].t_id;
	  			     var name=data[i].person.p_name;    			  
	  				var t_title=data[i].t_title;
	  				var t_text=data[i].t_text;  			
	  				var t_time=data[i].t_time;	  				
	  				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
	  				string+="<tbody><tr><td>"+num+"</td><td>"+name+"</td><td>"+t_title+"</td><td>"+t_text+"</td><td>"+t_time+"</td>"+delet+"<tr></tbody>";	
	  			}}
	  			$(".tablelist").html(string);
	  			$("td").css("border","solid 1px #d7a372");
	  			
	  	    },"json")		
	   })
	   });
	   

	  	
	  	function a(){	
	  		var path="../talk/getSelect"; 					  		 
	  		$.post(path,function(data){	
	  			 Count=data.length;//总数量
				 CountPage=Math.ceil(Count/6);
	 			 $("#fontpage1").html(CountPage);
	  		var string="<thead><tr><th>序号</th><th>用户名</th><th>标题</th><th>内容</th><th>时间</th><th>操作</th></tr></thead>";
	  			for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
	 				if(i<=Count-1&&i>=0){		
	  				var num=i+1;
	  				var id=data[i].t_id;
	  			     var name=data[i].person.p_name;    			  
	  				var t_title=data[i].t_title;
	  				var t_text=data[i].t_text;  			
	  				var t_time=data[i].t_time;	  				
	  				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
	  				string+="<tbody><tr><td>"+num+"</td><td>"+name+"</td><td>"+t_title+"</td><td>"+t_text+"</td><td>"+t_time+"</td>"+delet+"<tr></tbody>";	
	  			}}
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
	  	 					var paths="../talk/deleteTalbus";
	  	 					$.post(paths,{"id":id},function(data){
	  	 					 Count=data.length;//总数量
	  						 CountPage=Math.ceil(Count/6);
	  			 			 $("#fontpage1").html(CountPage);
	  	 						var string="<thead><tr><th>序号</th><th>用户名</th><th>标题</th><th>内容</th><th>时间</th><th>操作</th></tr></thead>";
	  	 			  			for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
	  	 			 				if(i<=Count-1&&i>=0){			
	  	 			  				var num=i+1;
	  	 			  				var id=data[i].t_id;
	  	 			  			    var name=data[i].person.p_name;	  			  
	  	 			  				var t_title=data[i].t_title;
	  	 			  				var t_text=data[i].t_text;  			
	  	 			  				var t_time=data[i].t_time;	  				
	  	 			  				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
	  	 			  				string+="<tbody><tr><td>"+num+"</td><td>"+name+"</td><td>"+t_title+"</td><td>"+t_text+"</td><td>"+t_time+"</td>"+delet+"<tr></tbody>";	
	  	 			  			}}
	  	 						$(".tablelist").html(string);
	  	 										
	  	 					},"json");
	  	 		}
	  		
	  	 	});					       
	  	});
	  	 
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
</script>
</head>

<body>
<!--头部-->
<div class="head_bg">
	<div class="head clearfix">
    	<div class="logo"><a href=""><img src="../images/logo.png" alt=""/></a></div>
        <div class="menu">
        	<div class="head_top">
            	
                <c:if test="${falg==2}">
        		<label id="label">${businesser.b_name}:您好</label><a class="p" href="../CommCon/userMain">注销</a>
        		</c:if>
            </div>
            <ul class="clearfix">
            	<li ><a href="../CommCon/carriermain">首页</a></li>           	
            	<li><a href="../CommCon/carrierperson">个人信息</a></li> 
                <li ><a href="../CommCon/carrierdeal">业务消息</a></li>
                <li ><a href="../CommCon/carrierinquiry">物流管理</a></li>
                <li class="now"><a href="../CommCon/carriertouser">通知用户</a></li>
                <li><a href="../CommCon/carriernews">消息发布</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<div class="book">
    	    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">通知用户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
  	<li><a href="#tab2" class="selected">查看信息</a></li> 
    <li><a href="#tab1" >通知用户</a></li> 
    
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
      <div id="dto_user">
          <table class="tablelistuser">       
          </table>   
             
      </div>
         <div >
         <img src="../imgs/takls.png" alt=""  id="imgbackground" />
        </div>   
    </div> 
    
    
    
  	<div id="tab2" class="tabson">
    
    
    <ul class="seachform">   
    <li><label>查询用户</label><input name="" type="text" class="scinput" /></li>
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>   
    </ul>
    
    
    <table class="tablelist">
    	
    </table>
     <div id="d2_3_1">共<font id="fontpage1"></font>	页;当前为<font id="fontpage2"></font>页 
			   	    <button id="shou" class="page1">首页</button><button id="shang" class="page1">上一页</button>
			   	    <button id="xia" class="page1">下一页</button> <button id="wei" class="page1">尾页</button>
			          
			    </div>
    
      
       
  
    
    </div>  
       
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
    
    
    
    </div>
    </div>
    
</div>
<!--中间部分-->
<div class="space_hx">&nbsp;</div>
<!--底部-->
<div class="foot_bg">
	<div class="foot">
    	<div class="foot_t">
        	<a href="">业务介绍</a>
            <a href="">联系我们</a>
        </div>
        <div id="hide"> 
          <form method="post" action="../talk/addtalk" id="talks">  
          <input type="hidden" value="" id="p_id" name="p_id"/>   
          <ul>         
          <li class="li1"><label id="lab1">标题:</label><input id="talktitle" name="talktitle"  type="text" class="dfinput"   style="width:400px;"/></li> 
         
          <li class="li1"><label id="lab2">内容:</label><textarea id="talktext" name="talktext" style="width:400px;height:250px;border: 1px solid gainsboro;"></textarea> 
          </li>     
          </ul>
          
                
          
          </form> 
    
        </div>
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