package cn.com.zzzy.entity;

import java.util.Date;

/**
 * 社团表
 * @author Admin
 *
 */
public class Community {
	private Integer communityId;//社团ID
	private String communityName;//社团的名称
	private Integer communityPersonNum;//社团限制人数
	private Integer communityTeacherID;//老师的ID
	private Date communityCreateDate;//社团成立日期
	private Integer communityAppliStudent;//社团申请学生的ID
	private String communityAppliReason;//社团申请原因
	private String communityAppliRespon;//社团的职责
	private Integer communityFlag;//申请社团是否批准
	public Integer getCommunityId() {
		return communityId;
	}
	public void setCommunityId(Integer communityId) {
		this.communityId = communityId;
	}
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}
	public Integer getCommunityPersonNum() {
		return communityPersonNum;
	}
	public void setCommunityPersonNum(Integer communityPersonNum) {
		this.communityPersonNum = communityPersonNum;
	}
	public Integer getCommunityTeacherID() {
		return communityTeacherID;
	}
	public void setCommunityTeacherID(Integer communityTeacherID) {
		this.communityTeacherID = communityTeacherID;
	}
	public Date getCommunityCreateDate() {
		return communityCreateDate;
	}
	public void setCommunityCreateDate(Date communityCreateDate) {
		this.communityCreateDate = communityCreateDate;
	}
	public Integer getCommunityAppliStudent() {
		return communityAppliStudent;
	}
	public void setCommunityAppliStudent(Integer communityAppliStudent) {
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
	public Integer getCommunityFlag() {
		return communityFlag;
	}
	public void setCommunityFlag(Integer communityFlag) {
		this.communityFlag = communityFlag;
	}
	
}
