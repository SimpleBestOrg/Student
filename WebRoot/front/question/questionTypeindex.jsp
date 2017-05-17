<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>问吧类型</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="/Student/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="/Student/front/res/css/global.css">
</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" href="/" title="Fly">Fly社区</a>
    <div class="nav">
      <a class="nav-this" href="jie/index.html">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="#" target="_blank">
        <i class="layui-icon">&#xe617;</i>社团
      </a>
      <a href="" target="_blank">
        <i class="layui-icon">&#xe633;</i>活动 
      </a>
            <a href="" target="_blank">
        <i class="layui-icon">&#xe611;</i>说说
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
    </div>
  </div>
</div>

<div class="main layui-clear">
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a href="squestion.action">全部</a>
          <a href="stuquestion.action">我的问题</a>
          <a style="width:100px;" class="tab-this">
          <select onchange="questiontype()" lay-verify="required" name="quesetionTypeId.quesetionTypeId" id="quesetionTypeId" style="display:inline-block;height:36px;width:100px;border-radius: 5px;border-color: initial;color: initial; border-color: rgb(169, 169, 169); white-space: pre;">
          	<c:forEach items="${questiontype}" var="questiontype">
          				<option <c:if test="${questiontype.quesetionTypeId==typeId}">selected="selected"</c:if>   value="${questiontype.quesetionTypeId}">${questiontype.quesetionTypeName}</option>
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
       <c:forEach var="questionlist" items="${questionlist}">
		        <li class="fly-list-li">
		          <a href="user/home.html" class="fly-list-avatar">
		            <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0" alt="">
		          </a>
		          <h2 class="fly-tip">	
		            <a href="questionselect.action?qid=${questionlist.question_Id}"><c:out value="${questionlist.question_Title}"></c:out></a>
		            <span class="fly-tip-stick">置顶</span>
		            <span class="fly-tip-jing">精帖</span>
		          </h2>
		          <p>
		            <span><a href="user/home.html">${questionlist.stu_Name}</a></span>
		            <span>${questionlist.question_DataTime}</span>
		            <span>${questionlist.que_typeName}</span>
		            <span class="fly-list-hint"> 
		              <i class="iconfont" title="踩">&#xe60b;</i>赞 ${questionlist.question_step}
              		  <i class="iconfont" title="赞">&#xe60c;</i>评${questionlist.answerCount}
		            </span>
		          </p>
		        </li>
        </c:forEach>
      </ul>
      <div style="text-align: center">
        <div class="laypage-main"><span class="laypage-curr">1</span><a href="/jie/page/2/">2</a><a href="/jie/page/3/">3</a><a href="/jie/page/4/">4</a><a href="/jie/page/5/">5</a><span>…</span><a href="/jie/page/148/" class="laypage-last" title="尾页">尾页</a><a href="/jie/page/2/" class="laypage-next">下一页</a></div>
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
<script src="/Student/jquery-2.1.0.js"></script>
<script type="text/javascript">
		   function questiontype(){
			    var quesetionTypeId = $("#quesetionTypeId").val();
			   	alert(quesetionTypeId);
			    window.location = "typeQuestion.action?typeId="+quesetionTypeId;
		   }
</script>		
</html>