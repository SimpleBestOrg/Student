package cn.com.zzzy.entity;
/**
 * 学生成绩表
 * @author Admin
 *
 */
public class StudentScore {
	private int scoreId;//成绩ID
	private int scoreSubjectId;//科目ID
	private int scoreStudentId;//学生ID
	private int theScore;//理论分数
	public int getScoreId() {
		return scoreId;
	}
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}
	public int getScoreSubjectId() {
		return scoreSubjectId;
	}
	public void setScoreSubjectId(int scoreSubjectId) {
		this.scoreSubjectId = scoreSubjectId;
	}
	public int getScoreStudentId() {
		return scoreStudentId;
	}
	public void setScoreStudentId(int scoreStudentId) {
		this.scoreStudentId = scoreStudentId;
	}
	public int getTheScore() {
		return theScore;
	}
	public void setTheScore(int theScore) {
		this.theScore = theScore;
	}
	
}
