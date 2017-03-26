package cn.com.zzzy.entity;
/**
 * 学生籍贯表
 * @author Admin
 *
 */
public class StudentBirthplace {
	private int studentBirthplaceId;//出生地ID
	private String studentBirthplace;//籍贯名称
	private int    BirthplaceParentName;//父籍贯名称
	public int getStudentBirthplaceId() {
		return studentBirthplaceId;
	}
	public void setStudentBirthplaceId(int studentBirthplaceId) {
		this.studentBirthplaceId = studentBirthplaceId;
	}
	public String getStudentBirthplace() {
		return studentBirthplace;
	}
	public void setStudentBirthplace(String studentBirthplace) {
		this.studentBirthplace = studentBirthplace;
	}
	public int getBirthplaceParentName() {
		return BirthplaceParentName;
	}
	public void setBirthplaceParentName(int birthplaceParentName) {
		BirthplaceParentName = birthplaceParentName;
	}
	
}
