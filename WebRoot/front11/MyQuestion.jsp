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
                    <a href="../Index.jsp">
                        <img src="../Images/Student/logo.gif" alt="" width="165" height="48" />
                    </a>
                </div>
                <div class="topxx">
                    <select onchange="changeCateory($(this))" style="font-size: 11px; background: #4991cf;
                        color: #fff;">
                        
                        <option 
                            value="4">
                            远程</option>
                        
                        <option selected='selected'
                            value="1">
                            自考</option>
                        
                    </select>
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
                
    <h2 class="mbx">问吧 &gt; 我的问题</h2>
        
        <div class="layui-tab">
          <ul class="layui-tab-title">
            <li class="layui-this">问吧</li>
            <li>我的问题</li>
            <li>发表问题</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                           <div class="layui-form-item">
                                <label class="layui-form-label">问题类型</label>
                                <div class="layui-input-block">
                                  <select name="questionType" >
                                    <option value="0">C#</option>
                                    <option value="1">JAVA</option>
                                    <option value="2">Python</option>
                                    <option value="3">PHP</option>
                                    <option value="4">JAVASCRIPT</option>
                                  </select>
                                </div>
                          </div>
                         <div  style="border:1px solid red;width:600px;height:110px;margin-left:30px;margin-top:10px;">
                            <a href="baidu">
                            <img class="media-object img-circle " style="width:100px;height:100px;margin-top:5px;float:left;" src="/moban/front/Images/ks/Capture001.jpg" alt="通用的占位符图像"/>
                            <span style="font-size:20px; display:inline-block; color:blue;margin-left:20px;margin-top:20px;"><h4>ArrayList与LinkedList的区别....</h4></span>
                            </a>
                            <div style="border:1px solid white;width:500px;height:50px;margin-left:120px;margin-top:30px;" >
                                <span style="font-size:13px">李福光&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;java&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017-04-02 10:22:00</span>
                            </div>
                          </div>
                         <div  style="border:1px solid red;width:600px;height:110px;margin-left:30px;margin-top:10px;">
                            <a href="">
                            <img class="media-object img-circle " style="width:100px;height:100px;margin-top:5px;float:left;" src="/moban/front/Images/ks/Capture001.jpg" alt="通用的占位符图像"/>
                            <span style="font-size:20px; display:inline-block; color:blue;margin-left:20px;margin-top:20px;"><h4>ArrayList与LinkedList的区别....</h4></span>
                            </a>
                            <div style="border:1px solid white;width:500px;height:50px;margin-left:120px;margin-top:30px;" >
                                <span style="font-size:13px">李福光&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;java&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017-04-02 10:22:00</span>
                            </div>
                          </div>
                         <div  style="border:1px solid red;width:600px;height:110px;margin-left:30px;margin-top:10px;">
                            <a href="">
                            <img class="media-object img-circle " style="width:100px;height:100px;margin-top:5px;float:left;" src="/moban/front/Images/ks/Capture001.jpg" alt="通用的占位符图像"/>
                            <span style="font-size:20px; display:inline-block; color:blue;margin-left:20px;margin-top:20px;"><h4>ArrayList与LinkedList的区别....</h4></span>
                            </a>
                            <div style="border:1px solid white;width:500px;height:50px;margin-left:120px;margin-top:30px;" >
                                <span style="font-size:13px">李福光&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;java&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017-04-02 10:22:00</span>
                            </div>
                          </div>                                                    
            </div>
            <div class="layui-tab-item">
                    <ul>
                        <li>
                            <div style="width:1050px;height:30px;border:1px solid white;line-height:30px;margin-top:5px;">
                                 <a href="#">Ajax如何进行传值表单提交表单提交</a>
                                 <span style="font-size:5px; color:#999">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017/05/20&nbsp;&nbsp;&nbsp;&nbsp;08:20:03</span>
                                 <span style="margin-left:300px; color:#A9CCE3">0答</span>
                            </div>
                        </li>
                        <li>
                            <div style="width:1050px;height:30px;border:1px solid white;line-height:30px;margin-top:5px;">
                                 <a href="#">Ajax如何进行传值表单提交表单提交</a>
                                 <span style="font-size:5px; color:#999">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017/05/20&nbsp;&nbsp;&nbsp;&nbsp;08:20:03</span>
                                 <span style="margin-left:300px; color:#A9CCE3">0答</span>
                            </div>
                        </li>
                        <li>
                            <div style="width:1050px;height:30px;border:1px solid white;line-height:30px;margin-top:px;">
                                 <a href="#">Ajax如何进行传值表单提交表单提交</a>
                                 <span style="font-size:5px; color:#999">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017/05/20&nbsp;&nbsp;&nbsp;&nbsp;08:20:03</span>
                                 <span style="margin-left:300px; color:#A9CCE3">0答</span>
                            </div>
                        </li>
                        <li></li>
                    </ul>
            </div>
            <div class="layui-tab-item">
                        <div class="cztable">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="15%" align="right"><div align="right">问题标题： </div></td>
                                    <td><input id="Ctitle" size="20" name="Ctitle" class="input_2"/></td>
                                </tr>
                                <tr>
                                    <td width="15%" align="right"><div align="right">问题类型： </div></td>
                                    <td>
                                        <select id="Ctype" name="Ctype">
                                            <option value="Unselected">请选择</option>
                                            <option value="1">JAVA</option>
                                            <option value="3">C#</option>
                                            <option value="4">PHP</option>
                                            <option value="5">云计算</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%" align="right"><div align="right">问题内容： </div></td>
                                    <td><textarea name="Ccontent" cols="80" rows="5" id="Ccontent" class="input_2"></textarea></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <div align="center" >
                                            <input type="submit" value="发表" onclick="" class="input2" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>                        
            
            </div>
          </div>
        </div>
    
    



                                                  
    <input type="hidden" id="stuId" value="7c50f70a-775b-4aef-8bf2-5010ec612c0d" />
    <!--不要的javascript代码-->
<script type="text/javascript">
        var pageIndex = 1; //当前加载页数
        var hasData = true; //是否还有数据可以加载
        var yearData = ""; //年份
        var monthData = ""; //月.日
        var $dt = null; //追加数据的jq对象
        function loadData() {
            if (hasData) {
                var stuId = $("#stuId").val();
                if (stuId.length > 1) {
                    $.ajax({
                        url: "StudyGetData.ashx",
                        type: "post",
                        data: "stuId=" + stuId + "&pageIndex=" + pageIndex,
                        success: function (data) {
                            pageIndex++;
                            var s1 = data.split('$1$')[0];
                            if (s1 == "0") {
                                hasData = false;
                            }
                            var s2 = data.split('$1$')[1];
                            showData(s2);
                        }
                    });
                }
            }
        }
        function showData(str) {
            var s3 = str.split('$3$');
            for (i = 0; i < s3.length; i++) {
                var s4 = s3[i].split('$2$');
                if (s4[0] != yearData) {
                    var t = "<li><h2 class='first'><a href='#nogo'>" + s4[0] + "年</a></h2></li>";
                    $("#hData").append(t);
                    yearData = s4[0];
                }
                if (s4[1] != monthData) {
                    var $li = $("<li class='green'><h3>" + s4[1] + "<span>" + yearData + "</span></h3></li>");
                    var $div = $("<div class='lc_right'></div>");
                    var $dl = $("<dl></dl>");
                    var $tdiv = $("<div class='time_ico'></div>");
                    $dt = $("<dt></dt>");
                    $dt.appendTo($dl);
                    $tdiv.appendTo($dl);
                    $dl.appendTo($div);
                    $div.appendTo($li);
                    $li.appendTo($("#hData"));
                    monthData = s4[1];
                }
                if ($dt) {
                    var pathA = s4[6];
                    var $span;
                    if (pathA.length < 1) {
                        $span = $("<span>" + s4[2] + " " + s4[3] + "<a>" + s4[4] + "</a>  " + s4[5] + "</span>");
                    } else {
                        $span = $("<span>" + s4[2] + " " + s4[3] + "<a href='" + pathA + "' target='_blank'>" + s4[4] + "</a>  " + s4[5] + "</span>");
                    }
                    $dt.append($span);
                }
            }
        }

        function reachBottom() {
            var scrollTop = 0;
            var clientHeight = 0;
            var scrollHeight = 0;
            if (document.documentElement && document.documentElement.scrollTop) {
                scrollTop = document.documentElement.scrollTop;
            } else if (document.body) {
                scrollTop = document.body.scrollTop;
            }
            if (document.body.clientHeight && document.documentElement.clientHeight) {
                clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
            } else {
                clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;
            }
            scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
            alert(scrollTop);
            if (scrollTop + clientHeight == scrollHeight) {
                return true;
            } else {
                return false;
            }
        }
        $(function () {
            $(window).scroll(function () {
                var sTop = $(this).scrollTop();
                var sHeight = $(this).height();
                var scrollHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
                if (sTop + sHeight == scrollHeight) {
                    loadData();
                }
            });
            loadData();
        });
     
    </script>
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
