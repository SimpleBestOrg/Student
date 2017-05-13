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
  <link rel="stylesheet" type="text/css" href="/Student/front/imageUpload/css/preview.css" />
<link rel="stylesheet" type="text/css" href="/Student/front/imageUpload/css/style.css">
<link rel="stylesheet" href="/Student/front/imageUpload/css/ssi-uploader.css"/>
</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" href="/" title="Fly">Fly社区</a>
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

<div id="activityDetailInfo" style="width:100%;height:auto;">
            <div  style="border:1px solid black;height:300px;width:80%;margin:0 auto;">
                    <div style="border:1px  solid green;height:290px;width:400px;float:left">
                        <img style="width:100%;height:100%" src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif"></img>
                    </div>
                    <div style='display:inline-block; margin-left:20px;margin-top:15px;float:left'>
                        <span id='activityName' style="font-size:30px;margin-left:15px;margin-top:20px;">RoboMaster2017南部赛区抢票</span>
                    </div>
                    <ul style='list-style:none; line-height:30px;margin-left:200px;margin-top:50px;'>
                            <li><span id='applyStudent' style="font-size:18px;margin-left:30px;">发起人:孙海洋</span>
                            <li><span id='applyStudent' style="font-size:18px;margin-left:30px;">时间:2015/02/01 17:25:05 ~ 2015/02/01 17:25:05</span>
                            <li><span id='applyStudent' style="font-size:18px;margin-left:30px;">类型:个人活动</span>
                            <li><span id='applyStudent' style="font-size:18px;margin-left:30px;">限制人数50人(已报名20人)</span>
                            <li><span id='applyStudent' style="font-size:18px;margin-left:30px;">火热报名中</span>
                    </ul>
                    <span >
                             <button style='margin-top:45px;margin-left:30px' class="layui-btn layui-btn-big layui-btn-normal">我要报名</button>
                             <button style='margin-top:45px;margin-left:80px' class="layui-btn layui-btn-big layui-btn-normal">记录活动</button>
                    </span>
            </div>
            <div style="border:1px solid ;width:80%;margin:0 auto;margin-top:5px;">
                   <fieldset class="layui-elem-field">
                          <legend>活动介绍</legend>
                          <div class="layui-field-box">
                                    “第十六届全国大学生机器人大赛 RoboMaster2017”（以下简称RM2017）分为机器人对抗赛和技术挑战赛两个项目，共有204支队伍报名参加了比赛。

在机器人对抗赛中，经过组委会的严格挑选，最终有98支精英队伍入围全国各分区赛，RM2016的八强队伍都入围了本次比赛。目前，紧锣密鼓的筹备工作已经在北京、广州、上海、成都四大城市陆续展开！
                          </div>
                 </fieldset>                  
                   <fieldset class="layui-elem-field">
                          <legend>社团介绍</legend>
                          <div class="layui-field-box">
                                    “第十六届全国大学生机器人大赛 RoboMaster2017”（以下简称RM2017）分为机器人对抗赛和技术挑战赛两个项目，共有204支队伍报名参加了比赛。

在机器人对抗赛中，经过组委会的严格挑选，最终有98支精英队伍入围全国各分区赛，RM2016的八强队伍都入围了本次比赛。目前，紧锣密鼓的筹备工作已经在北京、广州、上海、成都四大城市陆续展开！
                          </div>
                 </fieldset>             
                   <fieldset class="layui-elem-field">
                          <legend>活动记录</legend>
                          <div class="layui-field-box">
                                    “第十六届全国大学生机器人大赛 RoboMaster2017”（以下简称RM2017）分为机器人对抗赛和技术挑战赛两个项目，共有204支队伍报名参加了比赛。

在机器人对抗赛中，经过组委会的严格挑选，最终有98支精英队伍入围全国各分区赛，RM2016的八强队伍都入围了本次比赛。目前，紧锣密鼓的筹备工作已经在北京、广州、上海、成都四大城市陆续展开！
                                <div style="margin-left:800px;">——2017/02/03 17:02:50</div>
                          </div>
                          <div class="layui-field-box">
                                    “第十六届全国大学生机器人大赛 RoboMaster2017”（以下简称RM2017）分为机器人对抗赛和技术挑战赛两个项目，共有204支队伍报名参加了比赛。

在机器人对抗赛中，经过组委会的严格挑选，最终有98支精英队伍入围全国各分区赛，RM2016的八强队伍都入围了本次比赛。目前，紧锣密鼓的筹备工作已经在北京、广州、上海、成都四大城市陆续展开！
                                <div style="width:100%;height:100%;">
                                    <img style="width:350px;height:350px;" src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif"></img>
                                    <img style="width:350px;height:350px;" src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif"></img>
                                    <img style="width:350px;height:350px;" src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif"></img>                                     
                                </div>
                                <div style="margin-left:800px;">——2017/02/03 17:02:50</div>
                          </div>                          
                 </fieldset> 
                <fieldset class="layui-elem-field">
                  <legend>已參加人员</legend>
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:90px;">李福光</p>
                         </div> 
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                         </div>                             
                </fieldset>
                <fieldset class="layui-elem-field">
                  <legend>申请加入人员</legend>
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                            <button style="margin-left:35px;" class=" layui-btn layui-btn-normal  layui-btn-small">同意</button>
                            <button style="margin-left:30px;" class=" layui-btn layui-btn-normal  layui-btn-small">拒绝</button>
                         </div> 
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                            <button style="margin-left:35px;" class=" layui-btn layui-btn-normal  layui-btn-small">同意</button>
                            <button style="margin-left:30px;" class=" layui-btn layui-btn-normal  layui-btn-small">拒绝</button>                            
                         </div> 
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                            <button style="margin-left:35px;" class=" layui-btn layui-btn-normal  layui-btn-small">同意</button>
                            <button style="margin-left:30px;" class=" layui-btn layui-btn-normal  layui-btn-small">拒绝</button>                            
                         </div> 
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                            <button style="margin-left:35px;" class=" layui-btn layui-btn-normal  layui-btn-small">同意</button>
                            <button style="margin-left:30px;" class=" layui-btn layui-btn-normal  layui-btn-small">拒绝</button>                            
                         </div> 
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                            <button style="margin-left:35px;" class=" layui-btn layui-btn-normal  layui-btn-small">同意</button>
                            <button style="margin-left:30px;" class=" layui-btn layui-btn-normal  layui-btn-small">拒绝</button>                            
                         </div> 
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                            <button style="margin-left:35px;" class=" layui-btn layui-btn-normal  layui-btn-small">同意</button>
                            <button style="margin-left:30px;" class=" layui-btn layui-btn-normal  layui-btn-small">拒绝</button>                            
                         </div> 
                        <div style="float:left">
                            <div class="layui-inline">
                              <img src="/pic/54c9394b-93f1-484e-8c0f-d2468f8fe043.gif" class="layui-circle">
                            </div>
                            <p style="margin-top:5px;margin-left:70px;">李福光</p>
                            <button style="margin-left:35px;" class=" layui-btn layui-btn-normal  layui-btn-small">同意</button>
                            <button style="margin-left:30px;" class=" layui-btn layui-btn-normal  layui-btn-small">拒绝</button>                            
                         </div>                                                                                                                                                          
                </fieldset>                                    
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
</body>
</html>