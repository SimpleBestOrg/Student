package cn.com.zzzy.controller.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Community;
import cn.com.zzzy.entity.CommunityPeople;
import cn.com.zzzy.entity.CommunityPeopleVo;
import cn.com.zzzy.entity.CommunityVo;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.community.CommunityService;
import cn.com.zzzy.service.student.StudentMessageService;
import cn.com.zzzy.util.PageData;
import cn.com.zzzy.util.PageParam;

@Controller
public class CommunityController {
    //依赖注入，调用Service层
    @Autowired
    private CommunityService communityService;
    
    @Autowired
    private StudentMessageService  studentMessageService; 
    /**
     * 查询已经审核通过的所有社团，根据实体类的数据和flag（状态）的来查询，
     * @param communityVo
     * @param id
     * @return
     */
    @RequestMapping("getAllCommunity")
    public ModelAndView getAllCommunity(CommunityVo communityVo,Integer id){
        //实例化ModelAndView
        //把查询的得到的数据和返回的页面，封装到ModelAndView对象里面
        ModelAndView mv = new ModelAndView();
        //得到查询出来的数据
        List<Community> listCommunity = communityService.select(communityVo);
        //把查询出来的数据封装到listCommunity里面
        mv.addObject("listCommunity",listCommunity);
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
    public ModelAndView getCommunity(Integer id){
      //实例化ModelAndView
        ModelAndView mv = new ModelAndView();
      //把查询出来的数据封装到listCommunity里面
        mv.addObject("listCommunity",communityService.selectById(id));
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
    public String InsertCommunity(Model model,CommunityVo communityVo){
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
    public ModelAndView  queryById(Integer id){
        //实例化ModelAndView
       ModelAndView mv = new ModelAndView();
       //把得到的数据封装到queryById中，
       mv.addObject("queryById",communityService.queryById(id));
       //返回前台的路径
       mv.setViewName("/front/community/Mycommunity.jsp");
     //返回实例化的ModelAndView
       return mv;
    }
    @RequestMapping("InsertAppli")
    public String InsertAppli(Integer id,CommunityPeopleVo community){
        community.setStudentId(5);
        community.setCommunityId(id);
        System.out.println("社团id：："+community.getCommunityId());
        //得到插入的数据
        communityService.insertAppli(community);
        //重定向，返回到查询所有社团的页面
        return "redirect:getCommunity.action?id="+id;
    }
    
    @RequestMapping("queryCommunityForPage")
    @ResponseBody
    public PageData queryCommunityForPage(PageParam param){
         return communityService.queryCommunityForPage(param);
    }
    
    @RequestMapping("updateCommunityFlag")
    public void updateCommunityFlag(Community community,String reviewCommunityReason){
        System.out.println("社团状态:"+community.getCommunityFlag());
        System.out.println("社团ID:"+community.getCommunityId());
        System.out.println("社团申请人:"+community.getCommunityApplyStuId());
        System.out.println("回馈信息:"+reviewCommunityReason);
        System.out.println("社团名称:"+community.getCommunityName());
        String messageContext = "";
        if(community.getCommunityFlag()==1){
            System.out.println("同意创建社团");
            messageContext = "同意您创建&nbsp;&nbsp;<a href='/Student/getCommunity.action?id="+community.getCommunityId()+"'>"+community.getCommunityName()+"</a>&nbsp;&nbsp;社团 &nbsp;&nbsp;&nbsp;&nbsp;回馈信息:"+reviewCommunityReason;
        }else if(community.getCommunityFlag()==2){
            messageContext = "拒绝您创建&nbsp;&nbsp;<a href='/Student/getCommunity.action?id="+community.getCommunityId()+"'>"+community.getCommunityName()+"</a>&nbsp;&nbsp;社团 &nbsp;&nbsp;&nbsp;&nbsp;回馈信息:"+reviewCommunityReason;
        }
        System.out.println(messageContext);
        StudentMessage studentMessage = new StudentMessage();
        studentMessage.setMessageContext(messageContext); 
        studentMessage.setStudentId(community.getCommunityApplyStuId());
        //更新活动状态
        communityService.updateCommunityFlag(community);
        //插入消息表 通知学生 该学生申请的活动是否通过审核或者被拒绝
        studentMessageService.insertMessage(studentMessage);
    }
}
