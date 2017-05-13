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
    private Integer activityPersonNum;// 互动人数限制
    private String activityRegisterCond;// 活动申请条件
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

    public String getActivityRegisterCond() {
        return activityRegisterCond;
    }

    public void setActivityRegisterCond(String activityRegisterCond) {
        this.activityRegisterCond = activityRegisterCond;
    }

    public Set<ActivityLaunchPhoto> getActivityLaunchPhoto() {
        return activityLaunchPhoto;
    }

    public void setActivityLaunchPhoto(Set<ActivityLaunchPhoto> activityLaunchPhoto) {
        this.activityLaunchPhoto = activityLaunchPhoto;
    }

    
}
