package cn.com.zzzy.entity;

/**
 * 活动照片表
 * 
 * @author Admin
 *
 */
public class ActivityRecordPhoto {
    private Integer activityPhotoId;// 照片ID
    private ActivityRecord activityRecord;// 活动记录ID 活动照片--》活动记录 多对一
    private String activityRecordPhoto;// 活动照片
    private Integer activityRecordId;

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


    public String getActivityRecordPhoto() {
        return activityRecordPhoto;
    }

    public void setActivityRecordPhoto(String activityRecordPhoto) {
        this.activityRecordPhoto = activityRecordPhoto;
    }

    public Integer getActivityRecordId() {
        return activityRecordId;
    }

    public void setActivityRecordId(Integer activityRecordId) {
        this.activityRecordId = activityRecordId;
    }

}
