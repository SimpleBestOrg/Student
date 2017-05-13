package cn.com.zzzy.controller.student;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.student.StudentMessageService;

@Controller
public class StudentMessageController {
    
      @Autowired
      private  StudentMessageService  studentMessageService;
      
      /**
       * 查找学生的消息
       * @param session
       * @return
       */
      @RequestMapping("queryAllMessage")
      @ResponseBody
      public List<StudentMessage>  queryAllMessage(HttpSession session){
          Integer stuId = (Integer)session.getAttribute("stuId");
          return   studentMessageService.queryAllMessage(stuId);
      }
      
}
