package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 说说表
 * @author Admin
 *
 */
public class Talking {
	private int talkingId;//说说的ID
	private String talkingContent;//发表说说的内容
	private int talkingStudentId;//发表的学生的ID
	private Date talkingDateTime;//发表说说的时间
	public int getTalkingId() {
		return talkingId;
	}
	public void setTalkingId(int talkingId) {
		this.talkingId = talkingId;
	}
	public String getTalkingContent() {
		return talkingContent;
	}
	public void setTalkingContent(String talkingContent) {
		this.talkingContent = talkingContent;
	}
	public int getTalkingStudentId() {
		return talkingStudentId;
	}
	public void setTalkingStudentId(int talkingStudentId) {
		this.talkingStudentId = talkingStudentId;
	}
	public Date getTalkingDateTime() {
		return talkingDateTime;
	}
	public void setTalkingDateTime(Date talkingDateTime) {
		this.talkingDateTime = talkingDateTime;
	}
	
}
