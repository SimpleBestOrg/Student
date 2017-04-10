<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	学生信息管理平台
</title>
    <link href="Style/StudentStyle.css" rel="stylesheet" type="text/css" />
    <link href="Script/jBox/Skins/Blue/jbox.css" rel="stylesheet" type="text/css" />
    <link href="Style/ks.css" rel="stylesheet" type="text/css" />
    <script src="/Student/js/jquery.min.js"></script>
    <link href="layui/layui.css" rel="stylesheet" type="text/css" />
    <script src="layui/layui.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="Script/jBox/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="Script/jBox/i18n/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/Data.js" type="text/javascript"></script>
    <script type="text/javascript">
        $().ready(function () {
            setStudMsgHeadTabCheck();
            showUnreadSysMsgCount();
        });

        //我的信息头部选项卡
        function setStudMsgHeadTabCheck() {
            var currentUrl = window.location.href;
            currentUrl = currentUrl.toLowerCase();
            var asmhm = "";
            $("#ulStudMsgHeadTab li").each(function () {
                asmhm = $(this).find('a').attr("href").toLowerCase();
                if (currentUrl.indexOf(asmhm) > 0) {
                    $(this).find('a').attr("class", "tab1");
                    return;
                }
            });
        }

        //显示未读系统信息
        function showUnreadSysMsgCount() {
            var unreadSysMsgCount = "0";
            if (Number(unreadSysMsgCount) > 0) {
                $("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
            }
        }

        //退出
        function loginOut() {
            if (confirm("确定退出吗？")) {
                StudentLogin.loginOut(function (data) {
                    if (data == "true") {
                        window.location = "/Login.aspx";
                    }
                    else {
                        jBox.alert("退出失败！", "提示", new { buttons: { "确定": true} });
                    }
                });
            }
        }
        //更改报考类别
        function changeCateory(thisObj, id) {
            var oldCateoryId = $("#cateoryId").val();
            var cateoryId = "";
            if (id != null) {
                cateoryId = id;
            }
            else {
                cateoryId = thisObj.val();
            }
            var studentId = $("#studentId").val();
            if (cateoryId.length <= 0) {
                jBox.tip("报考类别不能为空！");
                if (id == null) {
                    thisObj.val(oldCateoryId);
                }
            }
            else {
                studentInfo.changeStudentCateory(cateoryId, function (data) {
                    var result = $.parseJSON(data);
                    if ((String(result.ok) == "true")) {
                        window.location.href = "/Index.aspx";
                    }
                    else {
                        jBox.tip(result.message);
                    }
                });
            }
        }
    </script>
    
    <script src="../Script/jquery-1.4.1.js" type="text/javascript"></script>
    <link href="../Style/history.css" rel="stylesheet" type="text/css" />
</head>
<body>


    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo">
                    <a href="Index.jsp">
                        <img src="Images/Student/logo.gif" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topxx">
                    910513201419学员：邹智，欢迎您！ <a href="../MyInfo/Index.jsp">我的信息</a> <a href="../User/StudentInfor/systemMsge.jsp">
                        通知</a> <a href="../User/Account/ChangePasswd.jsp">密码修改</a> <a onclick="loginOut()"
                            href="javascript:">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                        <li><a href="../Index.jsp">我的信息</a></li>
                        <li><a href="../EducationCenter/Score.jsp">教务中心</a></li>
                        <li><a href="../MyAccount/wdcw.jsp">我的学费</a></li>
                        <li><a href="StudentMaterial.jsp">资料中心</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="box mtop">

                 <jsp:include page="leftInfo.jsp" />
   <div class="rightbox">
                
    <h2 class="mbx">说说 &gt; 我的说说</h2>
        
        <div class="layui-tab">
          <ul class="layui-tab-title">
            <li class="layui-this">朋友说说</li>
            <li>我的说说</li>
            <li>发表说说</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                           <div class="talking" style="border:1px solid red;width:600px;">
                                    <img class="media-object img-circle " style="width:60px;height:60px;float:left;" src="/Student/front/image/Capture001.jpg" alt="通用的占位符图像"/>
                                    <span style="font-size:20px;display:block;margin-top:10px;">郇红芝</span>
                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                    <div style="border:1px solid red;width:600px;margin-top:10px;">
                                            <div style="border:1px solid blue;">
                                                                                                      
                                            </div>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <div style="border:1px solid green;">
                                                                                                            赞
                                            </div>
                                            <div style="border:1px solid green; background-color:green;">
                                                 <div style="border:1px solid black;">
                                                     <img src="" style="height:40px;width:40px;float:left;"/>
                                                     <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                                                     <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>
                                                 <div style="border:1px solid black; margin-left:40px;">
                                                    <img src="" style="height:40px;width:40px;float:left;"/>
                                                    <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>   
                                                 <div style="border:1px solid black;">
                                                     <img src="" style="height:40px;width:40px;float:left;"/>
                                                     <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;:&nbsp;&nbsp;程序员</span>
                                                     <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>
                                                 <div style="border:1px solid black; margin-left:40px;">
                                                    <img src="" style="height:40px;width:40px;float:left;"/>
                                                    <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>                                                 
                                            </div>
                                            <div style="border:1px solid black;height:30px;">评论</div>
                                    </div>
                         </div>      
            </div>
            <div class="layui-tab-item">
                         <div class="oneActivity" style="border:1px solid red;width:600px;">
                                    <img class="media-object img-circle " style="width:60px;height:60px;float:left;" src="/Student/front/image/Capture001.jpg" alt="通用的占位符图像"/>
                                    <span style="font-size:20px;display:block;margin-top:10px;">郇红芝</span>
                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                    <div style="border:1px solid red;width:600px;margin-top:10px;">
                                            <div style="border:1px solid blue;">
                                                                                                      
                                            </div>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <div style="border:1px solid green;">
                                                                                                            赞
                                            </div>
                                            <div style="border:1px solid green; background-color:green;">
                                                 <div style="border:1px solid black;">
                                                     <img src="" style="height:40px;width:40px;float:left;"/>
                                                     <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                                                     <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>
                                                 <div style="border:1px solid black; margin-left:40px;">
                                                    <img src="" style="height:40px;width:40px;float:left;"/>
                                                    <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>   
                                                 <div style="border:1px solid black;">
                                                     <img src="" style="height:40px;width:40px;float:left;"/>
                                                     <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;:&nbsp;&nbsp;程序员</span>
                                                     <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>
                                                 <div style="border:1px solid black; margin-left:40px;">
                                                    <img src="" style="height:40px;width:40px;float:left;"/>
                                                    <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>                                                 
                                            </div>
                                            <div style="border:1px solid black;height:30px;">评论</div>
                                    </div>
                         </div>
                         <div class="oneActivity" style="border:1px solid red;width:600px;">
                                    <img class="media-object img-circle " style="width:60px;height:60px;float:left;" src="/Student/front/image/Capture001.jpg" alt="通用的占位符图像"/>
                                    <span style="font-size:20px;display:block;margin-top:10px;">郇红芝</span>
                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                    <div style="border:1px solid red;width:600px;margin-top:10px;">
                                            <div style="border:1px solid blue;">
                                                                                                      
                                            </div>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <img src="" style="width:150px;height:150px;"/>
                                            <div style="border:1px solid green;">
                                                                                                            赞
                                            </div>
                                            <div style="border:1px solid green; background-color:green;">
                                                 <div style="border:1px solid black;">
                                                     <img src="" style="height:40px;width:40px;float:left;"/>
                                                     <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;:&nbsp;&nbsp;AAA软件教育  你好</span>
                                                     <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>
                                                 <div style="border:1px solid black; margin-left:40px;">
                                                    <img src="" style="height:40px;width:40px;float:left;"/>
                                                    <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>   
                                                 <div style="border:1px solid black;">
                                                     <img src="" style="height:40px;width:40px;float:left;"/>
                                                     <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">李福光</font>&nbsp;&nbsp;:&nbsp;&nbsp;程序员</span>
                                                     <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>
                                                 <div style="border:1px solid black; margin-left:40px;">
                                                    <img src="" style="height:40px;width:40px;float:left;"/>
                                                    <span style="font-size:15px;display:block;margin-top:5px;"><font style="color:red">郇红芝</font>&nbsp;&nbsp;回复:&nbsp;&nbsp;<font style="color:red">郇红芝</font>:AAA软件教育  你好</span>
                                                    <span style="color:#c0c0c0;font-size:10px;">2017-04-02 10:22:00</span>
                                                 </div>                                                 
                                            </div>
                                            <div style="border:1px solid black;height:30px;">评论</div>
                                    </div>
                         </div>                         
            </div>
            <div class="layui-tab-item">
                                    <textarea class="layui-textarea" id="LAY_demo1" style="display: none">  
                                                                                                                把编辑器的初始内容放在这textarea即可
                                 </textarea>    
            </div>
          </div>
        </div>
    
    



                                                  
    <input type="hidden" id="stuId" value="7c50f70a-775b-4aef-8bf2-5010ec612c0d" />
<script src="/StudentRecord/NewFront/front/layui/layui.js" charset="utf-8"></script>
<script>
            layui.use('element', function(){
              var $ = layui.jquery
              ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块
              
              //触发事件
              var active = {
                tabAdd: function(){
                  //新增一个Tab项
                  element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                  })
                }
                ,tabDelete: function(othis){
                  //删除指定Tab项
                  element.tabDelete('demo', '44'); //删除：“商品管理”
                  
                  
                  othis.addClass('layui-btn-disabled');
                }
                ,tabChange: function(){
                  //切换到指定Tab项
                  element.tabChange('demo', '22'); //切换到：用户管理
                }
              };
              
              $('.site-demo-active').on('click', function(){
                var othis = $(this), type = othis.data('type');
                active[type] ? active[type].call(this, othis) : '';
              });
              
              
            });
            <!--富文本编辑器-->
            layui.use('layedit', function(){
              var layedit = layui.layedit
              ,$ = layui.jquery;
              
              //构建一个默认的编辑器
              var index = layedit.build('LAY_demo1');
              
              //编辑器外部操作
              var active = {
                content: function(){
                  alert(layedit.getContent(index)); //获取编辑器内容
                }
                ,text: function(){
                  alert(layedit.getText(index)); //获取编辑器纯文本内容
                }
                ,selection: function(){
                  alert(layedit.getSelection(index));
                }
              };
              
              $('.site-demo-layedit').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
              });
              
          
            });
            
</script>



            </div>
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2012 广博教育 csgb.net 版权所有 站长统计</p>
        </div>
    </div>
</body>
</html>
