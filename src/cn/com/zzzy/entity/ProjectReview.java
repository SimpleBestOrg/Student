package cn.com.zzzy.entity;

public class ProjectReview {
	/**
	 * 评审项目表
	 */
	private int projectReviewId;//评审项目的ID
	private int projectTeacherId;//评审老师的ID
	private int projectId;//项目的ID
	private int projectScore;//评审项目的分数
	public int getProjectReviewId() {
		return projectReviewId;
	}
	public void setProjectReviewId(int projectReviewId) {
		this.projectReviewId = projectReviewId;
	}
	public int getProjectTeacherId() {
		return projectTeacherId;
	}
	public void setProjectTeacherId(int projectTeacherId) {
		this.projectTeacherId = projectTeacherId;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getProjectScore() {
		return projectScore;
	}
	public void setProjectScore(int projectScore) {
		this.projectScore = projectScore;
	}
	
}
