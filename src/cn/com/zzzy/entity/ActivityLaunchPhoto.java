package cn.com.zzzy.entity;

/**
 * 活动发起图片表
 * @author Admin
 *
 */
public class ActivityLaunchPhoto {
    private Integer activityLaunchPhotoId;
    private Integer activityLaunchId;
    private String activityLaunchPhotos;

    public Integer getActivityLaunchPhotoId() {
        return activityLaunchPhotoId;
    }

    public void setActivityLaunchPhotoId(Integer activityLaunchPhotoId) {
        this.activityLaunchPhotoId = activityLaunchPhotoId;
    }

    public Integer getActivityLaunchId() {
        return activityLaunchId;
    }

    public void setActivityLaunchId(Integer activityLaunchId) {
        this.activityLaunchId = activityLaunchId;
    }

    public String getActivityLaunchPhotos() {
        return activityLaunchPhotos;
    }

    public void setActivityLaunchPhotos(String activityLaunchPhotos) {
        this.activityLaunchPhotos = activityLaunchPhotos;
    }

}
