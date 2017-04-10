package cn.com.zzzy.entity;

/**
 * 推荐表
 * @author Admin
 *
 */
public class StudentRecommeFriend {
    private Integer recommId;// 推荐ID
    private Integer recommStduentId;// 推荐人的ID,给谁推荐
    private String recommRefereeStudentId;// 被推荐学生ID
    private Integer recommReason;// 推荐原因

    public Integer getRecommId() {
        return recommId;
    }

    public void setRecommId(Integer recommId) {
        this.recommId = recommId;
    }

    public Integer getRecommStduentId() {
        return recommStduentId;
    }

    public void setRecommStduentId(Integer recommStduentId) {
        this.recommStduentId = recommStduentId;
    }

    public String getRecommRefereeStudentId() {
        return recommRefereeStudentId;
    }

    public void setRecommRefereeStudentId(String recommRefereeStudentId) {
        this.recommRefereeStudentId = recommRefereeStudentId;
    }

    public Integer getRecommReason() {
        return recommReason;
    }

    public void setRecommReason(Integer recommReason) {
        this.recommReason = recommReason;
    }

}
