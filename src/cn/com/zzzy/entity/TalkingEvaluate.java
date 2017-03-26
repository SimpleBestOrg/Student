package cn.com.zzzy.entity;

import java.util.Date;
/**
 * 说说评论表
 * @author Admin
 *
 */
public class TalkingEvaluate {
	private int talkingEvaluateId;//说说评论的ID
	private int talkingId;//发表的说说ID
	private String talkingEvaluateContext;//说说评论的内容
	private int talkingEvaluateParentId;//评论的父ID
	private int talkingEvaluateStudentID;//评论的学生ID、
	private Date talkingEvaluateDateTime;//评论的时间
	public int getTalkingEvaluateId() {
		return talkingEvaluateId;
	}
	public void setTalkingEvaluateId(int talkingEvaluateId) {
		this.talkingEvaluateId = talkingEvaluateId;
	}
	public int getTalkingId() {
		return talkingId;
	}
	public void setTalkingId(int talkingId) {
		this.talkingId = talkingId;
	}
	public String getTalkingEvaluateContext() {
		return talkingEvaluateContext;
	}
	public void setTalkingEvaluateContext(String talkingEvaluateContext) {
		this.talkingEvaluateContext = talkingEvaluateContext;
	}
	public int getTalkingEvaluateParentId() {
		return talkingEvaluateParentId;
	}
	public void setTalkingEvaluateParentId(int talkingEvaluateParentId) {
		this.talkingEvaluateParentId = talkingEvaluateParentId;
	}
	public int getTalkingEvaluateStudentID() {
		return talkingEvaluateStudentID;
	}
	public void setTalkingEvaluateStudentID(int talkingEvaluateStudentID) {
		this.talkingEvaluateStudentID = talkingEvaluateStudentID;
	}
	public Date getTalkingEvaluateDateTime() {
		return talkingEvaluateDateTime;
	}
	public void setTalkingEvaluateDateTime(Date talkingEvaluateDateTime) {
		this.talkingEvaluateDateTime = talkingEvaluateDateTime;
	}
	
}
