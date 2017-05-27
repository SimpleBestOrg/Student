package cn.com.zzzy.controller.activity;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityInfo;
import cn.com.zzzy.entity.ActivityQueryVo;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.activity.ActivityRecordPhotoService;
import cn.com.zzzy.service.activity.ActivityService;
import cn.com.zzzy.service.student.StudentFriendService;
import cn.com.zzzy.service.student.StudentMessageService;
import cn.com.zzzy.util.PageData;
import cn.com.zzzy.util.PageParam;

@Controller
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ActivityRecordPhotoService activityRecordPhotoService;

    @Autowired
    private StudentFriendService studentFriendService;

    @Autowired
    private StudentMessageService studentMessageService;
    

    /**
     * 查询所有已经发起的活动活动
     * @return
     */
    @RequestMapping("queryAllActivity")
    @ResponseBody
    public List<Activity>  queryAllActivity(PageParam param){
        ActivityQueryVo activityQueryVo = new ActivityQueryVo();
        ActivityInfo activityInfo = new ActivityInfo();   
        activityInfo.setActivityFlag(3);
        activityQueryVo.setActivityInfo(activityInfo);
        return  activityService.queryActivityByCondition(param , activityQueryVo);
    }
    
    
    /**
     * 根据条件分页查询所有的活动
     * @param param   分页查询
     * @param activity  活动类型的条件
     * @return        返回list集合
     */
    @RequestMapping("queryActivityByCondition")
    @ResponseBody
    public List<Activity> queryActivityByCondition(PageParam param,HttpSession session) {
        ActivityQueryVo activityQueryVo = new ActivityQueryVo();
        ActivityInfo activityInfo = new ActivityInfo();
        System.out.println("查询的活动状态:"+param.getFlag());
        activityInfo.setActivityApplyStuId((Integer)session.getAttribute("stuId"));
        activityQueryVo.setActivityInfo(activityInfo);
        List<Activity> list = activityService.queryActivityByCondition(param, activityQueryVo);
        System.out.println("長度:" + list);
        return list;
    }

    /**
     * 根据条件查询活动的
     * @param param
     * @param activityQueryVo
     * @return
     */
    @RequestMapping("queryActivityCountByCondition")
    @ResponseBody
    public int queryActivityCountByCondition(PageParam param,ActivityQueryVo activityQueryVo){
         return  activityService.queryActivityCountByCondition(param,activityQueryVo);
    }
     /**
      * 供分页使用
      * @param param
      * @param activityQueryVo
      * @return
      */
    @RequestMapping("queryActivityForPage")
    @ResponseBody
     public PageData  queryActivityForPage(PageParam param,ActivityQueryVo activityQueryVo){
                    PageData pageData = new PageData(activityService.queryActivityCountByCondition(param,activityQueryVo),activityService.queryActivityByCondition(param, activityQueryVo));
                    return  pageData;
     }
    
    /**
     * 查询朋友所有的活动
     * @param param
     * @return
     */
    @RequestMapping("queryAllFriendActivity")
    @ResponseBody
    public List<Activity> queryAllFriendActivity(PageParam param, HttpSession session) {
        Integer stuId  = (Integer)session.getAttribute("stuId");
        System.out.println("学生号:"+stuId);
        List<Activity> friendActivityList = activityService.queryAllFriendActivity(param, stuId);
        return friendActivityList;
    }

    /**
     * 根据活动ID查询活动的详细内容(活动记录的照片)
     * @param activityId   活动ID
     * @return
     */
    @RequestMapping("queryActivityDetail")
    @ResponseBody
    public Activity queryActivityDetail(Integer activityId) {
        // ModelAndView modelAndView = new ModelAndView();
        // activityId = 2;
        List<Activity> activityList = new ArrayList<Activity>();
        Activity activity = activityService.queryActivityDetail(activityId);
        activityList.add(activity);
        // modelAndView.addObject("activity", activity);
        // modelAndView.setViewName("front/activityDetail.jsp");
        // return modelAndView;
        return activity;
    }

    /**
     * 根据学生ID查询参加过的活动
     * @param param
     * @param stuId
     * @return
     */
    @RequestMapping("queryMyJoinActivity")
    @ResponseBody
    public List<Activity> queryMyJoinActivity(PageParam param,HttpSession session) {
        Integer stuId = (Integer)session.getAttribute("stuId");
        List<Activity> list = activityService.queryMyJoinActivity(param, stuId);
        System.out.println("我参加的活动的数量" + list.size());
        return list;
    }

    /**
     * 插入申请活动方法
     * @param activity
     * @return
     */
    @RequestMapping(value = "/insertApplyActivity")
    public String insertApplyActivity(ActivityQueryVo activityQueryVo,String imgName,HttpSession session) {
        activityService.insertActivity(activityQueryVo);
        return "front/activity/activityindex.jsp";
    }
    
    
    
    /**
     * 更新活动状态(0:正在申请中1已同意发起活动2被拒绝申请活动3活动已发起)
     * @param activity
     */
    @RequestMapping("updateActivityFlag")
    public void updateActivityFlag(Activity activity,String reviewActivityReason){
         activityService.updateActivityFlag(activity);
         String messageContext = "";
         if(activity.getActivityFlag()==1){
             System.out.println("同意");
             messageContext += "同意创建<a href='/Student/front/activity/activitydetail.jsp?activityId="+activity.getActivityId()+"'><cite>"+activity.getActivityName()+"</cite></a>活动 回馈信息:&nbsp;&nbsp;"+reviewActivityReason;
         }else if(activity.getActivityFlag()==2){
             messageContext += "拒绝创建<a href='/Student/front/activity/activitydetail.jsp?activityId="+activity.getActivityId()+"'><cite>"+activity.getActivityName()+"</cite></a>活动 回馈信息:&nbsp;&nbsp;"+reviewActivityReason;
         }
         StudentMessage  studentMessage = new StudentMessage();
         studentMessage.setStudentId(activity.getActivityApplyStuId());
         studentMessage.setMessageContext(messageContext);
         studentMessageService.insertMessage(studentMessage);
    }
    

}
