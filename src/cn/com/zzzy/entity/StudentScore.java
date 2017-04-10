package cn.com.zzzy.entity;

/**
 * 学生成绩表
 * @author Admin
 *
 */
public class StudentScore {
    private Integer scoreId;// 成绩ID
    private Integer scoreSubjectId;// 科目ID
    private Integer scoreStudentId;// 学生ID
    private Integer theScore;// 理论分数

    public Integer getScoreId() {
        return scoreId;
    }

    public void setScoreId(Integer scoreId) {
        this.scoreId = scoreId;
    }

    public Integer getScoreSubjectId() {
        return scoreSubjectId;
    }

    public void setScoreSubjectId(Integer scoreSubjectId) {
        this.scoreSubjectId = scoreSubjectId;
    }

    public Integer getScoreStudentId() {
        return scoreStudentId;
    }

    public void setScoreStudentId(Integer scoreStudentId) {
        this.scoreStudentId = scoreStudentId;
    }

    public Integer getTheScore() {
        return theScore;
    }

    public void setTheScore(Integer theScore) {
        this.theScore = theScore;
    }

}
