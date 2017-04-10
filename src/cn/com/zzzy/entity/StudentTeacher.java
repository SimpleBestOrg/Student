package cn.com.zzzy.entity;

/**
 * 学生老师中间表
 * @author Admin
 *
 */
public class StudentTeacher {
    private Integer studentId;// 学生ID
    private Integer teacherId;// 老师ID

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

}
