package cn.com.zzzy.entity;
/**
 * 科目表
 * @author Admin
 *
 */
public class StudentSubject {
	private int subjectId;//科目ID
	private String subjectName;//科目名称
	private int subjectStageId;//课程阶段ID
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public int getSubjectStageId() {
		return subjectStageId;
	}
	public void setSubjectStageId(int subjectStageId) {
		this.subjectStageId = subjectStageId;
	}
	
}
