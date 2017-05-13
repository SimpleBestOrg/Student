package cn.com.zzzy.basemapper.studentmapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.util.PageParam;

public interface StudentFriendMapper {
        
    /**
     * 根据学生ID查询学生朋友信息
     * @param param
     * @param stuId
     * @return
     */
    List<Student>  queryFriendInfo(PageParam param,@Param("stuId") Integer stuId);
    
    /**
     * 根据学生ID查询出来加他为好友的学生ID(用于home.jsp判断是否显示  加号好友  待对方审核 )
     * @param stuId
     * @return
     */
    List<StudentFriend>  queryFriendFlag(@Param("stuId")Integer stuId);
    
    /**
     * 添加好友
     * @param studentFriend
     */
    void   addFriend(StudentFriend studentFriend);
    
    /**
     * 更新好友状态
     * @param studentFriend
     */
    void updateStudentFriendFlag(StudentFriend studentFriend);
}
