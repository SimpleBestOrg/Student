<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
  String path = request.getContextPath();
  request.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>活动</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${path}/front/res/layui/css/layui.css">
  <link rel="stylesheet" href="${path}/front/res/css/global.css">
  <link rel="stylesheet" href="${path}/front/res/layui/layui.js">
  <link rel="stylesheet" href="${path}/front/res/css/front.css">
 
</head>
 <style type="text/css">
	.prompt{
		margin-top:10px;
		color:#F00;
	}
</style>

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
       <a class="avatar" href="/Student/queryStudentInfoById.action">
        <img src="/pic/${loginStudent.studentPhoto}"> 
        <cite>${loginStudent.studentName}</cite>
        <i>${loginStudent.studentClasses.className}</i>
      </a>
      <div class="nav">
        <a href="selectStudentSign.action"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="/Student/logout.action"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </div>
  </div>
</div>
<!-- 这是申请部门的模态框 -->
<div>
	
</div>

<div class="main layui-clear">
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a class="tab-this">全部社团</a>
          <a onclick="myCommunityDetail()">我的社团</a> 
        </span>
        
        <c:if test="${communityPeople == null}" >
        	<button onclick="applyCommunity()" class="layui-btn jie-add">申请部门</button>
        </c:if>    
        <c:if test="${communityPeople  != null}">
                <button class="layui-btn jie-add"  onclick="msg('${communityInfo.communityName}',${communityPeople.communityPeoFlag},'${communityPeople.communityPosition}')" >申请部门</button>            
        </c:if> 
      </div>
      <!-- 显示所有的社团 -->
    <div class="front">
    <c:if test="${fn:length(listCommunity) > 0 }">
    	<c:forEach items="${listCommunity}" var="list">
      <div class="front-community">
      		<div class="front-photo"><img src="/pic/${list.communityPhoto }" style="width: 229px;height: 200px;"></div>
      		<button class="layui-btn" style="width:230px;height:50px;" onclick="communityDetail(${list.communityId})">${list.communityName }</button>
      </div>
       </c:forEach>
    </c:if> 
    <c:if test="${fn:length(listCommunity) == 0 }">
            <div class="fly-none">暂时没有社团</div> 
    </c:if>  
    </div>
    <div class="clear"></div>
    
     
    </div>
  </div>
  <div class="edge">

  </div>  
  
</div>
<form class="layui-form" action="InsertCommunity.action" enctype="multipart/form-data" method="post"  id="communityInsert" onsubmit="return checkAll()">
	<div>
		<input type="hidden" name="studentId" value="<%=session.getAttribute("stuId")%>"/>
	</div>
  <div class="layui-form-item">
    <label class="layui-form-label">名称</label>
    <div class="layui-input-block">
      <input type="text" name="communityName" id="communityName" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" onblur="checkCommunityName()">
      <div id="communityNameId" class="prompt"></div>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">人数</label>
    <div class="layui-input-block">
      <input type="text" name="communityPersonNum" id="communityPersonNum"  required  lay-verify="required" placeholder="请输入人数" autocomplete="off" class="layui-input" onblur="checkNum()">
      <div id="communityPersonNumId" class="prompt"></div>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">申请原因</label>
    <div class="layui-input-block">
      <textarea name="communityAppliReason" id="communityAppliReason" placeholder="请输入内容" class="layui-textarea" onblur="checkCommunityAppliReason()"></textarea>
      <div id="communityAppliReasonId" class="prompt"></div>
    </div>
    <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">职责</label>
    <div class="layui-input-block">
      <textarea name="communityAppliRespon" id="communityAppliRespon" placeholder="请输入内容" class="layui-textarea" onblur="checkCommunityAppliRespon()"></textarea>
      <div id="communityAppliResponId" class="prompt"></div>
    </div>
  </div>
 <!-- 显示照片 -->
  <div style="margin-left: 70px;">
  	<div id="divPreview">  
        <img id="imgHeadPhoto" src="" style="width: 160px; height: 170px; border: solid 1px #d2e2e2;" alt=""/>  
    </div>  
    <input type="file" name="Photo" onchange="PreviewImage(this,'imgHeadPhoto','divPreview');" size="20" />  
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit type="submit" lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>

<script src="/Student/js/jquery.min.js"></script>
<script type="text/javascript"> 
        $(function(){
        	var stuId = <%=session.getAttribute("stuId")%>;
        	if(stuId==null){
        		window.location="/Student/login.jsp?loginInfo="+1;
        	}
        })
        <!-- 上传照片 -->
        //js本地图片预览，兼容ie[6-9]、火狐、Chrome17+、Opera11+、Maxthon3  
        function PreviewImage(fileObj, imgPreviewId, divPreviewId) {  
            var allowExtention = ".jpg,.bmp,.gif,.png"; //允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;  
            var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();  
            var browserVersion = window.navigator.userAgent.toUpperCase();  
            if (allowExtention.indexOf(extention) > -1) {  
                if (fileObj.files) {//HTML5实现预览，兼容chrome、火狐7+等  
                    if (window.FileReader) {  
                        var reader = new FileReader();  
                        reader.onload = function (e) {  
                            document.getElementById(imgPreviewId).setAttribute("src", e.target.result);  
                        }  
                        reader.readAsDataURL(fileObj.files[0]);  
                    } else if (browserVersion.indexOf("SAFARI") > -1) {  
                        alert("不支持Safari6.0以下浏览器的图片预览!");  
                    }  
                } else if (browserVersion.indexOf("MSIE") > -1) {  
                    if (browserVersion.indexOf("MSIE 6") > -1) {//ie6  
                        document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);  
                    } else {//ie[7-9]  
                        fileObj.select();  
                        if (browserVersion.indexOf("MSIE 9") > -1)  
                            fileObj.blur(); //不加上document.selection.createRange().text在ie9会拒绝访问  
                        var newPreview = document.getElementById(divPreviewId + "New");  
                        if (newPreview == null) {  
                            newPreview = document.createElement("div");  
                            newPreview.setAttribute("id", divPreviewId + "New");  
                            newPreview.style.width = document.getElementById(imgPreviewId).width + "px";  
                            newPreview.style.height = document.getElementById(imgPreviewId).height + "px";  
                            newPreview.style.border = "solid 1px #d2e2e2";  
                        }  
                        newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";  
                        var tempDivPreview = document.getElementById(divPreviewId);  
                        tempDivPreview.parentNode.insertBefore(newPreview, tempDivPreview);  
                        tempDivPreview.style.display = "none";  
                    }  
                } else if (browserVersion.indexOf("FIREFOX") > -1) {//firefox  
                    var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);  
                    if (firefoxVersion < 7) {//firefox7以下版本  
                        document.getElementById(imgPreviewId).setAttribute("src", fileObj.files[0].getAsDataURL());  
                    } else {//firefox7.0+                      
                        document.getElementById(imgPreviewId).setAttribute("src", window.URL.createObjectURL(fileObj.files[0]));  
                    }  
                } else {  
                    document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);  
                }  
            } else {  
                alert("仅支持" + allowExtention + "为后缀名的文件!");  
                fileObj.value = ""; //清空选中文件  
                if (browserVersion.indexOf("MSIE") > -1) {  
                    fileObj.select();  
                    document.selection.clear();  
                }  
                fileObj.outerHTML = fileObj.outerHTML;  
            }  
            return fileObj.value;    //返回路径  
        }  
    </script>  
  <script src="${path}/front/res/layui/layui.js"></script>
<script  type="text/javascript">
                layui.use(['layer'],function(){
                	layer = layui.layer;
                })
                function msg(communityName,communityPeopleFlag,communityPosotion){
                	if(communityPeopleFlag == 0){
                		  layer.msg("已经申请加入了"+communityName+"社团 等待"+communityName+"部长审批 不能申请创建社团!!",{icon:1,time:2000})
                	}else if(communityPeopleFlag == 1){
                		  if(communityPosotion == '部长'){
                			  layer.msg("您是"+communityName+"的部长哦  不能创建社团了!!",{icon:1,time:2000})  
                		  }else{
                			  layer.msg("您是"+communityName+"的职员了哦  不能申请创建社团了!!",{icon:1,time:2000})
                		  }
                	}else if(communityPeopleFlag == 2){
                		layer.msg("您申请加入"+communityName+"社团  被拒绝了 不能在申请创建社团了!!",{icon:1,time:2000})
                	}
                }
			layui.use('upload', function(){
				layui.upload({
					  	  url: '/Student/insertPhoto.action'
						  ,success: function(res){
						    console.log(res); //上传成功返回值，必须为json格式
						  }
						});
			}); 	
		function applyCommunity(){
			layui.use('layer', function(){
				  var layer = layui.layer
				  ,$  = layui.jquery;
					//页面层
					layer.open({
					  type: 1,
					  skin: 'layui-layer-rim', //加上边框
					  area: ['500px', '550px'], //宽高
					  content:  $('#communityInsert')
					});
				}); 
		}	
			//传的是社团ID，上面用onclick调用
		  function communityDetail(communityId){
				 window.location.href="${path}/getCommunity.action?id="+communityId;
			}
		  function myCommunityDetail(){
			  window.location.href="${path}/queryById.action";
		  }	 
		
</script>
<!-- 文本框中的正则表达式判断 -->
<script type="text/javascript">
		//验证名称只能为汉字
		function checkCommunityName(){
			var communityName = document.getElementById("communityName").value;
			var communityNameId = document.getElementById("communityNameId");
			var regName = /^[\u4e00-\u9fa5]{0,}$/;
			if(regName.test(communityName) == false)
			{
				communityNameId.innerHTML = "格式不正确，请重新输入";
				return false;
			}else
			{
				communityNameId.innerHTML = "";
				return true;
			}
		}
		//验证人数为只能为数字
		function checkNum(){
			var communityPersonNum = document.getElementById("communityPersonNum").value;
			var communityPersonNumId = document.getElementById("communityPersonNumId");
			var regMobile = /^[0-9]*$/;
			if(regMobile.test(communityPersonNum) == false)
			{
				communityPersonNumId.innerHTML = "格式不正确，请重新输入";
				return false;
			}else
			{
				communityPersonNumId.innerHTML = "";
				return true;
			}
		}
		//验证申请部门原因只能为汉字
		function checkCommunityAppliReason(){
			var communityAppliReason = document.getElementById("communityAppliReason").value;
			var communityAppliReasonId = document.getElementById("communityAppliReasonId");
			var regName = /^[\u4e00-\u9fa5]{0,}$/;
			if(regName.test(communityAppliReason) == false){
				communityAppliReasonId.innerHTML = "格式不正确，请重新输入"
				return false;
			}else{
				communityAppliReasonId.innerHTML = "";
				return true;
			}
		}
		//验证职责只能为汉字
		function checkCommunityAppliRespon(){
			var communityAppliRespon = document.getElementById("communityAppliRespon").value;
			var communityAppliResponId = document.getElementById("communityAppliResponId");
			var regName = /^[\u4e00-\u9fa5]{0,}$/;
			if(regName.test(communityAppliRespon) == false){
				communityAppliResponId.innerHTML = "格式不正确，请重新输入"
				return false;
			}else{
				communityAppliResponId.innerHTML = "";
				return true;
			}
		}
		//点击提交按钮是判断
		function checkAll(){ 
			checkCommunityName();
			checkNum();
			checkCommunityAppliReason();
			checkCommunityAppliRespon();
			if(checkCommunityName() && checkNum() && checkCommunityAppliReason() && checkCommunityAppliRespon()){
				return true;
			}else{
				return false;
			}
		}
</script>
</body>
</html>