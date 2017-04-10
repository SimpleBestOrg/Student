package cn.com.zzzy.entity;

/**
 * 项目学生中间表
 * @author Admin
 *
 */
public class ProjectStudent {
    private Integer prjectId;// 项目的ID
    private Integer studentId;// 学生的ID

    public Integer getPrjectId() {
        return prjectId;
    }

    public void setPrjectId(Integer prjectId) {
        this.prjectId = prjectId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

}
