<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Fly Template v2.0，基于 layui 的轻量级社区模版</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="/Student/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="/Student/front/res/css/global.css">
</head>
<style type="text/css">
		.right{
		border: 1px solid red;
		width:480px;
		height: 500px;
		margin-left: 730px;
		background: no-repeat;
	 	background-image: url("${path}/front/image/11.jpg");
		background-size: 100%;
		padding-top: -100px;
		
	}
	.pre-size{
	font-size: 18px;
}
	.community-info{
	font-size:30px;
	color: red;
	margin-left:400px;
	margin-top:200px;
}
	.p-img{
	display: inline-block;		
}
	#divcss5{ margin:10px auto} 
	#divcss5 img{ 
	border-radius:50%;
	width:150px;
	height: 200px;
} 
	.photo-radius{
		margin:10px auto;
	}
	.photo-radius img{
	border-radius:50%;
	width:100px;
	height: 100px;
	}
</style>
<body>
<div class="header">
  <div class="main">
    <a class="logo" href="/" title="Fly">Fly社区</a>
    <div class="nav">
      <a class="nav-this" href="index.html">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">
      <!-- 未登入状态 -->
      <a class="unlogin" href="user/login.html"><i class="iconfont icon-touxiang"></i></a>
      <span><a href="user/login.html">登入</a><a href="user/reg.html">注册</a></span>
      <p class="out-login">
        <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
        <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
      </p>   
      
      <!-- 登入后的状态 -->
      <!-- 
      <a class="avatar" href="user/index.html">
        <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0">
        <cite>贤心</cite>
        <i>VIP2</i>
      </a>
      <div class="nav">
        <a href="/user/set/"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="/user/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div> -->
      
    </div>
  </div>
</div>


<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
    	  <c:if test="${queryById == null}">
    	    <div class="community-info"><a href="getAllCommunity.action">未参加社团</a></div>
    	  </c:if>
		  <c:if test="${queryById != null }">
	      <div class="fly-panel detail-box" >
	      <div id="divcss5" class="p-img"><img src="${path}/front/image/41.jpg" /></div>
	        <h1 class="p-img"  style="margin-left: 50px;">${queryById.communityName}</h1>
	          
	      </div>
	  
        <div class="detail-body photos" style="margin-bottom: 20px;">
		<pre class="pre-size">
		<span>人数：    ${queryById.communityPersonNum }</span>
		<span>负责人：  ${queryById.communityTeacherID.teacherName }</span>
		<span>创建日期：${queryById.communityCreateDate }</span>
		<span>申请人：  ${queryById.communityAppliStudent.studentName }</span>
		<span>职责：   ${queryById.communityAppliRespon }</span>
		</pre>
		 </div>
		  </c:if>
      </div>
		<!-- 显示社团中的成员      -->
     <%--   <c:forEach items="${queryById.communityPeoples}" var="student">
       		<div  class="p-img" style="padding-left: 40px;">
		      <span>${student.communityStudentID.studentPhoto }</span><div class="photo-radius" class="p-img"><img src="${path}/front/image/41.jpg" /></div>
		      <span style="margin-left: 30px;">${student.communityStudentID.studentName }</span>
		      </div>
    	 </c:forEach>  --%>
    	
</div>
   <div class="right">
</div>
 <div style="display: inline-block;">
	   <c:forEach items="${queryById.communityPeoples}" var="student">
       		<div  class="p-img" style="padding-left: 40px;">
		      <span>${student.student.studentPhoto }</span><div class="photo-radius" class="p-img"><img src="${path}/front/image/41.jpg" /></div>
		      <span style="margin-left: 30px;">${student.student.studentName }</span>
		      </div>
    	 </c:forEach>
    	 </div>

</div>
 <script src="${path}/front/res/layui/layui.js"></script>
</body>
</html>