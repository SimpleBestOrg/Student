package cn.com.zzzy.entity;

/**
 * 活动表的学生
 * 
 * @author Admin
 *
 */
public class ActivityStudent {
    private Integer activityStudentsId;
    private Integer activityId;// 活动ID
    private Integer studentsId;// 学生ID
    private Integer stuActivityFlag;// 学生申请加入活动的状态
    private Activity  activity;

    
    
    public Integer getActivityStudentsId() {
        return activityStudentsId;
    }

    public void setActivityStudentsId(Integer activityStudentsId) {
        this.activityStudentsId = activityStudentsId;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Integer getStudentId() {
        return studentsId;
    }

    public void setStudentId(Integer studentsId) {
        this.studentsId = studentsId;
    }

    public Integer getStuActivityFlag() {
        return stuActivityFlag;
    }

    public void setStuActivityFlag(Integer stuActivityFlag) {
        this.stuActivityFlag = stuActivityFlag;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    
}
