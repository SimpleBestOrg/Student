package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 问题答案表
 */
public class QuestionAnswer {
	private int quesetionAnswerId;//答案ID
	private String quesetionAnswerContent;//答案内容
	private int quesetionAnswerQuestionId;//问题ID
	private int quesetionAnswerStudentId;//回答问题的学生ID
	private Date quesetionAnswerDateTime;//回答答案的时间
	private int quesetionAnswerParentId;//问题答案父ID(是回答问题的两个人聊天)
	public int getQuesetionAnswerId() {
		return quesetionAnswerId;
	}
	public void setQuesetionAnswerId(int quesetionAnswerId) {
		this.quesetionAnswerId = quesetionAnswerId;
	}
	public String getQuesetionAnswerContent() {
		return quesetionAnswerContent;
	}
	public void setQuesetionAnswerContent(String quesetionAnswerContent) {
		this.quesetionAnswerContent = quesetionAnswerContent;
	}
	public int getQuesetionAnswerQuestionId() {
		return quesetionAnswerQuestionId;
	}
	public void setQuesetionAnswerQuestionId(int quesetionAnswerQuestionId) {
		this.quesetionAnswerQuestionId = quesetionAnswerQuestionId;
	}
	public int getQuesetionAnswerStudentId() {
		return quesetionAnswerStudentId;
	}
	public void setQuesetionAnswerStudentId(int quesetionAnswerStudentId) {
		this.quesetionAnswerStudentId = quesetionAnswerStudentId;
	}
	public Date getQuesetionAnswerDateTime() {
		return quesetionAnswerDateTime;
	}
	public void setQuesetionAnswerDateTime(Date quesetionAnswerDateTime) {
		this.quesetionAnswerDateTime = quesetionAnswerDateTime;
	}
	public int getQuesetionAnswerParentId() {
		return quesetionAnswerParentId;
	}
	public void setQuesetionAnswerParentId(int quesetionAnswerParentId) {
		this.quesetionAnswerParentId = quesetionAnswerParentId;
	}
	
}
