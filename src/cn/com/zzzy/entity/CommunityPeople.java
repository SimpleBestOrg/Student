package cn.com.zzzy.entity;

/**
 * 申请加入社团表
 * @author Admin
 *
 */
public class CommunityPeople {
    private int comunityPeopleId;// 申请加入社团表ID
    private Community community;// 申请进入社团id社团的ID（外键）
    private Student student;// 社团成员的学生的ID
    private String communityPosition;// 部门中的职位
    private Integer communityPeoFlag;// 学生申请加入这个社团的状态(0:正在申请加入这个社团1:经过审批并同意的已经成为这个社团的人员2:经过审批未同意的)
    private Integer studentId;
    private Integer communityId;
    private Integer stuMessageId;

    public Integer getCommunityId() {
        return communityId;
    }

    public void setCommunityId(Integer communityId) {
        this.communityId = communityId;
    }

    public int getComunityPeopleId() {
        return comunityPeopleId;
    }

    public void setComunityPeopleId(int comunityPeopleId) {
        this.comunityPeopleId = comunityPeopleId;
    }

    public Community getCommunity() {
        return community;
    }

    public void setCommunity(Community community) {
        this.community = community;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getCommunityPosition() {
        return communityPosition;
    }

    public void setCommunityPosition(String communityPosition) {
        this.communityPosition = communityPosition;
    }

    public Integer getCommunityPeoFlag() {
        return communityPeoFlag;
    }

    public void setCommunityPeoFlag(Integer communityPeoFlag) {
        this.communityPeoFlag = communityPeoFlag;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getStuMessageId() {
        return stuMessageId;
    }

    public void setStuMessageId(Integer stuMessageId) {
        this.stuMessageId = stuMessageId;
    }

}
