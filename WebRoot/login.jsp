<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>AAA记录登录系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='assets/css/googleapis.css'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>AAA</h1>
            <form action="/Student/queryAccountLanding.action" method="post">
                <input type="text" name="accountName" class="username" placeholder="用户名">
                <input type="password" name="accountPwd" class="password" placeholder="密码">
                <button type="submit">登录</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>
       <script type="text/javascript">
       		$(function(){
       				
       				var loginMsg = <%=request.getAttribute("loginMsg")%>;
       				if(loginMsg == 1){
       					alert("用户名或者密码输入错误 重新输入");
       				}
       				
       				var loginInfo = <%=request.getParameter("loginInfo")%>;
       				if(loginInfo == 1){
       					alert("请登录");
       				}
       		})
       </script>
    </body>

</html>

