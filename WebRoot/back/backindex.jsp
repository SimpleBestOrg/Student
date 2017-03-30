<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这个页面是准备做后台页面</title>
	<link rel="stylesheet" type="text/css" href="/Student//back/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="/Student/back/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="/Student/back/easyui/demo/demo.css">
	<script  src="/Student/js/jquery.min.js"></script>
	<script  src="/Student/back/easyui/jquery.easyui.min.js"></script>
	<script  src="/Student/js/easyui-lang-zh_CN.js"></script>
</head>


<body>
<body class="easyui-layout">
	<div data-options="region:'north',title:' ',split:true"
		style="height: 100px;">
		<center>
			<H1>学生信息管理系统</H1>
		</center>
	</div>
	<!-- 底部 -->
	<div data-options="region:'south',title:'gere',split:true" style="height:50px;">
	
	</div>
	<!-- 右侧 -->	
	<div data-options="region:'east',title:'朋友圈',split:true" style="width: 150px;">
			<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查看朋友说说</a>
	</div>
	<!-- 左侧 -->	
	<div data-options="region:'west',title:'个人信息',split:true" style="width:150px;">
			
	</div>
	<div data-options="region:'center',title:''" fit="trues" style="padding: 5px; background: #eee;">
	  <!-- 首页页面 -->
		<div id="tt" class="easyui-tabs" style="width: 1020px; height: 500px;"
			fit="true">
			<div title="活动" style="padding:20px;">
				
			</div>
			<div title="说说" style="padding:20px;">
					<table id="talking"></table>
			</div>
			<div title="问吧" style="padding:20px;">
					<table id="question"></table>
			</div>
		    <div title="成绩" data-options="closable:true" style="overflow:auto;padding:20px;display:none;">   
		    			<a href="/Student/WebRoot/front/view.jsp">成绩</a> 
		    </div>
			<div title="项目" style="padding:20px;">
					
			</div>						
		</div>
	</div>
	                 <div id="tb" style="padding:2px 5px;">
										Date From:<input id="dateFrom" type="text"></input>
										To: <input id="dateTo"  type="text"></input>
										Language: 
										<select class="easyui-combobox" panelHeight="auto" style="width:100px">
											<option value="java">Java</option>
											<option value="c">C</option>
											<option value="basic">Basic</option>
											<option value="perl">Perl</option>
											<option value="python">Python</option>
										</select>
										<a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
					 </div>
					 <div id="add" style="padding:2px 5px;">
										<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
										<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
										<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
										<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
										<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
					</div>
</body>
</body>
</html>
<script type="text/javascript">
   //显示说说数据表格
	$('#talking').datagrid({
		url:'datagrid_data1.json',
		fit:true,
		fitColumns:true,
		pagination:true,
		toolbar:toolbar,
		singleSelect:true,
		striped:true,
		columns:[[
					{field:'ck',title:'',checkbox:true},
					{field:'activityName',title:'活动名称',width:100}, 
		            {field:'activityAddress',title:'活动地点',width:100},
		            {field:'activityBeginTime',title:'活动开始时间',width:100}, 
					{field:'activityEndTime',title:'活动结束时间',width:100},
					{field:'activityFlag',title:'状态',width:100},
					{field:'',title:'操作',width:100}
				  ]],
		toolbar: [{
			iconCls: 'icon-edit',
			handler: function(){alert('编辑按钮')}
		},'-',{
			iconCls: 'icon-help',
			handler: function(){alert('帮助按钮')}
		}]
		  
	});
   
   //日期控件
	$('#dateFrom').datebox({    
	    width:'110px'
	});  
	$('#dateTo').datebox({    
	    width:'110px'
	});  	

	
	
	//问题数据表格
	$('#question').datagrid({
		url:'datagrid_data1.json',
		fit:true,
		fitColumns:true,
		pagination:true,
		toolbar:"#tb",
		singleSelect:true,
		striped:true,
		footer:"#add",
		columns:[[
					{field:'ck',title:'',checkbox:true},
					{field:'activityName',title:'活动名称',width:100}, 
		            {field:'activityAddress',title:'活动地点',width:100},
		            {field:'activityBeginTime',title:'活动开始时间',width:100}, 
					{field:'activityEndTime',title:'活动结束时间',width:100},
					{field:'activityFlag',title:'状态',width:100},
					{field:'',title:'操作',width:100}
				  ]]	  
	});
	
	

	
	
	//查看朋友说说按钮
	$("#btn").click(function() {
		$('#win').dialog("open");
	});
</script>