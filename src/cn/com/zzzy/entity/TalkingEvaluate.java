package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 说说评论表
 * @author Admin
 *
 */
public class TalkingEvaluate {
    private int talkingToCaoId;// 说说评论的ID
    private int talkingId;// 发表的说说ID
    private String talkingToCaoContext;// 说说评论的内容
    private int talkingToCaoParentId;// 评论的父ID
    private int talkingToCaoStudentID;// 评论的学生ID、
    private Date talkingToCaoDateTime;// 评论的时间

    public int getTalkingToCaoId() {
        return talkingToCaoId;
    }

    public void setTalkingToCaoId(int talkingToCaoId) {
        this.talkingToCaoId = talkingToCaoId;
    }

    public int getTalkingId() {
        return talkingId;
    }

    public void setTalkingId(int talkingId) {
        this.talkingId = talkingId;
    }

    public String getTalkingToCaoContext() {
        return talkingToCaoContext;
    }

    public void setTalkingToCaoContext(String talkingToCaoContext) {
        this.talkingToCaoContext = talkingToCaoContext;
    }

    public int getTalkingToCaoParentId() {
        return talkingToCaoParentId;
    }

    public void setTalkingToCaoParentId(int talkingToCaoParentId) {
        this.talkingToCaoParentId = talkingToCaoParentId;
    }

    public int getTalkingToCaoStudentID() {
        return talkingToCaoStudentID;
    }

    public void setTalkingToCaoStudentID(int talkingToCaoStudentID) {
        this.talkingToCaoStudentID = talkingToCaoStudentID;
    }

    public Date getTalkingToCaoDateTime() {
        return talkingToCaoDateTime;
    }

    public void setTalkingToCaoDateTime(Date talkingToCaoDateTime) {
        this.talkingToCaoDateTime = talkingToCaoDateTime;
    }

}
