<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script  src="/Student/js/jquery.min.js"></script>
<title>测试json页面  测试之后 可以删除</title>
</head>
<script type="text/javascript">
		function requestjson(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/queryJson.action",
				data:'{"activityName":"同乡会","activityFlag":"0"}',
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					 alert(data);
				}										
			});	
		}
		function  responsjson(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/responseJson.action",
				data:"activityName=同乡会&activityFlag=0",
				success:function(data){
					  alert(data.activityName);
				}
			});
		}

</script>
<body>
	<input type="button" onclick="requestjson()"  value="请求json对象 返回json对象"></input>
	<input type="button" onclick="responsjson()" value="请求key/value 返回json对象"></input>
</body>
</html>