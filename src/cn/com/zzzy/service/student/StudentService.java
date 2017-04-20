package cn.com.zzzy.service.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.studentmapper.StudentsMapper;
import cn.com.zzzy.entity.Student;
import cn.com.zzzy.util.PageParam;

@Service
public class StudentService {
        
        @Autowired
        public StudentsMapper studentMapper;
        
        /**
         * 根据学生ID查询学生朋友的信息
         * @param param
         * @param stuId  学生ID
         * @return
         */
        public List<Student>  queryFriendInfo(PageParam param,Integer stuId){
            return  studentMapper.queryFriendInfo(param,stuId);
        }
        
}
