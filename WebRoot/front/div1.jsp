<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>测试布局页面  可以删除</title>
		<script  src="/Student/js/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/Student/front/bootstrap/bootstrap.min.css">
		<script  src="/Student/front/bootstrap/bootstrap.min.js"></script>
</head>
<style type="text/css">
		body{
			height:100%;
			width:100%;
			overflow:hidden;
			margin:0;
			padding:0;
		}
		
		.top{
			position: fixed;
			width:77%;
		}
		
		.centerInfo{
				border:1px solid red;
				width:100%;
				height:500px;
				background: white;
				margin-bottom:10%;
				margin-top:8%;
		}
		.centerInfo .leftInfo{
				border:1px solid black;
				width:20%;
				height:498px;
				background: white;
				margin-bottom:10px;
				float:left;
				position: fixed;
		}
		.centerInfo .rightInfo{
				border:1px solid green;
				width:80%;
				height:498px;
				background-color:white;
				margin-bottom:10px;
				float:right;
				padding: 10px 10px 10px 190px;	
				overflow: auto;
		}
		/*中间部分内容块*/
		.centerInfo .rightInfo .jumbotron{
			 align:centrer;
			 width:80%;
			 height:60%;
			 margin-left:auto;
			 margin-right:auto;
			 
		}
		.centerInfo .rightInfo .jumbotron .jumbotronTop{
			 width:100%;
			 height:20%;
			 background-color: black;
			 margin-top:-8%;
		}
		
		.bootomInfo{
				border:1px solid red;
				width:100%;
				height:50px;
				background: blue;
		}		
</style>

<body>
<div class="container">
	<div class="row clearfix top">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">首页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">活动<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">我发起的活动</a>
								</li>
								<li>
									 <a href="#">我参加的活动</a>
								</li>
								<li>
									 <a href="#">申请活动</a>
								</li>																
								
							</ul>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">说说<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">我的说说</a>
								</li>
								<li>
									 <a href="#">朋友说说</a>
								</li>
								<li>
									 <a href="#">与我相关</a>
								</li>																
								
							</ul>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">问吧<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">我的问题</a>
								</li>
								<li>
									 <a href="#">朋友问题</a>
								</li>
								<li>
									 <a href="#">我的答案</a>
								</li>	
								<li>
									 <a href="#">与我相关的问题</a>
								</li>																								
							</ul>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">社团<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">我的社团</a>
								</li>
								<li>
									 <a href="#">社团申请</a>
								</li>
								<li>
									 <a href="#">社团相关</a>
								</li>																
								
							</ul>
						</li>						
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">消息<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">我的消息</a>
								</li>
								<li>
									 <a href="#">社团消息</a>
								</li>
								<li>
									 <a href="#">未读消息</a>
								</li>																
								
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">查询</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">个人中心</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
							</ul>
						</li>
					</ul>
			</nav>
		</div>
	</div>
	<!--中间模块-->
	<div  class="centerInfo">
			 <!-- 中间左侧模块-->
				<div class="leftInfo">
							<ul class="nav nav-pills nav-stacked">
 									  <li role="presentation" class="active"><a href="#">推荐</a></li>
  									  <li role="presentation"><a href="#">活动中心</a></li>
  									  <li role="presentation"><a href="#">说说</a></li>
  									  <li role="presentation"><a href="#">社团</a></li>
  									  <li role="presentation"><a href="#">问吧</a></li>
  									  <li role="presentation"><a href="#">个人中心</a></li>
							</ul>
				</div>
			 <!-- 中间右侧模块-->	
				<div class="rightInfo">
						<div class="jumbotron" >
								<div class="jumbotronTop">
								
								</div>
								<div class="jumbotronBottom">
										
								</div>
						</div>
						<div class="jumbotron" >
								<div class="jumbotronTop">
								
								</div>
								<div class="jumbotronBottom">
										
								</div>
						</div>
						<div class="jumbotron" >
								<div class="jumbotronTop">
								
								</div>
								<div class="jumbotronBottom">
										
								</div>
						</div>						
				</div>	
				
							
	</div>
	<!--底部模块 -->
	<div  class="bootomInfo">
				
	</div>	
</div>

</body>
</html>