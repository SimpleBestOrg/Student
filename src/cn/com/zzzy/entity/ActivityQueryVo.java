package cn.com.zzzy.entity;

/**
 * 活动包装对象   
 * @author Admin
 *
 */
public class ActivityQueryVo {
    //活动
    private Activity activity;
    
    
    //为了系统可扩展性  对原生的po进行扩展
    private ActivityInfo  activityInfo;
    
    
    public Activity getActivity() {
        return activity;
    }
    
    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public ActivityInfo getActivityInfo() {
        return activityInfo;
    }

    public void setActivityInfo(ActivityInfo activityInfo) {
        this.activityInfo = activityInfo;
    }
    
    
    
}
