package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 学生表
 * @author Admin
 *
 */
public class Student {
	private int studentId;//学生ID
	private String studentName;//学生的姓名
	private String studentSex;//学生的性别
	private Date studentBirthday;//学生的生日
	private String studentAddress;//学生的地址
	private int studentBirthPlace;//籍贯 精确到县
	private int studentClassId;//学生的班级
	private int studentCommunityId;//学生参加的社团
	private String studentPhoto;//学生的个人照片
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
	public Date getStudentBirthday() {
		return studentBirthday;
	}
	public void setStudentBirthday(Date studentBirthday) {
		this.studentBirthday = studentBirthday;
	}
	public String getStudentAddress() {
		return studentAddress;
	}
	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}
	public int getStudentBirthPlace() {
		return studentBirthPlace;
	}
	public void setStudentBirthPlace(int studentBirthPlace) {
		this.studentBirthPlace = studentBirthPlace;
	}
	public int getStudentClassId() {
		return studentClassId;
	}
	public void setStudentClassId(int studentClassId) {
		this.studentClassId = studentClassId;
	}
	public int getStudentCommunityId() {
		return studentCommunityId;
	}
	public void setStudentCommunityId(int studentCommunityId) {
		this.studentCommunityId = studentCommunityId;
	}
	public String getStudentPhoto() {
		return studentPhoto;
	}
	public void setStudentPhoto(String studentPhoto) {
		this.studentPhoto = studentPhoto;
	}
	
}
