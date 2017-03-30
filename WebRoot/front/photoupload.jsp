<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试上传图片(单个图片上传)页面 测试  记住 测试  后 可删除</title>
</head>
<body>	
	   <form method="post" action="${pageContext.request.contextPath}/insertPhoto.action" enctype="multipart/form-data">
		  <input type="file" name="items"/>
		  <input type="submit" value="提交"/>
	   </form>	
</body>
</html>