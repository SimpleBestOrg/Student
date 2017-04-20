package cn.com.zzzy.controller.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.service.student.StudentFriendService;
import cn.com.zzzy.service.student.StudentService;
import cn.com.zzzy.util.PageParam;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    
    
    @Autowired
    private StudentFriendService studentFriendService;
    
    /**
     * 根据学生ID查询学生朋友的信息
     * @param param
     * @param stuId  学生ID
     * @return
     */
    @RequestMapping("queryFriendInfo")
    @ResponseBody
    public List<StudentFriend>  queryFriendInfo(PageParam param,Integer stuId){
          return  studentFriendService.queryFriendInfo(param, stuId);
    }
    
}
