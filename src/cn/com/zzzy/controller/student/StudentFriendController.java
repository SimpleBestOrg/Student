package cn.com.zzzy.controller.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.student.StudentFriendService;
import cn.com.zzzy.service.student.StudentMessageService;
import cn.com.zzzy.service.student.StudentService;
import cn.com.zzzy.util.PageParam;

@Controller
public class StudentFriendController {
    
    @Autowired
    private StudentFriendService studentFriendService;
    
    @Autowired
    private StudentMessageService  studentMessageServie;
    
    @Autowired
    private StudentService studentService;
    
    /**
     * 根据学生ID查询学生朋友的信息
     * @param param
     * @param stuId  学生ID
     * @return
     */
    @RequestMapping("queryFriendInfo")
    @ResponseBody
    public List<Student> queryFriendInfo(PageParam param) {
        Integer stuId = 1;
        return studentFriendService.queryFriendInfo(param, stuId);
    }
    
    
    /**
     * 根据学生ID查询学生朋友的信息
     * @param param
     * @param stuId  学生ID
     * @return
     */
    @RequestMapping("queryFriendsInfo")
    public ModelAndView queryFriendsInfo(PageParam param,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        AuthorityAccount account = (AuthorityAccount) request.getSession().getAttribute("Account");
        List<Student> listFriendInfo = studentFriendService.queryFriendInfo(param, account.getStudentId());
        System.out.println("朋友长度"+listFriendInfo.size());
        mav.addObject("listFriendInfo", listFriendInfo);
        mav.setViewName("/front/user/studentFriend.jsp");
        return mav;
    }
    
    /**
     * 添加好友
     * @param studentFriend  获取要加的好友ID
     * @param session  获取 登录的学生ID
     */
    @RequestMapping("addFriend")
    public void  addFriend(StudentFriend studentFriend,HttpSession  session){
        System.out.println("好友Id:"+studentFriend.getFriend());
        //获取登录学生ID
        Integer stuId = (Integer)session.getAttribute("stuId");
        studentFriend.setStudentId(stuId);
        studentFriend.setStuFriendFlag(0);
        studentFriendService.addFriend(studentFriend);
        
        //查询登录学生的信息
        Student stu = studentService.queryStudentInfoById(stuId);
        
        //查询被加好友的信息
       Student addFriendInfo = studentService.queryStudentInfoById(studentFriend.getFriend());
        
       StudentMessage studentMessage = new StudentMessage();
       String messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+stuId+"'><cite>"+stu.getStudentName()+"</cite></a>请求加为好友<span style='margin-left:530px;'><button onclick='agreeOrrefuseFriend("+stuId+",1,this)' class='layui-btn layui-btn-danger layui-btn-small'>同意</button><button onclick='agreeOrrefuseFriend("+stuId+",2,this)' class='layui-btn layui-btn-danger layui-btn-small '>拒绝</button></span> ";
       System.out.println("消息内容:"+messageContext);
       studentMessage.setMessageContext(messageContext);
       studentMessage.setStudentId(studentFriend.getFriend());
       studentMessageServie.insertMessage(studentMessage);
    }
    
    /**
     * 更新好友之间的状态
     * @param studentFriend
     * @param session
     */
    @RequestMapping("updateStudentFriendFlag")
    public void  updateStudentFriendFlag(StudentFriend studentFriend,Integer messageId,HttpSession session){
        System.out.println("消息ID:"+messageId);
        System.out.println("朋友ID:"+studentFriend.getFriend());
        System.out.println("状态:"+studentFriend.getStuFriendFlag());
        //登录学生的信息 
        Student  loginStu  = (Student)session.getAttribute("loginStudent");
        Integer stuId = loginStu.getStudentId();
        //请求加为好友的学生信息
        Student addFriendInfo = studentService.queryStudentInfoById(studentFriend.getStudentId());
        //得到登录学生ID 更新好友状态时用于查找
        studentFriend.setFriend(stuId);
        //更新好友状态(拒绝或者同意)
        studentFriendService.updateStudentFriendFlag(studentFriend);
        
        //用于消息通知
        StudentMessage studentMessage = new StudentMessage();
        
        //用于更新消息内容(点击 同意或者拒绝时   内容 需要更新为(已同意 或者  已拒绝))
        StudentMessage updateStuMessage = new StudentMessage();
        
        System.out.println("需要更新的消息ID:"+messageId);
        updateStuMessage.setStuMessageId(messageId);
        
        studentMessage.setStudentId(studentFriend.getStudentId());
        
        //新消息通知
        String messageContext = null;
        //更新现有的消息(同意或者拒绝按钮 更新为 已同意 或者已拒绝)
        String updateMessageContext = null;
        if(studentFriend.getStuFriendFlag()==1){
            //如果同意 双向添加
            StudentFriend studentFriends = new StudentFriend();
            studentFriends.setStudentId(stuId);
            studentFriends.setFriend(studentFriend.getStudentId());
            studentFriends.setStuFriendFlag(1);
            
            //双向添加
            studentFriendService.addFriend(studentFriends);
            
            
            //通知对方 已同意 加为好友  
            messageContext  = "<a href='/Student/queryStudentInfoById.action?stuId="+stuId+"'><cite>"+loginStu.getStudentName()+"</cite></a>同意你加为好友";
            
            //更新我的消息(如果点击同意  则显示已同意 如果点击拒绝  则显示已拒绝)
            updateMessageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+addFriendInfo.getStudentId()+"'><cite>"+addFriendInfo.getStudentName()+"</cite></a>请求加为好友<span style='margin-left:530px;'><button  class='layui-btn layui-btn-danger layui-btn-small layui-btn-disabled'>已同意</button></span> ";
        }else{
            //如果拒绝   那么更新好友状态  并添加消息  通知对方
            messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+stuId+"'><cite>"+loginStu.getStudentName()+"</cite></a>拒绝你加为好友";
            
            //更新我的消息(如果点击同意  则显示已同意 如果点击拒绝  则显示已拒绝)
            updateMessageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+addFriendInfo.getStudentId()+"'><cite>"+addFriendInfo.getStudentName()+"</cite></a>请求加为好友<span style='margin-left:530px;'><button  class='layui-btn layui-btn-danger layui-btn-small layui-btn-disabled'>已拒绝</button></span> ";            
        }
        
        studentMessage.setMessageContext(messageContext);
        
        updateStuMessage.setMessageContext(updateMessageContext);
        //通知对方消息
        studentMessageServie.insertMessage(studentMessage);
        //更新我的消息
        studentMessageServie.updateMessageContext(updateStuMessage);
    }
    
}
