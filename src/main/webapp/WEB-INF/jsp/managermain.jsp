<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线下单后台界面</title>
<script language="JavaScript" src="../js/jquery.js"></script>
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../js/managermain.js"></script>
</head>
<frameset rows="88,*,31" cols="*" frameborder="no" border="0" framespacing="0" id="frame">
  <frame src="../CommCon/top" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="../CommCon/left" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="../CommCon/index" name="rightFrame" id="rightFrame" title="rightFrame" />
  </frameset>
  <frame src="../CommCon/footer" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>

<noframes><body onload = "init()">

<script type="text/javascript">
function init(){
	alert(0);
	debugger;
	var top = window.frames['topFrame'],
	over = top.document.getElementById('over');
	$(over).click(function(){
		var f= confirm("你确定退出吗");
		if(f){
			
			
			//parent.src="../CommCon/userMain";
		}
		else{
			return false;
		}
	});
}
window.onload=init;
</script>
</body></noframes> 


<!-- <frameset rows="88,*,31" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.html" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="left.html" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="index.html" name="rightFrame" id="rightFrame" title="rightFrame" />
  </frameset>
  <frame src="footer.html" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes><body>
</body></noframes> -->
</html>

