package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 社团表
 * @author Admin
 *
 */
public class Community {
	private int communityId;//社团ID
	private String communityName;//社团的名称
	private int communityPersonNum;//社团限制人数
	private int communityTeacherID;//老师的ID
	private Date communityCreateDate;//社团成立日期
	private int communityAppliStudent;//社团申请学生的ID
	private String communityAppliReason;//社团申请原因
	private String communityAppliRespon;//社团的职责
	private int communityFlag;//申请社团是否批准
	public int getCommunityId() {
		return communityId;
	}
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}
	public int getCommunityPersonNum() {
		return communityPersonNum;
	}
	public void setCommunityPersonNum(int communityPersonNum) {
		this.communityPersonNum = communityPersonNum;
	}
	public int getCommunityTeacherID() {
		return communityTeacherID;
	}
	public void setCommunityTeacherID(int communityTeacherID) {
		this.communityTeacherID = communityTeacherID;
	}
	public Date getCommunityCreateDate() {
		return communityCreateDate;
	}
	public void setCommunityCreateDate(Date communityCreateDate) {
		this.communityCreateDate = communityCreateDate;
	}
	public int getCommunityAppliStudent() {
		return communityAppliStudent;
	}
	public void setCommunityAppliStudent(int communityAppliStudent) {
		this.communityAppliStudent = communityAppliStudent;
	}
	public String getCommunityAppliReason() {
		return communityAppliReason;
	}
	public void setCommunityAppliReason(String communityAppliReason) {
		this.communityAppliReason = communityAppliReason;
	}
	public String getCommunityAppliRespon() {
		return communityAppliRespon;
	}
	public void setCommunityAppliRespon(String communityAppliRespon) {
		this.communityAppliRespon = communityAppliRespon;
	}
	public int getCommunityFlag() {
		return communityFlag;
	}
	public void setCommunityFlag(int communityFlag) {
		this.communityFlag = communityFlag;
	}
	
}
