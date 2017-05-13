package cn.com.zzzy.service.activity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.activitymapper.ActivityMapper;
import cn.com.zzzy.entity.Activity;
import cn.com.zzzy.entity.ActivityQueryVo;
import cn.com.zzzy.util.PageData;
import cn.com.zzzy.util.PageParam;

@Service
public class ActivityService {
    @Autowired
    private  ActivityMapper activityMapper;
    
    
    /**
     * 根据条件分页查询活动
     * @param param
     * @param activityQueryVo
     * @return
     */
    public List<Activity>  queryActivityByCondition(PageParam param,ActivityQueryVo activityQueryVo){
              List<Activity> listActivity = activityMapper.queryActivityByCondition(param, activityQueryVo);
              System.out.println("长度:"+listActivity.size());
              return  listActivity;
    }
    
    /**
     * 根据条件查询活动数量
     * @param param
     * @param activityQueryVo
     * @return
     */
    public  int  queryActivityCountByCondition(PageParam param,ActivityQueryVo activityQueryVo){
             int count =   activityMapper.queryActivityAcountByCondition(param,activityQueryVo);
             System.out.println("数量:"+count);
              return count;
    }
    
    

    /**
     * 根据朋友ID查询朋友圈的活动
     * @param param
     * @param friendId
     * @return
     */
    public List<Activity>  queryAllFriendActivity(PageParam param,Integer stuId){
            return activityMapper.queryActivityByFriendIds(param, stuId);
    }
    /**
     * 根据朋友ID查询朋友圈活动的数量
     * @param friendId
     * @return
     */
    public int   queryActivityCountByFriendIds(Integer stuId){
        return activityMapper.queryActivityCountByFriendIds(stuId);
    }
    
    /**
     * 根据活动ID查询活动的详细信息
     * @param activityId  活动ID
     * @return      返回查询的活动对象
     */
    public Activity  queryActivityDetail(Integer activityId){
        if(activityId!=null){
            return  activityMapper.queryActivityDetail(activityId);
        }else{
            return null;
        }
        
    }
    
    /**
     * 根据学生ID查询参加过的活动
     * @param param
     * @param stuId
     * @return
     */
    public List<Activity>  queryMyJoinActivity(PageParam param,Integer  stuId){
         return activityMapper.queryMyJoinActivity(param, stuId);
    }
    
    
    /**
     * 添加活动申请
     * @param activityQueryVo
     * @return
     */
    public int  insertActivity(ActivityQueryVo activityQueryVo){
                if(activityQueryVo.getActivityInfo().getActivityAppliReason()!=null && activityQueryVo.getActivityInfo().getActivityBeginTime()!=null && activityQueryVo.getActivityInfo().getActivityEndTime()!=null && activityQueryVo.getActivityInfo().getActivityName()!=null && activityQueryVo.getActivityInfo().getActivityTypeId() != 0){
                      activityMapper.insertActivity(activityQueryVo);
                      return 1;
                 }else{
                      return  2;
                 }
    }
    
    /**
     * 更新活动状态
     * @param activity
     */
    public void updateActivityFlag(Activity activity){
        activityMapper.updateActivityFlag(activity);
    }
    
    
    
}
