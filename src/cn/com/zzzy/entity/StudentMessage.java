package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 学生消息表
 * @author Admin
 *
 */
public class StudentMessage {
    private Integer stuMessageId;
    private Integer studentId;
    private Student student;
    private String messageContext;
    private Date messageTime;

    public Integer getStuMessageId() {
        return stuMessageId;
    }

    public void setStuMessageId(Integer stuMessageId) {
        this.stuMessageId = stuMessageId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getMessageContext() {
        return messageContext;
    }

    public void setMessageContext(String messageContext) {
        this.messageContext = messageContext;
    }

    public Date getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Date messageTime) {
        this.messageTime = messageTime;
    }

}
