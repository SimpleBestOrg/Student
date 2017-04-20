<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
    学生信息管理平台
</title>
    <link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
    <link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" />
    <link href="Style/ks.css" rel="stylesheet" type="text/css" />
    <script src="/Student/js/jquery.min.js"></script>
    <link href="layui/layui.css" rel="stylesheet" type="text/css" />
    <script src="layui/layui.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    <link href="Style/history.css" rel="stylesheet" type="text/css" />
</head>
<body>


    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="Index.jsp">
                        <img src="Images/Student/logo.gif" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topxx">
                    <select onchange="changeCateory($(this))" style="font-size: 11px; background: #4991cf;
                        color: #fff;">
                        
                        <option 
                            value="4">
                            远程</option>
                        
                        <option selected='selected'
                            value="1">
                            自考</option>
                        
                    </select>
                    910513201419学员：邹智，欢迎您！ <a href="../MyInfo/Index.jsp">我的信息</a> <a href="../User/StudentInfor/systemMsge.jsp">
                        通知</a> <a href="../User/Account/ChangePasswd.jsp">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="../Index.jsp">我的信息</a></li>
                        <li><a href="../EducationCenter/Score.jsp">教务中心</a></li>
                        <li><a href="../MyAccount/wdcw.jsp">我的学费</a></li>
                        <li><a href="StudentMaterial.jsp">资料中心</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<div class="page">
        <div class="box mtop">

                 <jsp:include page="leftInfo.jsp" />
   <div class="rightbox">
                
    <h2 class="mbx">活动 &gt; 我的活动</h2>
        
        <div class="layui-tab">
          <ul class="layui-tab-title">
            <li class="layui-this">朋友活动</li>
            <li>我的活动</li>
            <li>申请活动</li>
          </ul>
         <div class="layui-tab-content">
            <div class="layui-tab-item layui-show" id="activityFriend"></div>
            <div class="layui-tab-item">
                                        <div class="layui-collapse">
                                          <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">我参加的活动</h2>
                                            <div class="layui-colla-content layui-show" id="myJoinActivity"></div>
                                          </div>
                                          <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">我申请的活动</h2>
                                            <div class="layui-colla-content layui-show" id="myAppliActivity"></div>
                                          </div>
                                          <div class="layui-colla-item">
                                            <h2 class="layui-colla-title">活动消息</h2>
                                            <div class="layui-colla-content layui-show" id="myActivityMessage"></div>
                                          </div>                                          
                                        </div>                
            </div>
            <div class="layui-tab-item">
                    <div class="appliActivity" style="border:1px solid red;width:900px;height:600px;">
                                                                 <form class="layui-form" style="display:inline-block;" id="applyActivity"  method="post">
                                                                      <input type="hidden" value="3"  name="activityInfo.studentId"/>
                                                                      <div class="layui-form-item ptop">
                                                                            <label class="layui-form-label" style="width:200px">活动名称</label>
                                                                            <div class="layui-input-block">
                                                                              <input type="text" name="activityInfo.activityName"  autocomplete="off" placeholder="请输入活动名称" class="layui-input" style="width:300px"/>
                                                                            </div>
                                                                      </div>
                                                                        <div class="layui-form-pane " style="margin-top: 15px; margin-left:100px;">
                                                                          <div class="layui-form-item">
                                                                            <label class="layui-form-label">时间选择</label>
                                                                            <div class="layui-input-inline">
                                                                              <input class="layui-input" name="activityInfo.activityBeginTime"  placeholder="开始日期" id="LAY_demorange_s"/>
                                                                            </div>
                                                                            <div class="layui-input-inline">
                                                                              <input class="layui-input"   placeholder="截止日期" id="LAY_demorange_e" name="activityInfo.activityEndTime"/>
                                                                            </div>
                                                                          </div>
                                                                        </div> 
                                                                        <div class="layui-form-item" style="margin-top: 15px;">
                                                                            <div class="layui-inline">
                                                                              <label class="layui-form-label" style="width:200px">活动类型</label>
                                                                                 <div class="layui-input-inline">
                                                                                      <select  style="width:200px;height:30px"  name="activityInfo.activityTypeId">
                                                                                        <option value="1" >个人活动</option>
                                                                                        <option value="2" >社团活动</option>
                                                                                      </select>
                                                                                 </div>
                                                                            </div>
                                                                         </div>   
                                                                         <div class="layui-form-item layui-form-text" >
                                                                            <label class="layui-form-label" style="width:200px">申请理由</label>
                                                                            <div class="layui-input-block" style="width:100px;" >
                                                                              <textarea placeholder="请输入内容" name="activityInfo.activityAppliReason" class="layui-textarea" style="width:500px"></textarea>
                                                                            </div>
                                                                         </div>
                                                                         <center>
                                                                         <button class="layui-btn  layui-btn-primary" onclick="test()" >申请</button>
                                                                         </center>                                                                                                                                                                                                                   
                                                        </form>
                    </div>
            </div>
          </div>
        </div>
    
    



                                                  
    

<script  type="text/javascript">

	function  applyActivity(){
		$.post("/Student/insertApplyActivity.action",$("#applyActivity").serialize(),function(data){
			alert(data);
		})
	}
	

    $(function(){
    	//查询朋友圈的活动
    	$.post("/Student/queryAllFriendActivity.action",function(data){
    		 var div = "";
    		 var today =new Date()
    		 alert((today.toLocaleString().replace(/年|月/g,'-')).replace(/日/g,''))
    		 $.each(data,function(i,a){
    			 div += " <div  style='border:1px solid #5DADE2; height:200px; margin-top:10px;'><div  style='border:1px solid white;width:50%;height:auto;margin-top:20px;margin-left:50px;'><a href='#'>";
        		 div += "<img class='media-object img-circle ' style='width:150px;height:150px;float:left;' src='/Student/front/image/Capture001.jpg' alt='通用的占位符图像'/></a> ";
        		 div += " <span style='font-size:20px; display:inline-block; color:blue;'>【"+a.activityName+"】</span><div style='border:1px solid black;width:300px;height:100px;margin-left:150px;margin-top:10px;' ><ul style='list-style:none; line-height:25px ;margin-left:-200px;'>";
        		 div +="<li><span>开始时间:"+((new Date(a.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li> <li><span>结束时间:"+((new Date(a.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li>";
            		 if(new Date(a.activityBeginTime)>today){
            			 div +="<li><span style='color:#999'>举行状态:火热报名中</span></li></ul></div></div>";
            			 div +="<button style='margin-left:350px;margin-top:-40px;'   class='layui-btn layui-btn-normal'>申请报名</button><button class='layui-btn layui-btn-normal' style='margin-left:350px;margin-top:-90px;'>查看详情</button>";
            		 }else if(new Date(a.activityEndTime)>today  && new Date(a.activityBeginTime)<=today){
            			 div +="<li><span style='color:#999'>举行状态:正在进行中</span></li></ul></div></div><button style='margin-left:350px;margin-top:-90px;' class='layui-btn layui-btn-normal'>查看详情</button>";
            		 }else {
            			 div +="<li><span style='color:#999'>举行状态:已结束</span></li></ul></div></div><button style='margin-left:350px;margin-top:-90px;' class='layui-btn layui-btn-normal'>查看详情</button>";	
            		 }
        		 div +="</div>";
    		 })
    		 div　+= "<div id='page'></div>";
    		 $('#activityFriend').html(div);
    	},"json");
    	
    	//根据ID查询申请过的活动
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
		 $('#myAppliActivity').html(div);		
    	},"json");
    	
        //根据ID查询参加过的活动(通过活动学生中间表的学生ID查询学生参加过的活动)
    	$.post("/Student/queryMyJoinActivity.action","stuId="+1,function(data){
    		 var div = "";
    		 var today =new Date();
    		 $.each(data,function(i,a){
    			 div += " <div  style='border:1px solid #5DADE2; height:200px; margin-top:10px;'><div  style='border:1px solid white;width:50%;height:auto;margin-top:20px;margin-left:50px;'><a href='#'>";
        		 div += "<img class='media-object img-circle ' style='width:150px;height:150px;float:left;' src='/Student/front/image/Capture001.jpg' alt='通用的占位符图像'/></a> ";
        		 div += " <span style='font-size:20px; display:inline-block; color:blue;'>【"+a.activityName+"】</span><div style='border:1px solid black;width:300px;height:100px;margin-left:150px;margin-top:10px;' ><ul style='list-style:none; line-height:25px ;margin-left:-200px;'>";
        		 div +="<li><span>开始时间:"+((new Date(a.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li> <li><span>结束时间:"+((new Date(a.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span></li>";
            		 if(new Date(a.activityBeginTime)>today){
            			 div +="<li><span>举行状态:正在报名中</span></li><li><span>已报名</span></li></ul></div></div>";
            			 div +="<button class='layui-btn layui-btn-normal' style='margin-left:350px;margin-top:-90px;'>查看详情</button>";
            		 }else if(new Date(a.activityEndTime)>today  && new Date(a.activityBeginTime)<=today){
            			 div +="<li><span>举行状态:正在进行中</span></li></ul></div></div><button style='margin-left:350px;margin-top:-90px;' class='layui-btn layui-btn-normal'>查看详情</button>";
            		 }else {
            			 div +="<li><span>举行状态:已结束</span></li></ul></div></div><button style='margin-left:350px;margin-top:-90px;' class='layui-btn layui-btn-normal'>查看详情</button>";	
            		 }
        		 div +="</div>";
    		 })
    		 div　+= "<div id='page'></div>";
    		 $('#myJoinActivity').html(div);
    	},"json");        
    	
    	
        
    	layui.use(['laydate','element','laypage', 'layer','jquery','form'],function(){
    	  var laydate = layui.laydate
    	  	 ,laypage = layui.laypage
    	  	 ,layer   = layui.layer
    	  	 ,element = layui.element()
    	  	 ,form  = layui.form()
    	  	 ,$ = layui.jquery; 
    	  
    	      //分页模块
    	      laypage({
    	          cont: 'page'
    	          ,pages: 100
    	          ,skip: true
    	          ,skin:'#98c9ee'
    	        });
    	      laypage({
    	          cont: 'MyAppliActivityPage'
    	          ,pages: 100
    	          ,skip: true
    	          ,skin:'#98c9ee'
    	        });    	      
    			  //触发事件
    	          var active = {
    	            tabAdd: function(){
    	              //新增一个Tab项
    	              element.tabAdd('demo', {
    	                title: '新选项'+ (Math.random()*1000|0) //用于演示
    	                ,content: '内容'+ (Math.random()*1000|0)
    	                ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
    	              })
    	            }
    	            ,tabDelete: function(othis){
    	              //删除指定Tab项
    	              element.tabDelete('demo', '44'); //删除：“商品管理”
    	              
    	              
    	              othis.addClass('layui-btn-disabled');
    	            }
    	            ,tabChange: function(){
    	              //切换到指定Tab项
    	              element.tabChange('demo', '22'); //切换到：用户管理
    	            }
    	          };
    	          
    	          $('.site-demo-active').on('click', function(){
    	            var othis = $(this), type = othis.data('type');
    	            active[type] ? active[type].call(this, othis) : '';
    	          });
    	  
    	              //日期模块
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
    });

    
              
  
  
});

</script>    



            </div>
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2012 广博教育 csgb.net 版权所有 站长统计</p>
        </div>
    </div>
</body>
</html>
