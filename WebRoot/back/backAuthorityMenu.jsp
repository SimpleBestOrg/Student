<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/Student//back/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="/Student/back/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="/Student/back/easyui/demo/demo.css">
	<script  src="/Student/js/jquery.min.js"></script>
	<script  src="/Student/back/easyui/jquery.easyui.min.js"></script>
	<script  src="/Student/js/easyui-lang-zh_CN.js"></script>
<title>菜单管理</title>
</head>
 <body>
  	<table id="Menus"></table> 
 	<div id="MenusBtn">
 		<a href="#" id="BtnAdd" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加菜单</a>
 		<a href="#" id="BtnAddPar" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加父菜单</a>  
 		<a href="#" id="BtnEdit" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
 		<a href="#" id="BtnRemove" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>  
 	</div>
 	<div id="MenusFormDiv">
 		<form method="post" id="MenusForm">
 			<input type="hidden" name="menuId"/>
 			<table align="center" style="padding-top:30px;">
 				<tr>
 					<th>菜单名称:</th>
 					<td><input name="menuName" class="easyui-validatebox" data-options="required:true"/></td>
 				</tr>
 				<tr id="Parmenus1">
 					<th>路径:</th>
 					<td><input name="menuUrl" class="easyui-validatebox"/></td>
 				</tr>
 				<tr id="Parmenus2">
 					<th>父级菜单:</th>
 					<td>
 						<input type="hidden" id="Parents" name="menuParentId" />
 						<input id="Parent" name="Parent" />
 					</td>
 				</tr>
 			</table>
 		</form>
 	</div>
  </body>
  <style>
  	.disnone{
  		display:none;
  	}
  </style>
  <script type="text/javascript">
  	var MenusAll="";
  	$(function(){
  		$.post("/Student/queryAuthorityParentMenu.action",function(data){MenusAll=data;},"json");
  		Menus.init();
  	});
	
  	var Menus={
  		init :function(){
  			Menus.treegrid();
	  		Menus.Dialog();
	  		Menus.Button();
  		},
  		//主菜单下拉框
  		ComBox:function(Parent){
  			$('#Parent').combobox({
				    data:MenusAll,
				    valueField:'menuId',
				    textField:'menuName',
				    panelHeight:'auto',
				    editable:false,
				    onLoadSuccess:function(){
				    // 根据调用方法时  - 传入的参数选中菜单
				    	$('#Parent').combobox("select",Parent);
				    	$('#Parents').val(Parent);
				    },
				    onSelect:function(record){
				    	$('#Parents').val(record.menuId);
				    }
				});  
  		},
  		Button:function(){
  			//删除
  			$('#BtnRemove').bind('click',function(){
	  			var row = $('#Menus').datagrid("getSelected");
	  			if(row){
					$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
					    if (r){    
					    	$.post("/Student/deleteAuthorityMenu.action",{menuId:row.menuId},function(data){
					    		$.messager.alert("提示",data);
					    		$('#Menus').treegrid("reload");	
					    	});
					    }    
					}); 
				}else{
					alert("请选中要删除的数据！");
				} 
  			}),
  			//添加根菜单
  			$('#BtnAddPar').bind('click',function(){
  				$('#MenusFormDiv').dialog('open');
  				$('#Parents').val(0);
  				$('#Parmenus1').addClass("disnone");  //追加样式隐藏文本框
  				$('#Parmenus2').addClass("disnone"); //同上
  			}),
  			
  			//添加菜单
  			 $('#BtnAdd').bind('click', function(){
  			    var row = $('#Menus').datagrid("getSelected");
		        if(row){
		        	$('#MenusFormDiv').dialog('open');
		        	if(row.menuParentId=='0'){  //如果选中的行的父级列是0 则表明示父级菜单，则执行添加该父菜单的子菜单
		        		$('#MenusForm').form('load',{
		  					'menuParentId':row.menuParentId,  // 为父级元素赋值
		  				}); 
		  				Menus.ComBox(row.menuId);
		        	}else{//如果选中子菜单行则执行添加子菜单
			        	$('#MenusForm').form('load',{
		  					'menuParentId':row.menuParentId,
		  				});
		  				Menus.ComBox(row.menuParentId);
			        }
  				}else{
  					//如果没选中任何数据则添加根菜单
  					$('#BtnAddPar').click();  // 调用添加根菜单的方法
  				}
		     });
		     //修改
		     $('#BtnEdit').bind('click', function(){
		        var row = $('#Menus').datagrid("getSelected");
		        if(row){
			        if(row.menuParentId=='0'){
			        $('#MenusFormDiv').dialog('open');
				        $('#MenusForm').form('load',{
		  					'menuName':row.menuName,
		  					'menuId':row.menuId,
		  					'menuParentId':row.menuParentId
		  				});
		  				$('#Parmenus1').addClass("disnone");  //追加样式隐藏文本框
	  					$('#Parmenus2').addClass("disnone"); 
			        }else{
			        	$('#MenusFormDiv').dialog('open');
				        $('#MenusForm').form('load',{
		  					'menuName':row.menuName,
		  					'menuUrl':row.menuUrl,
		  					'menuId':row.menuId,
		  				});
		  				//调用下拉框并传入选中的父级元素
		  				Menus.ComBox(row.menuParentId);
			        }
		        }else{
		        	alert("请选中要修改的行！");
		        }
		     });
  		},
  		Dialog:function(){
	  		$('#MenusFormDiv').dialog({    
			    title: '菜单添加',    
			    width: 450,    
			    height: 200,
			    closable:false,  // 是否显示关闭按钮（X）    
			    closed: true,    
			    cache: false,    
			    onClose:function(){$('#MenusFormDiv').form('clear');},//关闭则清楚该Div内的文本内容
			    modal: true,
			    buttons:[{
					text:'保存',
					handler:function(){
						$('#MenusForm').form('submit',{
			    			url:"/Student/insertOrUpdateAuthorityMenu.action",
			    			onSubmit:function(){
			    				var isValid = $(this).form('validate');
			    				return isValid;
			    			},
			    			success:function(data){
			    				$.messager.show({
			    					title:'我的消息',		    					
			    					msg:data,
			    					height:150,
			    					timeout:3000,
			    					showType:'slide'
			    				});
			    				//防止添加完根菜单后追加子菜单时只出现ID而不出现文本
			    				$.post("/stuManager/queryAuthorityParentMenu.action",function(data){MenusAll=data;},"json");
			    				$('#Parmenus1').removeClass("disnone");  //追加样式移除该隐藏的文本框属性
  								$('#Parmenus2').removeClass("disnone");
			    				$('#Menus').treegrid("reload");  //刷新当前页面
						        $('#MenusFormDiv').dialog("close");
			    			}
			    		});
					}
				},{
					text:'关闭',
					handler:function(){
						$('#MenusFormDiv').dialog("close"); 
						$('#Parmenus1').removeClass("disnone");  //追加样式移除该隐藏的文本框属性
  						$('#Parmenus2').removeClass("disnone");
					}
				}]
				    
				});
  		},
	  	treegrid:function(){
	  		$('#Menus').treegrid({    
			    url:'/Student/queryAuthorityMenu.action',    
			    idField:'menuId',    
			    treeField:'menuName',
			    toolbar:'#MenusBtn',
			    fit:true,
			    fitColumns:true,
			    singleSelect:true,
			    animate:true,    
			    columns:[[    
			        {title:'menuid',field:'menuId',hidden:true},    
			        {field:'menuName',title:'menuName',width:1},    
			        {field:'menuUrl',title:'menuUrl',width:1},    
			        {field:'menuParentId',title:'menuParentId',hidden:true}    
			    ]]
			});  
		}
  	};
  </script>
</html>