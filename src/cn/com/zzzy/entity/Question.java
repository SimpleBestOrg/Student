package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 问题表
 * @author Admin
 *
 */
public class Question {
    private int quesetionId;// 问题表的ID
    private String quesetionContent;// 问题内容
    private String quesetionTitle;// 题目的标题
    private int quesetionTypeId;// 问题类型的ID
    private int quesetionStudentId;// 提问问题的学生ID
    private Date quesetionDateTime;// 提问问题的时间；

    public int getQuesetionId() {
        return quesetionId;
    }

    public void setQuesetionId(int quesetionId) {
        this.quesetionId = quesetionId;
    }

    public String getQuesetionContent() {
        return quesetionContent;
    }

    public void setQuesetionContent(String quesetionContent) {
        this.quesetionContent = quesetionContent;
    }

    public String getQuesetionTitle() {
        return quesetionTitle;
    }

    public void setQuesetionTitle(String quesetionTitle) {
        this.quesetionTitle = quesetionTitle;
    }

    public int getQuesetionTypeId() {
        return quesetionTypeId;
    }

    public void setQuesetionTypeId(int quesetionTypeId) {
        this.quesetionTypeId = quesetionTypeId;
    }

    public int getQuesetionStudentId() {
        return quesetionStudentId;
    }

    public void setQuesetionStudentId(int quesetionStudentId) {
        this.quesetionStudentId = quesetionStudentId;
    }

    public Date getQuesetionDateTime() {
        return quesetionDateTime;
    }

    public void setQuesetionDateTime(Date quesetionDateTime) {
        this.quesetionDateTime = quesetionDateTime;
    }

}
