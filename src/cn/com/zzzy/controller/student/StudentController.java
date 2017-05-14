package cn.com.zzzy.controller.student;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
import cn.com.zzzy.service.authority.AuthorityAccountService;
import cn.com.zzzy.service.authority.AuthorityMenuService;
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
    
    @Autowired
    private AuthorityAccountService auAcService;

    /**
     * 根据学生ID查询学生的详细信息
     * @param stuId
     * @return
     */
    @RequestMapping("queryStudentInfoById")
    public ModelAndView queryStudentInfoById(HttpServletRequest request,Integer stuId) {
        AuthorityAccount account = (AuthorityAccount) request.getSession().getAttribute("Account");
        Student loginStudent = studentService.queryStudentInfoById(account.getStudentId()); 
        Student student = null;
        Integer count = 5;
        System.out.println("学生编号:"+stuId);
        if(stuId!=null){
            student = studentService.queryStudentInfoById(stuId);
            if(stuId!=account.getStudentId()){
             //根据学生ID查询出加他好友的学生ID和状态(审核 同意  未同意)
             List<StudentFriend> studentFriendFlag = studentFriendService.queryFriendFlag(stuId);
                 for(int i=0;i<studentFriendFlag.size();i++){
                         StudentFriend studentFriend = studentFriendFlag.get(i);
                         System.out.println(i+"nihao"+studentFriend.getStudentId()+"好友:"+studentFriend.getFriend());
                         if(studentFriend.getStudentId()==account.getStudentId()  && studentFriend.getStuFriendFlag()==0){
                                 //已经加对方为好友 但是对方未审核
                                 count = 0;
                         }else if(studentFriend.getStudentId()==account.getStudentId() && studentFriend.getStuFriendFlag()== 1){
                                 //已经加对方为好友 对方已同意  已经是好友
                                 count = 1;
                         }else if(studentFriend.getStudentId()==account.getStudentId() && studentFriend.getStuFriendFlag()==2){
                                //加对方为好友  但是被对方拒绝
                                count = 2;
                         }
                 }
            }else{
                        count  = 1;
            }  
             //如果学生ID为空说明是用户登录
        } else if(stuId == null){
            System.out.println("登录学生ID:" + account.getStudentId());
            count =  1;
            request.getSession().setAttribute("stuId", account.getStudentId());
            student = studentService.queryStudentInfoById(account.getStudentId());
        }
        
        
        HttpSession session = request.getSession();
        session.setAttribute("loginStudent", loginStudent);
        System.out.println("count:"+count);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("student", student);
        modelAndView.addObject("count", count);
        modelAndView.addObject("loginStudent", loginStudent);
        modelAndView.setViewName("/front/user/home.jsp");
        return modelAndView;
    }
   @RequestMapping("queryStudent")
   @ResponseBody
    public Student queryStudent(){
        Integer stuId = 1;
        Student student = studentService.queryStudentInfoById(stuId);
        return student;
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
    /**
     * 查询学生个性签名
     * @param stuId
     * @return
     */
    @RequestMapping("selectStudentSign")
    public ModelAndView selectStudentSign(HttpSession session){
        //查询个性签名
        String StuSign=studentService.selectStudentSign((Integer)session.getAttribute("stuId"));
        //查询(原)密码
        String StudentPwd= auAcService.selectStudentPwd((Integer)session.getAttribute("stuId"));
        ModelAndView mv = new ModelAndView();
        mv.addObject("StudentPwd", StudentPwd);
        mv.addObject("stuId", (Integer)session.getAttribute("stuId"));
        mv.addObject("StuSign", StuSign);
        mv.setViewName("/front/user/set.jsp");
        return mv;
    }
   /**
    * 更新学生个性签名
    * @param stuId
    * @param studentSign
    */
    @RequestMapping("updateStudentSign")
    public String updateStudentSign(Integer stuId,String studentSign){
        studentService.updateStudentSign(stuId, studentSign);
        return "redirect:queryStudentInfoById.action?stuId="+stuId;
    }
    
    
}
