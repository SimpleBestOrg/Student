package cn.com.zzzy.controller.community;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Community;
import cn.com.zzzy.entity.CommunityPeople;
import cn.com.zzzy.entity.CommunityVo;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.community.CommunityService;
import cn.com.zzzy.service.student.StudentMessageService;
import cn.com.zzzy.service.student.StudentService;
import cn.com.zzzy.util.PageData;
import cn.com.zzzy.util.PageParam;


@Controller
public class CommunityController {
    //依赖注入，调用Service层
    @Autowired
    private CommunityService communityService;
    
    @Autowired
    private StudentMessageService  studentMessageService; 
    
    @Autowired
    private StudentService studentService;
    
    
    
    //供分页使用
    @RequestMapping("queryCommunityForPage")
    @ResponseBody
    public PageData queryCommunityForPage(PageParam param){
         return communityService.queryCommunityForPage(param);
    }
    
    /**
     * 同意或者拒绝创建社团
     * @param community
     * @param reviewCommunityReason
     */
    @RequestMapping("updateCommunityFlag")
    public void updateCommunityFlag(Community community,String reviewCommunityReason){
        System.out.println("社团状态:"+community.getCommunityFlag());
        System.out.println("社团ID:"+community.getCommunityId());
        System.out.println("社团申请人:"+community.getCommunityApplyStuId());
        System.out.println("回馈信息:"+reviewCommunityReason);
        System.out.println("社团名称:"+community.getCommunityName());
        String messageContext = "";
        if(community.getCommunityFlag()==1){
            //如果同意 那么才有创建时间  用于获取当前时间  
                Date now = new Date(); 
                DateFormat d1 = DateFormat.getDateInstance();
                String nowDate = d1.format(now);            
                community.setCommunityCreateDate(nowDate);
                //如果同意 那么申请创建社团的学生  是该社团的部长 并且  要添加到该社团的成员中
                CommunityPeople communityPeople = new CommunityPeople();
                communityPeople.setCommunityId(community.getCommunityId());
                communityPeople.setCommunityPeoFlag(1);
                communityPeople.setCommunityPosition("部长");
                communityPeople.setStudentId(community.getCommunityApplyStuId());
                communityService.insertAppli(communityPeople);
                //更新学生加入的社团 ID 
                Student stu = new Student();
                stu.setStudentCommunityId(community.getCommunityId());
                stu.setStudentId(community.getCommunityApplyStuId());
                studentService.updateStudentCommunity(stu);
            messageContext = "同意您创建&nbsp;&nbsp;<cite><a href='/Student/getCommunity.action?id="+community.getCommunityId()+"'>"+community.getCommunityName()+"</a></cite>&nbsp;&nbsp;社团 &nbsp;&nbsp;&nbsp;&nbsp;回馈信息:"+reviewCommunityReason;
            
        }else if(community.getCommunityFlag()==2){
            messageContext = "拒绝您创建&nbsp;&nbsp;<cite><a href='/Student/getCommunity.action?id="+community.getCommunityId()+"'>"+community.getCommunityName()+"</a></cite>&nbsp;&nbsp;社团 &nbsp;&nbsp;&nbsp;&nbsp;回馈信息:"+reviewCommunityReason;
        }
        //用于通知  申请创建社团的学生 的消息
        StudentMessage studentMessage = new StudentMessage();
        studentMessage.setMessageContext(messageContext); 
        studentMessage.setStudentId(community.getCommunityApplyStuId());
        //插入消息表 通知学生 该学生申请的社团是否通过审核或者被拒绝
        studentMessageService.insertMessage(studentMessage);
        //更新社团状态
        communityService.updateCommunityFlag(community);
    }
    
    /**
     * 查询已经审核通过的所有社团，根据实体类的数据和flag（状态）的来查询，
     * @param communityVo
     * @param id
     * @return
     */
    @RequestMapping("getAllCommunity")
    public ModelAndView getAllCommunity(CommunityVo communityVo,HttpSession session){
        //实例化ModelAndView
        //把查询的得到的数据和返回的页面，封装到ModelAndView对象里面
        ModelAndView mv = new ModelAndView();
        //得到查询出来的数据
        List<Community> listCommunity = communityService.select(communityVo);
        //把查询出来的数据封装到listCommunity里面
        mv.addObject("listCommunity",listCommunity);
        

        //查询该学生是否申请加入过社团  如果申请加入过社团    则在页面中禁用申请创建社团按钮   
        CommunityPeople communityPeople =  communityService.queryStuApplyJoin((Integer)session.getAttribute("stuId"));
        System.out.println("社团人员等于空"+communityPeople==null);
        mv.addObject("communityPeople", communityPeople);
        //表示已经   申请加入的有社团  查询已经申请加入的社团  用于页面  弹框提示
        if(communityPeople != null){
                    mv.addObject("communityInfo", communityService.queryById(communityPeople.getStudentId()));
        }
        
        
        //将返回的页面封装到ModelAndView里面
        mv.setViewName("/front/community/communityindex.jsp");
        //返回实例化的ModelAndView
        return mv;
    }
    /**
     * 根据社团的ID来查询出来详细信息
     * @param id
     * @return
     */
    @RequestMapping("getCommunity")
    public ModelAndView getCommunity(Integer id,HttpSession session){
      //实例化ModelAndView
        ModelAndView mv = new ModelAndView();
      //把查询出来的数据封装到listCommunity里面
        mv.addObject("listCommunity",communityService.selectById(id));
        //查询该学生是否申请加入过社团  如果申请加入过社团    则在页面中禁用申请创建社团按钮   
        CommunityPeople communityPeople =  communityService.queryStuApplyJoin((Integer)session.getAttribute("stuId"));
        mv.addObject("communityPeople", communityPeople);
        //表示已经   申请加入的有社团  查询已经申请加入的社团  用于页面  弹框提示
        if(communityPeople != null){
                    mv.addObject("communityInfo", communityService.queryById(communityPeople.getStudentId()));
        }
        //将返回的页面封装到ModelAndView里面
        mv.setViewName("/front/community/communitydetail.jsp");
        //返回实例化的ModelAndView
        return mv;
    }
    /**
     * 添加社团
     * @param model
     * @param communityVo
     * @return
     */
    @RequestMapping("InsertCommunity")
    public String InsertCommunity(@RequestParam("Photo") MultipartFile file,Model model,CommunityVo communityVo,HttpServletRequest request){
        System.out.println("进来了");
        String originalFilename  =   file.getOriginalFilename();
        String  newFileName = null;
        String newFileNames  = null;
        if(file!=null && originalFilename!=null && originalFilename.length()>0){
              // 存储图片的物理路径
            String  pic_path = "D:\\develop\\";
            //新的图片名称
            newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
             newFileNames = newFileName.replaceAll("-", "_");
            //新图片
            File  files = new File(pic_path+newFileNames);
            //将内存的数据写入磁盘
            try {
                file.transferTo(files);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } 
            catch (IOException e) {
                e.printStackTrace();
            }
        }
        communityVo.setCommunityPhoto(newFileNames);
        //得到插入的数据
        communityService.insert(communityVo);
        //重定向，返回到查询所有社团的页面
        return "redirect:getAllCommunity.action";
    }
    @RequestMapping("insertPhoto")
    @ResponseBody
    public String insertPhoto(){
         return "成功";
    }
    /**
     * 根据登录者的Id来查询自己社团的详细信息
     * @param id
     * @return
     */
    @RequestMapping("queryById")
    public ModelAndView  queryById(HttpSession session){
       Integer   studentId = (Integer)session.getAttribute("stuId");
        //实例化ModelAndView
       ModelAndView mv = new ModelAndView();
       //根据学生ID查询出来我的社团的详细信息
       Community community = communityService.queryById(studentId);
       //把得到的数据封装到queryById中，
       mv.addObject("queryById",community);
       if(community != null){
           //把根据社团的ID查询出来社团发出的所有活动封装到communityActivity中 
           mv.addObject("communityActivity",communityService.communityActivity(community.getCommunityId()));
           //把查询的申请反馈信息封装到selectFlag
           mv.addObject("selectFlag",communityService.selectFlag(community.getCommunityId()));
       }

       
       //返回前台的路径
       mv.setViewName("/front/community/Mycommunity.jsp");
     //返回实例化的ModelAndView
       return mv;
    }
    /**
     * 申请加入社团
     */
    @RequestMapping("InsertAppli")
    public String InsertAppli(Integer id,CommunityPeople communityPeople,HttpSession session){
        communityPeople.setStudentId((Integer)session.getAttribute("stuId"));
        communityPeople.setCommunityId(id);
        //申请加入社团 职位为 普通职位
        communityPeople.setCommunityPosition("普通职员");
        communityPeople.setCommunityPeoFlag(0);
        
        //得到登陆者的信息
        Student  loginStudent = (Student)session.getAttribute("loginStudent");
        //得到申请加入的社团的名称(用于消息通知)
        Community community = communityService.selectById(communityPeople.getCommunityId());
        System.out.println("社团申请人:"+community.getCommunityApplyStuId());
        //消息通知社团管理员 
        StudentMessage  studentMessage = new StudentMessage();
        String messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>申请加入&nbsp;&nbsp;<a href='/student/queryById.action'><cite>"+community.getCommunityName()+"</cite></a>&nbsp;&nbsp;社团<span style='margin-left:450px;'><button onclick='agreeOrRefuseCommunity("+community.getCommunityId()+","+loginStudent.getStudentId()+",1,this)' class='layui-btn layui-btn-danger layui-btn-small'>同意</button><button onclick='agreeOrRefuseCommunity("+community.getCommunityId()+","+loginStudent.getStudentId()+"1,this)' class='layui-btn layui-btn-danger layui-btn-small'>拒绝</button></span>";
        System.out.println("社团消息内容:"+messageContext);
        System.out.println(messageContext);
        //社团申请人 就为社团管理员 所以这个消息是通知该学生的
        studentMessage.setStudentId(community.getCommunityApplyStuId());
        studentMessage.setMessageContext(messageContext);
        studentMessageService.insertMessage(studentMessage);
        
        //设置申请加入这个社团的消息ID
        communityPeople.setStuMessageId(studentMessage.getStuMessageId());
        //得到插入的数据
        communityService.insertAppli(communityPeople);
        //重定向，返回到查询所有社团的页面
        return "redirect:getCommunity.action?id="+id;
    }
    /**
     * 同意或者拒绝申请加入
     */
    @RequestMapping("updateCommunityPeopleFlag")
    public void updateAllFlag(CommunityPeople communityPeople,Integer stuMessageId,HttpSession session){
        System.out.println("社团ID:"+communityPeople.getCommunityId());
        System.out.println("申请加入这个社团的学生状态:"+communityPeople.getCommunityPeoFlag());
        System.out.println("申请加入这个社团的学生:"+communityPeople.getStudentId());
        System.out.println("消息ID:"+stuMessageId);
       
        //更新学生加入这个社团的状态
        communityService.updateCommunityPeopleFlag(communityPeople);
        //得到申请加入这个社团的学生信息
        Student  applyJoinStudent = studentService.queryStudentInfoById(communityPeople.getStudentId());
        //得到登陆者的学生信息
        Student  loginStudent = (Student)session.getAttribute("loginStudent");
        //得到申请加入的社团的名称(用于消息通知)
        Community community = communityService.selectById(communityPeople.getCommunityId());
        
        //发送给申请加入这个社团的学生消息
        StudentMessage studentMessage = new StudentMessage();
        
        //更新我的消息  将同意和拒绝按钮 更新为  已同意或者已拒绝
        StudentMessage updateStudentMessage = new StudentMessage();
        
        //更新我的消息内容
        String updateMessageContext = "";
        //发送给对方的消息内容
        String messageContext = "";
        
        if(communityPeople.getCommunityPeoFlag() == 1){
            //同意学生加入这个社团
            updateMessageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+applyJoinStudent.getStudentId()+"'><cite>"+applyJoinStudent.getStudentName()+"</cite></a>申请加入&nbsp;&nbsp;<a href='/Student/queryById.action'><cite>"+community.getCommunityName()+"</cite></a>&nbsp;&nbsp;社团<span style='margin-left:450px;'><button  class='layui-btn layui-btn-danger layui-btn-small  layui-btn-disabled'>已同意</button></span>";
            messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>&nbsp;&nbsp;同意你加入&nbsp;<a href='/Student/getCommunity.action?id="+community.getCommunityId()+"'><cite>"+community.getCommunityName()+"</cite></a>社团";
            //更新学生加入的社团 ID 
            Student stu = new Student();
            stu.setStudentCommunityId(communityPeople.getCommunityId());
            stu.setStudentId(communityPeople.getStudentId());
            studentService.updateStudentCommunity(stu); 
        }else if(communityPeople.getCommunityPeoFlag() == 2){
            //拒绝学生加入这个社团
            updateMessageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+applyJoinStudent.getStudentId()+"'><cite>"+applyJoinStudent.getStudentName()+"</cite></a>申请加入&nbsp;&nbsp;<a href='/student/queryById.action'><cite>"+community.getCommunityId()+"</cite></a>&nbsp;&nbsp;社团<span style='margin-left:450px;'><button  class='layui-btn layui-btn-danger layui-btn-small  layui-btn-disabled'>已拒绝</button></span>";
            messageContext = "<a href='/Student/queryStudentInfoById.action?stuId="+loginStudent.getStudentId()+"'><cite>"+loginStudent.getStudentName()+"</cite></a>&nbsp;&nbsp;拒绝你加入&nbsp;<cite><a href='/Student/getCommunity.action?id="+community.getCommunityId()+">"+community.getCommunityName()+"</a></cite>社团";
        }
        System.out.println("更新的消息内容:"+updateMessageContext);
        System.out.println("消息内容:"+messageContext);
        studentMessage.setMessageContext(messageContext);
        studentMessage.setStudentId(applyJoinStudent.getStudentId());
        updateStudentMessage.setStuMessageId(stuMessageId);
        updateStudentMessage.setMessageContext(updateMessageContext);       
        studentMessageService.insertMessage(studentMessage);
        studentMessageService.updateMessageContext(updateStudentMessage);
    }
  
    
    
}
