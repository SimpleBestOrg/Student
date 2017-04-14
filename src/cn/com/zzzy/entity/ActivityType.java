package cn.com.zzzy.entity;


/**
 * 活动类型表
 * @author Admin
 *
 */
public class ActivityType {
	 private Integer activityTypeId;//活动ID
	 private Integer communityId;//社团ID
	 private Community community;
	 private String activityTypeName;//活动的名称
    public Integer getActivityTypeId() {
        return activityTypeId;
    }
    public void setActivityTypeId(Integer activityTypeId) {
        this.activityTypeId = activityTypeId;
    }
    public Integer getCommunityId() {
        return communityId;
    }
    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }
    public String getActivityTypeName() {
        return activityTypeName;
    }
    public void setActivityTypeName(String activityTypeName) {
        this.activityTypeName = activityTypeName;
    }
    public Community getCommunity() {
        return community;
    }
    public void setCommunity(Community community) {
        this.community = community;
    }
	 
	 
	 
	 
    }
