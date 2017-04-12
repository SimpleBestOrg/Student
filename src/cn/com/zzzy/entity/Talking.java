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
    private Student stuId;  //学生
    private Integer talkingStudentId;// 发表的学生的ID
    private Date talkingDateTime;// 发表说说的时间
    private TalkingAuthority talkingAuthority;
    private Integer talkingAuthorityId;// 说说权限ID
    private Integer talkingThumCount;  
    
    
    public Integer getTalkingThumCount() {
        return talkingThumCount;
    }

    public void setTalkingThumCount(Integer talkingThumCount) {
        this.talkingThumCount = talkingThumCount;
    }

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

    public Student getStuId() {
        return stuId;
    }

    public void setStuId(Student stuId) {
        this.stuId = stuId;
    }

    public TalkingAuthority getTalkingAuthority() {
        return talkingAuthority;
    }

    public void setTalkingAuthority(TalkingAuthority talkingAuthority) {
        this.talkingAuthority = talkingAuthority;
    }

}
