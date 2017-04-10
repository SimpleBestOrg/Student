package cn.com.zzzy.entity;

/**
 * 科目表
 * @author Admin
 *
 */
public class StudentSubject {
    private Integer subjectId;// 科目ID
    private String subjectName;// 科目名称
    private Integer subjectStageId;// 课程阶段ID

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public Integer getSubjectStageId() {
        return subjectStageId;
    }

    public void setSubjectStageId(Integer subjectStageId) {
        this.subjectStageId = subjectStageId;
    }

}
