<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>消息业务</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link href="../css/style.css" rel="stylesheet" type="text/css" />

<script src="../js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
<link href="../css/layer.css" rel="stylesheet"  type="text/css" id="layui_layer_skinlayercss" />
<script src="../js/layer.js" type="text/javascript"></script> 


<!--<link rel="stylesheet" type="text/css" href="../css/thems.css"/>-->
<style type="text/css">
 .xiu{
     background-color: #F4A460;
	color: white;
	border-radius:10px;
	padding-left: 10px;
	padding: 7px;
   }
   .xiu:hover{
     
	 background-color: #FFB90F;
	
   }
   
 select{
  width:200px;
  height:30px;
  margin-bottom: 65px;
  border: 1px solid gold;
 }
 option{
 height:30px;
 border: 1px solid gold;
 }
	.book{
		height: 500px;
		width: 976px;
		border: 1px solid gold;
		/*background: url(../img/qq1.png);*/
		background-position: 0% 19%;
		margin-top: 40px;}

		#layertab{
			 display:none; 
			 height:200px;
			 width:650px ; 
			}
			.bgc{
			background-color: #EEEEEE;
			float:left;
			width:90px;
			height:30px;
			padding-top: 20px;
			}
			td{
		
		
			}
			input{
			border-radius:9px;
			
			}
			body .demo-class .layui-layer-title{background:#FFCC66; color:white;}
			#label{
	
	padding:4px;
	background-color:#FFCC66 ;
	color: white;
	border-radius: 6px;
	font-size: 1.34em;
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
	
 a();
 $("#fontpage2").html(CurrPage);
 $("#selectbutton").click(function(){
	 a();
	 $("#fontpage2").html(CurrPage);
 })
 });
 
 
	
	function a(){
		
		var path="../deal/getSelectBus";
		var app = $('input:radio[name="apply"]:checked').val(); 		
		var name=$("#b_deal").val();
		
		$.post(path,{"app":app,"name":name},function(data){	
			 Count=data.length;//总数量
			 CountPage=Math.ceil(Count/6);
 			 $("#fontpage1").html(CountPage);
		var string="<thead><tr><th>序号</th><th>订单号</th><th>货物重量</th><th>总价</th><th>发货人姓名</th><th>收货人姓名</th><th>申请时间</th><th>运输状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
			for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){	
				if(i<=Count-1&&i>=0){
				var num=i+1;
			    var id=data[i].d_id;				
				var d_number=data[i].d_number;
				var d_weight=data[i].d_weight;
				var d_price=data[i].d_price;
				var d_fromname=data[i].d_fromname;
				var d_toname=data[i].d_toname;
				var d_time=data[i].d_time;	
				var d_state=data[i].d_state;
				var look="<td class=look id="+id+"><font class=xiu>查看</font></td>";
				var update="<td class=update id="+id+"><font class=xiu>物流状态</font></td>";
				var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
				string+="<tbody><tr><td>"+num+"</td><td>"+d_number+"</td><td>"+d_weight+"</td><td>"+d_price+"</td><td>"+d_fromname+"</td><td>"+d_toname+"</td><td>"+d_time+"</td><td>"+d_state+"</td>"+look+update+delet+"<tr></tbody>";						
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
 		var path="../deal/getIdDeal";
 		$.post(path,{"id":id},function(data){	
 			
 			 var d_number=data.d_number	
 			 $("#d_number").val(d_number);
 			 var d_state=data.d_state;
 			$("#d_state").val(d_state);
 			 var d_weight=data.d_weight; 
 			$("#d_weight").val(d_weight);			
 			 var d_price=data.d_price;
 			$("#d_price").val(d_price);			
			 var d_frommail=data.d_frommail;
			 $("#d_frommail").val(d_frommail);			 
			 var d_fromname=data.d_fromname;
			 $("#d_fromname").val(d_fromname);			 
			 var d_fromphone=data.d_fromphone;
			 $("#d_fromphone").val(d_fromphone);			 
			 var d_fromtelephone=data.d_fromtelephone;
			 $("#d_fromtelephone").val(d_fromtelephone);			 
			 var d_fromaddress=data.d_fromaddress;
			 $("#d_fromaddress").val(d_fromaddress);	
			 var d_tomail=data.d_tomail;	
			 $("#d_tomail").val(d_tomail);
			 var d_toname=data.d_toname;
			 $("#d_toname").val(d_toname);		 
			 var d_tophone=data.d_tophone;
			 $("#d_tophone").val(d_tophone);		 
			 var d_totelephone=data.d_totelephone;
			 $("#d_totelephone").val(d_totelephone);			 
			 var d_toaddress=data.d_toaddress;
			 $("#d_toaddress").val(d_toaddress);		 
			 var d_time=data.d_time;
			 $("#d_time").val(d_time);			 
			 var d_remark=data.d_remark;
			 $("#d_remark").val(d_remark);
			  layer.open({
				  type: 1 //Page层类型
				   ,area: '1000px' 
				  ,skin: 'demo-class'
			      ,offset: ['90px', '170px']
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
 				var falg=confirm("你确定要改变状态吗？");
 				if(falg==false){
 					return false;
 				}else{
	                   layer.open({						
						type:1,
						title:'提示框',
						skin: 'demo-class',
						/* area:['200px','200px'], */
						/* offset: ['200px', '400px'], */
						shade: 0.2,
						content:'请选择: <select name="getup" id="getup"><option >待接收</option><option >运输中</option><option >到站</option></select>',
						btn:['确认','取消'],
						yes:function(index, layero){
							var appval=$("#getup").val();						
							var paths="../deal/updateState";
							$.post(paths,{"id":id,"d_state":appval},function(data){
								 Count=data.length;//总数量
								 CountPage=Math.ceil(Count/6);
					 			 $("#fontpage1").html(CountPage);
								var string="<thead><tr><th>序号</th><th>订单号</th><th>货物重量</th><th>总价</th><th>发货人姓名</th><th>收货人姓名</th><th>申请时间</th><th>运输状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
								for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
									if(i<=Count-1&&i>=0){
									var num=i+1;
								    var id=data[i].d_id;				
									var d_number=data[i].d_number;
									var d_weight=data[i].d_weight;
									var d_price=data[i].d_price;
									var d_fromname=data[i].d_fromname;
									var d_toname=data[i].d_toname;
									var d_time=data[i].d_time;	
									var d_state=data[i].d_state;
									var look="<td class=look id="+id+"><font class=xiu>查看</font></td>";
									var update="<td class=update id="+id+"><font class=xiu>物流状态</font></td>";
									var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
									string+="<tbody><tr><td>"+num+"</td><td>"+d_number+"</td><td>"+d_weight+"</td><td>"+d_price+"</td><td>"+d_fromname+"</td><td>"+d_toname+"</td><td>"+d_time+"</td><td>"+d_state+"</td>"+look+update+delet+"<tr></tbody>";						
								}}
		 						$(".tablelist").html(string);						
		 					},"json");
							
						    layer.close(index);   
						},
						cancel:function(index){							
						}
					});
	
 				}			
	});	
});	
	
	
	
$(function(){
	$(".tablelist").on("click",".delete",function(){	
 		var id=$(this).attr("id");			
 		var falg=confirm("你确定删除吗");
 				if(falg==false){
 					return false;
 				}else{
 					var paths="../deal/deleteDeal";
 					$.post(paths,{"id":id},function(data){
 						 Count=data.length;//总数量
 						 CountPage=Math.ceil(Count/6);
 			 			 $("#fontpage1").html(CountPage);
 						var string="<thead><tr><th>序号</th><th>订单号</th><th>货物重量</th><th>总价</th><th>发货人姓名</th><th>收货人姓名</th><th>申请时间</th><th>运输状态</th><th>操作A</th><th>操作B</th><th>操作C</th></tr></thead>";
						for(var  i=6*(CurrPage-1);i<=6*CurrPage-1;i++){
							if(i<=Count-1&&i>=0){
							var num=i+1;
						    var id=data[i].d_id;				
							var d_number=data[i].d_number;
							var d_weight=data[i].d_weight;
							var d_price=data[i].d_price;
							var d_fromname=data[i].d_fromname;
							var d_toname=data[i].d_toname;
							var d_time=data[i].d_time;	
							var d_state=data[i].d_state;
							var look="<td class=look id="+id+"><font class=xiu>查看</font></td>";
							var update="<td class=update id="+id+"><font class=xiu>物流状态</font></td>";
							var delet="<td class=delete id="+id+"><font class=xiu>删除</font></td>";
							string+="<tbody><tr><td>"+num+"</td><td>"+d_number+"</td><td>"+d_weight+"</td><td>"+d_price+"</td><td>"+d_fromname+"</td><td>"+d_toname+"</td><td>"+d_time+"</td><td>"+d_state+"</td>"+look+update+delet+"<tr></tbody>";						
						}}
 						$(".tablelist").html(string);
 										
 					},"json");
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
            	<c:if test="${falg==2}">
        		<label id="label">${businesser.b_name}:您好</label><a class="p" href="../CommCon/userMain">注销</a>
        		</c:if>
            </div>
            <ul class="clearfix">
            	<li ><a href="../CommCon/carriermain">首页</a></li>           	
            	<li><a href="../CommCon/carrierperson">个人信息</a></li> 
                <li class="now"><a href="../CommCon/carrierdeal">业务消息</a></li>
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
    	 <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">业务信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
   <ul class="prosearch">
   <li><label id="ddd">交易状态：</label>
   <input class="apply" name="apply" type="radio" value='待接收'  />&nbsp;待接收&nbsp;&nbsp;
   <input class="apply" name="apply" type="radio" value='运输中' />&nbsp;运输中&nbsp;&nbsp;
   <input class="apply" name="apply" type="radio" value='到站' />&nbsp;到站&nbsp;&nbsp;
   <input class="apply" name="apply" type="radio" value=""  checked="checked"/>&nbsp;全部</li>
   <li><label>查询：</label><i>订单号</i><input name="b_deal" type="text" class="scinput" id="b_deal" value=""/>&nbsp;&nbsp;<input name="" type="button" class="sure" value="查询" id="selectbutton"/></li>
   
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
			<tr><td class="bgc">订单号:</td><td ><input name="d_number" type="text" id="d_number" class="scinput"/></td>
			<td class="bgc">发货人姓名:</td><td ><input name="d_fromname" type="text" id="d_fromname" class="scinput"/></td>
			<td class="bgc">发货人地址:</td><td><input name="d_fromaddress" type="text" id="d_fromaddress" class="scinput"/></td>
			<td class="bgc">收货人邮箱:</td><td ><input name="d_tomail" type="text" id="d_tomail" class="scinput"/></td></tr>
			
			
			<tr><td class="bgc">交易状态:</td><td ><input name="d_state" type="text" id="d_state" class="scinput"/></td>
			<td class="bgc">发货人手机号:</td><td ><input name="d_fromphone" type="text" id="d_fromphone" class="scinput"/></td>
			<td class="bgc">收货人姓名:</td><td ><input name="d_toname" type="text" id="d_toname" class="scinput"/></td>
			<td class="bgc">收货人地址:</td><td ><input name="d_toaddress" type="text" id="d_toaddress" class="scinput"/></td></tr>
			
			
			<tr><td class="bgc">货物重量:</td><td ><input name="d_weight" type="text" id="d_weight" class="scinput"/></td>
			<td class="bgc">发货人电话:</td><td ><input name="d_fromtelephone" type="text" id="d_fromtelephone" class="scinput"/></td>
			<td class="bgc">收货人手机号:</td><td ><input name="d_tophone" type="text" id="d_tophone" class="scinput"/></td>
			<td class="bgc">时间:</td><td ><input name="d_time" type="text" id="d_time" class="scinput"/></td></tr>
			
			
			<tr><td class="bgc">货物价格:</td><td ><input name="d_price" type="text" id="d_price" class="scinput"/></td>
			<td class="bgc">发货人邮箱:</td><td ><input name="d_frommail" type="text" id="d_frommail" class="scinput"/></td>
			<td class="bgc">收货人电话:</td><td ><input name="d_totelephone" type="text" id="d_totelephone" class="scinput"/></td>
			<td class="bgc">备注:</td><td ><input name="d_remark" type="text" id="d_remark" class="scinput"/></td></tr>			
	</table>
    	   
  
   
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