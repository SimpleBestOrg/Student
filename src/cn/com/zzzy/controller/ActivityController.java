package cn.com.zzzy.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityInfo;
import cn.com.zzzy.entity.ActivityPhoto;
import cn.com.zzzy.entity.ActivityQueryVo;
import cn.com.zzzy.service.ActivityPhotoService;
import cn.com.zzzy.service.ActivityService;
import cn.com.zzzy.util.PageParam;

@Controller
public class ActivityController {
 
    @Autowired
    private  ActivityService activityService;
    
    @Autowired
    private  ActivityPhotoService  activityPhotoService;
    
    /**
     * 根据条件分页查询所有的活动
     * @param param   分页查询
     * @param activity  活动类型的条件
     * @return        返回list集合
     */
    @RequestMapping("queryActivityByCondition")
    @ResponseBody
    public List<Activity>  queryActivityByCondition(PageParam param,ActivityQueryVo activityQueryVo){
        System.out.println("ID:"+activityQueryVo.getActivityInfo().getStudentId());
        List<Activity> list =  activityService.queryActivityByCondition(param, activityQueryVo);
        return list;
    }
    
    /**
     * 查询朋友所有的活动
     * @param param
     * @return
     */
    @RequestMapping("queryAllFriendActivity")
    @ResponseBody
    public List<Activity>  queryAllFriendActivity(PageParam param){
               List<Integer> friendId = new ArrayList<Integer>();
                friendId.add(2);
                friendId.add(3);
               List<Activity>    friendActivityList = activityService.queryAllFriendActivity(param, friendId);
               int  activityCount  = activityService.queryActivityCountByFriendIds(friendId);
               System.out.println("查询行数"+activityCount);
               System.out.println(friendActivityList.size());
               return friendActivityList;
    }
    
    
    /**
     * 根据活动ID查询活动的详细内容(活动记录的照片)
     * @param activityId   活动ID
     * @return
     */
    @RequestMapping("activityDetail")
    public ModelAndView queryActivityDetail(Integer activityId){
        ModelAndView modelAndView =  new ModelAndView();
        activityId = 1;
        Activity activity =  activityService.queryActivityDetail(activityId);
        System.out.println("活动名称:"+activity.getActivityName());
        System.out.println("活动记录ID"+activity.getActivityRecord().getActivityRecordContent());
        /**
         * 活动结束之后 判断该活动是否被记录  如果记录了  则查询出来记录的照片
         */
        if(activity.getActivityRecord().getActivityRecordId()!=null){
            List<ActivityPhoto> activityPhotoList  = activityPhotoService.queryActivityPhotoList(activity.getActivityRecord().getActivityRecordId());
            for(int i=0;i<activityPhotoList.size();i++){
                System.out.println(activityPhotoList.get(i).getActivityPhoto());
            }
            modelAndView.addObject("activityPhotoList", activityPhotoList);
        }
        modelAndView.addObject("activity", activity);
        modelAndView.setViewName("front/activityDetail.jsp");
        return modelAndView;
    }
    
    /**
     * 根据学生ID查询参加过的活动
     * @param param
     * @param stuId
     * @return
     */
    @RequestMapping("queryMyJoinActivity")
    @ResponseBody
    public List<Activity>   queryMyJoinActivity(PageParam param,int stuId){
        List<Activity> list =  activityService.queryMyJoinActivity(param, stuId);
        System.out.println("我参加的活动的数量"+list.size());
       // System.out.println(list.get(0).getActivityName());
        return list;
    }
    
    
    
    
    /**
     * 插入申请活动方法
     * @param activity
     * @return
     */
     @RequestMapping(value = "/insertApplyActivity", produces = {"text/html;charset=UTF-8;"})
    public String  insertApplyActivity(ActivityQueryVo activityQueryVo){
            String msg = "申请失败";
            try {
                 activityService.insertActivity(activityQueryVo);  
                 msg = "申请成功";
            } catch (Exception e) {
                    e.printStackTrace();
            }
            return   msg;
    }
    
}
