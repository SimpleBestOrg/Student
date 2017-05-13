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
<div style="width:100%;height:auto;">
            <div style="width:70%;margin:0 auto;border:1px solid green">
                    <div style="width:80%;height:250px;border:1px solid red;margin-left:50px;">
                                   <div style="float:left;">
                                        <img  id="imgInfo" src="" style="width:200px;height:250px;"></img>
                                   </div>
                                   <div style="display:inline-block;  width:200px;height:80px;margin-top:15px;">
                                            <span id="activityName" style="font-size:30px;margin-left:15px;margin-top:20px;">活动名称:</span>
                                   </div>
                                   <ul style='list-style:none; line-height:27px;margin-left:-200px;margin-top:-40px;'>
                                        <li><span id="applyStudent" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="activityType" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="activityStatus" style="font-size:18px;margin-left:15px;">活动状态:已结束</span></li>
                                        <li><span id="activityBeginTime" style="font-size:18px;margin-left:15px;"></span></li>
                                        <li><span id="activityEndTime" style="font-size:18px;margin-left:15px;"></span></li>
                                   </ul>
                    </div>
                    <div  style="width:80%;border:1px solid green;margin-left:50px;">
                                 <form class="layui-form" action="/Student/insertActivityRecord.action"  method="post"  >
                                    <label style="font-size:20px;">记录活动:</label>
                                    <div style="width:100%;">
                                      <textarea id="L_content" name="activityRecordContent" required lay-verify="required" placeholder="我要回答"  class="layui-textarea fly-editor"  style="height:150px;resize: none;"></textarea>
                                      <input   type="hidden" id="activityId" name="activityId" val=""></input>
                                    </div> 
                                    <div id="previewAppend">
                                            <!-- 图片预览 -->
                                    </div> 
                                    <button style="margin-left:300px;margin-top:10px;" class="layui-btn layui-btn-big layui-btn-normal">提交记录</button>
                                 </form>   
                    </div>
            </div>
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
<script>
$(function(){
      var activityId = <%=request.getParameter("activityId")%>
      alert(activityId);
	  $.post("/Student/queryActivityDetail.action",{"activityId":activityId},function(data){
		  				$("#activityId").val(activityId);
					  	 $("#activityName").html(data.activityName);	
					  	 $("#applyStudent").html("申请人:&nbsp;&nbsp;"+data.student.studentName);	
					  	 $("#activityType").html("活动类型:"+data.activityType.activityTypeName);
					  	 $("#activityBeginTime").html("活动开始时间:"+((new Date(data.activityBeginTime)).toLocaleString().replace(/年|月/g,'-')));
					  	 $("#activityEndTime").html("活动开始时间:"+((new Date(data.activityEndTime)).toLocaleString().replace(/年|月/g,'-')));
	  },"json")	  
	
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

</script>
</body>
</html>