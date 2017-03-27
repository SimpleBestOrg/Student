package cn.com.zzzy.entity;

/**
 * 学生朋友中间表
 * @author Admin
 *
 */
public class StudentFriend {
    private int studentId;// 学生ID
    private int friend;// 朋友ID

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getFriend() {
        return friend;
    }

    public void setFriend(int friend) {
        this.friend = friend;
    }

}
