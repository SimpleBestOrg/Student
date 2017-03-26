package cn.com.zzzy.entity;

/**
 * 活动记录表
 * @author Admin
 *
 */
public class ActivityRecord {
	private int activityRecordId;// 活动记录ID
	private int activityId;// 活动ID
	private int activityRecordContent;// 活动记录内容

	public int getActivityRecordId() {
		return activityRecordId;
	}

	public void setActivityRecordId(int activityRecordId) {
		this.activityRecordId = activityRecordId;
	}

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	public int getActivityRecordContent() {
		return activityRecordContent;
	}

	public void setActivityRecordContent(int activityRecordContent) {
		this.activityRecordContent = activityRecordContent;
	}

}
