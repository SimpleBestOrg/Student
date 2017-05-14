package cn.com.zzzy.basemapper.studentmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.basemapper.BaseMapper;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.util.PageParam;

public interface StudentsMapper extends BaseMapper<Student>{
        
    /**
     * 根据学生Id查询学生朋友的信息
     * @param param
     * @param stuId
     * @return
     */
    List<Student>  queryFriendInfo(PageParam param,@Param("stuId") Integer stuId);  
    
    /**
     * 根据学生ID查询学生的详细信息
     * @param stuId
     * @return
     */
    Student  queryStudentInfoById(@Param("stuId") Integer stuId);
    
    /**
     * 查询所有学生
     * @return
     */
    List<Student>  queryAllStudent(@Param("page")PageParam param);
    
    /**
     * 查询所有学生总数
     * @return
     */
    Integer   queryAllStudentCount(@Param("page")PageParam param);
    
    /**
     * 添加学生
     * @param student
     */
    void  addStudent(Student student);
    
    /**
     * 查询学生个性签名
     * @param stuId
     * @return
     */
    String selectStudentSign(@Param("stuId") Integer stuId);
    
    /**
     * 更新学生个性签名
     * @param stuId
     * @param studentSign
     */
    void updateStudentSign(@Param("stuId") Integer stuId,@Param("studentSign") String studentSign);
}
