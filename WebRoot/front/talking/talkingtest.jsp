<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>首页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="/Student/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="/Student/front/res/css/global.css">
</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" href="/" title="Fly"> </a>
    <div class="nav">
      <a class="nav-this" href="jie/index.html">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="layui-icon">&#xe617;</i>社团
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="layui-icon">&#xe633;</i>活动 
      </a>
            <a href="http://www.layui.com/" target="_blank">
        <i class="layui-icon">&#xe611;</i>说说
      </a>
    </div>
    
    <div class="nav-user">
      <!-- 未登入状态 -->
      <a class="unlogin" href="user/login.html"><i class="iconfont icon-touxiang"></i></a>
      <span><a href="user/login.html">登入</a><a href="user/reg.html">注册</a></span>
      
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
    <div class="content">
      <div class="fly-tab fly-tab-index">
        <span>
          <a href="jie/index.html">全部说说</a>
          <a href="jie/index.html">我的说说</a>
          <a href="jie/index.html">朋友说说</a>
          <a href="jie/index.html">精帖</a>
          <a href="user/index.html">我的帖</a>
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
      </div>
             <!-- 发表说说 -->
       <div id="editTalking"  style="width:100%;height:180px;margin-bottom: 20px;">
            <form class="layui-form" action="">
                <div style="width:690px;">
                 <textarea id="publishTalking" >
                 </textarea>
                </div> 
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
      
 <div class="talking" style="border:1px solid red;width:600px;">
         <div  style="width:600px;">
            <img class="media-object img-circle " style="width:60px;height:60px;float:left;" src="/Student/front/image/Capture001.jpg" alt="通用的占位符图像">
            <span style="font-size:20px;display:block;margin-top:10px;">郇红芝</span>
            <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
            <div style="border:1px solid red;width:600px;margin-top:10px;">
                    <div style="border:1px solid blue;">
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁                                    
                    </div>
                    <img src="" style="width:150px;height:150px;"/>
                    <img src="" style="width:150px;height:150px;"/>
                    <img src="" style="width:150px;height:150px;"/>
                    <div style="border:1px solid green;">
                                   <i class="iconfont icon-iconfontpraise"></i>                                                
                    </div>
                    <div style="border:1px solid green; background-color:green;">
                         <div style="border:1px solid black;">
                             <img src="" style="height:40px;width:40px;float:left;">
                             <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                             <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>
                         <div style="border:1px solid black; margin-left:40px;">
                            <img src="" style="height:40px;width:40px;float:left;">
                            <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                            <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>   
                                                  <div style="border:1px solid black;">
                             <img src="" style="height:40px;width:40px;float:left;">
                             <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                             <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>
                         <div style="border:1px solid black; margin-left:40px;">
                            <img src="" style="height:40px;width:40px;float:left;">
                            <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
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
       <div style="">
            <img class="media-object img-circle " style="width:60px;height:60px;float:left;" src="/Student/front/image/Capture001.jpg" alt="通用的占位符图像">
            <span style="font-size:20px;display:block;margin-top:10px;">郇红芝</span>
            <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
            <div style="border:1px solid red;width:600px;margin-top:10px;">
                    <div style="border:1px solid blue;">
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁
                                                                     明天 你好 啊   老铁                                    
                    </div>
                    <img src="" style="width:150px;height:150px;"/>
                    <img src="" style="width:150px;height:150px;"/>
                    <img src="" style="width:150px;height:150px;"/>
                    <div style="border:1px solid green;">
                                   <button style="margin-left:570px;"><i class="iconfont icon-iconfontpraise"></i></button>                                                
                    </div>
                    <div style="border:1px solid green; background-color:green;">
                         <div style="border:1px solid black;">
                             <img src="" style="height:40px;width:40px;float:left;">
                             <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                             <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>
                         <div style="border:1px solid black; margin-left:40px;">
                            <img src="" style="height:40px;width:40px;float:left;">
                            <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                            <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>   
                                                  <div style="border:1px solid black;">
                             <img src="" style="height:40px;width:40px;float:left;">
                             <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                             <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                         </div>
                         <div style="border:1px solid black; margin-left:40px;">
                            <img src="" style="height:40px;width:40px;float:left;">
                            <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
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
            
 </div>
      
      <div style="text-align: center">
        <div class="laypage-main">
          <a href="jie/index.html" class="laypage-next">更多求解</a>
        </div>
      </div>
      
    </div>
  </div>
  
  <div class="edge">
    <div class="fly-panel leifeng-rank"> 
      <h3 class="fly-panel-title">近一月回答榜 - TOP 12</h3>
      <dl>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="../res/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
      </dl>
    </div>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">最近热帖</dt>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
    </dl>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">近期热议</dt>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
    </dl>
    
    <div class="fly-panel fly-link"> 
      <h3 class="fly-panel-title">友情链接</h3>
      <dl>
        <dd>
          <a href="http://www.layui.com/" target="_blank">layui</a>
        </dd>
        <dd>
          <a href="http://layim.layui.com/" target="_blank">LayIM</a>
        </dd>
        <dd>
          <a href="http://layer.layui.com/" target="_blank">layer</a>
        </dd>
      </dl>
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