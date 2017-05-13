<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <h1>${question.quesetionTitle}</h1>
        	<div class="fly-tip fly-detail-hint" data-id="{{rows.id}}">
          <span class="fly-tip-stick">置顶帖</span>
          <span class="fly-tip-jing">精帖</span>
          <span>未结贴</span>
          <input type="hidden" id="questionId" value="${question.quesetionId}"/>
          <div class="fly-list-hint jieda-reply"> 
            <!--  <a href="updateStep.action?questionId=${question.quesetionId}"><span class="jieda-zan"><i class="iconfont icon-zan"></i><em> ${question.questionStep}</em></span></a>
            -->
          </div>
        </div>
        <div class="detail-about">
          <a class="jie-user" href="">
            <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0" alt=" ${question.quesetionStudentId.studentPhoto}">
            <cite>
             	  ${question.quesetionStudentId.studentName}
              <em><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${question.quesetionDateTime}"></fmt:formatDate></em>
            </cite>
          </a>
          <div class="detail-hits" data-id="{{rows.id}}">
            <span class="layui-btn layui-btn-mini jie-admin" type="edit"><a href="/jie/edit/{{rows.id}}">${question.quesetionTypeId.quesetionTypeName}</a></span>
          </div>
        </div>
        <div class="" style="margin-bottom: 20px;">
          <p>${question.quesetionContent}</p>
        </div>
         	<div class="jieda-reply" style="margin-left: 540px;">
         	  <!-- 点赞 调用JavaScript -->
              <a id="step"><span class="jieda-zan"><i class="iconfont icon-zan"></i><em> ${question.questionStep}</em></span></a>
              <span type="reply" id="span"><i class="iconfont icon-svgmoban53"></i>回复</span>
            </div>
      </div>
      <div class="fly-panel detail-box" style="padding-top: 0;">
        <a name="comment"></a>
        <ul class="jieda photos" id="jieda">
    <c:forEach items="${question.questionAnswer}" var="answer">
          <li data-id="12" class="jieda-daan">
            <a name="item-121212121212"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="">
                <img src="../../res/images/avatar/default.png" alt="${answer.student.studentPhoto}">
                <cite>
                  <i>${answer.student.studentName}</i>
                </cite>
              </a>
              <div class="detail-hits">
                <span><fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${answer.quesetionAnswerDateTime}"></fmt:formatDate></span>
              </div>
              <!-- <i class="iconfont icon-caina" title="最佳答案"></i> -->
            </div>
            <div class="detail-body jieda-body">
              <p>${answer.quesetionAnswerContent}</p>
            </div>
            <div class="jieda-reply">
            <!-- 点击获得答案的ID -->
              <span class="pan" id="pan" type="reply">
              	<input type="hidden" class="questionStudnetName" value="${answer.student.studentName}">
              	<input  type="hidden" class="quesetionAnswerId" value="${answer.quesetionAnswerId}"/>
                <i class="iconfont icon-svgmoban53"></i>
              	回复</span>
            </div>
          </li>
      </c:forEach> 
        </ul>
        <div class="layui-form layui-form-pane">
          <form action="insertanswer.action" method="post">
            <div class="layui-form-item layui-form-text">
              <div class="layui-input-block">
                <textarea id="quesetionAnswerContent" name="quesetionAnswerContent" required lay-verify="required" placeholder="我要回答"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
              	<input type="hidden" id="answerQuestionId" name="answerQuestionId" value="${qid}"/>
              	<input type="hidden" id="quesetionAnswerParentId" name="quesetionAnswerParentId" value=""/>
              	<input type="hidden" id="questionName" name="questionName" value=""/>
              </div>
            </div>
            <div class="layui-form-item">
              <input type="hidden" name="jid" value="{{rows.id}}">
              <button class="layui-btn">提交回答</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <div class="edge">
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">最近热帖</dt>
      <c:forEach items="${groupquestion}" var="groupquestion">
	      <dd>
	        <a href="questionselect.action?qid=${groupquestion.question_Id}">${groupquestion.question_Title}</a>
	        <span><i class="iconfont">&#xe60b;</i>${groupquestion.question_step}</span>
	      </dd>
      </c:forEach>
    </dl>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">近期热议</dt>
      <c:forEach items="${comment}" var="comment">
	      <dd>
	        <a href="questionselect.action?qid=${comment.question_Id}">${comment.question_Title}</a>
	        <span><i class="iconfont">&#xe60c;</i> ${comment.count}</span>
	      </dd>
      </c:forEach>
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
<script src="/Student/front/res/layui/layui.js"></script>
<script src="/Student/js/jquery.min.js"></script>
<!-- 点回复获得滑倒底部 -->
<script type="text/javascript">
	<!-- 点回复获得滑倒底部 -->
	$("#span").click(function(){
		/* 获得滑倒底部  */
		document.getElementById("quesetionAnswerContent").scrollIntoView();
		$("#quesetionAnswerParentId").val(null);
		$("#quesetionAnswerContent").val(null);
		/* 获得焦点 */
		$("#quesetionAnswerContent")[0].focus();
	})
	/* 点子回复获取ID姓名 */
	$(".pan").click(function(){
		/* 获得滑倒底部  */
		document.getElementById("quesetionAnswerContent").scrollIntoView();
		/*获取被回复的答案ID*/
		var panid = $(this).parent().parent().find(".quesetionAnswerId").val();
		/* 获取被回复的姓名  */
		var paname = $(this).parent().parent().find(".questionStudnetName").val();
		/* 弹窗(测试用的) */
		alert(panid);
		alert(paname);
		/* 给隐藏框赋值 */
		$("#quesetionAnswerParentId").val(panid);
		/* 给隐藏框赋值  */
		$("#quesetionAnswerContent").val('@'+paname);
		/* 获得焦点 */
		$("#quesetionAnswerContent")[0].focus();
	})
	
	
</script>
<script>
	/* 点赞  */
	 $("#step").click(function(){
		 	/* 得到问题的Id */
		   var questionId =  $("#questionId").val();
		   /* 跳转到updateStep.action方法中并把问题ID传进去 */
		 	$.post("/Student/updateStep.action",{"questionId":questionId},function(data){
		 		alert(data);
		 	},'json');
		   /* 从新刷新页面 */
		   window.location.reload();
	 })
</script>

</body>
</html>