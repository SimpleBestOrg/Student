package cn.com.zzzy.entity;

/**
 * 对原声的Activity进行扩展
 * @author Admin
 *
 */
public class ActivityInfo extends Activity {

    private Integer studentId;
    private Integer activityTypeId;
    public Integer getStudentId() {
        return studentId;
    }
    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }
    public Integer getActivityTypeId() {
        return activityTypeId;
    }
    public void setActivityTypeId(Integer activityTypeId) {
        this.activityTypeId = activityTypeId;
    }

    
}
