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
<title>学生管理</title>
</head>
<body>
            <!-- 显示学生信息网格 -->
            <table id="studentGrid"></table>
            <!-- 工具栏  -->
            <div id="tb">
                <a id="addStudentBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
                <!-- 搜索框 -->
                <input id="ss"></input>
            </div>
            
            
            
            <!--添加学生的表单 -->
           <div id="addStudentDialog"> 
            <center> 
             <form id="addStudentForm" method="post" enctype="multipart/form-data">   
                <div>  
                    <label>姓名:</label>   
                    <input class="easyui-validatebox" type="text" name="studentName" data-options="required:true" />   
                </div>   
                <div>
                    <label>性别:</label>
                    <select id="sex" class="easyui-combobox" name="studentSex"  style="width:180px;">   
                        <option value="0">男</option>   
                        <option value="1">女</option>   
                    </select>    
                </div>   
                <div>
                    <label>出生日期:</label>
                    <input id="birthday" type="text" name="studentBirthday" style="width:180px;"  ></input>  
                </div>
                <div>
                    <label>班级:</label>
                    <input id="class" name="studentClasses.classesId"  style="width:180px;">
                </div>
                <div>
                    <label>住址:</label>
                    <input id=""  class="easyui-validatebox" name="studentAddress"   style="width:180px;"  data-options="required:true" />
                </div>
                <div>
                    <label>个人照片:</label>
                    <input type="file" name="photoFile"     onchange="PreviewImage(this,'imgHeadPhoto','divPreview')"  />
                       <div id="divPreview">
                          <img id="imgHeadPhoto"  width="200"  height="200" src="/admin/upload/">
                       </div>
                    <label>注意:学生的登录账户和登录密码为学生的名字拼音形式</label>   
                </div>
                
             </form> 
            </center> 
           </div> 
            <!-- 修改学生信息 -->
            <div id="addStudent"></div>
            
            
</body>
<script type="text/javascript">                        
        $(function(){
        	//页面初始化
        	roomPage.init();
        })               
    
                       
        var roomPage  = {
       					init:function(){
       						roomPage.grid();
       						roomPage.dialog();
       						roomPage.click();
       						roomPage.datetimebox();
       						roomPage.combox();
       						roomPage.search();
       					}, 
						grid:function(){
            							//显示学生数据的表格
            	                        $('#studentGrid').datagrid({    
            	                            url:'/Student/getAllStudent.action',  
            	                            loadMsg:'努力加载中',
            	                            striped:true,
            	                            pagination:true,//在底部显示分页工具栏
            	                            singleSelect:true,//只能单选一条数据
            	                            toolbar:'#tb',
            	                            pageSize:2,
            	                            pageList:[1,2,3,4,5],
            	                            columns:[[    
            									{field:'ck',title:'',checkbox:true}, 
            	                                {field:'stu_Id',title:'ID',width:50,align:'center'},    
            	                                {field:'stu_Name',title:'姓名',width:100,align:'center'},    
            	                                {field:'stu_Sex',title:'性别',width:100,align:'center',
                													 formatter:function(value,row,index){
                															if(value==0){
                																return '男';
                															}else{
                																return '女';
                															}																													 
                												 }																						            	                                	
            	                                	},
            	                                {field:'stu_Birthday',title:'年龄',width:100,align:'center'},
            	                                {field:'cla_Name',title:'班级',width:100,align:'center'},
            	                                {field:'community_Name',title:'社团',width:100,align:'center',
            													 formatter:function(value,row,index){
            																if(value==null){
            																	return '暂无社团';
            																}else{
            																	return value;
            																}																													 
            													 }						
            	                                	},
            	                                {field:'stu_Address',title:'住址',width:100,align:'center'},
            	                                {field:'stu_Photo',title:'照片',width:100,align:'center', 
            	                                				formatter:function(value,row,index){
            	                                						return '<img  src="/pic/'+value+'" style="width:50px;height:50px;"/>';
            	                                						}
            	                                }]]    
            	                        });  							
						},
						dialog:function(){
		                       //增加学生框
		                       $('#addStudentDialog').dialog({    
		                    	    title: '添加学生',    
		                    	    width: 450,    
		                    	    height:450,    
		                    	    closed: true,    
		                    	    cache: false,    
		                    	    modal: true,
		                    	    onClose:function(){
		                    	    	$("#addStudentForm").form("clear");
		                    	    	roomPage.combox();
		                    	    	roomPage.datetimebox();
		                    	    },
		                    	    buttons:[{
		                    	    		text:'保存',
		                    	    		handler:function(){
		                    	    			//添加学生提交
		                    	    			$("#addStudentForm").form("submit",{
		                    	    				 url:'/Student/addStudent.action',
		                    	    				 onSubmit:function(){
		                    	    					 var isValid = $(this).form('validate');
		                    	    					 return isValid;
		                    	    				 },
		                    	    				 success:function(data){
		                    	    					 $.messager.show({
		                    	    							title:'消息',
		                    	    							msg:data,
		                    	    							timeout:500,
		                    	    							height:150,
		                    	    							showType:'slide'
		                    	    						});
		                    	    					 $('#studentGrid').datagrid("reload");
		                    	    					 $('#addStudentDialog').dialog("close");
		                    	    				 }
		                    	    			})
		                    	    		}
		                    	         },{
		                    	        	 text:'关闭',
		                    	        	 handler:function(){
		                    	        		  $("#addStudentDialog").dialog("close");
		                    	        	 }
		                    	         }]
		                    	});
						},
						click:function(){
    	                        //点击编辑学生按钮时 
    	                        $('#updateStudent').click(function(){
    	                        		//判断是否选中的有数据
    	                        		var row = $('#studentGrid').datagrid('getSelected');
    	                        		//如果有选中的数据
    	                        	});
    	                        //点击添加学生按钮时
    	                        $("#addStudentBtn").click(function(){
    	                        		$("#addStudentDialog").dialog("open");
    	                        })							
						},
						datetimebox:function(){
    		                       //日期输入框
    		                       $('#birthday').datebox({    
    		                            value: '3/4/2010',    
    		                            required: true,    
    		                            showSeconds: true,
    		                        }); 
						},
						combox:function(){
							//班级下拉框
							$('#class').combobox({    
							    url:'/Student/queryAllClasses.action',    
							    valueField:'classesId',//id    
							    textField:'className',//value值
							    panelHeight:'auto',
							    onLoadSuccess:function(){
							    	//获取所有的班级数据
							    	var data = $('#class').combobox('getData');
							    	//默认选中第一个
							    	if(data!=''){
							    		$('#class').combobox('select',data[0].classesId);
							    	}
							    }
							}); 
						},
						search:function(){
							$('#ss').searchbox({ 
								searcher:function(value,name){ 
    								alert(value + "," + name); 
            								$('#studentGrid').datagrid({
            									url:"/Student/getAllStudent.action",
            									queryParams: {
            										keyWord : value
            									}
            								});
    								}, 
    							prompt:'请输入关键字'
								}); 
						}
                }
        
        
        //预览照片
        function PreviewImage(fileObj,imgPreviewId,divPreviewId){  
            var allowExtention=".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;  
            var extention=fileObj.value.substring(fileObj.value.lastIndexOf(".")+1).toLowerCase();              
            var browserVersion= window.navigator.userAgent.toUpperCase();  
            if(allowExtention.indexOf(extention)>-1){   
                if(fileObj.files){//HTML5实现预览，兼容chrome、火狐7+等  
                    if(window.FileReader){  
                        var reader = new FileReader();   
                        reader.onload = function(e){  
                            document.getElementById(imgPreviewId).setAttribute("src",e.target.result);  
                        }    
                        reader.readAsDataURL(fileObj.files[0]);  
                    }else if(browserVersion.indexOf("SAFARI")>-1){  
                        alert("不支持Safari6.0以下浏览器的图片预览!");  
                    }  
                }else if (browserVersion.indexOf("MSIE")>-1){  
                    if(browserVersion.indexOf("MSIE 6")>-1){//ie6  
                        document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
                    }else{//ie[7-9]  
                        fileObj.select();  
                        if(browserVersion.indexOf("MSIE 9")>-1)  
                            fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问  
                        var newPreview =document.getElementById(divPreviewId+"New");  
                        if(newPreview==null){  
                            newPreview =document.createElement("div");  
                            newPreview.setAttribute("id",divPreviewId+"New");  
                            newPreview.style.width = document.getElementById(imgPreviewId).width+"px";  
                            newPreview.style.height = document.getElementById(imgPreviewId).height+"px";  
                            newPreview.style.border="solid 1px #d2e2e2";  
                        }  
                        newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";                              
                        var tempDivPreview=document.getElementById(divPreviewId);  
                        tempDivPreview.parentNode.insertBefore(newPreview,tempDivPreview);  
                        tempDivPreview.style.display="none";                      
                    }  
                }else if(browserVersion.indexOf("FIREFOX")>-1){//firefox  
                    var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);  
                    if(firefoxVersion<7){//firefox7以下版本  
                        document.getElementById(imgPreviewId).setAttribute("src",fileObj.files[0].getAsDataURL());  
                    }else{//firefox7.0+                      
                        document.getElementById(imgPreviewId).setAttribute("src",window.URL.createObjectURL(fileObj.files[0]));  
                    }  
                }else{  
                    document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
                }           
            }else{  
                alert("仅支持"+allowExtention+"为后缀名的文件!");  
                fileObj.value="";//清空选中文件  
                if(browserVersion.indexOf("MSIE")>-1){                          
                    fileObj.select();  
                    document.selection.clear();  
                }                  
                fileObj.outerHTML=fileObj.outerHTML;  
            }  
        }
</script>
</html>