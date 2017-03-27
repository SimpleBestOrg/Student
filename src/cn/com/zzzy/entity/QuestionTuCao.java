package cn.com.zzzy.entity;

/**
 * 问题吐槽表（踩，赞）
 * @author Admin
 *
 */
public class QuestionTuCao {
    private int querstionTuCaoId;
    private int questionId;// 问题的ID
    private int questionTucaoStep;// 踩
    private int questionTucaoPraise;// 赞
    private int questionTucaoStudentId;// 对答案踩赞的学生ID

    public int getQuerstionTuCaoId() {
        return querstionTuCaoId;
    }

    public void setQuerstionTuCaoId(int querstionTuCaoId) {
        this.querstionTuCaoId = querstionTuCaoId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getQuestionTucaoStep() {
        return questionTucaoStep;
    }

    public void setQuestionTucaoStep(int questionTucaoStep) {
        this.questionTucaoStep = questionTucaoStep;
    }

    public int getQuestionTucaoPraise() {
        return questionTucaoPraise;
    }

    public void setQuestionTucaoPraise(int questionTucaoPraise) {
        this.questionTucaoPraise = questionTucaoPraise;
    }

    public int getQuestionTucaoStudentId() {
        return questionTucaoStudentId;
    }

    public void setQuestionTucaoStudentId(int questionTucaoStudentId) {
        this.questionTucaoStudentId = questionTucaoStudentId;
    }

}
