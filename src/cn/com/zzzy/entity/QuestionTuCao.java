package cn.com.zzzy.entity;

/**
 * 问题吐槽表（踩，赞）
 * @author Admin
 *
 */
public class QuestionTuCao {
    private Integer querstionTuCaoId;
    private Integer questionId;// 问题的ID
    private Student questionTucaoStudentId;//踩过或赞过的学生ID  在踩或者赞的时候  读取 此表查询 这个学生是否赞过 或者踩过此问题   如果踩过或者赞过 则不孕赞 
    public Integer getQuerstionTuCaoId() {
        return querstionTuCaoId;
    }

    public void setQuerstionTuCaoId(Integer querstionTuCaoId) {
        this.querstionTuCaoId = querstionTuCaoId;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

	public Student getQuestionTucaoStudentId() {
		return questionTucaoStudentId;
	}

	public void setQuestionTucaoStudentId(Student questionTucaoStudentId) {
		this.questionTucaoStudentId = questionTucaoStudentId;
	}

    /*public Integer getQuestionTucaoStudentId() {
        return questionTucaoStudentId;
    }

    public void setQuestionTucaoStudentId(Integer questionTucaoStudentId) {
        this.questionTucaoStudentId = questionTucaoStudentId;
    }*/
    
}
