package cn.com.zzzy.entity;

/**
 * 学生登录表
 * @author Admin
 *
 */
public class StudentLogin {
    private String studentLoginNo;// 学生登录ID
    private String studentLoginPwd;// 学生登录密码
    private Integer studentId;// 学生ID

    public String getStudentLoginNo() {
        return studentLoginNo;
    }

    public void setStudentLoginNo(String studentLoginNo) {
        this.studentLoginNo = studentLoginNo;
    }

    public String getStudentLoginPwd() {
        return studentLoginPwd;
    }

    public void setStudentLoginPwd(String studentLoginPwd) {
        this.studentLoginPwd = studentLoginPwd;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

}
