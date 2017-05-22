package cn.com.zzzy.controller.talking;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.entity.TalkingToCao;
import cn.com.zzzy.service.TalkingToCaoService;
import cn.com.zzzy.service.student.StudentMessageService;

@Controller
public class talkingToCaoController {
        
    @Autowired
    private TalkingToCaoService talkingToCaoService;
    
    @Autowired
    private StudentMessageService studentMessageService;
    /**
     * 添加回复
     * @param talkingToCao
     * @return
     */
    @RequestMapping("insertTalkingToCao")
    @ResponseBody
    public String insertTalkingToCao(HttpSession session,@RequestBody TalkingToCao talkingToCao){
          Student loginStudent = (Student)session.getAttribute("loginStudent");
          System.out.println(talkingToCao.getStudentId());
          //如果是自己评论自己  那么不用消息通知
          if(talkingToCao.getStudentId() != loginStudent.getStudentId()){
              String messageContext  = null;
              if(talkingToCao.getTalkingToCaoParentId()==0){
                       messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>评论了您的说说";    
              }else {
                       messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>回复了你";
              }
              StudentMessage studentMessage = new StudentMessage();
              studentMessage.setStudentId(talkingToCao.getStudentId());
              studentMessage.setMessageContext(messageContext);
              studentMessageService.insertMessage(studentMessage);
          }
          talkingToCao.setTalkingToCaoStudentID(loginStudent.getStudentId());
          return talkingToCaoService.insertTalkingToCao(talkingToCao);
    }
}
