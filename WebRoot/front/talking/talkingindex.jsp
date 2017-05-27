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
  <title>说说首页</title>
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
    <a title="AAA">AAA</a>
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
    </div>v>
    
    <div class="nav-user">      
       <a class="avatar" href="/Student/queryStudentInfoById.action">
        <img src="/pic/${loginStudent.studentPhoto}">
        <cite>${loginStudent.studentName}</cite>
        <i>${loginStudent.studentClasses.className}</i>
         
      </a>
      <div class="nav">
        <a href="/Student/front/user/set.jsp"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="/Student/logout.action"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>


<div class="main layui-clear" >
  <div class="wrap">
    <div class="content">
      <div class="fly-tab fly-tab-index">
        <span>
          <a id="friendTalking"  onclick="talkingPage.friendTalking('/Student/queryTalkingByFriendId.action')">朋友说说</a>
          <a id="myTalking"   onclick="talkingPage.friendTalking('/Student/queryTalkingByStuId.action')">我的说说</a>
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
           <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
      </div>
             <!-- 发表说说 -->
       <div id="editTalking"  style="width:100%;margin-bottom: 20px;">
            <form class="layui-form" action="/Student/insertTalking.action"  method="post" >
                <div style="width:600px;">
                <textarea id="L_content" name="talkingContent" required lay-verify="required" placeholder="发说说"  class="layui-textarea fly-editor" style="height: 50px;resize:none;"></textarea>
                </div> 
                <div id="previewAppend">
                        <!-- 图片预览 -->
                </div> 
                    
                <div > 
                  <div class="layui-form-item" style="display: inline-block;">
                    <div class="layui-input-block" style="margin-left: 0px;">
                      <select name="talkingAuthorityId" >
                        <option value="1">仅好友可见</option>
                        <option value="2">仅自己可见</option>
                      </select>
                    </div>
                  </div>
                <div id="publish" style="display: inline-block;" >
                     <button class="layui-btn site-demo-layedit"   onclick="pushTalking()"  data-type="content">发说说</button>
                </div>
               </div> 
            </form>  
       </div>
            <div class="talking"  id="talking" style="width:600px;">
                   <!--说说显示 -->                    
            </div> 
         
    </div>
      <div style="text-align: center">
        <div id="demo8" class="laypage-main"></div>
      </div>    
  </div>
  
  <div class="edge">
          <div>
              <img  style="width:500px;height:300px;" src="/pic/20170522000525.jpg"/>
              <img  style="margin-top:30px;;width:500px;height:300px;" src="/pic/psb.jpg"/>
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
<script src="/Student/front/imageUpload/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="/Student/front/imageUpload/js/ssi-uploader.js"></script>
<script>

	$(function(){
        var stuId = <%=session.getAttribute("stuId")%>;
        if(stuId==null){
        	window.location="/Student/login.jsp?loginInfo="+1;
        }
		var action = '<%=request.getParameter("action")%>';
		if(action=='null'){
			talkingPage.friendTalking('/Student/queryTalkingByFriendId.action');	
		}else {
			talkingPage.friendTalking(action);
		}
		
		layui.use(['layer', 'laytpl', 'form', 'upload', 'util','laypage'], function(){
			  var $ = layui.jquery
			  ,layer = layui.layer
			  ,laytpl = layui.laytpl
			  ,laypage = layui.laypage
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
		                  +'<span type="face" title="插入表情"><i class="iconfont icon-biaoqing"></i>表情</span>'
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
		                              url: '/Student/uploadImage.action'
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
		if(imgLength>1){
			 $("#table"+imgIndex).remove();
		}else{
			$("#previewDiv").remove();
		}
	}
	
	
    var talkingPage = {
            friendTalking:function(action){
            		if(action=='/Student/queryTalkingByStuId.action'){
            			$("#friendTalking").removeClass("tab-this");
            			$("#myTalking").addClass("tab-this");
            		}else if(action=='/Student/queryTalkingByFriendId.action'){
            			$("#myTalking").removeClass("tab-this");
            			$("#friendTalking").addClass("tab-this");
            		}
                    $.post(action,function(data){
                          var div ="";
                          if(data.length!=0){ 
                           $.each(data,function(i,a){
                        	   		
                                     div += " <div  style='width:600px;' id='remove"+a.talkingId+"'>";
                                     div += "<a href='/Student/queryStudentInfoById.action?stuId="+a.stuId.studentId+"'><img class='media-object img-circle ' style='width:60px;height:60px;float:left;' src='/pic/"+a.stuId.studentPhoto+"' alt='通用的占位符图像'/></a>";
                                     div += "<span style='font-size:20px;display:block;margin-top:10px;'>"+a.stuId.studentName+"</span>";
                                     div += "<span id='talkingDeleteBtn' style='color:#c0c0c0;font-size:10px;'>"+((new Date(a.talkingDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
                                     if(action=="/Student/queryTalkingByStuId.action"){
                                    	 div += "<button  onclick='deleteTalking("+a.talkingId+")' class='layui-btn layui-btn-primary layui-btn-mini' style='margin-left:375px;'>删除</button>";
                                     }
                                     div += "<div style='width:600px;margin-top:10px;'>";
                                     div += "<div style='margin-top:20px;margin-bottom:10px;font-size:18px;'>"+a.talkingContent+"</div>";
                                     
                                     //如果说说中有照片 则显示照片
                                     if(a.talkingPhotos.length!=0){
                                            $.each(a.talkingPhotos,function(i,p){
                                                //照片数量为1时  照片宽度
                                                if(a.talkingPhotos.length==1){
                                                    div  +=  "<img src='/pic/"+p.talkingPhoto+"' style='width:600px;height:500px;'/>";                                                   
                                                }else{
                                                    div  +=  "<img src='/pic/"+p.talkingPhoto+"' style='width:150px;height:150px;'/>";
                                                }
                                            })
                                     }
                                     //如果说说的评论不是空  则显示说说评论的内容
                                     if(a.talkingTocao.length!=0){
                                          div += "<div style='border:1px solid black; '>";
                                          
                                             //一条说说被评论(主评论和回复)的条数
                                        //    var toCaoLength = a.talkingTocao.length;
                                        //      alert("评论数量:"+toCaoLength);
                                            $.each(a.talkingTocao,function(i,t){
                                                //找出主评论  
                                                if(t.talkingToCaoParentId==0){
                                                //  toCaoLength = toCaoLength-1; 
                                                     div += "<div  id='append"+t.talkingToCaoId+"'  onclick='appendHuifu("+t.talkingToCaoId+")' ><div ><img src='/pic/"+t.student.studentPhoto+"' style='height:40px;width:40px;float:left;'/>";
                                                     div += "<input type='hidden' id='talkingIdhidden"+t.talkingToCaoId+"' value='"+a.talkingId+"'></input>";
                                                     div += "<input type='hidden' id='studentTuCaoId"+t.talkingToCaoId+"' value='"+t.student.studentId+"'>";
                                                     div += "<span style='font-size:15px;display:block;margin-top:5px;'><font style='color:red'>"+t.student.studentName+"</font>&nbsp;&nbsp;:&nbsp;&nbsp;"+t.talkingToCaoContext+"</span>";
                                                     div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(t.talkingToCaoDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
                                                     div += "<input type='hidden' value='"+t.talkingToCaoId+"'/>";
                                                     div += "</div>"; 
                                                        $.each(a.talkingTocao,function(y,parent){
                                                            if(parent.talkingToCaoParentId==t.talkingToCaoId){
                                                                 div += "<div style='margin-left:40px;'><img src='/pic/"+parent.student.studentPhoto+"' style='height:40px;width:40px;float:left;'/>";
                                                                 div += "<span style='font-size:15px;display:block;margin-top:5px;'><font style='color:red'>"+parent.student.studentName+"</font>&nbsp;<font style='color:black'>回复&nbsp;</font><font style='color:red'>"+t.student.studentName+":</font>&nbsp;&nbsp;:&nbsp;&nbsp;"+parent.talkingToCaoContext+"</span>";
                                                                 div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(parent.talkingToCaoDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
                                                                 div += "<input type='hidden' value='"+parent.talkingToCaoId+"'/>";
                                                                 div += "</div>";
                                                                 $.each(a.talkingTocao,function(z,child){
                                                                     if(child.talkingToCaoParentId==parent.talkingToCaoId){
                                                                         div += "<div style='margin-left:40px;'><img src='/pic/"+child.student.studentPhoto+"' style='height:40px;width:40px;float:left;'/>";
                                                                         div += "<span style='font-size:15px;display:block;margin-top:5px;'><font style='color:red'>"+child.student.studentName+"</font>&nbsp;回复<font style='color:red'>"+parent.student.studentName+"</font>&nbsp;&nbsp;&nbsp;&nbsp;"+child.talkingToCaoContext+"</span>";
                                                                         div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(child.talkingToCaoDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
                                                                         //回复人的ID
                                                                         div += "<input type='hidden' value='"+child.talkingToCaoId+"'/>";
                                                                         div += "</div>";
                                                                         $.each(a.talkingTocao,function(h,grandson){
                                                                              if(grandson.talkingToCaoParentId==child.talkingToCaoId){
                                                                                     div += "<div style='margin-left:40px;'><img src='/pic/"+grandson.student.studentPhoto+"' style='height:40px;width:40px;float:left;'/>";
                                                                                     div += "<span style='font-size:15px;display:block;margin-top:5px;'><font style='color:red'>"+grandson.student.studentName+"</font>&nbsp;回复<font style='color:red'>"+child.student.studentName+"</font>&nbsp;&nbsp;&nbsp;&nbsp;"+grandson.talkingToCaoContext+"</span>";
                                                                                     div += "<span style='color:#c0c0c0;font-size:10px;'>"+((new Date(grandson.talkingToCaoDateTime)).toLocaleString().replace(/年|月/g,'-')).replace(/日/g,'')+"</span>";
                                                                                     div += "<input type='hidden' value='"+grandson.talkingToCaoId+"'/>";
                                                                                     div += "</div>";                                                                                 
                                                                              }
                                                                         })
                                                                     }
                                                                 })
                                                            }
                                                        })
                                                        div+="</div>";
                                                }
                                            })
                                            div +="</div>";
                                     }
                                     div += "<div class='jieda-reply'  ><span  onclick='addZanCount("+a.talkingId+","+a.talkingStudentId+")' style='margin-left:565px;' class='jieda-zan'  type='zan'><i   class='iconfont icon-zan'></i><em id='thumCount'>"+a.talkingThumCount+"</em></span></div>"
                                     div += "<div style='width:600px;height:40px;'><textarea id='mainToCaoContext"+a.talkingId+"' style='width:530px;height:40px;resize:none;' placeholder='评论'></textarea><button onclick='pushTalkingToCao("+a.talkingId+","+a.stuId.studentId+")' style='margin-top:-30px;' class='layui-btn'>评论</button></div>";
                                     //说说评论
                                     div += "</div></div></div>";
                           })
                          }else{
                        	  div += "<span style='margin-left:300px;'>"
                              div += '暂无说说';
                        	  div += "</span>";
                          } 
                          $("#talking").html(div);
                    })
                }  
    
    }


        //追加回复  传递主评论ID 
    function   appendHuifu(id){
          //判断回复框是否存在  如果不存在则追加评论框 只能对一个主评论的最后一条评论进行回复
          if($("#append"+id).next(".huifu").length==0){
                $(".huifu").remove();
                //追加回复框
                $("#append"+id).after("<div class='huifu'><input id='huifuContent' style='width:400px;height:30px;margin-left:100px;' type='text'><button  id='hui' class='layui-btn layui-btn-primary'>  评论  </button></div>");               
           }else if($("#append"+id).next(".huifu").length==1){
                //如果存在回复框 则删除回复框
                $(".huifu").remove();
           }
           //点击回复时删除回复框
            $("#hui").click(function(){
                //得到一个主评论的回复数量  用于查找最后一个评论的父ID
                var inputLength = $("#append"+id).find("input").length;
                //得到被回复的ID
                var talkingToCaoParentId = $("#append"+id).find("input")[inputLength-1].value;
                var talkingId = document.getElementById("talkingIdhidden"+id).value;
                var talkingToCaoContext = document.getElementById("huifuContent").value;
               if(talkingToCaoContext.length != 0){
               	 var studentTuCaoId  = document.getElementById("studentTuCaoId"+id).value;
                    $.ajax({
                            type:'post',
                            url:'/Student/insertTalkingToCao.action',
                            contentType:'application/json;charset=utf-8',
                            //数据格式是json串
                            data:'{"talkingId":'+talkingId+',"talkingToCaoParentId":'+talkingToCaoParentId+',"talkingToCaoContext":"'+talkingToCaoContext+'","studentId":'+studentTuCaoId+'}',
                            success:function(data){//返回json结果
                                //回复成功后 刷新页面
                            	window.location.reload();  
                            }
                        });
                    //删除回复框
                    $('.huifu').remove();   
               }else{
            	  layer.msg("回复内容不能为空",{icon:5,time:1500}) 
               }

            })
    }   
    
    //点赞
    function addZanCount(talkingId,studentId){
    		$.post("/Student/thumTalking.action",{"talkingId":talkingId,"studentId":studentId},function(data){
    								var count = $("#thumCount").html();
    								if(data == 'HAVE'){
    									layer.msg("已经点过赞了",{icon:5,time:1500});
    								}else if(data == 'FAIL'){
    									layer.msg("不能点赞自己的说说",{icon: 5,time:1500});
    								}else if(data == 'SUCCESS'){
    									layer.msg("成功点赞",{icon: 1,time:1500});
    									$("#thumCount").html(++count);
    								}
    		},'text');
    }
    
    //发表主评论
    function pushTalkingToCao(talkingId,studentId){
    	var context = document.getElementById("mainToCaoContext"+talkingId).value;
		if(context.length!=0){
            $.ajax({
                type:'post',
                url:'/Student/insertTalkingToCao.action',
                contentType:'application/json;charset=utf-8',
                //数据格式是json串，商品信息
				data:'{"talkingId":'+talkingId+',"talkingToCaoParentId":'+0+',"talkingToCaoContext":"'+context+'","studentId":'+studentId+'}',
                success:function(data){//返回json结果
                    //回复成功后 刷新页面
                    window.location.reload();
                }
            });			
		}else if(context.length==0){
			 layer.msg("请填写评论内容",{icon:5,time:1500});
		}
    }
    
    //删除说说
    function  deleteTalking(talkingId){
    	 $.post("/Student/deleteTalkingByTalkigId.action",{"talkingId":talkingId},function(data){
    		  if(data == "successDelete"){
    			  layer.msg("删除成功",{icon: 1,time:1500});
    			  $("#remove"+talkingId).remove();
    			  if($("#talking").children("div").length==0){
    			  		$("#talking").html("<span style='margin-left:300px;margin-top:50px;'>暂无说说</span>");
    			  }
    			  //window.location.href = "/Student/front/talking/talkingindex.jsp?action=/Student/queryTalkingByStuId.action";  
    		  }else{
    			  layer.msg("删除失败",{icon: 5,time:1500});
    		  }
    	 });
    }
    
    

	    
</script>

</body>
</html>