package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 活动表
 * @author Admin
 */
public class Activity {
	private int activityId;// 活动Id
	private String activityName;// 活动名称
	private Date activityBeginTime;// 活动开始名称
	private Date activityEndTime;// 活动结束时间
	private Date activityAppliTime;// 活动申请时间
	private String activityAppliReason;// 申请活动原因
	private int activityTypeId;// 活动类型ID
	private int activityAppliStuId;// 申请活动学生ID
	private int activityFlag;// 活动状态(0:正在申请中的状态 1:已经审批的活动并且同意了2:已经审批未同意的活动)

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

	public Date getActivityBeginTime() {
		return activityBeginTime;
	}

	public void setActivityBeginTime(Date activityBeginTime) {
		this.activityBeginTime = activityBeginTime;
	}

	public Date getActivityEndTime() {
		return activityEndTime;
	}

	public void setActivityEndTime(Date activityEndTime) {
		this.activityEndTime = activityEndTime;
	}

	public Date getActivityAppliTime() {
		return activityAppliTime;
	}

	public void setActivityAppliTime(Date activityAppliTime) {
		this.activityAppliTime = activityAppliTime;
	}

	public String getActivityAppliReason() {
		return activityAppliReason;
	}

	public void setActivityAppliReason(String activityAppliReason) {
		this.activityAppliReason = activityAppliReason;
	}

	public int getActivityTypeId() {
		return activityTypeId;
	}

	public void setActivityTypeId(int activityTypeId) {
		this.activityTypeId = activityTypeId;
	}

	public int getActivityAppliStuId() {
		return activityAppliStuId;
	}

	public void setActivityAppliStuId(int activityAppliStuId) {
		this.activityAppliStuId = activityAppliStuId;
	}

	public int getActivityFlag() {
		return activityFlag;
	}

	public void setActivityFlag(int activityFlag) {
		this.activityFlag = activityFlag;
	}

}
