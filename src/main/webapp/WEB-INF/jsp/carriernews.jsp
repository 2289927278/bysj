<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>承运商消息发布</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<!--<link rel="stylesheet" type="text/css" href="../css/thems.css"/>-->
<link href="../css/select.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="../js/select-ui.min.js"></script>
<style type="text/css">
	.book{
		height: 500px;
		width: 976px;
		border: 1px solid 	#FFAA33;
		/*background: url(../img/qq1.png);*/
		/*background-position: 0% 19%;*/
		margin-top: 40px;
	}
	#label{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	font-size: 1.34em;
	}
	.xiu{
     background-color: #F4A460;
	color: white;
	border-radius:10px;
	text-align:center;
	padding-right: 8px;
	padding: 9px;
   }
   .xiu:hover{
     
	 background-color: #FFB90F;
	
   }
</style>
<script type="text/javascript">
var CurrPage=1;
var Pagenum=6;
var Count;
var CountPage;//总页数
   $(function(){
	   $(".p").click(function(){
			return confirm("你确定注销吗");
				
			});  
	   
	   $(".btn").click(function(){
		   if($(".dfinput").val()==""){
			   alert("订单号不能为空");
			   return false;
		   }
		   if($("#i_instruction").val()==""){
			   alert("内容不能为空");
			   return false;
		   }
		 alert("发布成功");
		  $("form").submit();
	   });
   });
   
   
   $(function(){	
	   a();
	   $("#fontpage2").html(CurrPage);
	   $("#inquirybtn").click(function(){
	  	 a();
	  	$("#fontpage2").html(CurrPage);
	   })
	   });
	   

	  	
	  	function a(){	
	  		var path="../news/getSelect"; 					  		  		 
	  		$.post(path,function(data){	
	  			Count=data.length;//总数量
				 CountPage=Math.ceil(Count/6);
	 			 $("#fontpage1").html(CountPage);
	  		var string="<thead><tr><th>序号</th><th>标题</th><th>内容</th><th>时间</th><th>操作</th></tr></thead>";
	  			for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
	 				if(i<=Count-1&&i>=0){			
	  				var num=i+1;
	  			    var id=data[i].n_id;				
	  				var n_title=data[i].n_title;
	  				var n_text=data[i].n_text;  			
	  				var n_time=data[i].n_time;		  				
	  				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
	  				string+="<tbody><tr><td>"+num+"</td><td>"+n_title+"</td><td>"+n_text+"</td><td>"+n_time+"</td>"+delet+"<tr></tbody>";	
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
	  	 					var paths="../news/deleteNews";
	  	 					$.post(paths,{"id":id},function(data){
	  	 						Count=data.length;//总数量
	  	 					 CountPage=Math.ceil(Count/6);
	  	 		 			 $("#fontpage1").html(CountPage);
	  	 						var string="<thead><tr><th>序号</th><th>标题</th><th>内容</th><th>时间</th><th>操作</th></tr></thead>";
	  	 			  			for( var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
	  	 			 				if(i<=Count-1&&i>=0){			
	  	 			  				var num=i+1;
	  	 			  			    var id=data[i].n_id;				
	  	 			  				var n_title=data[i].n_title;
	  	 			  				var n_text=data[i].n_text;  			
	  	 			  				var n_time=data[i].n_time;		  				
	  	 			  				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
	  	 			  				string+="<tbody><tr><td>"+num+"</td><td>"+n_title+"</td><td>"+n_text+"</td><td>"+n_time+"</td>"+delet+"<tr></tbody>";	
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
                <li ><a href="../CommCon/carriertouser">通知用户</a></li>
                <li class="now"><a href="../CommCon/carriernews">消息发布</a></li>
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
					<li><a href="#">发布消息</a></li>
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
						<form action="../news/addnews" method="post">
							<ul class="forminfo">
								<li><label>标题<b>*</b></label><input name="n_title"
									type="text" class="dfinput" 
									style="width: 518px;" /></li>
								<li><label>通知内容<b>*</b></label> <textarea
										id="i_instruction" name="n_text"
										style="width: 700px; height: 150px; border: 1px solid gainsboro;"></textarea>
								</li>
								<li><label>&nbsp;</label><input name="" type="button"
									class="btn" value="马上发布" /></li>
							</ul>
						</form>
					</div>

					<div id="tab2" class="tabson">

						<!-- <ul class="seachform">
							<li><label>订单号查询</label><input name="" type="text"
								class="scinput" id="inquiryval" /></li>
							<li><label>&nbsp;</label><input name="" type="button"
								class="scbtn" id="inquirybtn" value="查询" /></li>
						</ul> -->

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
            <a href="">找物流有限责任公司</a>
                                      
        </div>  
    </div>	
</div>
<!--底部-->
</body>
</html>