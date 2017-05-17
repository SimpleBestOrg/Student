package cn.com.zzzy.entity;

import java.util.Set;

/**
 * 活动发起表
 * @author Admin
 *
 */
public class ActivityLaunch {
    private Integer activityLaunchId;// 活动发起ID
    private String activityLaunchDesc;// 对发起的活动进行描述
    private Integer activityPersonNum;// 活动人数限制
    private Set<ActivityLaunchPhoto> activityLaunchPhoto;

    public Integer getActivityLaunchId() {
        return activityLaunchId;
    }

    public void setActivityLaunchId(Integer activityLaunchId) {
        this.activityLaunchId = activityLaunchId;
    }

    public String getActivityLaunchDesc() {
        return activityLaunchDesc;
    }

    public void setActivityLaunchDesc(String activityLaunchDesc) {
        this.activityLaunchDesc = activityLaunchDesc;
    }

    public Integer getActivityPersonNum() {
        return activityPersonNum;
    }

    public void setActivityPersonNum(Integer activityPersonNum) {
        this.activityPersonNum = activityPersonNum;
    }


    public Set<ActivityLaunchPhoto> getActivityLaunchPhoto() {
        return activityLaunchPhoto;
    }

    public void setActivityLaunchPhoto(Set<ActivityLaunchPhoto> activityLaunchPhoto) {
        this.activityLaunchPhoto = activityLaunchPhoto;
    }

    
}
