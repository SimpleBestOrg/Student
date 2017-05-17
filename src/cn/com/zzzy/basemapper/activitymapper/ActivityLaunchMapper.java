package cn.com.zzzy.basemapper.activitymapper;
import cn.com.zzzy.entity.ActivityLaunch;
/**
 * 发起活动mapper  
 * @author Admin
 *
 */
public interface ActivityLaunchMapper{
		    
    /**
     * 发起活动
     * @param activityLaunch
     */
     void  insertlaunchActivity(ActivityLaunch activityLaunch);
     
}
