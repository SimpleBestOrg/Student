package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 问题答案表
 * @author Admin
 *
 */
public class QuestionAnswer {
    private Integer quesetionAnswerId;// 答案ID
    private String quesetionAnswerContent;// 答案内容
    private Question quesetionAnswerQuestionId;// 问题ID
    private Student quesetionAnswerStudentId;// 回答问题的学生ID
    private Date quesetionAnswerDateTime;// 回答答案的时间
    private Integer quesetionAnswerParentId;// 问题答案父ID(是回答问题的两个人聊天)

    public Integer getQuesetionAnswerId() {
        return quesetionAnswerId;
    }

    public void setQuesetionAnswerId(Integer quesetionAnswerId) {
        this.quesetionAnswerId = quesetionAnswerId;
    }

    public String getQuesetionAnswerContent() {
        return quesetionAnswerContent;
    }

    public void setQuesetionAnswerContent(String quesetionAnswerContent) {
        this.quesetionAnswerContent = quesetionAnswerContent;
    }

    public Question getQuesetionAnswerQuestionId() {
		return quesetionAnswerQuestionId;
	}

	public void setQuesetionAnswerQuestionId(Question quesetionAnswerQuestionId) {
		this.quesetionAnswerQuestionId = quesetionAnswerQuestionId;
	}

	public Student getQuesetionAnswerStudentId() {
		return quesetionAnswerStudentId;
	}

	public void setQuesetionAnswerStudentId(Student quesetionAnswerStudentId) {
		this.quesetionAnswerStudentId = quesetionAnswerStudentId;
	}

	public Date getQuesetionAnswerDateTime() {
        return quesetionAnswerDateTime;
    }

    public void setQuesetionAnswerDateTime(Date quesetionAnswerDateTime) {
        this.quesetionAnswerDateTime = quesetionAnswerDateTime;
    }

    public Integer getQuesetionAnswerParentId() {
        return quesetionAnswerParentId;
    }

    public void setQuesetionAnswerParentId(Integer quesetionAnswerParentId) {
        this.quesetionAnswerParentId = quesetionAnswerParentId;
    }

}
