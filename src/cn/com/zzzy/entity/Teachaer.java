package cn.com.zzzy.entity;

/**
 * 老师表
 * @author Admin
 *
 */
public class Teachaer {
    private Integer teacherId;// 老师ID（也是老师老师的登录ID）
    private String teacherName;// 老师的名称
    private String teacherPwd;// 老师登录的密码

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherPwd() {
        return teacherPwd;
    }

    public void setTeacherPwd(String teacherPwd) {
        this.teacherPwd = teacherPwd;
    }

}
