<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑器</title>
<link rel="stylesheet" type="text/css" href="/Student/front/dist/css/wangEditor.min.css">
<script type="text/javascript" src="/Student/front/dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/Student/front/dist/js/wangEditor.min.js"></script>
</head>
<body>
   <div style="height:300px;width:80%">
	<textarea id="textarea1">
    	<p>请输入内容...</p>
	</textarea>
   </div>
   
	<button id="launch">发表内容</button>
<!--这里引用jquery和wangEditor.js-->
	<script type="text/javascript">
	    var editor = new wangEditor('textarea1');
	    
	    //自定义菜单
	    editor.config.menus = [
	          'img',
	          'emotion'
		];
	    //自定义表情
	    editor.config.emotions = {
	    		 'default': {
	    		        title: '表情',  // 组名称
	    		        data: '/Student/front/dist/emotions1.data'  // 服务器的一个json文件url，例如官网这里配置的是 http://www.wangeditor.com/wangEditor/test/emotions.data
	    		    }	
	    }
	    
	    //配置上传图片的服务器端
   		 editor.config.uploadImgUrl = '/Student/image';
	    //隐藏网络上传图片
	    editor.config.hideLinkImg = true;
	    //配置上传图片的headers
	    editor.config.uploadHeaders = {
	            'Accept' : 'text/x-json'
	        };
	    
	    
	    
	    
	    
	    
	    
	    editor.create();
	    
	    $('#launch').click(function () {
	        // 获取编辑器区域完整html代码
	        var html = editor.$txt.html();
			
	        alert(html);
	        // 获取编辑器纯文本内容
	        var text = editor.$txt.text();

	        // 获取格式化后的纯文本
	        var formatText = editor.$txt.formatText();
	    });
	</script>
</body>
</html>