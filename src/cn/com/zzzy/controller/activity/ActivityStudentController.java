package cn.com.zzzy.controller.activity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityStudent;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.activity.ActivityStudentService;
import cn.com.zzzy.service.student.StudentMessageService;
import cn.com.zzzy.service.student.StudentService;

@Controller
public class ActivityStudentController {
    @Autowired
    private ActivityStudentService activityStudentService;
    
    @Autowired
    private StudentService studentServie;
    
    
    @Autowired
    private StudentMessageService studentMessageService;
    /**
     * 学生申请加入活动
     * @param activity ①加入哪个活动 ②这个活动的申请人(用于消息通知)
     * @param session  获取是哪个学生申请加入这个活动
     * @return
     */
    @RequestMapping("insertStudentActivity")
    @ResponseBody
    public String insertStudentActivity(Activity activity,HttpSession session){
        
        Student  loginStudent = (Student)session.getAttribute("loginStudent");
        
        StudentMessage studentMessage = new StudentMessage();
        studentMessage.setStudentId(activity.getActivityApplyStuId());
        String messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>申请加入&nbsp;&nbsp;<a href='/student/queryActivityDetail.action?activityId="+activity.getActivityId()+"'><cite>"+activity.getActivityName()+"</cite></a>&nbsp;&nbsp;活动<span style='margin-left:450px;'><button onclick='agreeOrRefuseActivity("+loginStudent.getStudentId()+","+activity.getActivityId()+",1,this)' class='layui-btn layui-btn-danger layui-btn-small'>同意</button><button onclick='agreeOrRefuseActivity("+activity.getActivityApplyStuId()+","+activity.getActivityId()+",2,this)' class='layui-btn layui-btn-danger layui-btn-small'>拒绝</button></span>";
        studentMessage.setMessageContext(messageContext);
        studentMessageService.insertMessage(studentMessage);
        
        
        ActivityStudent activityStudent = new ActivityStudent();
        activityStudent.setActivityId(activity.getActivityId());
        activityStudent.setStudentsId((Integer)session.getAttribute("stuId"));
        activityStudent.setStuActivityFlag(0);
        activityStudent.setStuMessageId(studentMessage.getStuMessageId());
        activityStudentService.insertActivityStudent(activityStudent);
        
        return  "你好";
    }
    
    /**
     * 更新学生加入活动的状态
     * @param activityStudent
     * @return
     */
    @RequestMapping("updateStudentActivityFlag")
    @ResponseBody
    public String  updateStudentActivityFlag(ActivityStudent activityStudent,HttpSession session){
         System.out.println("活动ID:"+activityStudent.getActivityId());
         System.out.println("学生ID:"+activityStudent.getStudentId());
         System.out.println("状态:"+activityStudent.getStuActivityFlag());
         System.out.println("消息ID:"+activityStudent.getStuMessageId());
         System.out.println("同意或者拒绝的活动名称:"+activityStudent.getActivityName());
         
         System.out.println("你好");
        // 更新好友加入活动的状态
         activityStudentService.updateStudentActivityFlag(activityStudent);
         
         //更新我的消息(同意或者拒绝  显示为已同意或者已经拒绝)
         StudentMessage updateLoginStuMessage = new StudentMessage();
         //登录者的消息
         String updateLogStuMessageContext = "";
         //学生消息表
         StudentMessage studentMessage = new StudentMessage();
         Student  loginStudent = (Student)session.getAttribute("loginStudent");

         //申请加入活动的学生信息
         Student applyActivitystudent =  studentServie.queryStudentInfoById(activityStudent.getStudentId());
         
         //申请加入的活动活动详细信息
         
         String messageContext = "";
         //同意加入活动
         if(activityStudent.getStuActivityFlag()==1){
             messageContext = "<a href='/Student/front/user/home.jsp?stuId="+loginStudent.getStudentId()+"'>"+loginStudent.getStudentName()+"</a>同意您加入&nbsp;&nbsp;<a href='/student/front/activity/activitydetail.jsp?activityId="+activityStudent.getActivityId()+"'>"+activityStudent.getActivityName()+"</a>&nbsp;&nbsp;活动";
             updateLogStuMessageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+applyActivitystudent.getStudentId()+"'>"+applyActivitystudent.getStudentName()+"</a>申请加入&nbsp;&nbsp;<a href='/student/queryActivityDetail.action?activityId="+activityStudent.getActivityId()+"'>"+activityStudent.getActivityName()+"</a>&nbsp;&nbsp;活动<span style='margin-left:500px;'><button  class='layui-btn layui-btn-danger layui-btn-small layui-btn-disabled'>已同意</button></span>";
         }else if(activityStudent.getStuActivityFlag()==2){
         //拒绝加入这个活动    
             messageContext = "<a href='/Student/front/user/home.jsp?stuId="+loginStudent.getStudentId()+"'>"+loginStudent.getStudentName()+"</a>拒绝您加入&nbsp;&nbsp;<a href='/student/front/activity/activitydetail.jsp?activityId="+activityStudent.getActivityId()+"'>"+activityStudent.getActivityName()+"</a>&nbsp;&nbsp;活动";
             updateLogStuMessageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+applyActivitystudent.getStudentId()+"'>"+applyActivitystudent.getStudentName()+"</a>申请加入&nbsp;&nbsp;<a href='/student/queryActivityDetail.action?activityId="+activityStudent.getActivityId()+"'>"+activityStudent.getActivityName()+"</a>&nbsp;&nbsp;活动<span style='margin-left:500px;'><button  class='layui-btn layui-btn-danger layui-btn-small layui-btn-disabled'>已拒绝</button></span>";
         }
         System.out.println("你好");
         System.out.println("给对方的消息"+messageContext);
         System.out.println("更新我的消息:"+updateLogStuMessageContext);
         studentMessage.setMessageContext(messageContext);
         studentMessage.setStudentId(applyActivitystudent.getStudentId());
         updateLoginStuMessage.setMessageContext(updateLogStuMessageContext);
         updateLoginStuMessage.setStuMessageId(activityStudent.getStuMessageId());
         studentMessageService.insertMessage(studentMessage);
         studentMessageService.updateMessageContext(updateLoginStuMessage);
         return "你好";
    }
    
    
}
