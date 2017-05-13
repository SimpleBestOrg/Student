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
		height: 700px;
		margin-left: 730px;
	}
	<!-- 浮动塌陷 -->
	.clear{
  clear:both;
}
.pre-size{
	font-size: 18px;
	display: block;
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
</style>
<body>

<div class="header">
  <div class="main">
     <div class="nav" style="margin-left:-50px;">
      <a  href="${path}/squestion.action">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="${path}/getAllCommunity.action">
        <i  class="layui-icon">&#xe600;</i>社团
      </a>
      <a href="${path}/front/activity/activityindex.jsp">
        <i  class="layui-icon">&#xe62e;</i>活动 
      </a>
      <a  href="${path}/front/talking/talkingindex.jsp">
        <i  class="layui-icon">&#xe606;</i>说说
      </a >
      <a href="${path}/queryFriendsInfo.action">
        <i  class="layui-icon">&#xe613;</i>朋友
            
      </a>  
    </div>
    
    <div class="nav-user">      
      <a class="avatar" >
        <img src="/pic/${loginStudent.studentPhoto}">
        <cite>${loginStudent.studentName}</cite>
        <i>${loginStudent.studentClasses.className}</i>
         
      </a>
      <div class="nav">
        <a href="/Student/front/user/set.jsp"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href=""><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>


<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
      <div class="fly-panel detail-box">
      <p class="p-img" class="avatar">
      <div id="divcss5" class="p-img"><img src="${path}/front/image/41.jpg" /></div> 
        <h1 class="p-img" style="margin-left: 50px;">${listCommunity.communityName}</h1>
        <button class="layui-btn" style="margin-left:600px; margin-top:-70px;" onclick="communityAppli(${listCommunity.communityId})">申请入团</button>
          <pre class="pre-size">
	<span>人数：	   ${listCommunity.communityPersonNum }</span>
	<span>负责人：	   ${listCommunity.communityTeacherID.teacherName }</span>
	<span>创建日期：  ${listCommunity.communityCreateDate }</span>
	<span>申请人：    ${listCommunity.communityAppliStudent.studentName }</span>
	<span>职责：      ${listCommunity.communityAppliRespon }</span>
</pre>
        </div>
        <div class="detail-body photos" >
           
        </div>
      </div>
</div>

<div class="right">
    <img src="/pic/hj1.jpg" style="margin-top:-700px;width:480px;height:700px;"></img>
    
</div>
</div>
 <script src="${path}/front/res/layui/layui.js"></script>
<script type="text/javascript">
 	function communityAppli(community){
 			alert(community);
 			window.location.href="${path}/InsertAppli.action?id="+community;
 	}
</script>
</body>
</html>