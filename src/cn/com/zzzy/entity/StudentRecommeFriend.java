package cn.com.zzzy.entity;
/**
 * 推荐表
 * @author Admin
 *
 */
public class StudentRecommeFriend {
	private int recommId;//推荐ID
	private int recommStduentId;//推荐人的ID,给谁推荐
	private String recommRefereeStudentId;//被推荐学生ID
	private int recommReason;//推荐原因
	public int getRecommId() {
		return recommId;
	}
	public void setRecommId(int recommId) {
		this.recommId = recommId;
	}
	public int getRecommStduentId() {
		return recommStduentId;
	}
	public void setRecommStduentId(int recommStduentId) {
		this.recommStduentId = recommStduentId;
	}
	public String getRecommRefereeStudentId() {
		return recommRefereeStudentId;
	}
	public void setRecommRefereeStudentId(String recommRefereeStudentId) {
		this.recommRefereeStudentId = recommRefereeStudentId;
	}
	public int getRecommReason() {
		return recommReason;
	}
	public void setRecommReason(int recommReason) {
		this.recommReason = recommReason;
	}
	
}
