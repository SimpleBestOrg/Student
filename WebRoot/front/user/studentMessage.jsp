<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动消息</title>
</head>
<body>
        <span id="info"></span>
</body>
<script src="/Student/js/jquery.min.js"></script>
<script type="text/javascript">
	  $(function(){
		    $.post("/Student/queryAllMessage.action",function(data){
		    	var div ="";
		    	$.each(data,function(i,a){
		    		div+= a.messageContext;
		    	})
		    	$("#info").html(div);
		    });
	  })
</script>
</html>