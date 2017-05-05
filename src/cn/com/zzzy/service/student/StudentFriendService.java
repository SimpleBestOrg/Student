package cn.com.zzzy.service.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.studentmapper.StudentFriendMapper;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.entity.StudentFriend;
import cn.com.zzzy.util.PageParam;

@Service
public class StudentFriendService {
            
        @Autowired
        private  StudentFriendMapper studentFriendMapper;
    
        /**
         * 查找所有的朋友
         * @param param
         * @param stuId
         * @return
         */
        public  List<Student>  queryFriendInfo(PageParam param,Integer stuId){
             return  studentFriendMapper.queryFriendInfo(param, stuId);
        }
}
