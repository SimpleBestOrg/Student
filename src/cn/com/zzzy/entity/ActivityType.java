package cn.com.zzzy.entity;


/**
 * 活动类型表
 * @author Admin
 *
 */
public class ActivityType {
	 private Integer activityTypeId;//活动ID
	 private String activityTypeName;//活动的名称
	
	 
	public Integer getActivityTypeId() {
        return activityTypeId;
    }
    public void setActivityTypeId(Integer activityTypeId) {
        this.activityTypeId = activityTypeId;
    }
    public String getActivityName() {
		return activityTypeName;
	}
	public void setActivityName(String activityTypeName) {
		this.activityTypeName = activityTypeName;
	}
	 
}
