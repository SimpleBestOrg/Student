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
      
            <div class="talking"  id="talking" style="border:1px solid red;width:600px;">
                   <!--说说显示 -->                    
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
<script src="/Student/js/jquery.min.js"></script>
<script>


	
    
    $(function(){
    			talkingPage.friendTalking();
    		    layui.use(['layedit','form'], function(){
    		    	  var layedit = layui.layedit
    		    	  ,$ = layui.jquery
    		    	  ,form = layui.form();
    		    	  //构建一个默认的编辑器
    		    	  var index = layedit.build('publishTalking');
    		    	  var index = layedit.build('publishTalking1');
    		          layedit.build('publishTalking', {
    		            tool: ['face', 'image']
    		            ,height: 100
    		          })	
    		          layedit.build('publishTalking1', {
      		            tool: ['face', 'image']
      		            ,height: 100
      		          })	    		          
    		    	});
    })
    
    var talkingPage = {
    			friendTalking:function(){
    				$.post("/Student/queryTalkingByFriendId.action","stuId="+1,function(data){
    						var div ="";
    				       $.each(data,function(i,a){
    				    	   	     div += " <div  style='width:600px;'>";
    				    	   		 div += "<img class='media-object img-circle ' style='width:60px;height:60px;float:left;' src='"+a.stuId.studentPhoto+"' alt='通用的占位符图像'/>";
    				    	   		 div += "<span style='font-size:20px;display:block;margin-top:10px;'>"+a.stuId.studentName+"</span>";
									 div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(a.talkingDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
									 div += "<div style='border:1px solid red;width:600px;margin-top:10px;'>";
									 div += "<div style='border:1px solid blue;'>"+a.talkingContent+"</div>";
									 
									 //如果说说中有照片 则显示照片
									 if(a.talkingPhotos.length!=0){
											$.each(a.talkingPhotos,function(i,p){
												//照片数量为1时  照片宽度
												if(a.talkingPhotos.length==1){
													div  +=  "<img src='"+p.talkingPhoto+"' style='width:500px;height:500px;'/>";													
												}else{
													div  +=  "<img src='"+p.talkingPhoto+"' style='width:150px;height:150px;'/>";
												}
											})
									 }
									 
									 //如果说说的评论不是空  则显示说说评论的内容
									 
									 alert("第"+i+"个说说"+a.talkingTocao.length);
									 if(a.talkingTocao.length!=0){
										  div += "<div style='border:1px solid green; background-color:green;'>";
										  	 //一条说说被评论(主评论和回复)的条数
										    var toCaoLength = a.talkingTocao.length;
										  	
										 	$.each(a.talkingTocao,function(i,t){
										 		if(t.talkingToCaoParentId==null){
 										 			 div += "<div style='border:1px solid black;'><img src='"+t.student.studentPhoto+"' style='height:40px;width:40px;float:left;'/>";
										 			 div += "<span style='font-size:15px;display:block;margin-top:5px;'><font style='color:red'>"+t.student.studentName+"</font>&nbsp;&nbsp;:&nbsp;&nbsp;"+t.talkingToCaoContext+"</span>";
													 div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(t.talkingToCaoDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
													 div += "</div>"; 
	    										 		$.each(a.talkingTocao,function(y,parent){
	    										 			if(parent.talkingToCaoParentId==t.talkingToCaoId){
	    	 										 			 div += "<div style='border:1px solid black;margin-left:40px;'><img src='"+parent.student.studentPhoto+"' style='height:40px;width:40px;float:left;'/>";
	    											 			 div += "<span style='font-size:15px;display:block;margin-top:5px;'><font style='color:red'>"+parent.student.studentName+"</font>&nbsp;&nbsp;:&nbsp;&nbsp;"+parent.talkingToCaoContext+"</span>";
	    														 div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(parent.talkingToCaoDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
	    														 div += "</div>";
	    														 $.each(a.talkingTocao,function(z,child){
	    															 if(child.talkingToCaoParentId==parent.talkingToCaoId){
	    	    	 										 			 div += "<div style='border:1px solid black;margin-left:40px;'><img src='"+child.student.studentPhoto+"' style='height:40px;width:40px;float:left;'/>";
	    	    											 			 div += "<span style='font-size:15px;display:block;margin-top:5px;'><font style='color:red'>"+child.student.studentName+"</font>&nbsp;&nbsp;:&nbsp;&nbsp;"+child.talkingToCaoContext+"</span>";
	    	    														 div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(child.talkingToCaoDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
	    	    														 div += "</div>";		
	    															 }
	    														 })
	    										 			}
	    										 		})
										 		}

										 	})
										 	div +="</div>";
									 }
									 
									 
									 div += "<div style='border:1px solid green;'><i class='iconfont icon-iconfontpraise'></i></div>"                                                
	                                 //说说评论
									 div += "<form class='layui-form' action=''><div style='width:690px;'><textarea id='publishTalking1' ></textarea></div></div></div>";
    				       })
    				       $("#talking").html(div);
    				})
    			}
    }
    
    
    
	
</script>

</body>
</html>