<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>活动</title>
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

<div class="main layui-clear">
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a onclick="activityPage.friendActivity('/Student/queryActivityByCondition.action')" class="tab-this">朋友活动</a>
          <a >我参加的活动</a>
          <a >我申请的活动</a>
          <a >活动消息</a>
          
          
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
        <a href="add.html" class="layui-btn jie-add">申请活动</a>
      </div>
      
      <div  id="activity">
            
      </div>
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
<script src="/Student/js/jquery.min.js"></script>

<script type="text/javascript">
			var n = "/Student/queryAllFriendActivity.action";
			$(function(n){
				alert("弹框:"+n);
				activityPage.init();
			});

			var activityPage = {
					init :function(){
						activityPage.friendActivity(n);
					},
					friendActivity:function(n){
							alert(n);
							$.post(n,function(data){
					    		 var div = "";
					    		 var today =new Date();
					    		 $.each(data,function(i,a){
					    			 div += " <div  style='border:1px solid #5DADE2; height:170px; margin-top:10px;'><div  style='width:100%;height:auto;margin-top:10px;margin-left:50px;'><a href='#'>";
					        		 div += "<img class='media-object img-circle ' style='width:150px;height:150px;float:left;' src='/Student/front/image/Capture001.jpg' alt='通用的占位符图像'/></a> ";
					        		 div += " <span style='font-size:20px; display:inline-block; color:blue;'>【"+a.activityName+"】</span><div style='border:1px solid black;width:300px;height:100px;margin-left:150px;margin-top:10px;' ><ul style='list-style:none; line-height:25px ;margin-left:-200px;'>";
					        		 div +="<li><span>开始时间:"+((new Date(a.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li> <li><span>结束时间:"+((new Date(a.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li>";
					            		 if(new Date(a.activityBeginTime)>today){
					            			 div +="<li><span style='color:#999'>举行状态:火热报名中</span></li></ul></div></div>";
					            			 div +="<button style='margin-left:600px;margin-top:-220px;'   class='layui-btn layui-btn-normal'>申请报名</button><button class='layui-btn layui-btn-normal' style='margin-left:800px;margin-top:-130px;'>查看详情</button>";
					            		 }else if(new Date(a.activityEndTime)>today  && new Date(a.activityBeginTime)<=today){
					            			 div +="<li><span style='color:#999'>举行状态:正在进行中</span></li></ul></div></div><button class='layui-btn layui-btn-normal' style='margin-left:800px;margin-top:-130px;'>查看详情</button>";
					            		 }else {
					            			 div +="<li><span style='color:#999'>举行状态:已结束</span></li></ul></div></div><button class='layui-btn layui-btn-normal' style='margin-left:800px;margin-top:-160px;'>查看详情</button>";	
					            		 }
					        		 div +="</div>";
					    		 })
					    		 div　+= "<div id='page'></div>";
					    		 $('#activity').html(div);
					    	},"json");
					},
					applyActivity:function(){
				    	
				    		$.post("/Student/queryActivityByCondition.action","activityInfo.StudentId=1",function(data){
					      		 var div = "";
					   		 var today =new Date()
					   		 $.each(data,function(i,a){
					   			 div += " <div  style='border:1px solid #5DADE2; height:200px; margin-top:10px;'><div  style='border:1px solid white;width:50%;height:auto;margin-top:20px;margin-left:50px;'><a href='#'>";
					       		 div += "<img  class='media-object img-circle ' style='width:150px;height:150px;float:left;' src='/Student/front/image/Capture001.jpg' alt='通用的占位符图像'/></a> ";
					       		 div += " <span style='font-size:20px; display:inline-block; color:blue;'>【"+a.activityName+"】</span><div style='border:1px solid black;width:300px;height:100px;margin-left:150px;margin-top:10px;' ><ul style='list-style:none; line-height:25px ;margin-left:-200px;'>";
					       		 div +="<li><span>开始时间:"+((new Date(a.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li> <li><span>结束时间:"+((new Date(a.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li>";
					       		 if(a.activityFlag==3){
					           		 if(new Date(a.activityBeginTime)>today){
					           			 div +="<li><span>状态:火热报名中</span></li></ul></div></div>";
					           			 div +="<button style='margin-left:350px;margin-top:-40px;'   class='layui-btn layui-btn-normal'>申请报名</button><button class='layui-btn layui-btn-normal' style='margin-left:350px;margin-top:-90px;'>查看详情</button>";
					           		 }else if(new Date(a.activityEndTime)>today  && new Date(a.activityBeginTime)<=today){
					           			 div +="<li><span>状态:正在进行中</span></li></ul></div></div><button style='margin-left:350px;margin-top:-90px;' class='layui-btn layui-btn-normal'>查看详情</button>";
					           		 }else {
					           			 div +="<li><span>状态:已结束</span></li></ul></div></div>";
					           			 div +="<button class='layui-btn layui-btn-normal' style='margin-left:350px;margin-top:-90px;'>记录活动</button>"
					           		 }
					       		 }else if(a.activityFlag==0){
					        			div +="<li><span>申请状态:正在申请中</span></li></ul></div></div>";
					        		}else  if(a.activityFlag==1){
					        			div +="<li><span>申请状态:未发起</span></li></ul></div></div>";
					        			div +="<button class='layui-btn layui-btn-normal' style='margin-left:350px;margin-top:-90px;'>立即发起</button>";
					        		}else  if(a.activityFlag==2){
					        			div +="<li><span>申请状态:被拒绝</span></li></ul></div></div>";
					        		}
					       		 div +="</div>";
					   		 })
					   		 div　+= "<div id='MyAppliActivityPage'></div>";
					   		 $('#activity').html(div);		
					       	},"json");						
						},
			}
			function  applyActivity(){
				activityPage.applyActivity();
			}			
</script>
</body>
</html>