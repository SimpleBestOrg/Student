package cn.com.zzzy.entity;

import java.util.Set;

/**
 * 活动记录表
 * @author Admin
 *
 */
public class ActivityRecord {
    private Integer activityRecordId;// 活动记录ID
    private String  activityRecordContent;// 活动记录内容
    private Set<ActivityPhoto> activityPhotos;//一个活动多个照片
    

    public Integer getActivityRecordId() {
        return activityRecordId;
    }

    public void setActivityRecordId(Integer activityRecordId) {
        this.activityRecordId = activityRecordId;
    }

    public String getActivityRecordContent() {
        return activityRecordContent;
    }

    public void setActivityRecordContent(String activityRecordContent) {
        this.activityRecordContent = activityRecordContent;
    }

    public Set<ActivityPhoto> getActivityPhotos() {
        return activityPhotos;
    }

    public void setActivityPhotos(Set<ActivityPhoto> activityPhotos) {
        this.activityPhotos = activityPhotos;
    }

    
    
}
