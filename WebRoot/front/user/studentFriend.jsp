 <%@page import="cn.com.zzzy.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
     
      <!-- 登入后的状态 -->
      <%if(session.getAttribute("loginStudent")!=null){ 
            Student student  = (Student)session.getAttribute("loginStudent");
      %>
          <a class="avatar" href="user/index.html">
            <img src="/pic/<%=student.getStudentPhoto()%>">
            <cite><%=student.getStudentName()%></cite>
            <i><%=student.getStudentClasses().getClassName()%></i>
          </a>
          <div class="nav">
            <a href="/Student/front/user/set.jsp"><i class="iconfont icon-shezhi"></i>设置</a>
            <a href="/user/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
          </div>
      <% } %>
    </div>
  </div>
</div>


<div class="main layui-clear">
  <div class="wrap">
    <c:forEach items="${listFriendInfo}" var="friendInfo" >
        <div style="width:680px;height:80px;margin-top:5px;">
            <a>
                    <img src="/pic/${friendInfo.studentPhoto}" style='width:100px;height:78px;'/>
            </a>        
                    <span style="display:block;font-size:20px;margin-top:-75px;margin-left:110px;">${friendInfo.studentName}</span>
                    <span style="margin-left:110px;margin-top:-20px;">班级:${friendInfo.studentClasses.className}</span>
                    <span style="display:block;font-size:15px;margin-left:110px;margin-top:0px;">${friendInfo.studentSignature}</span>
                    <input type="button" style="margin-left:500px;margin-top:-92px;" onclick="stuDetail(${friendInfo.studentId})"  class="layui-btn layui-btn-normal" value="他的主页"></input>
        </div>
     </c:forEach>  
  </div>
  <div class="edge">
    <dl class="fly-panel fly-list-one"> 
    </dl>
    
    <dl class="fly-panel fly-list-one"> 
    </dl>
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
<script src="/Student/js/jquery.min.js"></script>
<script type="text/javascript">
			
			function  stuDetail(stuId){
					window.location.href="/Student/queryStudentInfoById.action?stuId="+stuId;
			}
</script>
</body>

</html>