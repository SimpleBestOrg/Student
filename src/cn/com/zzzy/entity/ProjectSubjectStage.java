package cn.com.zzzy.entity;

/**
 * 学期阶段表
 * @author Admin
 *
 */
public class ProjectSubjectStage {
    private Integer stageId;// 学期阶段ID
    private String stageName;// 学期阶段的名称

    public Integer getStageId() {
        return stageId;
    }

    public void setStageId(Integer stageId) {
        this.stageId = stageId;
    }

    public String getStageName() {
        return stageName;
    }

    public void setStageName(String stageName) {
        this.stageName = stageName;
    }

}
