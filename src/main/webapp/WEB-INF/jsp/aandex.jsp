<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../CommCon/insert" method="post">
	订单号：<input type="text" name="p2_Order"readonly="readonly" value="09876" /><br/>
	金　额：<input type="text" name="p3_Amt" readonly="readonly" value="1"/><br/>
	选择银行：<br/>
	<input type="radio" name="pd_FrpId" value="ICBC-NET"/>工商银行
	<img src="<c:url value='../bank_img/icbc.bmp'/>" align="middle"/>
	
	<input type="radio" name="pd_FrpId" value="BOC-NET"/>中国银行
	<img src="<c:url value='../bank_img/bc.bmp'/>" align="middle"/><br/><br/>
	
	<input type="radio" name="pd_FrpId" value="ABC-NET"/>农业银行
	<img src="<c:url value='../bank_img/abc.bmp'/>" align="middle"/>
	
	<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
	<img src="<c:url value='../bank_img/ccb.bmp'/>" align="middle"/><br/><br/>
	
	<input type="radio" name="pd_FrpId" value="BCC-NET"/>交通银行
	<img src="<c:url value='../bank_img/bcc.bmp'/>" align="middle"/><br/><br/>

	<input type="radio" name="pd_FrpId" value="CMBC-NET-B2C"/>民生银行
	<img src="<c:url value='../bank_img/cmbc.bmp'/>" align="middle"/>
	
	
		<input type="radio" name="pd_FrpId" value="NANJING-NET"/>南京银行
	<img src="<c:url value='../bank_img/nanjing.bmp'/>" align="middle"/><br/><br/>
	
	<input type="radio" name="pd_FrpId" value="SH-NET"/>上海银行
	<img src="<c:url value='../bank_img/sh.bmp'/>" align="middle"/><br/><br/>
	
	
	<INPUT TYPE="radio" NAME="pd_FrpId" value="CMBCHINA-NET-B2C">招商银行 
   <INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET-B2C">工商银行
	<INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET-B2C">农业银行
	<INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET-B2C">建设银行 
			
			
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="CMBC-NET-B2C">中国民生银行总行
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET-B2C" >光大银行 
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET-B2C">交通银行
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET-B2C">深圳发展银行
			
			
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET-B2C">北京银行
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET-B2C">兴业银行 
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET-B2C">上海浦东发展银行 
			  <INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET-B2C">中信银行
			
	
	<input type="submit" value="确认支付"/>
</form>
</body>
</html>