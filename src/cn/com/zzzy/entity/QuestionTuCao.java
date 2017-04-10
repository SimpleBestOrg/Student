package cn.com.zzzy.entity;

/**
 * 问题吐槽表（踩，赞）
 * @author Admin
 *
 */
public class QuestionTuCao {
    private Integer querstionTuCaoId;
    private Integer questionId;// 问题的ID
    private Integer questionTucaoStep;// 踩
    private Integer questionTucaoPraise;// 赞
    private Integer questionTucaoStudentId;// 对答案踩赞的学生ID

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

    public Integer getQuestionTucaoStep() {
        return questionTucaoStep;
    }

    public void setQuestionTucaoStep(Integer questionTucaoStep) {
        this.questionTucaoStep = questionTucaoStep;
    }

    public Integer getQuestionTucaoPraise() {
        return questionTucaoPraise;
    }

    public void setQuestionTucaoPraise(Integer questionTucaoPraise) {
        this.questionTucaoPraise = questionTucaoPraise;
    }

    public Integer getQuestionTucaoStudentId() {
        return questionTucaoStudentId;
    }

    public void setQuestionTucaoStudentId(Integer questionTucaoStudentId) {
        this.questionTucaoStudentId = questionTucaoStudentId;
    }

}
