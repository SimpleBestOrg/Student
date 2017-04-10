package cn.com.zzzy.entity;

/**
 * 学生籍贯表
 * @author Admin
 *
 */
public class StudentBirthplace {
    private Integer studentBirthplaceId;// 出生地ID
    private String studentBirthplace;// 籍贯名称
    private Integer BirthplaceParentName;// 父籍贯名称

    public Integer getStudentBirthplaceId() {
        return studentBirthplaceId;
    }

    public void setStudentBirthplaceId(Integer studentBirthplaceId) {
        this.studentBirthplaceId = studentBirthplaceId;
    }

    public String getStudentBirthplace() {
        return studentBirthplace;
    }

    public void setStudentBirthplace(String studentBirthplace) {
        this.studentBirthplace = studentBirthplace;
    }

    public Integer getBirthplaceParentName() {
        return BirthplaceParentName;
    }

    public void setBirthplaceParentName(Integer birthplaceParentName) {
        BirthplaceParentName = birthplaceParentName;
    }

}
