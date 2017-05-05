package cn.com.zzzy.controller.student;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.service.student.StudentFriendService;
import cn.com.zzzy.util.PageParam;

@Controller
public class StudentFriendController {
    
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
    public ModelAndView queryFriendsInfo(PageParam param) {
        ModelAndView mav = new ModelAndView();
        Integer stuId = 1;
        List<Student> listFriendInfo = studentFriendService.queryFriendInfo(param, stuId);
        for(int i = 0;i<listFriendInfo.size();i++){
                System.out.println(listFriendInfo.get(i));
        }
        mav.addObject("listFriendInfo", listFriendInfo);
        mav.setViewName("/front/user/studentFriend.jsp");
        return mav;
    }
    
}
