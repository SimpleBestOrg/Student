package cn.com.zzzy.entity;

/**
 *项目表
 * @author Admin
 *
 */
public class Project {
    private Integer projectID;// 项目的ID
    private String projectName;// 项目的名称
    private String projectDescription;// 项目的描述
    private String score;// 项目的平均分数(评审老师各自给出的分数的平均数)
    private Integer projectStage;// 项目的阶段（S1，S2，S3）

    public Integer getProjectID() {
        return projectID;
    }

    public void setProjectID(Integer projectID) {
        this.projectID = projectID;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public Integer getProjectStage() {
        return projectStage;
    }

    public void setProjectStage(Integer projectStage) {
        this.projectStage = projectStage;
    }

}
