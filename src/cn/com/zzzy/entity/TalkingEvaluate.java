package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 说说评论表
 * @author Admin
 *
 */
public class TalkingEvaluate {
    private Integer talkingToCaoId;// 说说评论的ID
    private Integer talkingId;// 发表的说说ID
    private String talkingToCaoContext;// 说说评论的内容
    private Integer talkingToCaoParentId;// 评论的父ID
    private Integer talkingToCaoStudentID;// 评论的学生ID、
    private Date talkingToCaoDateTime;// 评论的时间

    public Integer getTalkingToCaoId() {
        return talkingToCaoId;
    }

    public void setTalkingToCaoId(Integer talkingToCaoId) {
        this.talkingToCaoId = talkingToCaoId;
    }

    public Integer getTalkingId() {
        return talkingId;
    }

    public void setTalkingId(Integer talkingId) {
        this.talkingId = talkingId;
    }

    public String getTalkingToCaoContext() {
        return talkingToCaoContext;
    }

    public void setTalkingToCaoContext(String talkingToCaoContext) {
        this.talkingToCaoContext = talkingToCaoContext;
    }

    public Integer getTalkingToCaoParentId() {
        return talkingToCaoParentId;
    }

    public void setTalkingToCaoParentId(Integer talkingToCaoParentId) {
        this.talkingToCaoParentId = talkingToCaoParentId;
    }

    public Integer getTalkingToCaoStudentID() {
        return talkingToCaoStudentID;
    }

    public void setTalkingToCaoStudentID(Integer talkingToCaoStudentID) {
        this.talkingToCaoStudentID = talkingToCaoStudentID;
    }

    public Date getTalkingToCaoDateTime() {
        return talkingToCaoDateTime;
    }

    public void setTalkingToCaoDateTime(Date talkingToCaoDateTime) {
        this.talkingToCaoDateTime = talkingToCaoDateTime;
    }

}
