<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网站地图</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<style type="text/css">
	#baiMap{
			float: left;
			width: 500px;
			height: 600px;			
		}
		#r0{margin-left: 15px;
		  margin-top: 20px;
			float: left;			
			height: 40px;
			/*border: 1px solid gold;*/
			
			
		}
		  #searchResultPanel{
			overflow: auto;		    	
			margin-left: 15px;		  
			float: left;
			width: 450px;
			height: 536px;						
		}
		#suggestId{
			height:30px;
			border-radius: 7px;
		}
		#queding{
			border-radius: 7px;
			padding: 3px;
			
		}
		#button{
			border-radius: 7px;
			padding: 6px;
		}
</style>
<style type="text/css">
	
	label{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	}
	
	
</style>

<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=a6WHhd9W51irGbedG9TVs8n09O9e5FZ3"></script>
<script type="text/javascript">
$(function(){
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
        		<a href="../manager/">管理员登录</a> 
        		</c:if>
        		<c:if test="${falg==2}">
        		<label>${businesser.b_name}:您好</label><a class="p" href="../CommCon/back">注销</a>
        		</c:if>
            </div>
            <ul class="clearfix">
            	<li ><a href="../CommCon/carriermain">首页</a></li>           	
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
<div class="main clearfix">
   <div id="d_main">
   	   <div id="baiMap"></div>	
		
		<div id="r0">网点查询: <input type="text" value="" id="suggestId"/>
		<button id="button">确定</button>
		</div>
		
		<div id="searchResultPanel">
			
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
        
    </div>	
</div>
<!--底部-->
</body>


  <script type="text/javascript">
  var s;
  $(function(){
  	$("#button").click(function(){
  		 s=$("#suggestId").val();
  		 var local = new BMap.LocalSearch(map, {
	     renderOptions: {map: map, panel: "searchResultPanel"}
	});
	local.search(s);
  	});
  });
  var cityName;
  var map = new BMap.Map("baiMap");
  map.enableScrollWheelZoom();
 /*  var myCity = new BMap.LocalCity();
	myCity.get(myfun); */
//	var point = new BMap.Point(116.331398,39.897445);
//	map.centerAndZoom(point,12);

/* 	function myfun(result){
		 cityName = result.name;
		map.setCenter(cityName);
		map.centerAndZoom(cityName,12);
		alert("当前定位城市:"+cityName);
		
	} */
	map.centerAndZoom("合肥",12); 
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			
			alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
	

</script>
</html>


	