package cn.com.zzzy.entity;

import java.util.Date;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 社团表
 * @author Admin
 *
 */
public class Community {
    private int communityId;// 社团ID
    private String communityName;// 社团的名称
    private int communityPersonNum;// 社团限制人数
    private Teacher communityTeacherID;// 老师的ID
    private Date communityAppliDate;//社团申请日期
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String communityCreateDate;// 社团成立日期
    private Student communityAppliStudent;// 社团申请学生的ID
    private String communityAppliReason;// 社团申请原因
    private String communityAppliRespon;// 社团的职责
    private int communityFlag;// 申请社团是否批准
    private String communityPhoto;// 社团照片
    private Set<CommunityPeople> communityPeoples;
    private Integer communityApplyStuId;

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

    public Teacher getCommunityTeacherID() {
        return communityTeacherID;
    }

    public void setCommunityTeacherID(Teacher communityTeacherID) {
        this.communityTeacherID = communityTeacherID;
    }

    public String getCommunityCreateDate() {
        return communityCreateDate;
    }

    public void setCommunityCreateDate(String communityCreateDate) {
        this.communityCreateDate = communityCreateDate;
    }

    public Student getCommunityAppliStudent() {
        return communityAppliStudent;
    }

    public void setCommunityAppliStudent(Student communityAppliStudent) {
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

    public String getCommunityPhoto() {
        return communityPhoto;
    }

    public void setCommunityPhoto(String communityPhoto) {
        this.communityPhoto = communityPhoto;
    }

    public Set<CommunityPeople> getCommunityPeoples() {
        return communityPeoples;
    }

    public void setCommunityPeoples(Set<CommunityPeople> communityPeoples) {
        this.communityPeoples = communityPeoples;
    }

    public Date getCommunityAppliDate() {
        return communityAppliDate;
    }

    public void setCommunityAppliDate(Date communityAppliDate) {
        this.communityAppliDate = communityAppliDate;
    }

    public Integer getCommunityApplyStuId() {
        return communityApplyStuId;
    }

    public void setCommunityApplyStuId(Integer communityApplyStuId) {
        this.communityApplyStuId = communityApplyStuId;
    }

}
