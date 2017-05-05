package cn.com.zzzy.controller.activity;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityQueryVo;
import cn.com.zzzy.entity.AuthorityAccount;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.entity.StudentMessage;
import cn.com.zzzy.service.activity.ActivityPhotoService;
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
    private ActivityPhotoService activityPhotoService;

    @Autowired
    private StudentFriendService studentFriendService;

    @Autowired
    private StudentMessageService studentMessageService;
    /**
     * 根据条件分页查询所有的活动
     * @param param   分页查询
     * @param activity  活动类型的条件
     * @return        返回list集合
     */
    @RequestMapping("queryActivityByCondition")
    @ResponseBody
    public List<Activity> queryActivityByCondition(PageParam param, ActivityQueryVo activityQueryVo) {
        List<Activity> list = activityService.queryActivityByCondition(param, activityQueryVo);
        System.out.println("長度:" + list);
        return list;
    }

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
    public List<Activity> queryAllFriendActivity(PageParam param, HttpServletRequest request) {
        // 得到登录学生的ID
        AuthorityAccount account = (AuthorityAccount)request.getSession().getAttribute("Account");
        
        Integer  stuId  = account.getAccountId();
        // 根据学生ID查找所有朋友的信息
        List<Student> studentFriend = studentFriendService.queryFriendInfo(null, stuId);
        List<Activity> friendActivityList = null;
        if (studentFriend.size() != 0) {
            List<Integer> friendIds = new ArrayList<Integer>();
            for (int i = 0; i < studentFriend.size(); i++) {
                //将朋友的Id添加到朋友ID的集合中
//                friendIds.add(studentFriend.get(i).getFriend());
                  System.out.println();
            }
            friendActivityList = activityService.queryAllFriendActivity(param, friendIds);
        }
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
    public List<Activity> queryMyJoinActivity(PageParam param,HttpServletRequest request) {
        AuthorityAccount account = (AuthorityAccount)request.getSession().getAttribute("Account");
        Integer  stuId  = account.getAccountId();
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
    public String insertApplyActivity(ActivityQueryVo activityQueryVo) {
        System.out.println(activityQueryVo.getActivityInfo().getActivityName());
        System.out.println(activityQueryVo.getActivityInfo().getActivityBeginTime());
        System.out.println(activityQueryVo.getActivityInfo().getActivityEndTime());
        System.out.println(activityQueryVo.getActivityInfo().getActivityAppliReason());
        System.out.println(activityQueryVo.getActivityInfo().getActivityTypeId());
        System.out.println(activityQueryVo.getActivityInfo().getStudentId());
        String msg = "申请失败";
        try {
            activityService.insertActivity(activityQueryVo);
            msg = "申请成功";
        } catch (Exception e) {
            e.printStackTrace();
        }
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
             messageContext += "同意创建<a href='/Student/queryActivityDetail.action?activityId="+activity.getActivityId()+"'>"+activity.getActivityName()+"</a>活动 回馈信息:"+reviewActivityReason;
         }else if(activity.getActivityFlag()==2){
             messageContext += "拒绝创建<a href='/Student/queryActivityDetail.action?activityId="+activity.getActivityId()+"'>"+activity.getActivityName()+"</a>活动 回馈信息:"+reviewActivityReason;
         }
         StudentMessage  studentMessage = new StudentMessage();
         studentMessage.setStudentId(activity.getActivityApplyStuId());
         studentMessage.setMessageContext(messageContext);
         studentMessageService.insertMessage(studentMessage);
    }

}
