package cn.com.zzzy.entity;

import java.util.Date;
import java.util.Set;

/**
 * 活动记录表
 * @author Admin
 *
 */
public class ActivityRecord {
    private Integer activityRecordId;// 活动记录ID
    private String  activityRecordContent;// 活动记录内容
    private Integer activityId;
    private Set<ActivityRecordPhoto> activityRecordPhotos;//一个活动多个照片
    private Date    activityRecordTime;

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


    public Set<ActivityRecordPhoto> getActivityRecordPhotos() {
        return activityRecordPhotos;
    }

    public void setActivityRecordPhotos(Set<ActivityRecordPhoto> activityRecordPhotos) {
        this.activityRecordPhotos = activityRecordPhotos;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Date getActivityRecordTime() {
        return activityRecordTime;
    }

    public void setActivityRecordTime(Date activityRecordTime) {
        this.activityRecordTime = activityRecordTime;
    }

    
    
    
}
