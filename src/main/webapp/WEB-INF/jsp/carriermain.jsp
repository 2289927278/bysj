<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>承运商首页</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<!--<link rel="stylesheet" type="text/css" href="../css/thems.css"/>-->
 <link href="../css/layer.css" rel="stylesheet"  type="text/css" id="layui_layer_skinlayercss" />

<link rel="stylesheet" type="text/css" href="../css/index.css"/>
<!--幻灯片-->
<link rel="stylesheet" type="text/css" href="../css/goodnav.css">
<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
 <script src="../js/layer.js" type="text/javascript"></script>
<style type="text/css">
    #mainul2{
    height: 212px;
    }
	.book{
		
		width: 976px;	
		background-position: 0% 19%;
		margin-top: 40px;
	}
	
	.xin{
		
		height: 215px;
		
		overflow: scroll;
		
		
	}
	#em{
	width:180px;
	overflow: hidden;
	}
	#label{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;

	}
	body .demo-class .layui-layer-title{background:#3333FF; color:white; padding-right: 220px}
	/* .p{
	
	padding:4px;
	background-color:#FF0033 ;
	color: white;
	border-radius: 6px;
	} */
</style>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.litenav.js"></script>
<script type="text/javascript">
$(function(){
	var path="../help/getnews";
     $.post(path,function(date){
	for(var i=0;i<date.length;i++){
		var id=date[i].h_id;
		var h_title=date[i].h_title;
		var h_time=date[i].h_time;
		var string="<li class=clickli id="+id+"><a ><span>"+h_title+"</span></a><em>"+h_time+"</em></li>";
		$("#mainul1").append(string);
	}
},"json");

$("#mainul1").on("click",".clickli",function(){
	var id=$(this).attr("id");
	$.post("../help/gethelp",{"id":id},function(date){
		var text=date.h_text;
		 layer.open({						
				type:0,
				title:'系统通知',
				skin: 'demo-class',
				/* area:['460px','300px'],  */
				offset: ['130px', '560px'],
				shade: 0.2,
				/* content:$("#hide"), */
				 content:"<html><textarea  cols=30 rows=10 id=ab>"+text+"</textarea></html>", 
				btn:'确认'
								
			});		
	},"json")
});




var path="../news/getlistnews";
$.post(path,function(date){
	for(var i=0;i<date.length;i++){
		var id=date[i].n_id;
		var n_title=date[i].n_title;
		var n_time=date[i].n_time;
		var string="<li class=clickli1 id="+id+"><a ><span>"+n_title+"</span></a><em id=em>"+n_time+"</em></li>";
		$("#mainul2").append(string);
	}
	/* $("#em").css("overflow","none"); */
},"json");

$("#mainul2").on("click",".clickli1",function(){
	var id=$(this).attr("id");
	$.post("../news/getnews",{"id":id},function(date){
		var text=date.n_text;
		 layer.open({						
				type:0,
				title:'商家通知',
				skin: 'demo-class',
				/* area:['460px','300px'],  */
				offset: ['130px', '560px'],
				shade: 0.2,
				/* content:$("#hide"), */
				 content:"<html><textarea  cols=30 rows=10 id=ab>"+text+"</textarea></html>",  
				btn:'确认'
								
			});		
	},"json")
});
	 
	
	 $(".p").click(function(){
			return confirm("你确定注销吗");
				
			});  

	$(".tabBox .tabNav li").click(function(){
		$(this).siblings("li").removeClass("now");
		$(this).addClass("now");
		$(this).parents(".tabBox").find(".tabCont").css("display","none");
		var i=$(this).index();
		$(this).parents(".tabBox").find(".tabCont:eq("+i+")").css("display","block");
		//console.log(i);
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
            	<c:if test="${falg==2}">
        		<label id="label">${businesser.b_name}:您好</label><a class="p" href="../CommCon/userMain">注销</a>
        		</c:if>            
            </div>
            <ul class="clearfix">
            	<li class="now"><a href="../CommCon/carriermain">首页</a></li>           	
            	<li><a href="../CommCon/carrierperson">个人信息</a></li> 
                <li ><a href="../CommCon/carrierdeal">业务消息</a></li>
                <li ><a href="../CommCon/carrierinquiry">物流管理</a></li>
                <li ><a href="../CommCon/carriertouser">通知用户</a></li>
                <li><a href="../CommCon/carriernews">消息发布</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
<!--中间部分-->
<div class="main">
	<div class="book">
    	<!--盒子1-->
    <div class="box_1 clearfix">
    	<div class="box_1_l">
         <a href="../CommCon/Map" id="userbook">路径查找<img src="../images/icon2.png"/></a>
        	<a href="../CommCon/webbus" >网点查询<img src="../images/icon2.png"/></a>
        	<a href="../CommCon/follow" >货物追踪<img src="../images/icon2.png"/></a>
        	<!-- <a href="../CommCon/businesser" >承运商申请<img src="../images/icon2.png"/></a> --> 
        	
           <!-- <a href="carrier.html" class="a_2">承运商申请<img src="../images/icon2.png"/></a>-->
        </div>
       
        <div class="banner">
        	<!-- 代码 开始 -->
            <div id="hotpic">
                <div id="NewsPic">
               
                    <a target="_blank" href="" style="visibility: visible; display: block;">
                        <img src="../upload/banner.jpg" class="Picture" alt="" /></a>
                    <a style="visibility: hidden; display: none;" target="_blank" href="">
                       <img src="../upload/w2.jpg" class="Picture" alt="" /></a>
                    <a style="visibility: hidden; display: none;" target="_blank" href="">
                        <img src="../upload/w3.jpg" class="Picture" alt="" /></a>
                    <a style="visibility: hidden; display: none;" target="_blank" href="">
                        <img src="../upload/w5.jpg" class="Picture" alt="" /></a>
                    <a style="visibility: hidden; display: none;" target="_blank" href="">
                        <img src="../upload/w6.jpg" class="Picture" alt="" /></a>
                    <a style="visibility: hidden; display: none;" target="_blank" href="">
                        <img src="../upload/w7.jpg" class="Picture" alt="" /></a>
                    <div class="Nav">
                        <span class="Norma1">6</span>
                        <span class="Norma1">5</span>
                        <span class="Norma1">4</span>
                        <span class="Norma1">3</span>
                        <span class="Norma1">2</span>
                        <span class="Norma1">1</span>
                    </div>
                    
                   
                </div>
            </div>
            <div class="banner1">
            	 <img src="../img/shouji.png"  id="shouji"/>
            </div>
            
            
          
            <script type="text/javascript">
                $('#hotpic').liteNav(1500);
                
            </script>
            <!-- 代码 结束 -->
        </div>
    </div>
    <!--盒子1-->
    <div class="space_hx">&nbsp;</div>
    <!--盒子2-->
    <!--<div class="box_2">
    	<div class="tabBox_t">
            <div class="tabBox">-->
           	<img src="../img/bej.png"  height="150px" width="960px"/>
             
        <!--</div>
    </div>-->
    <!--盒子2-->
    <div class="space_hx">&nbsp;</div>
    <!--盒子3-->
    <div class="box_3 clearfix">
    	<div class="box_3_l">
        	<div class="box_head">
            	<span>公告信息</span>
                <a href=""><img src="../images/more.png" /></a>
            </div>
            <ul id="mainul1">
            	
            </ul>
        </div>
        <div class="box_3_r">
        	<div class="box_head">
            	<span>活动信息</span>
                <a href=""><img src="../images/more.png" /></a>
            </div>
            <!--开始-->
              
              
        
            <div class="box16 clearfix">
            	<div class="xin">
            		
                <ul id="mainul2">
                    
                 
                </ul>
              </div>
            </div>
            <!--结束-->
        </div>
    </div>
    <!--盒子3-->
  <div class="space_hx">&nbsp;</div>
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
       
    </div>	
</div>
<!--底部-->
</body>
</html>