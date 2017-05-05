package cn.com.zzzy.controller.student;

import java.util.List;

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
      
      @RequestMapping("queryAllMessage")
      @ResponseBody
      public List<StudentMessage>  queryAllMessage(){
           Integer stuId = 1;
           return   studentMessageService.queryAllMessage(stuId);
      }
      
}
