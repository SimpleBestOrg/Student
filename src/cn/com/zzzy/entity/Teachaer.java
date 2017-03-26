package cn.com.zzzy.entity;
/**
 * 老师表
 * @author Admin
 *
 */
public class Teachaer {
	private int teacherId;//老师ID（也是老师老师的登录ID）
	private String teacherName;//老师的名称
	private String teacherPwd;//老师登录的密码
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherPwd() {
		return teacherPwd;
	}
	public void setTeacherPwd(String teacherPwd) {
		this.teacherPwd = teacherPwd;
	}
	
}
