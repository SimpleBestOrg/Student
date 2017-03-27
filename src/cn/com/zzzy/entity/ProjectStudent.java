package cn.com.zzzy.entity;

/**
 * 项目学生中间表
 * @author Admin
 *
 */
public class ProjectStudent {
    private int prjectId;// 项目的ID
    private int studentId;// 学生的ID

    public int getPrjectId() {
        return prjectId;
    }

    public void setPrjectId(int prjectId) {
        this.prjectId = prjectId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

}
