package cn.com.zzzy.entity;

/**
 * 活动表的学生
 * 
 * @author Admin
 *
 */
public class ActivityStudent {
    private Integer activityId;// 活动ID
    private Integer studentId;// 学生ID
    private Integer stu_activityFlag;// 学生申请加入活动的状态

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getStu_activityFlag() {
        return stu_activityFlag;
    }

    public void setStu_activityFlag(Integer stu_activityFlag) {
        this.stu_activityFlag = stu_activityFlag;
    }

}
