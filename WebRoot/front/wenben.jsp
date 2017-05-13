<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>edit(带图片上传)富文本编辑器</title>
<link rel="stylesheet" href="assets/design/css/trumbowyg.css">
<script src="assets/jquery.min.js"></script>
<script src="assets/trumbowyg.js"></script>
<script src="assets/plugins/upload/trumbowyg.upload.js"></script>
<script src="assets/plugins/base64/trumbowyg.base64.js"></script>


</head>

<body>

    
        <div id="odiv" style="width:200px;height:300px;display:none;position:absolute;z-index:100;">
            <img src="assets/pic/sx.png" title="缩小" border="0" alt="缩小" onclick="sub(-1);"/>
            <img src="assets/pic/fd.png" title="放大" border="0" alt="放大" onclick="sub(1)"/>
            <img src="assets/pic/cz.png" title="重置" border="0" alt="重置" onclick="sub(0)"/>
            <img src="assets/pic/sc.png" title="删除" border="0" alt="删除" onclick="del();odiv.style.display='none';"/>
        </div>
        <div  onmousedown="show_element(event)"  style="clear:both" id="customized-buttonpane" class="editor">
            
        </div>
        
    <form action="/News/img.action" id="wenBenform" method="post" >
            <input type="text"  id="info" name="info"></input>
    </form>
       <input type="button" id="btn" value="提交" />
    <script type="text/javascript">
    		 $("#btn").click(function(){
    			 alert("你好");
    			 var wenbeninfo =  $("#customized-buttonpane").html(); 
    			 $("#info").html("fdsafdsa");
    		 })
    </script>
</body>
