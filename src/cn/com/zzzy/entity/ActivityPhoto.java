package cn.com.zzzy.entity;

/**
 * 活动照片表
 * 
 * @author Admin
 *
 */
public class ActivityPhoto {
	private int activityPhotoId;// 照片ID
	private int activityRecordId;// 活动记录ID
	private String activityPhoto;// 活动照片

	public int getActivityPhotoId() {
		return activityPhotoId;
	}

	public void setActivityPhotoId(int activityPhotoId) {
		this.activityPhotoId = activityPhotoId;
	}

	public int getActivityRecordId() {
		return activityRecordId;
	}

	public void setActivityRecordId(int activityRecordId) {
		this.activityRecordId = activityRecordId;
	}

	public String getActivityPhoto() {
		return activityPhoto;
	}

	public void setActivityPhoto(String activityPhoto) {
		this.activityPhoto = activityPhoto;
	}

}
