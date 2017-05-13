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
        
        
        /**
         * 根据学生ID查询出来加他为好友的学生ID(用于home.jsp页面判断是否显示  加号好友  待对方审核 )
         * @param stuId
         * @return
         */
        public List<StudentFriend>  queryFriendFlag(Integer stuId){
             return  studentFriendMapper.queryFriendFlag(stuId);
        }
        
        /**
         * 添加好友
         * @param studentFriend
         */
        public void addFriend(StudentFriend studentFriend){
              System.out.println("学生ID11111:"+studentFriend.getStudentId());
              studentFriendMapper.addFriend(studentFriend);
        }
        
        
        /**
         * 更新好友状态(同意或者拒绝)
         */
        public void updateStudentFriendFlag(StudentFriend studentFriend){
            studentFriendMapper.updateStudentFriendFlag(studentFriend);
        }
}
