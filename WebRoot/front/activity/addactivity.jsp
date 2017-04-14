<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>申请活动页面</title>
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
      <!-- 登入后的状态 -->
      
      <a class="avatar" href="../user/index.html">
        <img src="">
        <cite>贤心</cite>
        <i>VIP2</i>
      </a>
      <div class="nav">
        <a href="../user/set.html"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href=""><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
      
    </div>
  </div>
</div>

<div class="main layui-clear">
  <div class="fly-panel" >
    <h2 class="page-title">申请活动</h2>
    
    <!--  <div class="fly-none">并无权限</div>--> 

           <form class="layui-form" style="display:inline-block;" action="/Student/insertApplyActivity.action" method="post" id="applyActivity" >
              <input type="hidden" value="3"  name="activityInfo.studentId"/>
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
                            <option value="1" >个人活动</option>
                            <option value="2" >社团活动</option>
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
                    <label class="layui-form-label" style="width:200px">申请理由</label>
                    <div class="layui-input-block" style="width:100px;" >
                      <textarea placeholder="请输入内容" name="activityInfo.activityAppliReason" class="layui-textarea" style="width:500px" lay-verify="applyreason"></textarea>
                    </div>
                 </div>
                <center>
                 <button class="layui-btn" lay-filter="demo1" lay-submit="" onclick="applyActivity1()">立即提交</button>
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
<script>
			
            layui.use(['form','laydate'],function(){
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
                		  if(value.length<3 ||  value.length>5){
                			  return "活动名称至少三个字符之多五个字符";
                		  }
                	  },
                	  applyreason:function(value){
                		  if(value.length<5){
                			  return "申请理由至少填写三十个字节";
                		  }
                	  },
                  });
                  form.on('submit(demo1)', function(data){
                	  		return false;
                	  });  
               })
               
</script>
          
</body>
</html>