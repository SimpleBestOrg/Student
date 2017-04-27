package cn.com.zzzy.basemapper.studentmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.util.PageParam;

public interface StudentFriendMapper {
        
    /**
     * 根据学生ID查询学生朋友信息
     * @param param
     * @param stuId
     * @return
     */
    List<StudentFriend>  queryFriendInfo(PageParam param,@Param("stuId") Integer stuId);
}
