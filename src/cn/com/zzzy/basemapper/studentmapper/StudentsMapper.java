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
}
