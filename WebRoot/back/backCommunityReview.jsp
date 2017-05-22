<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社团审核</title>
    <link rel="stylesheet" type="text/css" href="/Student//back/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="/Student/back/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/Student/back/easyui/demo.css">
    <script  src="/Student/js/jquery.min.js"></script>
    <script  src="/Student/back/easyui/jquery.easyui.min.js"></script>
    <script  src="/Student/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
                <!-- 显示社团信息网格 -->
            <table id="communityGrid"></table>
            <!-- 工具栏  -->
            <div id="tb">
                <a id="reviewCommunity" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">审核</a>
                <!-- 搜索框 -->
                <input id="ss"></input>
                <!-- 下拉选择框 -->
                <select id="cc" class="easyui-combobox" name="dept" style="width:200px;">   
                    <option value="">全部</option>   
                    <option value="0">待审核</option>   
                    <option value="1">已同意</option>   
                    <option value="2">被拒绝</option>   
                </select>            
            </div> 
            <div id='communityForm'>
               <center>
                    <form method="post" id="updateCommunityForm">
                            <div style='margin-top:15px'>  
                                <label>社团名称:</label>   
                                <input type="text"  style='border:0px;' id='communityName' name="communityName" value="" readonly="readonly" />   
                            </div> 
                            <div style='margin-top:15px'>    
                                <label>社团职责:</label>   
                                <input type="text"  style='border:0px;' id='communityAppliRespon'  value="" readonly="readonly" />   
                            </div>
                            <div style='margin-top:15px'>    
                                <label>社团人数:</label>   
                                <input type="text" style='border:0px;' id='communityPersonNum' value="" readonly="readonly" />   
                            </div>                            
                            <div style='margin-top:15px'>    
                                <label>申请原因:</label>   
                                <input type="text" style='border:0px;' id='communityAppliReason' value="" readonly="readonly" />   
                            </div> 
                            <div style='margin-top:15px'>  
                                <label>申请时间:</label>   
                                <input type="text" style='border:0px;' id='communityAppliDate' value="" readonly="readonly" />   
                            </div> 
                            <div style='margin-top:15px'>    
                                <label>申请人:</label>   
                                <input type="text" style='border:0px;' id='studentName' value="" readonly="readonly" />   
                            </div>
                            <div style='margin-top:15px'>    
                                <label style='margin-left:-150px;'>回馈信息:</label>  
                                <div style='margin-left:60px;'> 
                                     <textarea rows="5"  cols="20" id='reviewCommunityReason' name='reviewCommunityReason'></textarea>
                                </div>   
                            </div>      
                            <div style='margin-top:20px;'>
                                <label style="color: red;">*注意:①理由为同意或者拒绝理由[必填项]</br><span style='margin-left:-25px;'>②若同意申请人则为社团部长</span></label>
                                <!-- 活动用于后台获取 -->
                                <input type='hidden' value='' id='communityFlag' name='communityFlag' />
                                <!-- 活动ID 用于后台获取进行更新 -->
                                <input type='hidden' value='' id='communityId' name='communityId'/>
                                <input type='hidden' value='' id='communityApplyStuId' name='communityApplyStuId'/>
                            </div>                                
                    </form>
                  </center>            
            </div>           
</body>
    <script type="text/javascript">
    		$(function(){
    			 roomPage.init();
    		})
    		
    		var roomPage = {
    				 init:function(){
    					 roomPage.datagrid();
    					 roomPage.searcher();
    					 roomPage.combobox();
    					 roomPage.click();
    					 roomPage.dialog();
    				 },
    				 datagrid:function(){
    					 $('#communityGrid').datagrid({
	                            url:'/Student/queryCommunityForPage.action',  
	                            loadMsg:'努力加载中',
	                            striped:true,
	                            pagination:true,//在底部显示分页工具栏
	                            singleSelect:true,//只能单选一条数据
	                            toolbar:'#tb',
	                            pageSize:4,
	                            pageList:[1,2,3,4,5],
	                            columns:[[
	                                      {field:'ck',title:'',checkbox:true}, 
	                                      {field:'communityName',title:'社团名称'},
	                                      {field:'communityAppliStudent',title:'申请人',
												formatter:function(value,row,index){
													 return value.studentName;
												}
	                                      },
	                                      {field:'communityPersonNum',title:'限制人数',width:80,align:'center',
												formatter:function(value,row,index){
													 return value+"人";
												}
	                                      },
	                                      {field:'communityAppliReason',title:'申请原因'},
	                                      {field:'communityAppliDate',title:'申请日期',width:200,align:'center',
	                                    		formatter:function(value,row,index){
	                                    			return ((new Date(value)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')
	                                    		}
	                                      	},
	                                      {field:'communityPhoto',title:'社团照片',width:120,align:'center',
												formatter:function(value,row,index){
													 if(value!=null){
														 return '<img  src="/pic/'+value+'" style="width:50px;height:50px;"/>';
													 }else if(row.communityPhoto==null){
														 return '暂无照片';
													 }
												}
	                                      },
	                                      {field:'communityFlag',title:'社团状态',
        											formatter:function(value,row,index){
        												 if(value==0){
        													  return '待审批';
        												 }else  if(value==1){
        													  return '已同意';
        												 }else  if(value==2){
        													  return '未同意';
        												 }
        											}
	                                      },
	                                      ]]
    					 })
    				 },
    				 dialog:function(){
    						 $('#communityForm').dialog({
    	                    	    title: '审核社团',    
    	                    	    width: 450,    
    	                    	    height:550,    
    	                    	    closed: true,    
    	                    	    cache: false,    
    	                    	    modal: true,
    	                    	    buttons:[{
    	                    	    	text:'同意',
    	                    	    	handler:function(){
    	                    	    		if($('#reviewCommunityReason').val().length!=0){
    	                    	    			//点击同意按钮时  说明活动审核通过  给活动状态隐藏栏赋值1 用于更新活动的状态 
    	                    	    			$('#communityFlag').val(1);
    											$("#updateCommunityForm").form("submit",{
    												url:'/Student/updateCommunityFlag.action',
    	                    	    				success:function(data){
    	                        	    					$('#communityGrid').datagrid("reload");
    	                           	    					$('#communityForm').dialog("close");
    	                    	    				 }
    											})
    	                    	    		}else if($('#reviewCommunityReason').val().length==0){
    	                    	    			$.messager.alert('警告','请填写回馈信息'); 
    	                    	    		}
    	                    	    	}
    	                    	    },{
    	                    	    	text:'拒绝',
    	                    	    	handler:function(){
    	                    	    		if($('#reviewActivityReason').val().length!=0){
    	                    	    			//点击拒绝按钮时  说明活动审核通过  给活动状态隐藏栏赋值2
    											$('#communityFlag').val(2);
    											$("#updateCommunityForm").form("submit",{
    												url:'/Student/updateCommunityFlag.action',
    	                    	    				success:function(data){
    	                        	    					$('#communityGrid').datagrid("reload");
    	                           	    					$('#communityForm').dialog("close");
    	                    	    				 }
    											})
    	                    	    		}else if($('#reviewActivityReason').val().length==0){
    	                    	    			$.messager.alert('警告','请填写拒绝理由'); 
    	                    	    		}		                    	    		
    	                    	    	}		                    	    	
    	                    	    },{
    	                    	    	text:'关闭',
    	                    	    	handler:function(){
    	                    	    		alert($('#reviewActivityDialog').dialog("close"));
    	                    	    	}		                    	    	
    	                    	    }]
    						 })
    					},
    				 searcher:function(){
    					 $('#ss').searchbox({ 
    						 searcher:function(value,name){ 
    							 alert(value + "," + name);
    							 var communityFlag = $('#cc').val();
            							 $('#communityGrid').datagrid({
            								    url:'/Student/queryCommunityForPage.action',  
            									queryParams: {
													keyWord:value,
													flag : communityFlag
            									}
            								});
    						 }, 
    						 prompt:'社团名称/申请人/申请原因' 
    						 }); 
    				 },
    				 combobox:function(){
						$('#cc').combobox({
							  editable:false,
							  panelHeight:'auto',
							  onChange:function(newValue,oldValue){
								  //得到模糊查询的关键字
								  var keyWord = $('#ss').val();
      								$('#communityGrid').datagrid({
      									url:'/Student/queryCommunityForPage.action',  
    									queryParams: {
    										flag : newValue,
    										keyWord : keyWord
    									}
    								});								  
							  }													
						})
    				 },
    				 click:function(){
    					 $('#reviewCommunity').click(function(){
    						 var row =  $('#communityGrid').datagrid("getSelected");
    						 if(row==null){
    							 $.messager.alert('警告','请选择需要审核的社团');  
    						 }else if(row!=null && row.communityFlag==0){
    							 $('#communityName').val(row.communityName);
    							 $('#communityAppliRespon').val(row.communityAppliRespon);
    							 $('#communityPersonNum').val(row.communityPersonNum+"人");
    							 $('#communityAppliReason').val(row.communityAppliReason);
    							 $('#communityAppliDate').val(row.communityAppliDate);
    							 $('#studentName').val(row.communityAppliStudent.studentName);
    							 $('#communityApplyStuId').val(row.communityAppliStudent.studentId);
    							 $('#communityId').val(row.communityId);
    							 $('#communityForm').dialog("open");
    						 }else if(row!=null && row.communityFlag!=0){
    							 $.messager.alert('警告','该社团已审核');
    						 }
    					 })
    				 }
    				 
    		}
    </script>
</html>