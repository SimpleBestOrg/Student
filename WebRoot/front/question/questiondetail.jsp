<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <a class="nav-this" href="index.html">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
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
    </div>
  </div>
</div>



<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
      <div class="fly-panel detail-box">
      <c:forEach var="qs" items="${listselect}">
        <h1>${qs.question_Title}</h1>
        	<div class="fly-tip fly-detail-hint" data-id="{{rows.id}}">
          <span class="fly-tip-stick">置顶帖</span>
          <span class="fly-tip-jing">精帖</span>
          <span>未结贴</span>
          <div class="fly-list-hint"> 
            <i class="iconfont" title="回答">&#xe60c;</i>赞 ${qs.question_praise}
            <i class="iconfont" title="人气">&#xe60b;</i> 踩 ${qs.question_step}
          </div>
        </div>
        <div class="detail-about">
          <a class="jie-user" href="">
            <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0" alt="">
            <cite>
             	${qs.stu_Name}
              <em>${qs.question_DataTime}</em>
            </cite>
          </a>
          <div class="detail-hits" data-id="{{rows.id}}">
            <span class="layui-btn layui-btn-mini jie-admin" type="edit"><a href="/jie/edit/{{rows.id}}">${qs.que_typeName}</a></span>
            <!--<span class="layui-btn layui-btn-mini jie-admin  layui-btn-danger" type="collect" data-type="add">取消收藏</span>-->
          </div>
        </div>
        <div class="" style="margin-bottom: 20px;">
          <p>${qs.question_Content}</p>
        </div>
  </c:forEach>
      </div>
      <div class="fly-panel detail-box" style="padding-top: 0;">
        <a name="comment"></a>
        <ul class="jieda photos" id="jieda">
          <li data-id="12" class="jieda-daan">
            <a name="item-121212121212"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="">
                <img src="../../res/images/avatar/default.png" alt="">
                <cite>
                  <i>纸飞机</i>
                  <!-- <em>(楼主)</em>
                  <em style="color:#5FB878">(管理员)</em>
                  <em style="color:#FF9E3F">（活雷锋）</em>
                  <em style="color:#999">（该号已被封）</em> -->
                </cite>
              </a>
              <div class="detail-hits">
                <span>3分钟前</span>
              </div>
              <i class="iconfont icon-caina" title="最佳答案"></i>
            </div>
            <div class="detail-body jieda-body">
              <p>么么哒</p>
            </div>
            <div class="jieda-reply">
              <span class="jieda-zan zanok" type="zan"><i class="iconfont icon-zan"></i><em>12</em></span>
              <span type="reply"><i class="iconfont icon-svgmoban53"></i>回复</span>
              <!-- <div class="jieda-admin">
                <span type="edit">编辑</span>
                <span type="del">删除</span>
                <span class="jieda-accept" type="accept">采纳</span>
              </div> -->
            </div>
          </li>
          
          <li data-id="13">
            <a name="item-121212121212"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="">
                <img src="../../res/images/avatar/default.png" alt="">
                <cite>
                  <i>香菇</i>
                  <em style="color:#FF9E3F">活雷锋</em>
                </cite>
              </a>
              <div class="detail-hits">
                <span>刚刚</span>
              </div>
            </div>
            <div class="detail-body jieda-body">
              <p>蓝瘦</p>
            </div>
            <div class="jieda-reply">
              <span class="jieda-zan" type="zan"><i class="iconfont icon-zan"></i><em>0</em></span>
              <span type="reply"><i class="iconfont icon-svgmoban53"></i>回复</span>
              <div class="jieda-admin">
                <span type="edit">编辑</span>
                <span type="del">删除</span>
                <span class="jieda-accept" type="accept">采纳</span>
              </div>
            </div>
          </li>
          <!-- <li class="fly-none">没有任何回答</li> -->
        </ul>
        
        <div class="layui-form layui-form-pane">
          <form action="/jie/reply/" method="post">
            <div class="layui-form-item layui-form-text">
              <div class="layui-input-block">
                <textarea id="L_content" name="content" required lay-verify="required" placeholder="我要回答"  class="layui-textarea fly-editor" style="height: 150px;"></textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <input type="hidden" name="jid" value="{{rows.id}}">
              <button class="layui-btn" lay-filter="*" lay-submit>提交回答</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <div class="edge">
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">最近热帖</dt>
      <dd>
        <a href="">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
    </dl>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">近期热议</dt>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
    </dl>
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
<script src="../../res/layui/layui.js"></script>
<script>
layui.cache.page = 'jie';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '../../res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '../../res/mods/'
}).extend({
  fly: 'index'
}).use('fly', function(){
  var fly = layui.fly;
  //如果你是采用模版自带的编辑器，你需要开启以下语句来解析。
  /*
  $('.detail-body').each(function(){
    var othis = $(this), html = othis.html();
    othis.html(fly.content(html));
  });
  */
});
</script>

</body>
</html>