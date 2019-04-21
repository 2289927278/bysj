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
		#r0{margin-left: 500px;
		  margin-top: 20px;
			/* float: left; */		
			position:absolute;	
			height: 40px;
			/*border: 1px solid gold;*/
			
			
		}
			#r{
			 margin-top: 70px;
				overflow: auto;
			/*border: 1px solid gold;	*/
			margin-left: 15px;		  
			float: left;
			width: 450px;
			height: 530px;
			
		}
		#s,#z{
			height:25px;
			border-radius: 7px;
		}
		#queding{
			border-radius: 7px;
			padding: 3px;
			
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
    	<div class="logo"><a ><img src="../images/logo.png" alt=""/></a></div>
        <div class="menu">
        	<div class="head_top">           	
        		<c:if test="${falg==2}">
        		<label>${businesser.b_name}:您好</label><a class="p" href="../CommCon/userMain">注销</a>
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
		
		<div id="r0">起点:<input type="text" value="" id="s"/>
		终点:<input type="text" value="" id="z"/>
		<input type="button" name="queding" id="queding" value="确定" />
		</div>
		
		<div id="r">
			
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
	var map = new BMap.Map("baiMap");
	map.enableScrollWheelZoom();
//	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
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
	
	
	$(function(){
		$("#s").click(function(){
			var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "s"
		
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
	//	G("r").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
//		G("r").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});
		});
	});
	
	
	
	$(function(){
		$("#z").click(function(){
			var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "z"
		
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
//		G("r").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
//		G("r").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});
		});
	});

	
	$(function(){
		$("#queding").click(function(){
			var s=$("#s").val();
			var z=$("#z").val();
			var walking = new BMap.WalkingRoute(map, {renderOptions: {map: map, panel: "r", autoViewport: true}});
	walking.search(s, z);
		});	
	});
	
	function G(id) {
		return document.getElementById(id);
	}
	
	
	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
//		local.search(myValue);
	}
</script>
</html>