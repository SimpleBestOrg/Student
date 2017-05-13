<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>我的问题</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="/Student/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="/Student/front/res/css/global.css">
</head>
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
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a href="squestion.action">全部</a>
          <a href="#" class="tab-this">我的问题</a>
          <a href="typeQuestion.action?typeId=1" style="width:100px;">
          <select lay-verify="required" name="quesetionTypeId.quesetionTypeId" id="quesetionTypeId" style="display:inline-block;height:36px;width:100px;border-radius: 5px;border-color: initial;color: initial; border-color: rgb(169, 169, 169); white-space: pre;">
          <c:forEach items="${questiontype}" var="questiontype">
          	<option value="${questiontype.quesetionTypeId}">${questiontype.quesetionTypeName}</option>
          </c:forEach>
          </select></a>
       </span>
        <form action="questiondim.action" method="post" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input  name="contenTitle" id="contenTitle" class="layui-input"  autocomplete="off" placeholder="搜索内容，回车跳转" type="text" >
        </form>
        <a href="selecall.action" class="layui-btn jie-add">发表问题</a>
      </div>
      <ul class="fly-list">
       <c:forEach var="s" items="${stuquestion}">
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="../../res/images/avatar/default.png" alt="${s.stu_Photo}">
          </a>
          <h2 class="fly-tip">
            <a href="questionselect.action?qid=${s.question_Id}"><c:out value="${s.question_Title}"></c:out></a>
            <span class="fly-tip-stick">置顶</span>
            <span class="fly-tip-jing">精帖</span>
          </h2>
          <p>
            <span><a href="user/home.html">${s.stu_Name}</a></span>
            <span>${s.question_DataTime}</span>
            <span>${s.que_typeName}</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="赞">&#xe60c;</i>赞 ${s.question_step}
              <i class="iconfont" title="踩">&#xe60b;</i>踩 ${s.question_praise}
            </span>
          </p>
        </li>
        </c:forEach>
      </ul>
      <div style="text-align: center">
        <div class="laypage-main">
        	<span class="laypage-curr">1</span>
        	<a href="/jie/page/2/">2</a>
        	<a href="/jie/page/3/">3</a>
        	<a href="/jie/page/4/">4</a>
        	<a href="/jie/page/5/">5</a>
        	<span>…</span>
        	<a href="/jie/page/148/" class="laypage-last" title="尾页">尾页</a>
        	<a href="/jie/page/2/" class="laypage-next">下一页</a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/">layui.com</a></p>
  <p>
    <a href="http://fly.layui.com/auth/get" target="_blank">产品授权</a>
    <a href="http://fly.layui.com/jie/8157.html" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461.html" target="_blank">微信公众号</a>
  </p>
</div>
<script src="/Student/front/res/layui/layui.js"></script>
<script>
		layui.use('form', function(){
			  var form = layui.form();
			});
</script>
</body>
</html>