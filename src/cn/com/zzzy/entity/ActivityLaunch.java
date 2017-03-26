package cn.com.zzzy.entity;

/**
 * 活动发起表
 * @author Admin
 *
 */
public class ActivityLaunch {
	private int activityLaunchId;// 活动发起ID
	private String activityId; // 活动ID
	private String activityLaunchDesc;// 对发起的活动进行描述
	private int activityPersonNum;// 互动人数限制
	private String activityRegisterCond;// 活动申请条件

	public int getActivityLaunchId() {
		return activityLaunchId;
	}

	public void setActivityLaunchId(int activityLaunchId) {
		this.activityLaunchId = activityLaunchId;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getActivityLaunchDesc() {
		return activityLaunchDesc;
	}

	public void setActivityLaunchDesc(String activityLaunchDesc) {
		this.activityLaunchDesc = activityLaunchDesc;
	}

	public int getActivityPersonNum() {
		return activityPersonNum;
	}

	public void setActivityPersonNum(int activityPersonNum) {
		this.activityPersonNum = activityPersonNum;
	}

	public String getActivityRegisterCond() {
		return activityRegisterCond;
	}

	public void setActivityRegisterCond(String activityRegisterCond) {
		this.activityRegisterCond = activityRegisterCond;
	}

}
