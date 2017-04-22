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
<!-- 这是申请部门的模态框 -->
<div>
	
</div>

<div class="main layui-clear">
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a class="tab-this">全部社团</a>
          <a onclick="myCommunityDetail(1)">我的社团</a> 
          <a href="">申请建立社团</a>
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
			//传的是社团详细的ID，上面用onclick调用
		  function communityDetail(communityId){
				 window.location.href="${path}/getCommunity.action?id="+communityId;
			}
		  function myCommunityDetail(stuId){
			  alert(stuId);
			  window.location.href="${path}/getCommunity.action?stuId="+stuId;
		  }	 
		
			
</script>
</body>
</html>