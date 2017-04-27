package cn.com.zzzy.controller.student;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.service.student.StudentFriendService;
import cn.com.zzzy.service.student.StudentService;
import cn.com.zzzy.util.PageData;
import cn.com.zzzy.util.PageParam;
import cn.com.zzzy.util.Util;

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
    public List<StudentFriend> queryFriendInfo(PageParam param, Integer stuId) {
        return studentFriendService.queryFriendInfo(param, stuId);
    }

    /**
     * 根据学生ID查询学生的详细信息
     * @param stuId
     * @return
     */
    @RequestMapping("queryStudentInfoById")
    public ModelAndView queryStudentInfoById(HttpServletRequest request) {
        AuthorityAccount account = (AuthorityAccount) request.getSession().getAttribute("Account");
        System.out.println("登录学生ID:" + account.getStudentId());
        Student student = studentService.queryStudentInfoById(account.getStudentId());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("student", student);
        modelAndView.setViewName("/front/user/home.jsp");
        return modelAndView;
    }

    /**
     * 得到所有的学生信息
     * @return
     */
    @RequestMapping("getAllStudent")
    @ResponseBody
    public PageData getAllStudent(PageParam param) {
            return  studentService.queryForPage(param);
    }

    /**
     * 添加学生信息
     * @param student
     * @param file
     * @return
     * @throws IOException 
     * @throws IllegalStateException 
     */
    @RequestMapping("addStudent")
    @ResponseBody
    public void addStudent(Student student, MultipartFile photoFile) throws IllegalStateException, IOException {
         System.out.println("学生姓名:"+student.getStudentSex()); 
        // 得到图片的原始名称
        String originalFilename = photoFile.getOriginalFilename();
        if (photoFile != null && originalFilename != null && originalFilename.length() > 0) {
            // 存储图片的物理路径
            String pic_path = "E:\\develop\\";
            // 新的图片名称
            String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            // 新图片
            File file = new File(pic_path + newFileName);
            // 将内存的数据写入磁盘
            photoFile.transferTo(file);
            student.setStudentPhoto(newFileName);
        }
        String msg = studentService.addStudent(student);
        Util.Writer(msg);
    }
}
