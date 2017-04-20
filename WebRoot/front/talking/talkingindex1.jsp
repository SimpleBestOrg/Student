<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>说说</title>
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
          <a href="" class="tab-this">全部</a>
          <a href="">我的说说</a>
          <a href="">朋友说说</a>
          <a href="">与我相关</a>
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
      </div>
       
       <!-- 发表说说 -->
       <div id="editTalking"  style="width:100%;height:180px;margin-bottom: 20px;">
            <form class="layui-form" action="">
                <textarea id="publishTalking" >
                </textarea>
                <div style="margin-top:5px;"> 
                  <div class="layui-form-item" style="display: inline-block;">
                    <div class="layui-input-block" style="margin-left: 0px;">
                      <select name="interest" >
                        <option value="0">所有人可见</option>
                        <option value="1">仅好友可见</option>
                        <option value="2">仅自己可见</option>
                      </select>
                    </div>
                  </div>
                <div id="publish" style="display: inline-block;" >
                    <button class="layui-btn">发说说</button>
                </div>
               </div> 
            </form>    
       </div>
        
       <div class="oneActivity" style="border:1px solid red;width:600px;margin-left:300px;margin-top:50px;">
            <img class="media-object img-circle " style="width:60px;height:60px;float:left;" src="/Student/front/image/Capture001.jpg" alt="通用的占位符图像">
            <span style="font-size:20px;display:block;margin-top:10px;">郇红芝</span>
            <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
            <div style="border:1px solid red;width:600px;margin-top:10px;">
                    <div style="border:1px solid blue;">
                                                                              
                    </div>
                    <img src="" style="width:150px;height:150px;"/>
                    <img src="" style="width:150px;height:150px;"/>
                    <img src="" style="width:150px;height:150px;"/>
                    <div style="border:1px solid green;">
                                                                                    赞
                    </div>
                    <div style="border:1px solid green; background-color:green;">
                         <div style="border:1px solid black;">
                             <img src="" style="height:40px;width:40px;float:left;">
                             <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                             <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>
                         <div style="border:1px solid black; margin-left:40px;">
                            <img src="" style="height:40px;width:40px;float:left;">
                            <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                            <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>   
                         <div style="border:1px solid black;">
                             <img src="" style="height:40px;width:40px;float:left;">
                             <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;:&nbsp;&nbsp;程序员</span>
                             <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>
                         <div style="border:1px solid black; margin-left:40px;">
                            <img src="" style="height:40px;width:40px;float:left;">
                            <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                            <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>                                                 
                    </div>
                    <div style="border:1px solid black;height:30px;">评论</div>
            </div>
 </div>  
      
      <!-- <div class="fly-none">并无相关数据</div> -->
    
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
<script>
layui.use(['layedit','form'], function(){
	  var layedit = layui.layedit
	  ,$ = layui.jquery
	  ,form = layui.form();
	  //构建一个默认的编辑器
	  var index = layedit.build('publishTalking');
      layedit.build('publishTalking', {
          tool: ['face', 'image']
          ,height: 100
        })	
	});

</script>
        
</body>
</html>