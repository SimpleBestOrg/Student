package cn.com.zzzy.entity;

/**
 * 学生朋友中间表
 * @author Admin
 *
 */
public class StudentFriend {
    private Integer studentId;// 学生ID
    private Integer friend;// 朋友ID

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getFriend() {
        return friend;
    }

    public void setFriend(Integer friend) {
        this.friend = friend;
    }

}
