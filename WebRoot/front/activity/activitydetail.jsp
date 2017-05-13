<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>活动首页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="/Student/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="/Student/front/res/css/global.css">
  <link rel="stylesheet" type="text/css" href="/Student/front/imageUpload/css/preview.css" />
<link rel="stylesheet" type="text/css" href="/Student/front/imageUpload/css/style.css">
<link rel="stylesheet" href="/Student/front/imageUpload/css/ssi-uploader.css"/>
</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" href="/" title="Fly">Fly社区</a>
     <div class="nav" style="margin-left:-50px;">
      <a  href="${path}/squestion.action">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="${path}/getAllCommunity.action">
        <i  class="layui-icon">&#xe600;</i>社团
      </a>
      <a href="${path}/front/activity/activityindex.jsp">
        <i  class="layui-icon">&#xe62e;</i>活动 
      </a>
      <a  href="${path}/front/talking/talkingindex.jsp">
        <i  class="layui-icon">&#xe606;</i>说说
      </a >
      <a href="${path}/queryFriendsInfo.action">
        <i  class="layui-icon">&#xe613;</i>朋友
            
      </a>  
    </div>
    
    <div class="nav-user">      
      <a class="avatar" >
        <img src="/pic/${loginStudent.studentPhoto}">
        <cite>${loginStudent.studentName}</cite>
        <i>${loginStudent.studentClasses.className}</i>
         
      </a>
      <div class="nav">
        <a href="/Student/front/user/set.jsp"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href=""><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>

<div id="activityDetailInfo" style="width:100%;height:auto;">
        
</div>

<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/">layui.com</a></p>
  <p>
    <a href="http://fly.layui.com/auth/get" target="_blank">产品授权</a>
    <a href="http://fly.layui.com/jie/8157.html" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461.html" target="_blank">微信公众号</a>
  </p>
</div>

<script src="/Student/front/res/layui/layui.js"></script>
<script src="/Student/js/jquery.min.js"></script>
      <script type="text/javascript">
                $(function(){
              	  layui.use(['layer', 'laytpl', 'form', 'upload', 'util'], function(){
            		  var $ = layui.jquery
            		  ,layer = layui.layer
            		  ,laytpl = layui.laytpl
            		  ,form = layui.form()
            		  layui.focusInsert = function(obj, str){
            			    var result, val = obj.value;
            			    obj.focus();
            			    if(document.selection){ //ie
            			      result = document.selection.createRange(); 
            			      document.selection.empty(); 
            			      result.text = str; 
            			    } else {
            			      result = [val.substring(0, obj.selectionStart), str, val.substr(obj.selectionEnd)];
            			      obj.focus();
            			      obj.value = result.join('');
            			    }
            			  };
            		  
            		 var gather={
            	            layEditor: function(options){
            	                var html = '<div class="fly-edit">'
            	                  +'<span type="picture" title="插入图片：img[src]"><i class="iconfont icon-tupian"></i>图片</span>'
            	                +'</div>';
            	                var log = {}, mod = {
            	                  picture: function(editor){ //插入图片
            	                      layer.open({
            	                          type: 1
            	                          ,id: 'fly-jie-upload'
            	                          ,title: '插入图片'
            	                          ,area: 'auto'
            	                          ,shade: false
            	                          ,area: '465px'
            	                          ,skin: 'layui-layer-border'
            	                          ,content: ['<ul class="layui-form layui-form-pane" style="margin: 20px;font-size:12px;">'
            	                            ,'<li class="layui-form-item">'
            	                              ,'<label class="layui-form-label">URL</label>'
            	                              ,'<div class="layui-input-inline">'
            	                                  ,'<input required name="image" placeholder="支持直接粘贴远程图片地址" value="" class="layui-input">'
            	                                ,'</div>'
            	                                ,'<input required type="file" name="file" class="layui-upload-file" value="">'
            	                            ,'</li>'
            	                            ,'<li class="layui-form-item" style="text-align: center;">'
            	                              ,'<button type="button" lay-submit lay-filter="uploadImages" class="layui-btn">确认</button>'
            	                            ,'</li>'
            	                          ,'</ul>'].join('')
            	                          ,success: function(layero, index){
            	                            var image =  layero.find('input[name="image"]');
            	                            layui.upload({
            	                              url: '/News/uploadImage.action'
            	                              ,elem: '#fly-jie-upload .layui-upload-file'
            	                              ,success: function(res){
            	                                if(res.flag == 1){
            	                                  image.val(res.url);
            	                                  var imgIndex =  $("#previewDiv").children('table').length;
            	                                  if(document.getElementById('previewDiv')){
            	                                	  $("#previewDiv").append('<table id="table'+imgIndex+'" class="ssi-imgToUploadTable ssi-pending"><tbody><tr><td class="ssi-imgToUpload"> <img class="ssi-imgToUpload" id="previewImg1" src="/pic/'+res.url+'" style="width:140px;height:128px;"/></td></tr><tr><td><button type="button" class="ssi-button error ssi-removeBtn" onclick="removePreviewImg('+imgIndex+')" id="removeImg"><span  class="trash10 trash" ></span></button></td></tr><tr><td id="iii" id="previewName">'+res.url+'<input type="hidden" name="imgName" value="'+res.url+'"></td></tr></tbody></table>');
            	                                  }else{
            	                                	  $("#previewAppend").append('<div id="previewDiv" class="ssi-uploadBox ssi-previewBox ssi-uploadNoDropZone"><table id="table0" class="ssi-imgToUploadTable ssi-pending"><tbody><tr><td class="ssi-imgToUpload"> <img class="ssi-imgToUpload" id="previewImg1" src="/pic/'+res.url+'" style="width:140px;height:128px;"/></td></tr><tr><td><button onclick="removePreviewImg('+0+')" class="ssi-button error ssi-removeBtn" type="button" id="removeImg"><span  class="trash10 trash" ></span></button></td></tr><tr><td id="iii" id="previewName">'+res.url+'<input type="hidden" name="imgName" value="'+res.url+'"></td></tr></tbody></table></div>');
            	                                  }
            	                                  
            	                                } else {
            	                                  layer.msg(res.msg, {icon: 5});
            	                                }
            	                              }
            	                            });
            	                            
            	                            form.on('submit(uploadImages)', function(data){
            	                              var field = data.field;
            	                              if(!field.image) return image.focus();
            	                              layer.close(index);
            	                            });
            	                          }
            	                        });		                	  
            	                  }
            	                };
            	              }  
            		 }
            		  gather.layEditor({
            		    	elem: '.fly-editor'
            		  	  });
            		 
            		  })
                	
                	
                	var stuId = <%=session.getAttribute("stuId")%>;
                    var activityId = <%=request.getParameter("activityId")%>;
                    //alert(activityId);
                    var today = new Date();
                    $.post("/Student/queryActivityDetail.action",{"activityId":activityId},function(data){
                        
            			//统计报名人数
           				var count = 0;
            			var joinActivityFlag = 5;
           				$.each(data.activityStudents,function(i,a){
           					count++;
           					//判断登录学生加入了这个活动
           					if(a.students.studentId==stuId   && a.stuActivityFlag == 1){
           						alert("学生");
							   //登录学生已经加入这个活动 显示  我要加入 的禁用按钮
           						joinActivityFlag = 1;
           					}else if(a.students.studentId == stuId  && a.stuActivityFlag == 0){
           						joinActivityFlag = 0;// 已申请 待审核按钮
           					}else if(a.students.studentId == stuId  && a.stuActivityFlag == 2){
           						joinActivityFlag = 2;//被拒绝加入这个社团
           					}
           				})                    	
                    	if(data.student.studentId!=stuId){
                               var div ="<div  style='border:1px solid black;height:300px;width:80%;margin:0 auto;'>";
                               	  	div +="<div style='border:1px  solid green;height:290px;width:400px;float:left'>";
                               	 			div+="<img style='width:100%;height:100%' src='/pic/"+data.activityPhoto+"'></img>";
                               	  	div +="</div>";
                               	  	
                               	  	div +="<div style='display:inline-block; margin-left:20px;margin-top:15px;float:left'>";
                               	  			div+="<span id='activityName' style='font-size:30px;margin-left:15px;margin-top:20px;'>"+data.activityName+"</span>";
                               	  	div +="</div>";
                               	  	div += "<ul style='list-style:none; line-height:30px;margin-left:200px;margin-top:50px;'>";
                               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>发起人:"+data.student.studentName+"</span>";
                               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>时间:2015/02/01 17:25:05 ~ 2015/02/01 17:25:05</span>";
                               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>类型:"+data.activityType.activityTypeName+"</span>";
                               	  			if(new Date(data.activityBeginTime)>today){
                               	  				if(count==data.activityLaunch.activityPersonNum){
                               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>暂无名额(人数已满)</span>";
                               	  				}else{
	                               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>限制人数"+data.activityLaunch.activityPersonNum+"人(已报名"+count+"人)</span>";
	                               	  		div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>火热报名中</span>";
                               	  				}
                               	  				
                               	  			}else if(new Date(data.activityBeginTime)<today  && new Date(data.activityEndTime)>today){
                               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>"+count+"人参与)</span>";
                               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>活动正在进行中</span>";
                               	  			}else if(new Date(data.activityEndTime)<today){
                               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>"+count+"人参与</span>";
                               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>活动已结束</span>";	
                               	  			}
                                    div += "</ul>";
                                    div += "<span>";
 											if(joinActivityFlag == 5 && count<data.activityLaunch.activityPersonNum &&  (new Date(data.activityBeginTime))>today ){
 													div+="<button style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal' onclick='signUp("+data.activityId+","+data.student.studentId+")' >我要报名</button>";	
 											}else {
 													div+="<button style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal layui-btn-disabled'>我要报名</button>";
 											}                                   		
                                    div += "</span>";
                               	  div +="</div>";
                                  div +="<div style='border:1px solid ;width:80%;margin:0 auto;margin-top:5px;'>";
                                  			//判断活动是什么类型活动 如果是社团活动 那么则显示社团的一些信息
                                          	if(data.activityType.activityTypeId!=1){
                                       		 div +="<fieldset class='layui-elem-field' style='margin-top:25px;'>";
                                       		 	div+="<legend>社团介绍</legend>";
                                       		 	div+="<div class='layui-field-box'>"+data.activityType.community.communityAppliRespon+"</div>";
                                       		 div +="</fieldset>";
                                          	}
                                  			//活动介绍
                                  			div += "<fieldset class='layui-elem-field' style='margin-top:25px;' ><legend>活动介绍</legend>";
                                  			
                              			if(data.activityLaunch!=null){
                                      			div +="<div class='layui-field-box'>"+data.activityLaunch.activityLaunchDesc+"</div></fieldset>";
                                      			if(data.activityLaunch.activityLaunchPhoto.length!=0){
                                          			$.each(data.activityLaunch.activityLaunchPhoto,function(i,alp){
                                          				div += "<img style='width:600px;height:500px;' src='/pic/"+alp.activityLaunchPhotos+"'></img>";
                                          			})   
                                      			}	
                                  			}

                                  			
                                  			if(data.activityRecords.length!=0){
                                  				div += "<fieldset class='layui-elem-field' style='margin-top:25px;' ><legend>活动记录</legend>";
                                      			$.each(data.activityRecords,function(i,r){
                                      				div +="<div class='layui-field-box'>";
                                      				div +=r.activityRecordContent
                                      				if(r.activityRecordPhotos.length!=0){
                                      					div += " <div style='width:100%;height:100%;'>";
                                      						$.each(r.activityRecordPhotos,function(i,p){
                                      							div += "<img style='width:350px;height:350px;' src='/pic/"+p.activityRecordPhoto+"'></img>";
                                      						})
                                      					div += " </div>";
                                      				}
                                      				div +=" <div style='margin-left:800px;'>——2017/02/03 17:02:50</div>";
                                      				div += "</div>";
                                      			})
                                      			div +="</fieldset>";
                                  			}
                                  			//表示有人参与
                                  			if(count>0){
                                  				div += "<fieldset class='layui-elem-field' style='margin-top:25px;'>";
														div += "<legend>參加人员</legend>";
														$.each(data.activityStudents,function(i,p){
															if(p.stuActivityFlag==1){
															div += "<a href='/Student/queryStudentInfoById.action?stuId="+p.students.studentId+"'><div style='float:left'><div class='layui-inline'>";
															div += "<img src='/pic/"+p.students.studentPhoto+"' class='layui-circle'></div>";
															div += "<p style='margin-top:5px;margin-left:70px;'>"+p.students.studentName+"</p>";
															div += "</div></a>";
														  }	
														})

														
                                  				div += "</fieldset>";
														div +="</div>";	
                                  			}
                    	}else{
                    		//我的活动
                            var div ="<div  style='border:1px solid black;height:300px;width:80%;margin:0 auto;'>";
                       	  	div +="<div style='border:1px  solid green;height:290px;width:400px;float:left'>";
                       	 			div+="<img style='width:100%;height:100%' src='/pic/"+data.activityPhoto+"'></img>";
                       	  	div +="</div>";
                       	  	
                       	  	div +="<div style='display:inline-block; margin-left:20px;margin-top:15px;float:left'>";
                       	  			div+="<span id='activityName' style='font-size:30px;margin-left:15px;margin-top:20px;'>"+data.activityName+"</span>";
                       	  	div +="</div>"; 
                       	  	div += "<ul style='list-style:none; line-height:30px;margin-left:200px;margin-top:50px;'>";
               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>发起人:"+data.student.studentName+"</span>";
               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>时间:"+((new Date(data.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"~"+((new Date(data.activityEndTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>类型:"+data.activityType.activityTypeName+"</span>";
               	  			if(data.activityFlag==0  && new Date(data.activityBeginTime)>today){
               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>待审核</span>";
               	  			}else if(data.activityFlag==2){
               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>审核被拒</span>";
               	  			}else if(data.activityFlag == 3){               	  			
               	  			if(new Date(data.activityBeginTime)>today){
               	  				if(count==data.activityLaunch.activityPersonNum){
               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>暂无名额(人数已满)</span>";
               	  				}else {
                       	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>限制人数"+data.activityLaunch.activityPersonNum+"人(已报名"+count+"人)</span>";
                   	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>火热报名中</span>";
               	  				}
               	  			}else if(new Date(data.activityBeginTime)<today  && new Date(data.activityEndTime)>today){
               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>"+count+"人参与)</span>";
               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>活动正在进行中</span>";
               	  			}else if(new Date(data.activityEndTime)<today){
               	  			div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>"+count+"人参与</span>";
               	  				div+="<li><span id='applyStudent' style='font-size:18px;margin-left:30px;'>活动已结束</span>";	
               	  			}
               	  		}
                    div += "</ul>";  
                            div += "<span>";
                            	 if(data.activityFlag==1 && new Date(data.activityBeginTime) > today){
                            		 div+="<button style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal'>发起活动</button>";                            		 
                            	 }else if(data.activityFlag==1 && new Date(data.activityBeginTime) < today){
                            		 div+="<button style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal layui-btn-disabled'>活动已过期</button>";
                            	 }else if(data.activityFlag == 2){
                            		 div+="<button style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal '>审核未通过</button>";
                            	 }else if(data.activityFlag == 0 && new Date(data.activityBeginTime) > today){
                            		 div+="<button style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal layui-btn-disabled'>审核中</button>";
                            	 }else if(data.activityFlag == 0 && new Date(data.activityBeginTime) < today){
                            		 div+="<button style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal layui-btn-disabled'>活动已过期</button>";
                            	 }else if(data.activityFlag == 3){
                            		 div+="<button onclick='recordActivityFun()'  style='margin-top:45px;margin-left:30px' class='layui-btn layui-btn-big layui-btn-normal '    id='btnActivityRecord' >记录活动</button>";
                            	 }
                            div += "</span>";
                       	  div +="</div>";      
                       	  div +="<div style='border:1px solid ;width:80%;margin:0 auto;margin-top:5px;'>";
                			//判断活动是什么类型活动 如果是社团活动 那么则显示社团的一些信息
                        	if(data.activityType.activityTypeId!=1){
                     		 div +="<fieldset class='layui-elem-field' style='margin-top:25px;'>";
                     		 	div+="<legend>社团介绍</legend>";
                     		 	div+="<div class='layui-field-box'>"+data.activityType.community.communityAppliRespon+"</div>";
                     		 div +="</fieldset>";
                        	}
                			if(data.activityFlag == 3 ){
                                	div += "<fieldset class='layui-elem-field'>";
                                        	div += "<legend>活动介绍</legend>";
                                        	div += "<div class='layui-field-box'>"+data.activityLaunch.activityLaunchDesc;
                                        	div += "<div style='width:100%;height:100%;'>";
                                  			$.each(data.activityLaunch.activityLaunchPhoto,function(i,alp){
                                  				div += "<img style='width:600px;height:500px;' src='/pic/"+alp.activityLaunchPhotos+"'></img>";
                                  			})
                                        	div += "</div></div>";
                                	div += "</fieldset>";
                                	if(data.activityRecords.length!=0){
                                  		div += "<fieldset class='layui-elem-field'>";
                                		div += "<legend>活动记录</legend>";
                                	  $.each(data.activityRecords,function(i,ar){
                                		div += "<div class='layui-field-box'>"+ar.activityRecordContent;
                                		 if(ar.activityRecordPhotos.length!=0){
                                			 div += "<div style='width:100%;height:100%;'>";
                                			 $.each(ar.activityRecordPhotos,function(i,arp){
                                				 div += "<img style='width:350px;height:350px;' src='/pic/"+arp.activityRecordPhoto+"'></img>";
                                			 })
                                			 div += "</div>";
                                		 }
                                		div += "<div style='margin-left:800px;'>——"+((new Date(ar.activityRecordTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</div>";
                                		div += "</div>";                                		  
                                	  })
                                	}
                                	//请求加入这个活动的人数
                                	var activityStuReview = 0;
                                	//已经加入这个活动的人数
                                	var activityStu = 0;
                                	$.each(data.activityStudents,function(i,as){
                                		alert("状态:"+as.stuActivityFlag);
                                		if(as.stuActivityFlag == 1){
                                        	 activityStu++;                                			
                                		}
                                		if(as.stuActivityFlag == 0){
                                			activityStuReview++;	
                                		}
                                	})
                                	alert("待审批:"+activityStuReview);
                                	alert("已经加入:"+activityStu);
                                	if(data.activityStudents.length!=0){
                                 	   if(activityStu>0){
                                     	div += "<fieldset class='layui-elem-field'>";
                                     	div += "<legend>参加人员</legend>";
                                     	div += "<div class='layui-field-box'>";
                                     	  $.each(data.activityStudents,function(i,as){
                                     		if(as.stuActivityFlag == 1){  
                                           	div += "<div class='layui-inline' style='float:left'><img src='/pic/"+as.students.studentPhoto+"' class='ayui-circle'>";
                                           	div += "<p style='margin-top:5px;margin-left:90px;'>"+as.students.studentName+"</p>";
                                         	div += "</div>";
                                     		}
                                     	  })
                                     	 div += "</div></fieldset>"; 
                                 	   }
                                 	   if(activityStuReview>0){
                                            	div += "<fieldset class='layui-elem-field'>";
                                         	div += "<legend>待审批人员</legend>";
                                         	  $.each(data.activityStudents,function(i,as){
                                         		if(as.stuActivityFlag == 0){  
                                               	div += "<div class='layui-field-box'><div class='layui-inline'><img src='/pic/"+as.students.studentPhoto+"' class='ayui-circle'>";
                                               	div += "<p style='margin-top:5px;margin-left:90px;'>"+as.students.studentName+"</p>";
                                               	div += "<button style='margin-left:35px;' onclick='agreeOrrefuse("+as.students.studentId+","+data.activityId+",1)' class='layui-btn layui-btn-normal  layui-btn-small'>同意</button>";
                                                div += "<button style='margin-left:30px;' onclick='agreeOrrefuse("+as.students.studentId+","+data.activityId+",2)' class='layui-btn layui-btn-normal  layui-btn-small'>拒绝</button>";
                                             	div += "</div></div>";
                                         		}
                                         	  })   
                                         	 div += "</fieldset>"; 
                                 	   } 
                            			                               		
                                	}
                			}
                       	  if(data.activityFlag == 3 ){
                       		  div +="<form class='layui-form' action='/Student/insertActivityRecord.action'  method='post'>";
                       		  div += "<div style='width:100%;'>";
                       		  div += "<input type='hidden' value='"+data.activityId+"' name='activityId'/>";
                       		  div += "<textarea id='activityRecordTextArea'  name='activityRecordContent' required lay-verify='required' placeholder='记录活动'  class='layui-textarea fly-editor' style='height: 100px;width:100%'></textarea>";
                       		  div += "</div>";
                       		  div += "<div id='previewAppend'>";
                       		  div += "</div>";
                       		  div += "<button class='layui-btn layui-btn-big' style='margin-left:89%;'>上传记录</button>";
                      		layui.use(['layer', 'laytpl', 'form', 'upload', 'util'], function(){
                  			  var $ = layui.jquery
                  			  ,layer = layui.layer
                  			  ,laytpl = layui.laytpl
                  			  ,form = layui.form()
                  			  
                  			  layui.focusInsert = function(obj, str){
                  				    var result, val = obj.value;
                  				    obj.focus();
                  				    if(document.selection){ //ie
                  				      result = document.selection.createRange(); 
                  				      document.selection.empty(); 
                  				      result.text = str; 
                  				    } else {
                  				      result = [val.substring(0, obj.selectionStart), str, val.substr(obj.selectionEnd)];
                  				      obj.focus();
                  				      obj.value = result.join('');
                  				    }
                  				  };
                  			  
                  			 var gather={
                  		            layEditor: function(options){
                  		                var html = '<div class="fly-edit">'
                  		                  +'<span type="picture" title="插入图片：img[src]"><i class="iconfont icon-tupian"></i>图片</span>'
                  		                +'</div>';
                  		                var log = {}, mod = {
                  		                  picture: function(editor){ //插入图片
                  		                      layer.open({
                  		                          type: 1
                  		                          ,id: 'fly-jie-upload'
                  		                          ,title: '插入图片'
                  		                          ,area: 'auto'
                  		                          ,shade: false
                  		                          ,area: '465px'
                  		                          ,skin: 'layui-layer-border'
                  		                          ,content: ['<ul class="layui-form layui-form-pane" style="margin: 20px;font-size:12px;">'
                  		                            ,'<li class="layui-form-item">'
                  		                              ,'<label class="layui-form-label">URL</label>'
                  		                              ,'<div class="layui-input-inline">'
                  		                                  ,'<input required name="image" placeholder="支持直接粘贴远程图片地址" value="" class="layui-input">'
                  		                                ,'</div>'
                  		                                ,'<input required type="file" name="file" class="layui-upload-file" value="">'
                  		                            ,'</li>'
                  		                            ,'<li class="layui-form-item" style="text-align: center;">'
                  		                              ,'<button type="button" lay-submit lay-filter="uploadImages" class="layui-btn">确认</button>'
                  		                            ,'</li>'
                  		                          ,'</ul>'].join('')
                  		                          ,success: function(layero, index){
                  		                            var image =  layero.find('input[name="image"]');
                  		                            layui.upload({
                  		                              url: '/News/uploadImage.action'
                  		                              ,elem: '#fly-jie-upload .layui-upload-file'
                  		                              ,success: function(res){
                  		                                if(res.flag == 1){
                  		                                  image.val(res.url);
                  		                                  var imgIndex =  $("#previewDiv").children('table').length;
                  		                                  if(document.getElementById('previewDiv')){
                  		                                	  $("#previewDiv").append('<table id="table'+imgIndex+'" class="ssi-imgToUploadTable ssi-pending"><tbody><tr><td class="ssi-imgToUpload"> <img class="ssi-imgToUpload" id="previewImg1" src="/pic/'+res.url+'" style="width:140px;height:128px;"/></td></tr><tr><td><button type="button" class="ssi-button error ssi-removeBtn" onclick="removePreviewImg('+imgIndex+')" id="removeImg"><span  class="trash10 trash" ></span></button></td></tr><tr><td id="iii" id="previewName">'+res.url+'<input type="hidden" name="imgName" value="'+res.url+'"></td></tr></tbody></table>');
                  		                                  }else{
                  		                                	  $("#previewAppend").append('<div id="previewDiv" class="ssi-uploadBox ssi-previewBox ssi-uploadNoDropZone"><table id="table0" class="ssi-imgToUploadTable ssi-pending"><tbody><tr><td class="ssi-imgToUpload"> <img class="ssi-imgToUpload" id="previewImg1" src="/pic/'+res.url+'" style="width:140px;height:128px;"/></td></tr><tr><td><button onclick="removePreviewImg('+0+')" class="ssi-button error ssi-removeBtn" type="button" id="removeImg"><span  class="trash10 trash" ></span></button></td></tr><tr><td id="iii" id="previewName">'+res.url+'<input type="hidden" name="imgName" value="'+res.url+'"></td></tr></tbody></table></div>');
                  		                                  }
                  		                                  
                  		                                } else {
                  		                                  layer.msg(res.msg, {icon: 5});
                  		                                }
                  		                              }
                  		                            });
                  		                            
                  		                            form.on('submit(uploadImages)', function(data){
                  		                              var field = data.field;
                  		                              if(!field.image) return image.focus();
                  		                              layer.close(index);
                  		                            });
                  		                          }
                  		                        });		                	  
                  		                  }
                  		                  ,face: function(editor, self){ //插入表情
                  		                    var str = '', ul, face = gather.faces;
                  		                    for(var key in face){
                  		                      str += '<li title="'+ key +'"><img src="'+ face[key] +'"></li>';
                  		                    }
                  		                    str = '<ul id="LAY-editface" class="layui-clear">'+ str +'</ul>';
                  		                    layer.tips(str, self, {
                  		                      tips: 3
                  		                      ,time: 0
                  		                      ,skin: 'layui-edit-face'
                  		                    });
                  		                    $(document).on('click', function(){
                  		                      layer.closeAll('tips');
                  		                    });
                  		                    $('#LAY-editface li').on('click', function(){
                  		                      var title = $(this).attr('title') + ' ';
                  		                      layui.focusInsert(editor[0], 'face' + title);
                  		                    });
                  		                  }
                  		                };
                  		                
                  		                layui.use('face', function(face){
                  		                  options = options || {};
                  		                  gather.faces = face;
                  		                  $(options.elem).each(function(index){
                  		                    var that = this, othis = $(that), parent = othis.parent();
                  		                    parent.prepend(html);
                  		                    parent.find('.fly-edit span').on('click', function(event){
                  		                      var type = $(this).attr('type');
                  		                      mod[type].call(that, othis, this);
                  		                      if(type === 'face'){
                  		                        event.stopPropagation()
                  		                      }
                  		                    });
                  		                  });
                  		                });
                  		                
                  		              }  
                  			 		,escape: function(html){
                  		                  return String(html||'').replace(/&(?!#?[a-zA-Z0-9]+;)/g, '&amp;')
                  		                  .replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/'/g, '&#39;').replace(/"/g, '&quot;');
                  		                }
                  		              ,content: function(content){
                  		                  //支持的html标签
                  		                  var html = function(end){
                  		                    return new RegExp('\\['+ (end||'') +'(pre|div|table|thead|th|tbody|tr|td|ul|li|ol|li|dl|dt|dd|h2|h3|h4|h5)\\]\\n*', 'g');
                  		                  };
                  		                  content = gather.escape(content||'') //XSS
                  		                  .replace(/img\[([^\s]+?)\]/g, function(img){  //转义图片
                  		                    return '<img style="width:100px;height:100px;" src="/pic/' + img.replace(/(^img\[)|(\]$)/g, '') + '">';
                  		                  }).replace(/@(\S+)(\s+?|$)/g, '@<a href="javascript:;" class="fly-aite">$1</a>$2') //转义@
                  		                  .replace(/face\[([^\s\[\]]+?)\]/g, function(face){  //转义表情
                  		                    var alt = face.replace(/^face/g, '');
                  		                    return '<img alt="'+ alt +'" title="'+ alt +'" src="' + gather.faces[alt] + '">';
                  		                  }).replace(/a\([\s\S]+?\)\[[\s\S]*?\]/g, function(str){ //转义链接
                  		                    var href = (str.match(/a\(([\s\S]+?)\)\[/)||[])[1];
                  		                    var text = (str.match(/\)\[([\s\S]*?)\]/)||[])[1];
                  		                    if(!href) return str;
                  		                    var rel =  /^(http(s)*:\/\/)\b(?!(\w+\.)*(sentsin.com|layui.com))\b/.test(href.replace(/\s/g, ''));
                  		                    return '<a href="'+ href +'" target="_blank"'+ (rel ? ' rel="nofollow"' : '') +'>'+ (text||href) +'</a>';
                  		                  }).replace(html(), '\<$1\>').replace(html('/'), '\</$1\>') //转移代码
                  		                  .replace(/\n/g, '<br>') //转义换行   
                  		                  return content;
                  		                }
                  			 }
                  			  gather.layEditor({
                  			    	elem: '.fly-editor'
                  			  	  });
                  			 
                  			  })
                       	  }
                    	}  			
                            	  
                            div += "</div></div>"; 
                            $("#activityDetailInfo").html(div);
                    },'json') 
                })
                
                
                		//删除图片
                    	function removePreviewImg(imgIndex){
                    		//删除图片时 判断图片的长度 如果为0则把显示图片的div删除掉    如果不为0则只删除对应的table  不让显示该图片
                    		var imgLength = $("#previewDiv").children('table').length;
                    		alert("长度:"+imgLength);
                    		if(imgLength>1){
                    			 $("#table"+imgIndex).remove();
                    		}else{
                    			$("#previewDiv").remove();
                    		}
                    		alert("删除的图片下标:"+imgIndex);
                    	}
                	   //点击申请按钮
                	   function applyReview(flag){
                		   if(flag == 0){
                			   layer.msg("审核中");   
                		   }else if(flag == 2){
                			   layer.msg("条件不符合啊  亲");
                		   }
                	   }
                	   
                	   //点击报名按钮
                	   function  signUp(activityId,stuId){
                		   alert("活动ID:"+activityId);
                		   alert("活动管理人:"+stuId);
                		   var activityName = $("#activityName").html();
                		   $.post("/Student/insertStudentActivity.action",{"activityId":activityId,"activityApplyStuId":stuId,"activityName":activityName},function(data){
                			     alert(data);
                		   },'json')
                	   } 
                	  
                	  //点击记录活动 页面滚最底部
                      function  recordActivityFun(){
                    	  document.getElementById("activityRecordTextArea").scrollIntoView();
                    	  $("#activityRecordTextArea")[0].focus();
                      }
                	  
                	  //点击同意或者拒绝方法
                	  function  agreeOrrefuse(stuId,activityId,flag){
                		  		layer.msg("学生ID:"+stuId+"活动ID:"+activityId);
                     		    var activityName = $("#activityName").html();                		  		
								$.post("/Student/updateStudentActivityFlag.action",{"studentId":stuId,"activityId":activityId,"stuActivityFlag":flag,"activityName":activityName},function(data){
										
								},'json')
                	  }
                	   
        </script>
</body>
</html>