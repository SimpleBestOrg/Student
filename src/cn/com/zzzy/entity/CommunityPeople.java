package cn.com.zzzy.entity;

/**
 * 申请加入社团表
 * @author Admin
 *
 */
public class CommunityPeople {
    private Integer comunityPeopleId;// 申请加入社团表ID
    private Integer communityId;// 申请进入社团id社团成员的ID
    private Integer communityStudentID;// 社团成员的学生的ID
    private String communityPosition;// 部门中的职位
    private String communityPeoFlag;// 学生申请加入这个社团的状态(0:正在申请加入这个社团1:经过审批并同意的已经成为这个社团的人员2:经过审批为同意的)

    public Integer getComunityPeopleId() {
        return comunityPeopleId;
    }

    public void setComunityPeopleId(Integer comunityPeopleId) {
        this.comunityPeopleId = comunityPeopleId;
    }

    public Integer getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }

    public Integer getCommunityStudentID() {
        return communityStudentID;
    }

    public void setCommunityStudentID(Integer communityStudentID) {
        this.communityStudentID = communityStudentID;
    }

    public String getCommunityPosition() {
        return communityPosition;
    }

    public void setCommunityPosition(String communityPosition) {
        this.communityPosition = communityPosition;
    }

    public String getCommunityPeoFlag() {
        return communityPeoFlag;
    }

    public void setCommunityPeoFlag(String communityPeoFlag) {
        this.communityPeoFlag = communityPeoFlag;
    }

}
