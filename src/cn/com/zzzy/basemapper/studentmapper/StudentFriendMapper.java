package cn.com.zzzy.basemapper.studentmapper;

import java.util.List;

import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.util.PageParam;

public interface StudentFriendMapper {
        
    List<StudentFriend>  queryFriendInfo(PageParam param,Integer stuId);
}
