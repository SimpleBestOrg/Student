<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/Student//back/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="/Student/back/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/Student/back/easyui/demo.css">
    <script  src="/Student/js/jquery.min.js"></script>
    <script  src="/Student/back/easyui/jquery.easyui.min.js"></script>
    <script  src="/Student/js/easyui-lang-zh_CN.js"></script>
<title>审核活动</title>

</head>
<body>
    
    <!-- 显示审核活动网格-->
    <table id="activityReviewGrid"></table>

    <!-- 工具栏  -->
    <div id="tb">
        <a id="reviewActivity" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">审核</a>
        <!-- 搜索框 -->
        <input id="ss"></input>
        <!-- 下拉选择框 -->
        <select id="cc" class="easyui-combobox" name="dept" style="width:200px;">   
            <option value="">全部</option>   
            <option value="0">待审核</option>   
            <option value="1">已同意</option>   
            <option value="2">被拒绝</option>   
            <option value="3">已发起</option>   
        </select>            
    </div>
    <!-- 活动详细信息框 -->  
    <div id='reviewActivityDialog'>
            <center>
                 <form  method="post"  id="updateActivityFlagForm">
                    <div style='margin-top:15px'>  
                        <label>活动名称:</label>   
                        <input type="text"  id='activityName' name="activityName" value="" readonly="readonly" />   
                    </div> 
                    <div style='margin-top:15px'>  
                        <label>开始时间:</label>   
                        <input type="text"  id='activityBeginTime' value="" readonly="readonly" />   
                    </div> 
                    <div style='margin-top:15px'>   
                        <label>结束时间:</label>   
                        <input type="text" id='activityEndTime' value="" readonly="readonly" />   
                    </div> 
                    <div style='margin-top:15px'>    
                        <label>申请原因:</label>   
                        <input type="text" id='activityAppliReason' value="" readonly="readonly" />   
                    </div> 
                    <div style='margin-top:15px'>    
                        <label>申请人:</label>   
                        <input type="text" id='studentName' value="" readonly="readonly" />   
                    </div>
                    <div style='margin-top:15px'>    
                        <label>活动类型:</label>   
                        <input type="text" id='activityTypeName' value="" readonly="readonly" />   
                    </div>
                    <div style='margin-top:15px'>    
                        <label>理由:</label>   
                        <input type="text" id='reviewActivityReason' name='reviewActivityReason' value=""  />   
                    </div>      
                    <div style='margin-top:20px;'>
                        <label style="color: red;">*注意:理由为同意或者拒绝理由[必填项]</label>
                        <!-- 活动状态用于后台获取 -->
                        <input type='hidden' value='' id='activityFlag' name='activityFlag' />
                        <!-- 活动ID 用于后台获取进行更新 -->
                        <input type='hidden' value='' id='activityId' name='activityId'/>
                        <input type='hidden' value='' id='activityStuId' name='activityApplyStuId'/>
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
							roomPage.grid();
							roomPage.search();
							roomPage.combox();
							roomPage.click();
							roomPage.dialog();
						},
					 	//显示数据的网格
						grid:function(){
    			                $('#activityReviewGrid').datagrid({    
    			                    url:'/Student/queryActivityForPage.action',  
    			                    loadMsg:'努力加载中',
    			                    striped:true,
    			                    pagination:true,//在底部显示分页工具栏
    			                    singleSelect:true,//只能单选一条数据
    			                    toolbar:'#tb',
    			                    pageSize:10,
    			                    pageList:[5,10,15,20],
    			                    columns:[[
											  {field:'ck',title:'',checkbox:true}
    			                              ,{field:'activityName',title:'活动名称',width:80,align:'center'}
    			                              ,{field:'activityAppliReason',title:'申请原因',width:200,align:'center'}
    			                              ,{field:'activityBeginTime',title:'活动开始时间',width:160,align:'center',
    			                            	  formatter:function(value,row,index){
    			                            		   return ((new Date(value)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')
    			                            	  }
    			                              }
    			                              ,{field:'activityEndTime',title:'活动结束时间',width:160,align:'center',
    			                            	  formatter:function(value,row,index){
   			                            		   return ((new Date(value)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')
   			                            	  	 }    			                            	
    			                              }
    			                              ,{field:'student',title:'申请人',width:100,align:'center',
    			                            	  formatter:function(value,row,index){
      			                            		   return  value.studentName;
      			                            	  	 }      			                              
    			                              }
    			                              ,{field:'activityType',title:'活动类型',width:80,align:'center',
    			                            	  formatter:function(value,row,index){
     			                            		   return  value.activityTypeName;
     			                            	  	 }    			                            	  
    			                              }
    			                              ,{field:'activityFlag',title:'活动状态',width:80,align:'center',
												  formatter:function(value,row,index){
													   if(value==0){
														    return '待审核';
													   }else if(value==1){
														    return '已同意';
													   }else if(value==2){
														    return '被拒绝'
													   }else if(value==3){
														    return '已发起';
													   }
												  }    			                            	  
    			                              }
    			                              ]]
    			                });  						
    			                
						},
						dialog:function(){
							 $('#reviewActivityDialog').dialog({
		                    	    title: '审核活动',    
		                    	    width: 450,    
		                    	    height:450,    
		                    	    closed: true,    
		                    	    cache: false,    
		                    	    modal: true,
		                    	    buttons:[{
		                    	    	text:'同意',
		                    	    	handler:function(){
		                    	    		if($('#reviewActivityReason').val().length!=0){
		                    	    			//点击同意按钮时  说明活动审核通过  给活动状态隐藏栏赋值1 用于更新活动的状态 
		                    	    			$('#activityFlag').val(1);
												$("#updateActivityFlagForm").form("submit",{
													url:'/Student/updateActivityFlag.action',
		                    	    				success:function(data){
		                        	    					$('#activityReviewGrid').datagrid("reload");
		                           	    					$('#reviewActivityDialog').dialog("close");
		                    	    				 }
												})
		                    	    		}else if($('#reviewActivityReason').val().length==0){
		                    	    			$.messager.alert('警告','请填写同意理由'); 
		                    	    		}
		                    	    	}
		                    	    },{
		                    	    	text:'拒绝',
		                    	    	handler:function(){
		                    	    		if($('#reviewActivityReason').val().length!=0){
		                    	    			//点击拒绝按钮时  说明活动审核通过  给活动状态隐藏栏赋值2
												$('#activityFlag').val(2);
												$("#updateActivityFlagForm").form("submit",{
													url:'/Student/updateActivityFlag.action',
		                    	    				success:function(data){
		                        	    					$('#activityReviewGrid').datagrid("reload");
		                           	    					$('#reviewActivityDialog').dialog("close");
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
						//根据条件模糊查询
						search:function(){
							$('#ss').searchbox({ 
								searcher:function(value,name){ 
    								alert(value + "," + name); 
    								        //得到下拉框选中的值
    										var comboxValue = $('#cc').val();
    								        alert("下拉框值"+comboxValue);
            								$('#activityReviewGrid').datagrid({
            									url:"/Student/queryActivityForPage.action",
            									queryParams: {
            										keyWord : value,
            										activityFlag:comboxValue
            									}
            								});
    								}, 
    							prompt:'活动名称/类型名称/申请人'
								}); 
						},
					  //活动状态下拉框
					  combox:function(){
						  $("#cc").combobox({
							  editable:false,
							  panelHeight:'auto',
							  onChange:function(newValue,oldValue){
								  //得到模糊查询的关键字
								  var keyWord = $('#ss').val();
      								$('#activityReviewGrid').datagrid({
    									url:"/Student/queryActivityForPage.action",
    									queryParams: {
    										flag : newValue,
    										keyWord : keyWord
    									}
    								});								  
							  }
						  })
					  },
					  //审核按钮
					  click:function(){
						   //点击审核按钮
						   $("#reviewActivity").click(function(){
							   //获取选中的数据
							   var row = $('#activityReviewGrid').datagrid('getSelected');
							   if(row!=null  && row.activityFlag==0){
								   $("#activityName").val(row.activityName);
								   $("#activityAppliReason").val(row.activityAppliReason);
								   $("#activityBeginTime").val(((new Date(row.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,''));
								   $("#activityEndTime").val(((new Date(row.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,''));
								   $("#studentName").val(row.student.studentName);
								   $("#activityTypeName").val(row.activityType.activityTypeName);
								   $("#activityId").val(row.activityId);
								   $("#reviewActivityReason").val(null);
								   $("#activityFlag").val(null);
								   $("#activityStuId").val(row.student.studentId);
								   $("#reviewActivityDialog").dialog("open");
								   
							   }else if(row!=null  && row.activityFlag!=0){
								   $.messager.alert('警告','该活动已审核');  
							   }else{
								   $.messager.alert('警告','请选择需要审核的活动');
							   }
						   });
					  },
					  
			}

</script>
</html>