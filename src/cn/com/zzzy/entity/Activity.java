package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 活动表
 * @author Admin
 */
public class Activity {
    private Integer activityId;// 活动Id
    private String activityName;// 活动名称
    private Date activityBeginTime;// 活动开始时间
    private Date activityEndTime;// 活动结束时间
    private Date activityAppliTime;// 活动申请时间
    private String activityAppliReason;// 申请活动原因
    private ActivityType activityType;// 活动--》活动类型 一对一关系
    private Student student;// 一个活动由一个学生申请 一个学生可以申请多个活动 学生--》活动 一对多
    private ActivityRecord activityRecord;// 活动记录 活动--》活动记录 一对一
    private ActivityLaunch activityLaunch;
    private Integer activityFlag;// 活动状态(0:正在申请中的状态 1:已经审批的活动并且同意了2:已经审批未同意的活动)

    public Activity() {
        // TODO Auto-generated constructor stub
    }

    public Activity(String activityName) {
        super();
        this.activityName = activityName;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
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

    public ActivityType getActivityType() {
        return activityType;
    }

    public void setActivityType(ActivityType activityType) {
        this.activityType = activityType;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getActivityFlag() {
        return activityFlag;
    }

    public void setActivityFlag(Integer activityFlag) {
        this.activityFlag = activityFlag;
    }

    public Date getActivityBeginTime() {
        return activityBeginTime;
    }

    public void setActivityBeginTime(Date activityBeginTime) {
        this.activityBeginTime = activityBeginTime;
    }

    public ActivityLaunch getActivityLaunch() {
        return activityLaunch;
    }

    public void setActivityLaunch(ActivityLaunch activityLaunch) {
        this.activityLaunch = activityLaunch;
    }

    public ActivityRecord getActivityRecord() {
        return activityRecord;
    }

    public void setActivityRecord(ActivityRecord activityRecord) {
        this.activityRecord = activityRecord;
    }

}
