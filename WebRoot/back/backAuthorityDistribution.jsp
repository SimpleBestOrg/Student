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
<title>用户管理</title>
</head>
<body class="easyui-layout">   
    <div data-options="region:'west',title:'人员',split:true,collapsible:false" style="width:200px;">
    	<table id="Accounts"></table>
    	<div id="AccBtn">
	 		<a href="#" id="AccBtnSave" class="easyui-linkbutton" data-options="iconCls:'icon-add'" ></a>  
 			<input id="AcComBox"/>
 			<input id="AcSearch"></input>
 		</div>
 		
    </div>   
    <div data-options="region:'center',title:'权限',split:false,collapsible:false" style="width:200%;">
    	<table id="Permission"></table>
    	<div id="RoleBtn">
	 		<a href="#" id="RoleBtnSave" class="easyui-linkbutton" data-options="iconCls:'icon-save'"></a>
	 		<a href="#" id="RoleBtnEdit" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"></a>
	 		<a href="#" id="RoleBtnAdd" class="easyui-linkbutton" data-options="iconCls:'icon-add'"></a>
	 		<a href="#" id="RoleBtnRemove" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"></a>  
 		</div>
 		<div id="RolesFormDiv">
	 		<form method="post" id="RolesForm">
	 			<input type="hidden" name="authorityId"/>
	 			<table align="center" style="padding-top:30px;">
	 				<tr>
	 					<th>权限名称:</th>
	 					<td><input name="authorityName" class="easyui-validatebox" data-options="required:true"/></td>
	 				</tr>
	 			</table>
	 		</form>
	 	</div>
    	
    </div>  
 </body>
	<script>
		var selectid=0;
		var selectAcid=1; //查询的时候用 判断查询的是老师还是学生
		
		$(function(){
			Roles.Init();
		});
		var Roles={
			Init:function(){
				Roles.Dialog();
				Roles.DataGridAcc('teaName',1,"");
				Roles.ComBoX();
				Roles.Search();
				Roles.Button();
			},
			Search:function(){
				$('#AcSearch').searchbox({ 
					searcher:function(value){ 
						if(selectAcid==1){
							Roles.DataGridAcc('teaName',1,value);
						}else if(selectAcid==2){
							Roles.DataGridAcc('stuName',2,value);
						}
					}, 
					width:93,
					prompt:'模糊查询',
				}); 
			},
			ComBoX:function(){
				$('#AcComBox').combobox({
					data:[{"id":1,"text":"老师"}],
				    width:55,
				    valueField:'id',    
				    textField:'text',
				    panelHeight:'auto',  // 自动适应高度
				    editable:false,
				    onLoadSuccess:function(){
				    	$('#AcComBox').combobox("select","老师");
				    },
				    onSelect:function(row){
				    	selectAcid=row.id;  //查询的时候用 判断查询的是老师还是学生
				    	if(row.id==1){
				    		Roles.DataGridAcc('teaName',1,"");
				    	}else{
				    		Roles.DataGridAcc('stuName',2,"");
				    	}
				    	$('#AcSearch').searchbox('clear','none');
				    }
				});
			}, 
			Button:function(){
				$('#RoleBtnRemove').bind('click',function(){
		  			var row = $('#Permission').datagrid("getSelected");
		  			if(row){
						$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
						    if (r){    
						    	$.post("/Student/deleteAuthority.action",{authorityId:row.authorityId},function(data){
						    		$.messager.alert("提示",data);
						    	});
						    	Roles.DataGridPer(selectid);
						    }    
						}); 
					}
	  			 }),
			
				$('#RoleBtnEdit').bind('click', function(){
			       	var row = $('#Permission').datagrid("getSelected");
						if(row){
							$('#RolesFormDiv').dialog('open');
							$('#RolesForm').form('load',{
			  					'authorityName':row.authorityName,
			  					'authorityId':row.authorityId,
			  				}); 
						}
			    });
				$('#RoleBtnAdd').bind('click', function(){
			        $('#RolesFormDiv').dialog('open');
			    });
				$('#RoleBtnSave').bind('click',function(){
	  			 	var rows  = $('#Permission').datagrid("getSelections");
	  			 	var ids = new Array();
	  			 	$.each(rows,function(i,row){
	  			 		ids.push(row.authorityId);
	  			 	});
	  			 	$.post("/Student/saveAuthority.action",{accountId:selectid,ids:ids.join(",")},function(data){
						
	  			 	});
	  			 });			
			},
			Dialog:function(){
		  		$('#RolesFormDiv').dialog({    
				    title: '权限添加',    
				    width: 450,    
				    height: 220,    
				    closed: true,    
				    cache: false,    
				    onClose:function(){$('#RolesFormDiv').form('clear');},
				    modal: true,
				    buttons:[{
						text:'保存',
						handler:function(){
							$('#RolesForm').form('submit',{
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
				    				$('#Permission').datagrid("reload");
							        $('#RolesFormDiv').dialog("close");
				    			}
				    		});
						}
					},{
						text:'关闭',
						handler:function(){
							$('#RolesFormDiv').dialog('close'); 
						}
					}]
					});
	  		},
			DataGridAcc:function(name,id,value){
				if(id==undefined){
					id=1;
				}
				if(value==undefined){
					value="";
				}
				$('#Accounts').datagrid({    
				    url:'/Student/queryAccountTeaStu.action?id='+id+'&value='+value, 
				    idField:'accountId',
				    fitColumns:true, //横向的分配列宽
					striped:true,
					rownumbers:false,
				    fitColumns:true,
				    toolbar:'#AccBtn',
				    pagination:true, 
				    fit:true,
					singleSelect:true,  
				    columns:[[    
				        {field:'accountId',title:'accountId',width:100,hidden:true},    
				        {field:name,title:'',width:100},    
				    ]],
				    onLoadSuccess:function(){
				    	$('#Accounts').datagrid("selectRow",0);
				    },
				    onSelect:function(rowIndex,rowData){
				       selectid=rowData.accountId;
				       Roles.DataGridPer(rowData.accountId);
				    }
				}); 
				var p = $('#Accounts').datagrid('getPager');
				$(p).pagination({
					displayMsg:"",
					layout:['list','first','sep','prev','sep','next','sep','last'],
				});
			},
	  		DataGridPer :function(accountid){
	  			$('#Permission').datagrid({    
			    url:'/Student/queryAccountAuthority.action?authorityId='+accountid,   //获取数据的地址   ajax
			    fitColumns:true, //横向的分配列宽
			    striped:true,
			    idField:"authorityId",
			    rownumbers:false,
			    toolbar:'#RoleBtn',
			    singleSelect:true,
			    fit:true,//填满父控件
			    columns:[[    
			        {field:'authorityId',title:'authorityId',hidden:true},
			        {field:'authorityName',title:'',width:100},
			        {field:'sign',title:'sign',width:100,hidden:true,formatter:function(value,index,row){
			        	if(value==1){
			        		$('#Permission').datagrid("selectRow",row);
			        	}else{
				        	$('#Permission').datagrid("unselectRow",row);
				        }
			        }},
			    ]],
			    
			});
	  		}
		};
	</script>
</html> 