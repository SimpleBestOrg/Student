package cn.com.zzzy.entity;

/**
 * 班级表
 * @author Admin
 *
 */
public class StudentClasses {
    private Integer ClassesId;// 班级ID
    private String ClassesName;// 班级名称

    public Integer getClassesId() {
        return ClassesId;
    }

    public void setClassesId(Integer classesId) {
        ClassesId = classesId;
    }

    public String getClassesName() {
        return ClassesName;
    }

    public void setClassesName(String classesName) {
        ClassesName = classesName;
    }

}
