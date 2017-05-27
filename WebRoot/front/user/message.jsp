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
  <title>我的消息</title>
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
    <li class="layui-nav-item ">
      <a href="/Student/selectStudentSign.action">
        <i class="layui-icon">&#xe620;</i>
                           基本设置
      </a>
    </li>
    <li class="layui-nav-item layui-this">
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

  <div class="fly-panel fly-panel-user" >
      <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
       
        <div  id="LAY_minemsg"  style="margin-top: 10px;">
       
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
        layui.use(['layer'], function(){
        	  var layer = layui.layer;
        	});  
        $('#LAY_delallmsg').on('click', function(){
            var othis = $(this);

          });
        
        $(function(){
        	var stuId = <%=session.getAttribute("stuId")%>;
        	if(stuId==null){
        		window.location="/Student/login.jsp?loginInfo="+1;
        	}
        	var today =new Date();
        	var div ="";
        	$.post("/Student/queryAllMessage.action",function(data){
        		if(data.length>0){
        			$("#LAY_minemsg").before("<button onclick='deleteAllMessage()' style='margin-top:20px;margin-left:20px;' class='layui-btn layui-btn-danger' id='LAY_delallmsg'>清空全部消息</button>");
        			div += "<ul class='mine-msg'>";
        		  $.each(data,function(i,a){
        			div += "<li data-id='123'  style='margin-left:20px;'>";
        			div += "<blockquote class='layui-elem-quote'>";
        			div += a.messageContext;
        			div += "<input type='hidden' id='inty' value='"+a.stuMessageId+"'>"
        			div += "</blockquote>";
        			div += "<p><span>"+((new Date(a.messageTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span><button style='margin-right:10px;' onclick='deleteMessage("+a.stuMessageId+")'  class='layui-btn layui-btn-small layui-btn-danger fly-delete'>删除</button></p>";
        			div += "</li>";
        		  })
        		  div += "</ul>";
        		}else{
        			div +="<div class='fly-none'>您暂时没有最新消息</div>";
        		}
        		$("#LAY_minemsg").html(div);
        	},"json")
        })
        //申请加为好友 同意或者 拒绝   stuId(请求加为好友的学生ID) flag(同意或者拒绝的状态 用来判断)
        function  agreeOrrefuseFriend(stuId,flag,obj){
        	   var messageId =  $(obj).parent().next().val();
        	   $.post("/Student/updateStudentFriendFlag.action",{"studentId":stuId,"stuFriendFlag":flag,"messageId":messageId},function(data){
        		   
        	   },'json')
        	   window.location.reload();
        }
        
        //申请加入社团时   同意或者拒绝
        function  agreeOrRefuseCommunity(communityId,stuId,flag,obj){
        	//消息ID
        	var messageId = $(obj).parent().next().val();
        	$.post("/Student/updateCommunityPeopleFlag.action",{"studentId":stuId,"communityId":communityId,"stuMessageId":messageId,"communityPeoFlag":flag},function(data){
    			alert(data);
    		},'text')
    		window.location.reload();
        }
        
        //申请加入活动时 同意或者拒绝
        function agreeOrRefuseActivity(stuId,activityId,flag,obj){
        	//消息ID
        	var messageId =  $(obj).parent().next().val();
        	//得到活动名称
        	var activityName = $(obj).parent().prev().text();
        	$.post("/Student/updateStudentActivityFlag.action",{"studentsId":stuId,"activityId":activityId,"activityName":activityName,"stuMessageId":messageId,"stuActivityFlag":flag},function(data){
        			alert(data);
        	},'json')
        	window.location.reload();
        }
        
        //删除学生消息
        function  deleteMessage(MessageId){
        		$.post("/Student/deleteMessageByMessId.action",{"stuMessageId":MessageId})
        		window.location.reload();
        }
        
        //清空全部消息
        function  deleteAllMessage(){
            layer.confirm('确定清空吗？', function(index){
        		 $.post("/Student/deleteMessageByStuId.action");
        		 window.location.reload();
        		 layer.close(index);
        	});
        }
        
        
        
</script>

</body>
</html>