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
  <title>帐号设置</title>
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
          <a class="avatar" href="/Student/queryStudentInfoById.action">
            <img src="/pic/<%=student.getStudentPhoto()%>">
            <cite><%=student.getStudentName()%></cite>
            <i><%=student.getStudentClasses().getClassName()%></i>
          </a>
          <div class="nav">
            <a href="/Student/front/user/set.jsp"><i class="iconfont icon-shezhi"></i>设置</a>
            <a href="/Student/logout.action"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
          </div>
      <% } %>
    </div>
  </div>
</div>

<div class="main fly-user-main layui-clear">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="/Student/queryStudentInfoById.action">
        <i class="layui-icon">&#xe609;</i>
                                我的主页
      </a>
    </li>
    <li class="layui-nav-item layui-this">
      <a href="/Student/selectStudentSign.action">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="/Student/front/user/message.jsp">
        <i class="layui-icon">&#xe611;</i>
        我的消息
      </a>
    </li>
  </ul>
  
  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li class="layui-this" lay-id="info">我的签名</li>
        <li lay-id="pass">密码</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-form layui-form-pane layui-tab-item layui-show">
          <form action="/Student/updateStudentSign.action" method="post">
            <div class="layui-form-item layui-form-text">
              <label for="L_sign" class="layui-form-label">签名</label>
              <div class="layui-input-block">
                <input type="hidden" id="stuId" name="stuId" value="${stuId}">
                <textarea placeholder="随便写些什么刷下存在感" id="studentSign"  name="studentSign" autocomplete="off" class="layui-textarea" style="height: 80px;">${StuSign}</textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <button class="layui-btn" lay-submit>确认修改</button>
            </div>
          </form>  
          </div>
          
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <form action="updateStudentPwd.action" id="udpatePwdForm" method="post">
              <div class="layui-form-item">
                <label for="L_nowpass" class="layui-form-label" >当前密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_nowpass" name="nowpass" onblur="verifyNowPwd()" required lay-verify="required" autocomplete="off" class="layui-input">
                  <input type="hidden" id="hiddenPwd" value="${StudentPwd}">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="studentPwd" name="studentPwd" onblur="verifyNewPwd()" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="repwd" name="repwd" onblur="verifyRePwd()" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <input type="button" value="确认修改" id="updatePwd" onclick="updatePwdForm()" class="layui-btn"></input>
              </div>
            </form>
          </div>
          
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
<script src="/Student/js/jquery.min.js"></script>
<script>
$(function(){
	var stuId = <%=session.getAttribute("stuId")%>;
	if(stuId==null){
		window.location="/Student/login.jsp?loginInfo="+1;
	}
})
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '../../res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '/Student/front/res/mods/'
}).extend({
  fly: 'index'
}).use('fly');


layui.use('layer', function(){
	  var layer = layui.layer;
	});    


//提交成功后刷新
/*fly.form['set-mine'] = function(data, required){
  layer.msg('修改成功', {
    icon: 1
    ,time: 1000
    ,shade: 0.1
  }, function(){
    location.reload();
  });
}
*/

/**
 *  验证当前密码
 */
function verifyNowPwd(){
	   var L_nowpass = $("#L_nowpass").val().toString();
	   var hiddenPwd = $("#hiddenPwd").val().toString();
	   if(L_nowpass != hiddenPwd){
		   layer.alert('原密码输入不正确 请重新输入', {
			   skin: 'layui-layer-molv' //样式类名
			   ,closeBtn: 0
			 }, function(index){
				 $("#L_nowpass").val(null);
				 layer.close(index);
			 });
		   return false;
	   }else{
		   return true;
	   }
}
/**
 * 验证新密码格式是否正确
 */
function verifyNewPwd(){
	var newPwd = $("#studentPwd").val().toString();
	if(newPwd.length<6 || newPwd.length>16){
		   layer.alert('新密码格式输入错误 请重新输入', {
			   skin: 'layui-layer-molv' //样式类名
			   ,closeBtn: 0
			 }, function(index){
				 $("#studentPwd").val(null);
				 layer.close(index);
			 });	
		  return false;
	}else{
		return true;
	}
}

/**
 * 验证重复密码输入是否正确
 */
 function  verifyRePwd(){
	var newPwd = $("#studentPwd").val().toString();
	var reNewPwd = $("#repwd").val().toString();
	if(reNewPwd.length<6 || reNewPwd.length>16  || newPwd!=reNewPwd){
			   layer.alert('重复密码输入错误 请重新输入', {
				   skin: 'layui-layer-molv' //样式类名
				   ,closeBtn: 0
				 }, function(index){
					 $("#studentPwd").val(null);
					 $("#repwd").val(null);
					 layer.close(index);
				 });	
			   return false;
	}else{
		return true;
	}
}
/*
 * 点击修改密码验证
 */
function updatePwdForm(){
		if( verifyNowPwd && verifyNewPwd()  && verifyRePwd()){
			$("#udpatePwdForm").submit();
		}
}




</script>

</body>
</html>