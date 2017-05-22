<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限分配</title>
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
	  	.disnone{
	  		display:none;
	  	}
	 </style>
	<body class="easyui-layout">
		<div
			data-options="region:'west',title:'权限',split:false,collapsible:false"
			style="width: 150px;" >
			<div style="margin-top:5px">
				<a id="PerEdit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"></a>
				<a id="PerAdd" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'"></a>
				<a id="PerRemove" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"></a>
				<hr/>
			</div>
			<div id="Permission"></div>  <!-- 权限显示 -->
		</div>
		<div data-options="region:'center',title:'菜单'"
			style="padding: 0px; background: #eee;">
			<table id="Menus"></table>
		</div>
<!--菜单按钮  -->
		<div id="menusBtn">
			<a id="BtnSub" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
		</div>
		<!-- 添加权限 -->
		<div id="AddPermissionDiv">
			<form  method="post" id="AddPermissionForm">
				<input name="authorityId" type="hidden">
				<table align="center" style="margin-top:25px">
					<tr align="center">
						<td>权限名称：</td>
						<td><input name="authorityName" class="easyui-validatebox" data-options="required:true,validType:'text'" />  </td>
					</tr>
				</table>
			</form>
		</div>  
		
	</body>


</html>
<SCRIPT>
	var selectid=null;
	var selectName=null;
	var MenusAll="";
	$(function(){
		$.post("/Student/queryAuthorityParentMenu.action",function(data){MenusAll=data;},"json");
		PermissionPage.init();
		PermissionPage.Button();
		PermissionPage.DialogPermission();
		PermissionPage.DialogMenus();
	});
	var PermissionPage={
		init:function(){
			$.post("/Student/queryAuthority.action",function(data){
				if(data.length>0){
					var html="<ul>"; 
					$.each(data,function(i,item){
						html+="<li id='"+item.authorityId+"'>"+item.authorityName+"</li>";
					});
					html+="</ul>";
					$("#Permission").html(html);
					PermissionPage.bindClick();
				}
			},"json");
		},
		
		Button:function(){
			//权限的按钮方法
			$('#PerAdd').bind('click',function(){
				$('#AddPermissionDiv').dialog('open');
			});
			$('#PerRemove').bind('click',function(){
				$.messager.confirm('确认','您确认想要删除记录吗？',function(r){ 
				    if (r){    
				        $.post("/Student/deleteAuthority.action",{authorityId:selectid},function(data){
				        	$.messager.alert("提醒",data);
				        	PermissionPage.init();
				        });   
				    }    
				});  
			});
			$('#PerEdit').bind('click',function(){
				$('#AddPermissionDiv').dialog('open');
				$('#AddPermissionDiv').form('load',{
					'authorityId':selectid,
					'authorityName':selectName,
				});
			});
			
			
		},
		DialogPermission:function(){
			$('#AddPermissionDiv').dialog({    
			    title: '新增权限',    
			    width: 300,    
			    height: 150, 
			    closed: true,    
			    cache: false,    
			    modal: true,
			    onClose:function(){$('#AddPermissionDiv').form('clear');},//关闭则清楚该Div内的文本内容
			    buttons:[{
					text:'保存',
					handler:function(){
						$('#AddPermissionForm').form('submit',{
							url:"/Student/insertOrupdateAuthority.action",
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
						        $('#AddPermissionDiv').dialog("close");
						        PermissionPage.init();
			    			}
						});
					}
				},{
					text:'关闭',
					handler:function(){
						$('#AddPermissionDiv').dialog('close');
					}
				}],
			});  
		},
		bindClick:function(){
			$("#Permission > ul > li").on("click",function(){
				var lis = $("#Permission > ul >li");
				$.each(lis,function(i,li){
					$(li).css("background-color","white");
					$(this).css("color","gray");
				});
				$(this).css("background-color","blue");
				$(this).css("color","white");
				PermissionPage.TreeGrid($(this).attr("id"));//在点击时传递那个权限id
				selectid=$(this).attr("id");
				selectName=$(this).html();
			});
			$("#Permission > ul > li").first().trigger("click");
			
			$("#BtnSub").click(function(){
				var rows  = $('#Menus').treegrid("getSelections");
				var ids = new Array();
				$.each(rows,function(i,row){
					ids.push(row.menuId);
				});
				//authorityId :  selectid  当前选中Id 
				$.post("/Student/updateAuthorityMenu.action",{authorityId:selectid,ids:ids.join(",")},function(data){
				});
			});
		},
		TreeGrid:function(authorityId){
			if(authorityId==undefined){
				authorityId=0;
			}
			$('#Menus').treegrid({    
			    url:'/Student/queryOneAuthorityMenu.action?authorityId='+authorityId,    
			    idField:'menuId',    
			    treeField:'menuName',
			    toolbar:'#menusBtn',
			    fit:true,
			    fitColumns:true,
			    singleSelect:false,
			    animate:true,    
			    columns:[[    
			   		{field:'menu',checkbox:true,},  
			        {title:'menuId',field:'menuId',hidden:true},    
			        {field:'menuName',title:'menuName',width:1},   
			        {field:'sign',title:'sign',hidden:true,formatter:function(value,row,index){
			     
			        	if(value==1){
			        		$('#Menus').treegrid("select",row.menuId);
			        	}else{
			        		$('#Menus').treegrid("unselect",row.menuId);
			        	}
			        }},
			        {field:'menuUrl',title:'menuUrl',width:1},    
			    ]],
			    onSelect:function(rowData){
			   		if(rowData.menuParentId!=0){
			   			$('#Menus').treegrid("select",rowData.menuParentId);
			   		}
			    },
			});   
		}
	};

</SCRIPT>