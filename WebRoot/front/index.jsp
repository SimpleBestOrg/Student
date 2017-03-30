<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>首页</title>
		<script  src="/Student/js/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/Student/front/bootstrap/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/Student/front/bootstrap/layout.css">
		<script  src="/Student/front/bootstrap/bootstrap.min.js"></script>
</head>
<style type="text/css">
		.leftside{
			margin-top:15px;
		}
		.jumbotron{
			margin-top:15px;
		}
	    .jumbotronbootom{
		   margin-top:-50px;
		}
		.img{
			border:1px solid black;
			width:80px;
			height:80px;
			float:left;
		}
		.location{
			margin-left:10%;
		}
		
		.friendInfo{
			display: inline-block;
		}
		
		.timespan{
			font-size: 12px;
			margin-left:40%;
		}
		
		 
</style>

<body>
<div class="container">
	<div class="row clearfix top">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">AAA</a>
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
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">消息 <span class="badge">4</span>
							 </a>
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
	<!-- 中间模块 -->
	<div class="leftInfo">
			<div class="leftside">
				<ul class="nav nav-pills nav-stacked">
				  <li class="active"><a href="#">首页</a></li>
				  <li><a href="#">活动</a></li>
				  <li><a href="#">问吧</a></li>
				  <li><a href="#">说说</a></li>
				  <li><a href="#">社团</a></li>
				  <li><a href="#">个人主页</a></li>
				</ul>
			</div>	
	</div>
	<!-- 右部模块  -->	
	<div class="rightInfo">
		<div class="jumbotron" >
			<div class="panel panel-primary jumbotronbootom">
			    <div class="panel-heading">
			        <h3 class="panel-title">活动</h3>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    王的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>
		    			    			    
	       </div>
	   	
	  </div>      
	  
	  
	  	<div class="jumbotron " >
			<div class="panel panel-primary jumbotronbootom">
			    <div class="panel-heading">
			        <h3 class="panel-title">说说</h3>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>		    			    
	       </div>
	  </div>    
	  
	  	  	<div class="jumbotron " >
			<div class="panel panel-primary jumbotronbootom">
			    <div class="panel-heading">
			        <h3 class="panel-title">问吧</h3>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>
			    <div class="panel-body">
			      			<ul class="media-list">
								<li class="media">
	  							  <a class="pull-left" href="www.baidu.com">
			                       <img class="media-object img" src="/Student/front/image/Capture001.png" alt="通用的占位符图像">
									<div class="media-body">
			                           <h4 class="media-heading">社团活动    网的女人</h4>
			                           <h5>这是否第三季开发的时间里反对萨福多三范德萨范德萨范德萨范德萨发的卡发动机索拉卡范德萨这就发动机狂蜂浪蝶范德萨范德萨范德萨</h5>
		                             </div>
		                             <div class="container">
		                            	<p><span class="glyphicon glyphicon-time"></span><span class="timespan">五天前</span></p>
		                           	 </div>    				
		                          </a>
	                          </li>
                           </ul>
			    </div>		    			    
	       </div>
	  </div> 
	  
	  
</div>

</body>
