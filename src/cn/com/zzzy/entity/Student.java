package cn.com.zzzy.entity;

import java.util.Date;
import java.util.Set;

/**
 * 学生表
 * @author Admin
 *
 */
public class Student {
    private Integer studentId;// 学生ID
    private String studentName;// 学生的姓名
    private Integer studentSex;// 学生的性别
    private Date studentBirthday;// 学生的生日
    private String studentAddress;// 学生的地址
    private Integer studentBirthPlace;// 籍贯 精确到县
    private Integer studentClassId;// 学生的班级
    private Integer studentCommunityId;// 学生参加的社团
    private String studentPhoto;// 学生的个人照片
    private String studentSignature;//学生个性签名
    private StudentClasses studentClasses;
    private Set<Student> studentFriend;
    

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Date getStudentBirthday() {
        return studentBirthday;
    }

    public void setStudentBirthday(Date studentBirthday) {
        this.studentBirthday = studentBirthday;
    }

    public String getStudentAddress() {
        return studentAddress;
    }

    public void setStudentAddress(String studentAddress) {
        this.studentAddress = studentAddress;
    }

    public Integer getStudentBirthPlace() {
        return studentBirthPlace;
    }

    public void setStudentBirthPlace(Integer studentBirthPlace) {
        this.studentBirthPlace = studentBirthPlace;
    }

    public Integer getStudentClassId() {
        return studentClassId;
    }

    public void setStudentClassId(Integer studentClassId) {
        this.studentClassId = studentClassId;
    }

    public Integer getStudentCommunityId() {
        return studentCommunityId;
    }

    public void setStudentCommunityId(Integer studentCommunityId) {
        this.studentCommunityId = studentCommunityId;
    }

    public String getStudentPhoto() {
        return studentPhoto;
    }

    public void setStudentPhoto(String studentPhoto) {
        this.studentPhoto = studentPhoto;
    }

    public StudentClasses getStudentClasses() {
        return studentClasses;
    }

    public void setStudentClasses(StudentClasses studentClasses) {
        this.studentClasses = studentClasses;
    }

    public Set<Student> getStudentFriend() {
        return studentFriend;
    }

    public void setStudentFriend(Set<Student> studentFriend) {
        this.studentFriend = studentFriend;
    }

    public Integer getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(Integer studentSex) {
        this.studentSex = studentSex;
    }

    public String getStudentSignature() {
        return studentSignature;
    }

    public void setStudentSignature(String studentSignature) {
        this.studentSignature = studentSignature;
    }
    
}
