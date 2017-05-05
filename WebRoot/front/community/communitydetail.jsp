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
		background: no-repeat;
		background-image: url("${path}/front/image/11.jpg");
		background-size: 100%;
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
        <div class="detail-body photos" style="margin-bottom: 20px;">
        </div>
      </div>
</div>

<div class="right">
	<!-- 浮动塌陷 -->
	<div class="clear"></div>
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