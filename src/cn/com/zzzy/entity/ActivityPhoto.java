package cn.com.zzzy.entity;

/**
 * 活动照片表
 * 
 * @author Admin
 *
 */
public class ActivityPhoto {
    private Integer activityPhotoId;// 照片ID
    private ActivityRecord activityRecord;// 活动记录ID  活动照片--》活动记录   多对一
    private String activityPhoto;// 活动照片

    public Integer getActivityPhotoId() {
        return activityPhotoId;
    }

    public void setActivityPhotoId(Integer activityPhotoId) {
        this.activityPhotoId = activityPhotoId;
    }

    public ActivityRecord getActivityRecord() {
        return activityRecord;
    }

    public void setActivityRecord(ActivityRecord activityRecord) {
        this.activityRecord = activityRecord;
    }

    public String getActivityPhoto() {
        return activityPhoto;
    }

    public void setActivityPhoto(String activityPhoto) {
        this.activityPhoto = activityPhoto;
    }

}
