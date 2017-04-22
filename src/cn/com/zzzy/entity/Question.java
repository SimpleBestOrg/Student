package cn.com.zzzy.entity;

import java.util.Date;
import java.util.Set;

/**
 * 问题表
 * @author Admin
 *
 */
public class Question {
    private Integer quesetionId;// 问题表的ID
    private String quesetionContent;// 问题内容
    private String quesetionTitle;// 题目的标题
    private QuestionType quesetionTypeId;// 问题类型的ID
    private Student quesetionStudentId;// 提问问题的学生ID
    private Date quesetionDateTime;// 提问问题的时间；
    private Integer questionStep;  //当你踩或者赞的时候 先通过刚才的表 判断  这个是否 踩过或者赞过这个问题 如果踩过和赞过这个问题  则不赞或者踩  如果未赞或者未踩 则只用踩得数量加一或者赞的数量加一  然后 在questionToCao表里面 录入学生ID和对应的问题ID
    private Integer questionPraise; //赞
    private Set<QuestionAnswer>  questionAnswer;	//一个问题对应多个答案
    
    public Integer getQuestionStep() {
		return questionStep;
	}

	public void setQuestionStep(Integer questionStep) {
		this.questionStep = questionStep;
	}

	public Integer getQuestionPraise() {
		return questionPraise;
	}

	public void setQuestionPraise(Integer questionPraise) {
		this.questionPraise = questionPraise;
	}

	public Integer getQuesetionId() {
        return quesetionId;
    }

    public void setQuesetionId(Integer quesetionId) {
        this.quesetionId = quesetionId;
    }

    public String getQuesetionContent() {
        return quesetionContent;
    }

    public void setQuesetionContent(String quesetionContent) {
        this.quesetionContent = quesetionContent;
    }

    public String getQuesetionTitle() {
        return quesetionTitle;
    }

    public void setQuesetionTitle(String quesetionTitle) {
        this.quesetionTitle = quesetionTitle;
    }
    
	public QuestionType getQuesetionTypeId() {
		return quesetionTypeId;
	}

	public void setQuesetionTypeId(QuestionType quesetionTypeId) {
		this.quesetionTypeId = quesetionTypeId;
	}

	public Student getQuesetionStudentId() {
		return quesetionStudentId;
	}

	public void setQuesetionStudentId(Student quesetionStudentId) {
		this.quesetionStudentId = quesetionStudentId;
	}

	public Date getQuesetionDateTime() {
		return quesetionDateTime;
	}

	public void setQuesetionDateTime(Date quesetionDateTime) {
		this.quesetionDateTime = quesetionDateTime;
	}

	public Set<QuestionAnswer> getQuestionAnswer() {
		return questionAnswer;
	}

	public void setQuestionAnswer(Set<QuestionAnswer> questionAnswer) {
		this.questionAnswer = questionAnswer;
	}
	
}
