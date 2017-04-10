package cn.com.zzzy.entity;

/**
 * 项目评审表
 * @author Admin
 *
 */
public class ProjectReview {
    private Integer projectReviewId;// 评审项目表的ID
    private Integer projectTeacherId;// 评审老师的ID
    private Integer projectId;// 项目的ID
    private Integer projectScore;// 评审项目的分数

    public Integer getProjectReviewId() {
        return projectReviewId;
    }

    public void setProjectReviewId(Integer projectReviewId) {
        this.projectReviewId = projectReviewId;
    }

    public Integer getProjectTeacherId() {
        return projectTeacherId;
    }

    public void setProjectTeacherId(Integer projectTeacherId) {
        this.projectTeacherId = projectTeacherId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getProjectScore() {
        return projectScore;
    }

    public void setProjectScore(Integer projectScore) {
        this.projectScore = projectScore;
    }

}
