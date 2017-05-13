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
  <title>活动</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${path}/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="${path}/front/res/css/global.css">
  <link rel="stylesheet" href="${path}/front/res/layui/layui.js">
 
</head>
 <style type="text/css">
	.fly-list-li{
	float:left;	
}

.clear{
  clear:both;
}
	.style-button{
		margin-top:220px;
		margin-left:70px;
	}
#communityInsert{
	display: none;
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
<!-- 这是申请部门的模态框 -->
<div>
	
</div>

<div class="main layui-clear">
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a class="tab-this">全部社团</a>
          <a onclick="myCommunityDetail()">我的社团</a> 
          <a href="">我的消息</a>
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
        <div>
        	<button onclick="applyCommunity()" class="layui-btn jie-add">申请部门</button>
        </div>
      </div>
    <div class="front" style="width:90%;height:auto;border:1px solid red;overflow: hidden;">
    	<c:forEach items="${listCommunity}" var="list">
      <div style="border:1px solid red;width:230px;height:250px;float:left;margin-left:80px;margin-bottom: 30px;">
      		<div  style="border:1px solid black;widht:198px;height:200px;"></div>
      		<button class=" layui-btn" style="width:230px;height:50px;" onclick="communityDetail(${list.communityId})">${list.communityName }</button>
      </div>
      </c:forEach>
    </div>
    <div class="clear"></div>
    
      <!-- <div class="fly-none">并无相关数据</div> -->
      <div style="text-align: center">
        <div class="laypage-main"><span class="laypage-curr">1</span><a href="/jie/page/2/">2</a><a href="/jie/page/3/">3</a><a href="/jie/page/4/">4</a><a href="/jie/page/5/">5</a><span>…</span><a href="/jie/page/148/" class="laypage-last" title="尾页">尾页</a><a href="/jie/page/2/" class="laypage-next">下一页</a></div>
      </div>
    </div>
  </div>
</div>
<form class="layui-form" action="InsertCommunity.action" method="post"  id="communityInsert">
	<div>
		<input type="text" name="studentId" value="2"/>
	</div>
  <div class="layui-form-item">
    <label class="layui-form-label">名称</label>
    <div class="layui-input-block">
      <input type="text" name="communityName" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">人数</label>
    <div class="layui-input-block">
      <input type="text" name="communityPersonNum" required  lay-verify="required" placeholder="请输入人数" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">老师</label>
    <div class="layui-input-block">
      <input type="text" name="teacherId" value="88888" required  lay-verify="required" placeholder="请输入老师名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">申请原因</label>
    <div class="layui-input-block">
      <textarea name="communityAppliReason" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
    <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">职责</label>
    <div class="layui-input-block">
      <textarea name="communityAppliRespon" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div style="margin-left: 70px;">
  	<input type="file" name="file"  class="layui-upload-file">
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
  <script src="${path}/front/res/layui/layui.js"></script>
<script  type="text/javascript">
	
			layui.use('upload', function(){
				layui.upload({
					  	  url: '/Student/insertPhoto.action'
						  ,success: function(res){
						    console.log(res); //上传成功返回值，必须为json格式
						  }
						});
			}); 	
		function applyCommunity(){
			layui.use('layer', function(){
				  var layer = layui.layer
				  ,$  = layui.jquery;
					//页面层
					layer.open({
					  type: 1,
					  skin: 'layui-layer-rim', //加上边框
					  area: ['500px', '550px'], //宽高
					  content:  $('#communityInsert')
					});
				}); 
		}	
			//传的是社团ID，上面用onclick调用
		  function communityDetail(communityId){
				 window.location.href="${path}/getCommunity.action?id="+communityId;
			}
		  function myCommunityDetail(){
			  window.location.href="${path}/queryById.action";
		  }	 
		
			
</script>
</body>
</html>