<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>申请活动页面</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="/Student/front/res/layui/css/layui.css">
   <link rel="stylesheet" type="text/css" href="/Student/front/imageUpload/css/preview.css" />
  <link rel="stylesheet" type="text/css" href="/Student/front/imageUpload/css/style.css">
  <link rel="stylesheet" href="/Student/front/res/css/global.css">
  <link rel="stylesheet" href="/Student/front/imageUpload/css/ssi-uploader.css"/>
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
       <a class="avatar" href="/Student/queryStudentInfoById.action">
        <img src="/pic/${loginStudent.studentPhoto}">
        <cite>${loginStudent.studentName}</cite>
        <i>${loginStudent.studentClasses.className}</i>
      </a>
      <div class="nav">
        <a href="/Student/front/user/set.jsp"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="/Student/logout.action"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>

<div class="main layui-clear">
  <div class="fly-panel" >
    <h2 class="page-title">申请活动</h2>
    
    <!--  <div class="fly-none">并无权限</div>--> 

           <form class="layui-form" style="display:inline-block;" action="/Student/insertApplyActivity.action"  method="post"  >
              <input type="hidden" value=""  id="studentId" name="activityInfo.studentId"/>
              <div class="layui-form-item ptop">
                    <label class="layui-form-label" style="width:200px">活动名称</label>
                    <div class="layui-input-block">
                      <input type="text" name="activityInfo.activityName"  autocomplete="off" placeholder="请输入活动名称" class="layui-input" lay-verify="activityName"  style="width:300px"/>
                    </div>
              </div>
              <div class="layui-form-item" style="margin-top: 15px;">
                <div class="layui-inline">
                  <label class="layui-form-label" style="width:200px">活动类型</label>
                     <div class="layui-input-inline">
                          <select  style="width:200px;height:30px"   name="activityInfo.activityTypeId">
                            <c:forEach items="${activiyType}" var="type">
                                    <option value="${type.activityTypeId}">${type.activityTypeName}</option>
                            </c:forEach>
                          </select>
                     </div>
                </div>
             </div>
                <div class="layui-form-pane " style="margin-top: 15px; margin-left:100px;">
                  <div class="layui-form-item">
                    <label class="layui-form-label">时间选择</label>
                    <div class="layui-input-inline">
                      <input class="layui-input" name="activityInfo.activityBeginTime"  placeholder="开始日期" lay-verify="beginDate" id="LAY_demorange_s"/>
                    </div>
                    <div class="layui-input-inline">
                      <input class="layui-input"   placeholder="截止日期" id="LAY_demorange_e" name="activityInfo.activityEndTime" lay-verify="endDate" />
                    </div>
                  </div>
                </div> 
                 <div class="layui-form-item layui-form-text" >
                    <label class="layui-form-label" style="width:200px">申请原因:</label>
                    <div class="layui-input-block" style="width:100px;" >
                      <textarea placeholder="请输入内容" name="activityInfo.activityAppliReason" class="layui-textarea" style="width:500px" lay-verify="applyreason"></textarea>
                    </div>
                 </div>
                <div class="layui-form-pane " style="margin-top: 15px; margin-left:100px;">
                  <div class="layui-form-item">
                        <input type="file" name="file" class="layui-upload-file" />
                  </div>
                <div id="previewAppend">
                        <!-- 图片预览 -->
                </div> 
                </div> 
                <center>
                    <button class="layui-btn"  lay-submit="demo" onclick="applyActivity()">立即提交</button>
                </center> 
        </form>
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
<script src="/Student/js/jquery-1.8.3.js"></script>
<script>
		$(function(){
        	var stuId = <%=session.getAttribute("stuId")%>;
        	if(stuId==null){
        		window.location="/Student/login.jsp?loginInfo="+1;
        	}
        	$("#studentId").val(stuId);
		})
		   //layui模块
            layui.use(['form','laydate','upload'],function(){
                 var form = layui.form()
                 ,laydate = layui.laydate();
                  var start = {
                    min: laydate.now()
                    ,max: '2099-06-16 23:59:59'
                    ,istoday: false
                    ,format: 'YYYY-MM-DD hh:mm:ss'
                    ,choose: function(datas){
                      end.min = datas; //开始日选好后，重置结束日的最小日期
                      end.start = datas //将结束日的初始值设定为开始日
                    }
                  };
                  layui.upload({
                	  url: '/Student/uploadImage.action'
                	  ,success: function(res){
                		  var imgLength = $("#previewAppend").children('table').length;
                		  if(imgLength>0){
                				$("#tableImg").remove();  
                		  }
                		  $("#previewAppend").append('<table id="tableImg" class="ssi-imgToUploadTable ssi-pending"><tbody><tr><td class="ssi-imgToUpload"> <img class="ssi-imgToUpload" id="previewImg1" src="/pic/'+res.url+'" style="width:140px;height:128px;"/></td></tr><tr><td><button type="button" class="ssi-button error ssi-removeBtn" onclick="removePreviewImg()" id="removeImg"><span  class="trash10 trash" ></span></button></td></tr><tr><td id="iii" id="previewName">'+res.url+'<input type="hidden" name="activityInfo.activityPhoto" value="'+res.url+'"></td></tr></tbody></table>');
                	  }
                	});
                  
                  var end = {
                    min: laydate.now()
                    ,max: '2099-06-16 23:59:59'
                    ,istoday: false
                    ,format: 'YYYY-MM-DD hh:mm:ss'
                    ,choose: function(datas){
                      start.max = datas; //结束日选好后，重置开始日的最大日期
                    }
                  };
                  
                  document.getElementById('LAY_demorange_s').onclick = function(){
                    start.elem = this;
                    laydate(start);
                  }
                  document.getElementById('LAY_demorange_e').onclick = function(){
                    end.elem = this
                    laydate(end);
                  }
                  form.verify({
                	  activityName:function(value){
                		  if(value.length<5 ||  value.length>20){
                			  return "活动名称至少5个字符之多20个字符";
                		  }
                	  },
                	  applyreason:function(value){
                		  if(value.length<30){
                			  return "申请理由至少填写三十个字节";
                		  }
                	  }
                  });
                  form.on('submit(demo)', function(data){
                	  });  
               })
          	
	//删除图片
	function removePreviewImg(){
			 $("#tableImg").remove();
	}  
               
</script>
          
</body>
</html>