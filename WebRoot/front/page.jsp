<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="layui/layui.css" rel="stylesheet" type="text/css" />
    <script src="layui/layui.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
 <div id="demo7"></div> 
</body>
<script type="text/javascript">
layui.use(['laypage', 'layer'], function(){
	  var laypage = layui.laypage
	  ,layer = layui.layer;
            laypage({
                cont: 'demo7'
                ,pages: 100
                ,skip: true
              });
});        
</script>
</html>