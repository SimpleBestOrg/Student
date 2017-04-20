package cn.com.zzzy.entity;

import java.util.Set;

/**
 * 学生朋友中间表
 * @author Admin
 *
 */
public class StudentFriend {
    private Integer studentFriendId;// 学生朋友的中间表
    private Integer studentId;// 学生ID
    private Integer friend;// 朋友ID
    private Set<Student> students;
    private Integer stuFriendFlag;// 好友状态0:不是好友 1:已经申请加为好友 2:申请之后 未同意的 3:申请之后同意的

    

    public Set<Student> getStudents() {
        return students;
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

    public Integer getStudentFriendId() {
        return studentFriendId;
    }

    public void setStudentFriendId(Integer studentFriendId) {
        this.studentFriendId = studentFriendId;
    }

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

    public Integer getStuFriendFlag() {
        return stuFriendFlag;
    }

    public void setStuFriendFlag(Integer stuFriendFlag) {
        this.stuFriendFlag = stuFriendFlag;
    }

}
