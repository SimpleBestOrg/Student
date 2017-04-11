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
    private Student stuId;
    private Date talkingDateTime;// 发表说说的时间
    private TalkingAuthority talkingAuthority;
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


    public Date getTalkingDateTime() {
        return talkingDateTime;
    }

    public void setTalkingDateTime(Date talkingDateTime) {
        this.talkingDateTime = talkingDateTime;
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
