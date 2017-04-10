package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 说说表
 * @author Admin
 *
 */
public class Talking {
    private Integer talkingId;// 说说的ID
    private String talkingContent;// 发表说说的内容
    private Integer talkingStudentId;// 发表的学生的ID
    private Date talkingDateTime;// 发表说说的时间
    private Integer talkingAuthorityId;// 说说权限ID

    public Integer getTalkingId() {
        return talkingId;
    }

    public void setTalkingId(Integer talkingId) {
        this.talkingId = talkingId;
    }

    public String getTalkingContent() {
        return talkingContent;
    }

    public void setTalkingContent(String talkingContent) {
        this.talkingContent = talkingContent;
    }

    public Integer getTalkingStudentId() {
        return talkingStudentId;
    }

    public void setTalkingStudentId(Integer talkingStudentId) {
        this.talkingStudentId = talkingStudentId;
    }

    public Date getTalkingDateTime() {
        return talkingDateTime;
    }

    public void setTalkingDateTime(Date talkingDateTime) {
        this.talkingDateTime = talkingDateTime;
    }

    public Integer getTalkingAuthorityId() {
        return talkingAuthorityId;
    }

    public void setTalkingAuthorityId(Integer talkingAuthorityId) {
        this.talkingAuthorityId = talkingAuthorityId;
    }

}
