package cn.com.zzzy.entity;
/**
 * 学生老师中间表
 * @author Admin
 *
 */
public class StudentTeacher {
	private int studentId;//学生ID
	private int teacherId;//老师ID
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	
}
