package cn.com.zzzy.entity;


/**
 * 活动类型表
 * @author Admin
 *
 */
public class ActivityType {
	 private int activityId;//活动ID
	 private String activityName;//活动的名称
	public int getActivityId() {
		return activityId;
	}
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	 
}
