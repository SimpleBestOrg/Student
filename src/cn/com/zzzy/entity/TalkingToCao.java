package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 说说评论表
 * @author Admin
 *
 */
public class TalkingToCao {
    private Integer talkingToCaoId;// 说说评论的ID
    private Integer talkingId;// 说说ID
    private Talking talking;//说说
    private String talkingToCaoContext;// 说说评论的内容
    private TalkingToCao talkingToCao;//评论的父评论
    private Integer talkingToCaoParentId;// 评论的父ID
    private Student student;  //学生表
    private Integer talkingToCaoStudentID;// 评论的学生ID、
    private Date talkingToCaoDateTime;// 评论的时间
    
    
    
    public Talking getTalking() {
        return talking;
    }

    public void setTalking(Talking talking) {
        this.talking = talking;
    }

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

    public TalkingToCao getTalkinToCao() {
        return talkingToCao;
    }

    public void setTalkinToCao(TalkingToCao talkingToCao) {
        this.talkingToCao = talkingToCao;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
    
    
        
}
