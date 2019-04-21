$(function(){
setTimeout(function(){
	
	var top = window.frames['topFrame'],
	over = top.document.getElementById('over');
	$(over).click(function(){
		
		var f= confirm("你确定退出吗");
		if(f){
			window.location.href="../CommCon/userMain";
		}
		else{
			return false;
		}
	});
},1000);
	
})