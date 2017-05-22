<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理页面</title>
	<link rel="stylesheet" type="text/css" href="/Student/back/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="/Student/back/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="/Student/back/easyui/demo/demo.css">
	<script  src="/Student/js/jquery.min.js"></script>
	<script  src="/Student/back/easyui/jquery.easyui.min.js"></script>
	<script  src="/Student/js/easyui-lang-zh_CN.js"></script>
</head>

<style>
	 ul{margin: 0px;padding: 0px; list-style: none}
	 ul li{margin:0px;padding-left: 20px;height:30px; line-height:30px; border-bottom: 1px dashed #ccc;}
</style>

<body class="easyui-layout">   
    <div data-options="region:'north',title:'',split:false" style="height:40px;">
    	
    	<div align="right" style="margin-top:10px;margin-right:20px;">
    		<span style="margin-right:10px;">欢迎<a href="#"style="color:red">${Account.accountName}</a>登陆~</span>
    		<span id="isNullUser"><a href="#">注销</a></span>
    	</div>
    </div>   
    <div data-options="region:'west',title:'系统选项',split:true" style="width:180px;">
    	<div id="menus" class="easyui-accordion" data-options="fit:true,border:false">  
		</div>
    </div>   
    <div data-options="region:'center',title:''" style="padding:0px;background:#eee;">
    	<div id="tab" class="easyui-tabs" data-options="fit:true,border:false" >   
		</div>
    </div>
    <div data-options="region:'south',title:'',split:false" style="height:40px;padding-top:5px" align="center">
    	地址：郑州市二七区政通路25号AAA软件教育
    </div>     
  </body> 
<script type="text/javascript">
	$(function(){
		$.post("/Student/queryAccountMenu.action",function(data){
			if(data.length!=0){
				$.each(data,function(i,item){
					if(item.children.length>0){
						var ul = "<ul>";
							$.each(item.children,function(n,menu){
								ul+="<li><a style='display:block;height:inherit' href='javascript:toUrl(\""+menu.menuName+"\",\""+menu.menuUrl+"\")'>"+menu.menuName+"</a></li>";
							});
						ul+="</ul>";
						addMenu(item.menuName,ul);
					}
				});	
			}else{
				alert("请先登陆~");
				window.location="/Student/login.jsp";
			}
		},"json");
		$("#isNullUser").click(function(){
			$.post("/stuManager/isNullUser.bb",function(data){
				alert(data);;
			});
			window.location="/Student/login.jsp";
		});
	});
	function addMenu(title,info){
		$('#menus').accordion('add', {
			title: title,
			content: info
		});
	}
	function toUrl(title,url){
		var tab = $('#tab').tabs('getTab',title);
		if(tab){
			$('#tab').tabs('select',title);
		}else{
			$('#tab').tabs('add',{    
			    title:title,     
			    content:"<iframe src='"+url+"' width='100%' height='100%' frameborder='0' ></iframe>",    
			    closable:true,    
			});  
		}
	}		
</script>

</html>