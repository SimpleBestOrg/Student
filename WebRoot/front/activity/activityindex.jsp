<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>活动首页</title>
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
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a id = "friendActivity" onclick="activityPage.friendActivity()" class="tab-this">朋友活动</a>
          <a id = "myJoinActivity" onclick="joinActivity()">我参加的活动</a>
          <a id = "myApplyActivity" onclick="applyActivity('/Student/queryActivityByCondition.action','1')">我申请的活动</a>
          <a >活动消息</a>
          
          
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
        <a href="/Student/queryAllActivityType.action" class="layui-btn jie-add">申请活动</a>
      </div>
      
      <div  id="activity">
            
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

<script src="/Student/js/jquery.min.js"></script>
<script src="/Student/front/res/layui/layui.js"></script>

<script type="text/javascript">
            $(function(){
            	var stuId = <%=session.getAttribute("stuId")%>;
            	if(stuId==null){
            		window.location="/Student/login.jsp?loginInfo="+1;
            	}
            	activityPage.friendActivity();
            });
              //查询朋友活动
            var activityPage = {
            		friendActivity:function(){
            			    $("#friendActivity").addClass("tab-this");
            			    $("#myJoinActivity").removeClass("tab-this");
            			    $("#myApplyActivity").removeClass("tab-this");
            				$.post("/Student/queryAllActivity.action",function(data){
            					var div = "";
            					if(data.length>0){
            		    		 var today =new Date();
            		    		 $.each(data,function(i,a){
            		    			 div += " <div  style='border:1px solid #5DADE2; height:170px; margin-top:10px;'><div  style='width:100%;height:auto;margin-top:10px;margin-left:50px;'><a href='#'>";
            		        		 div += "<img class='media-object img-circle ' style='width:150px;height:150px;float:left;' src='/pic/"+a.activityPhoto+"' alt='通用的占位符图像'/></a> ";
            		        		 div += " <span style='font-size:20px; display:inline-block; color:blue;'>【"+a.activityName+"】</span><div style='border:1px solid black;width:300px;height:100px;margin-left:150px;margin-top:10px;' ><ul style='list-style:none; line-height:25px ;margin-left:-200px;'>";
            		        		 div +="<li><span>开始时间:"+((new Date(a.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li> <li><span>结束时间:"+((new Date(a.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li>";
            		            		 if(new Date(a.activityBeginTime)>today){
            		            			 div +="<li><span style='color:#999'>举行状态:火热报名中</span></li></ul></div></div>";
            		            			 div +="<button class='layui-btn layui-btn-normal' onclick='detailActivity("+a.activityId+")' style='margin-left:800px;margin-top:-130px;'>查看详情</button>";
            		            		 }else if(new Date(a.activityEndTime)>today  && new Date(a.activityBeginTime)<=today){
            		            			 div +="<li><span style='color:#999'>举行状态:正在进行中</span></li></ul></div></div><button class='layui-btn layui-btn-normal' onclick='detailActivity("+a.activityId+")' style='margin-left:800px;margin-top:-130px;'>查看详情</button>";
            		            		 }else {
            		            			 div +="<li><span style='color:#999'>举行状态:已结束</span></li></ul></div></div><button class='layui-btn layui-btn-normal' onclick='detailActivity("+a.activityId+")'  style='margin-left:800px;margin-top:-160px;'>查看详情</button>";	
            		            		 }
            		        		 div +="</div>";
            		    		 })
            					}else{
            						div += "暂无活动";
            					}	 
            		    		 $('#activity').html(div);
            		    	},"json");
            		},
            		applyActivity:function(){
        			    	$("#myApplyActivity").addClass("tab-this");
        			    	$("#myJoinActivity").removeClass("tab-this");
        			    	$("#friendActivity").removeClass("tab-this");
            	    		$.post("/Student/queryActivityByCondition.action",function(data){
            		      	 var div = "";
            		   		 var today =new Date()
            		   		 $.each(data,function(i,a){
            		   			 div += " <div  style='border:1px solid #5DADE2; height:170px; margin-top:10px;'><div style='width:50%;height:auto;margin-top:10px;margin-left:50px;'><a href='#'>";
            		       		 div += "<img  class='media-object img-circle ' style='width:150px;height:150px;float:left;'src='/pic/"+a.activityPhoto+"' alt='通用的占位符图像'/></a> ";
            		       		 div += " <span style='font-size:20px; display:inline-block; color:blue;'>【"+a.activityName+"】</span><div style='border:1px solid black;width:300px;height:100px;margin-left:150px;margin-top:10px;' ><ul style='list-style:none; line-height:25px ;margin-left:-200px;'>";
            		       		 div +="<li><span>开始时间:"+((new Date(a.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li> <li><span>结束时间:"+((new Date(a.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li>";
            		       		 if(a.activityFlag==3){
            		           		 if(new Date(a.activityBeginTime)>today){
            		           			 div +="<li><span>状态:火热报名中</span></li></ul></div></div>";
            		           			 div +="<button class='layui-btn layui-btn-normal' onclick='detailActivity("+a.activityId+")' onclick='detailActivity("+a.activityId+")' style='margin-left:550px;margin-top:-90px;'>查看详情</button>";
            		           		 }else if(new Date(a.activityEndTime)>today  && new Date(a.activityBeginTime)<=today){
            		           			 div +="<li><span>状态:正在进行中</span></li></ul></div></div><button style='margin-left:350px;margin-top:-90px;' onclick='detailActivity("+a.activityId+")' class='layui-btn layui-btn-normal'>查看详情</button>";
            		           		 }else {
            		           			 div +="<li><span>状态:已结束</span></li></ul></div></div>";
            		           			 div +="<button  onclick='detailActivity("+a.activityId+")'   class='layui-btn layui-btn-normal' style='margin-left:550px;margin-top:-160px;'>记录活动</button>"
            		           		 }
            		       		 }else if(a.activityFlag==0){
            		        			div +="<li><span>申请状态:正在申请中</span></li></ul></div></div>";
            		        			div +="<button class='layui-btn layui-btn-normal' style='margin-left:550px;margin-top:-160px;' onclick='detailActivity("+a.activityId+")'>查看详细</button>";
            		        		}else  if(a.activityFlag==1){
            		        			div +="<li><span>申请状态:未发起</span></li></ul></div></div>";
            		        			div +="<button class='layui-btn layui-btn-normal' style='margin-left:550px;margin-top:-160px;' onclick='detailActivity("+a.activityId+")'>查看详细</button>";
            		        		}else  if(a.activityFlag==2){
            		        			div +="<li><span>申请状态:被拒绝</span></li></ul></div></div>";
            		        			div +="<button class='layui-btn layui-btn-normal' style='margin-left:550px;margin-top:-160px;' onclick='detailActivity("+a.activityId+")'>查看详情</button>";
            		        		}
            		       		 div +="</div>";
            		   		 })
            		   		 $('#activity').html(div);		
            		       	},"json");						
            			},
            			joinActivity:function(){
        			    	$("#myJoinActivity").addClass("tab-this");
        			    	$("#myApplyActivity").removeClass("tab-this");
        			    	$("#friendActivity").removeClass("tab-this");            				
            			   	$.post("/Student/queryMyJoinActivity.action",function(data){
            		    		 var div = "";
            		    		 var today =new Date();
            		    		 $.each(data,function(i,a){
            		    			 div += " <div  style='border:1px solid #5DADE2; height:170px; margin-top:10px;'><div  style='width:50%;height:auto;margin-top:10px;margin-left:50px;'><a href='#'>";
            		        		 div += "<img class='media-object img-circle ' style='width:150px;height:150px;float:left;' src='/pic/"+a.activityPhoto+"' alt='通用的占位符图像'/></a> ";
            		        		 div += " <span style='font-size:20px; display:inline-block; color:blue;'>【"+a.activityName+"】</span><div style='border:1px solid black;width:300px;height:100px;margin-left:150px;margin-top:10px;' ><ul style='list-style:none; line-height:25px ;margin-left:-200px;'>";
            		        		 div +="<li><span>开始时间:"+((new Date(a.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li> <li><span>结束时间:"+((new Date(a.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li>";
            		            		 if(new Date(a.activityBeginTime)>today){
            		            			 div +="<li><span>举行状态:正在报名中</span></li><li><span>已报名</span></li></ul></div></div>";
            		            			 div +="<button class='layui-btn layui-btn-normal' onclick='detailActivity("+a.activityId+")' style='margin-left:800px;margin-top:-160px;'>查看详情</button>";
            		            		 }else if(new Date(a.activityEndTime)>today  && new Date(a.activityBeginTime)<=today){
            		            			 div +="<li><span>举行状态:正在进行中</span></li></ul></div></div><button class='layui-btn layui-btn-normal' onclick='detailActivity("+a.activityId+")' style='margin-left:800px;margin-top:-160px;'>查看详情</button>";
            		            		 }else {
            		            			 div +="<li><span>举行状态:已结束</span></li></ul></div></div><button class='layui-btn layui-btn-normal' onclick='detailActivity("+a.activityId+")' style='margin-left:800px;margin-top:-160px;'>查看详情</button>";	
            		            		 }
            		        		 div +="</div>";
            		    		 })
            		    		 $('#activity').html(div);
            		    	},"json");
            			},
            			//活动详情
            			detailActivity:function(activityId){
            					alert(activityId);
            				    window.location.href="/Student/front/activity/activitydetail.jsp?activityId="+activityId;
            			}
            			
            }
            //申请的活动
            function  applyActivity(){
            	activityPage.applyActivity();
            }	
            //参加的活动
            function  joinActivity(){
            	activityPage.joinActivity();
            }
            //活动详细
            function  detailActivity(activityId){
            	alert(activityId);
            	activityPage.detailActivity(activityId);
            }
            
            layui.use(['layer','layedit'], function(){
            	  var layer = layui.layer
            	  ,layedit = layui.layedit;
            	  layedit.build('recordEdit',{
            		  tool:['face','image'],
            		  height:130
            	  });
            	  
            	});           
            //记录活动
            function recordActivity(activityId){
            	window.location="/Student/front/activity/activityRecord.jsp?activityId="+activityId;
            }
            	      
</script>
</body>
</html>

