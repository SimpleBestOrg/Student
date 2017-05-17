<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户主页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
<link rel="stylesheet" href="/Student/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="/Student/front/res/css/global.css">
</head>
<body style="margin-top: 65px;">

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
        <a href="selectStudentSign.action"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href=""><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>

<div class="fly-home" style="background-image: url();height:350px;">
  <img src="/pic/${student.studentPhoto}" >
  <h1>
   	${student.studentName}
    
    <c:if test="${student.studentSex==0}">
        <i class="iconfont icon-nan"></i>        
    </c:if>
    
    <c:if test="${student.studentSex==1}">
        <i class="iconfont icon-nv"></i>
    </c:if>
     
      
  </h1>
  <p class="fly-home-info">
    
    <i class="iconfont icon-shijian"></i><span><fmt:formatDate pattern="yyyy-MM-dd" value="${student.studentBirthday}"></fmt:formatDate></span>
    <i class="iconfont icon-chengshi"></i><span>来自${student.studentAddress}</span>
    <c:if  test="${count==0}">
                    <span><button  class="layui-btn layui-btn-primary layui-btn-small">待审核</button></span>                
    </c:if>
    <c:if  test="${count!=0 && count!=1 && count!=2}">
                    <span><button onclick="addFriend(${student.studentId})" class="layui-btn layui-btn-primary layui-btn-small">加为好友</button></span>
    </c:if>
    <c:if test="${count==2}">
                    <span><button  class="layui-btn layui-btn-primary layui-btn-small">被拒绝</button></span>
    </c:if>
    
  </p>
  <c:if test="${student.studentSignature!=null}">
          <p class="fly-home-sign">(${student.studentSignature})</p>
  </c:if>
  <c:if test="${student.studentSignature==null && student.studentSignature==''}">
          <p class="fly-home-sign">(暂无签名)</p>
  </c:if>
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
<script src="/Student/js/jquery.min.js"></script>
<script  type="text/javascript">
	
		$(function(){
        	var stuId = <%=session.getAttribute("stuId")%>;
        	if(stuId==null){
        		window.location="/Student/login.jsp?loginInfo="+1;
        	}
		})
		//添加好友
		function addFriend(stuId){
		       $.post("/Student/addFriend.action",{"friend":stuId},function(data){},"json");
		       window.location.reload();
		}
</script>

</body>
</html>