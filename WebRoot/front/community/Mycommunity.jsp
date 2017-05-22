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
  <link rel="stylesheet" href="${path}/front/res/css/front.css">
</head>
<style type="text/css">
		.right{
		border: 1px solid red;
		width:480px;
		height: 500px;
		margin-left: 730px;
		background-image: url("/Student/front/image/11.jpg");
	}
	.pre-size{
	font-size: 20px;
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
	.photo-radius2 img{
	border-radius:50%;
	width:100px;
	height: 100px;
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
      <a class="avatar" href="/Student/queryStudentInfoById.action">
        <img src="/pic/${loginStudent.studentPhoto}">
        <cite>${loginStudent.studentName}</cite>
        <i>${loginStudent.studentClasses.className}</i>
         
      </a>
      <div class="nav">
        <a href="selectStudentSign.action"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="/Student/logout.action"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>

<!--  style="width:1169px;"width:1170px; -->
<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
    	  <c:if test="${queryById == null}">
    	      <div class="community-info"><a href="getAllCommunity.action">未参加社团</a></div>
    	  </c:if>
		  <c:if test="${queryById != null }">
	      <div class="fly-panel detail-box">
	      <div id="divcss5" class="p-img"><img src="/pic/${queryById.communityPhoto }" /></div>
	        <h1 class="p-img"  style="margin-left: 50px;">${queryById.communityName}</h1>
	      </div>
            <div class="detail-body photos" style="margin-bottom: 20px;">
        		<pre class="pre-size">
        		<span>人数：    ${queryById.communityPersonNum }</span>
        		<span>创建日期：${queryById.communityCreateDate }</span>
        		<span>申请人：  ${queryById.communityAppliStudent.studentName }</span>
        		<span>职责：   ${queryById.communityAppliRespon }</span>
        		</pre>
		   </div>
        <!-- 显示社团中的所有成员 --><!-- 字段集区块 - 默认风格 -->
        <!--字段集区块，用来判断<fieldset>中是否有值，如果有则显示，如果没有<fieldset>中的所有的内容都不显示 -->
         <% int count=0; %>
         	<c:forEach items="${queryById.communityPeoples}" var="student">
         		<% count = count+1; %>
        	</c:forEach>
        	<c:if test="<%= count > 0%>">
        <fieldset class="layui-elem-field">
          <legend>成员</legend>
          <div class="layui-field-box">
            <div style="display: inline-block;">
               <c:forEach items="${queryById.communityPeoples}" var="student">
                    <div  class="p-img" style="padding-left: 40px;">
                     <div class="photo-radius" class="p-img"><a href="/Student/queryStudentInfoById.action?stuId=${student.student.studentId}"><img src="/pic/${student.student.studentPhoto }" /></a></div>
                      <span style="margin-left: 30px;">${student.student.studentName }</span>
                      </div>
                 </c:forEach>
                 </div>
          </div>
        </fieldset>
        </c:if>
         <!-- 显示社团中所参与的所有活动 --><!-- 字段集区块 - 默认风格 -->
         <!--字段集区块，用来判断<fieldset>中是否有值，如果有则显示，如果没有<fieldset>中的所有的内容都不显示 -->
        <%int count1 = 0; %>
        <c:forEach items="${communityActivity}" var="communityActivity">
        	<% count1 = count1+1; %>
        </c:forEach>
         <c:if test="<%= count1 > 0%>">
        <fieldset class="layui-elem-field">
          <legend>活动</legend>
          <div class="layui-field-box">
              <div class="Activity">
           <c:forEach items="${communityActivity}" var="communityActivity">
              <div  class="p-img" style="padding-left: 40px;">
                <a href="/Student/front/activity/activitydetail.jsp?activityId=${communityActivity.activityId}">
                <div class="photo-radius2"><img src="/pic/${communityActivity.activityPhoto }" /></div>
                <span style="font-size: 16px;margin-left: 10px;">【${communityActivity.activityName }】</span></a>
              </div>
              </c:forEach>
        </div>
          </div>
        </fieldset> 
        </c:if>
<!-- 申请加入社团的反馈信息 -->
<!--字段集区块，用来判断<fieldset>中是否有值，如果有则显示，如果没有<fieldset>中的所有的内容都不显示 -->
		<%int count2 = 0; %>
        <c:forEach items="${selectFlag }" var="selectFlag">
            <c:forEach items="${selectFlag.communityPeoples}" var="Tll">
                    <% count2= count2 +1;%>
            </c:forEach>
        </c:forEach>
        <c:if test="<%= count2 > 0%>">
        <fieldset class="layui-elem-field">
          <legend>申请入团</legend>
            <div>
                <c:forEach items="${selectFlag }" var="selectFlag">
                 <div  class="p-img" style="padding-left: 40px;">
                    <c:forEach items="${selectFlag.communityPeoples}" var="Tell">
                         <div style="display:inline-block;">
                            <div class="photo-radius2" style="margin-left: 20px;"><a href="/Student/queryStudentInfoById.action?stuId=${Tell.student.studentId}"><img src="/pic/${Tell.student.studentPhoto }" /></a></div>
                            <span style="margin-left: 30px;">${Tell.student.studentName}</span>
                            <div>
                                <input type="submit" class="layui-btn" onclick="agreeCommunityPeople(1,${selectFlag.communityId},${Tell.student.studentId},${Tell.stuMessageId})"  value="同意" />
                                <input type="submit" class="layui-btn" onclick="refuseCommunityPeople(2,${selectFlag.communityId},${Tell.student.studentId},${Tell.stuMessageId})"  value="拒绝" />
                                </div>
                        </div>  
                    </c:forEach>
                 </div>
                </c:forEach>
            </div>
            </fieldset>
        </c:if>        
        </c:if>        
      </div>
</div>
<div class="right">
</div>



</div>
 <script src="${path}/front/res/layui/layui.js"></script>
 <script src="${path}/js/jquery.min.js"></script>
 <script type="text/javascript">
         $(function(){
         	var stuId = <%=session.getAttribute("stuId")%>;
         	if(stuId==null){
         		window.location="/Student/login.jsp?loginInfo="+1;
         	}
         })
 		//审批学生是否参加活动
 		function  agreeCommunityPeople(flag,communityId,studentId,stuMessageId){
 			$.post("/Student/updateCommunityPeopleFlag.action",{"studentId":studentId,"communityId":communityId,"communityPeoFlag":flag,"stuMessageId":stuMessageId});
 			window.location.reload();
 		}
 		
 </script>
</body>
</html>