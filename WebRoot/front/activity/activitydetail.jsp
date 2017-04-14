<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <a class="logo" href="/" title="Fly">Fly社区</a>
    <div class="nav">
      <a class="nav-this" href="activityindex.jsp">
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

<div style="width:100%;height:auto;">
            <div style="width:70%;height:auto;margin:0 auto;border:1px solid green">
                    <div style="width:80%;height:250px;border:1px solid red;margin-left:50px;">
                                   <div style="float:left;">
                                        <img src="" style="width:200px;height:250px;"></img>
                                   </div>
                                   <div style="display:inline-block;  width:200px;height:80px;margin-top:15px;">
                                            <span id="activityName" style="font-size:30px;margin-left:15px;margin-top:20px;"></span>
                                   </div>
                                   <ul style='list-style:none; line-height:27px;margin-left:-200px;margin-top:-40px;'>
                                        <li><span id="applyStudent" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="activityType" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="activityStatus" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="activityBeginTime" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="activityEndTime" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="joinInfo" style="font-size:18px;margin-left:15px;"></span></li>
                                   </ul>
                                   <span id="applyButton">
                                        
                                   </span>     
                    </div>
                    <div  style="width:80%;height:auto;border:1px solid green;margin-left:50px;">
                                <div id="activityDetailInfo" ></div>
                                <span style="font-size:20px;font-weight: bold;;margin-left:20px;">参加人员:</span>
                                <div id="activityStudent" style="margin-left:100px;"></div>                                
                                <span style="font-size:20px;font-weight: bold;;margin-left:20px;">活动描述:</span>
                                <p id="activityDescription" style="margin-left:100px;">
                                <p>
                                <span style="font-size:20px;font-weight: bold;;margin-left:20px;">活动照片:</span>
                                <div>
                                     <img src="" style="border:1px solid red;width:200px;height:200px;;margin-left:100px;"></img>
                                     <img src="" style="border:1px solid red;width:200px;height:200px;;margin-left:100px;"></img>
                                     <img src="" style="border:1px solid red;width:200px;height:200px;;margin-left:100px;"></img>
                                     <img src="" style="border:1px solid red;width:200px;height:200px;;margin-left:100px;"></img>
                                     <img src="" style="border:1px solid red;width:200px;height:200px;;margin-left:100px;"></img>
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
        		$(function(){
        			var stuId = 1;
        			var activityId = <%=request.getParameter("activityId")%>;
        			alert(activityId);
        			var today = new Date();
        			$.post("/Student/queryActivityDetail.action",{"activityId":activityId},function(data){
        					alert(data.activityName);
        					$("#activityName").html(data.activityName);	
        					$("#applyStudent").html("申请人:"+data.student.studentName);
        					//
        					
        					//
        					//  明天上午 判断活动类型 如果活动类型是社团活动  则显示社团的职责
        					//	
        					//
        					$("#activityType").html("活动类型:"+data.activityType.activityTypeName);
        					//如果活动类型是社团活动则需要在页面显示社团的职责
        					if(data.activityType.activityTypeId != 1){
        						alert(data.activityType.community.communityAppliRespon);
                                var span = "<span style='font-size:20px;font-weight: bold;;margin-left:20px;'>社团介绍:</span>";
                                span +="<p style='margin-left:100px;'>"+data.activityType.community.communityAppliRespon+"<p>";
        						$("#activityDetailInfo").html(span);
        					}
        					alert(today);
        					//判断查看的活动是否是我的活动  如果是我的活动  则显示'申请状态 和  举办状态 '  如果是朋友申请的活动 则显示举办状态
        					if(data.student.studentId==stuId){
        						if(data.activityFlag == 0){
        							$("#activityStatus").html("状态:正在审核");	
        						}else if(data.activityFlag == 1){
        							$("#activityStatus").html("状态:审核通过未发起");
        						}else if(data.activityFlag == 2){
        							$("#activityStatus").html("状态:审核未通过");
        						}else if(data.activityFlag == 3){
        							//发起过的活动  根据时间判断活动是否结束     
        							if(new Date(data.activityBeginTime<= today)){
        								$("#activityStatus").html("状态:正在报名中");
        							}else if(new Date(data.activityBeginTime>today && new Date(data.activityEnTime<today) )){
        								$("#activityStatus").html("状态:活动正在进行中");
        							}else if(new Date(data.activityEnTime<today)){
        								$("#activityStatus").html("状态:活动已结束");
        							}
        						}
        					}else{  //朋友的活动
    							//发起过的活动  根据时间判断活动是否结束
    							//声明count用来判断查看这个活动的学生是否参加了这个活动
    							var count = 0;
    							if(new Date(data.activityBeginTime) > today ){
    								$("#activityStatus").html("状态:活动正在报名中");
    								//查询活动学生表中  学生的ID是否存在  如果存在 则表示学生 已经报过名了 
    									$.each(data.activityStudents,function(i,a){
    											if(a.studentId == stuId){
    												 count ++;
    											}
    									})    		
									//表示这个学生参加已经加入这个活动了
									if(count==1){
										$("#joinInfo").html("已申请报名");
									}else{
										var  applyButton = "<button style='margin-left:600px;margin-top:-220px;' class='layui-btn layui-btn-normal'>申请报名</button>";
										$("#applyButton").html(applyButton);
									}
    							}else if(new Date(data.activityBeginTime)>today && new Date(data.activityEnTime<today) <today ){
    								$("#activityStatus").html("状态:活动正在进行中");
    							}else if(new Date(data.activityEndTime) < today ){
    								$("#activityStatus").html("状态:活动已结束");
    							}
        					}
        					$("#activityBeginTime").html("活动开始时间:"+((new Date(data.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,''));
        					$("#activityEndTime").html("活动结束时间:"+((new Date(data.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,''));
        					
        					$.each(data.activityStudents,function(i,a){
        						alert(a.studentName);
        					})
        					alert(data.activityStudents);
        					   //显示活动参与人员
        					   var div ="";
            					$.each(data.activityStudents,function(i,a){
               						 if(a.students.studentName!=null){
               							 div += "<div style='display:inline-block;margin-left:10px;' ><img src="+a.students.studentPhoto+" style='width:50px;height:50px;display: block;'>";
               							 div += "<span>"+a.students.studentName+"</span></div>";               							 
               						 }else{
               							 div == "暂无参加人员";
               						 }
               					})
               					$("#activityStudent").html(div);
        						$("#activityDescription").html(data.activityRecord.activityRecordContent);	
        			},'json')
        		})
        </script>
</body>
</html>