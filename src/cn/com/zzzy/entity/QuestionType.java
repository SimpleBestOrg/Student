package cn.com.zzzy.entity;

/**
 * 问题类型表
 * @author Admin
 *
 */
public class QuestionType {
    private Integer quesetionTypeId;// 问题类型ID
    private String quesetionTypeName;// 类型的名称

    public Integer getQuesetionTypeId() {
        return quesetionTypeId;
    }

    public void setQuesetionTypeId(Integer quesetionTypeId) {
        this.quesetionTypeId = quesetionTypeId;
    }

    public String getQuesetionTypeName() {
        return quesetionTypeName;
    }

    public void setQuesetionTypeName(String quesetionTypeName) {
        this.quesetionTypeName = quesetionTypeName;
    }

}
