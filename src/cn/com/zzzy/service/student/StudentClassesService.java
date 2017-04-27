package cn.com.zzzy.service.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.studentmapper.StudentClassMapper;
import cn.com.zzzy.entity.StudentClasses;

@Service
public class StudentClassesService {
        
        @Autowired
        private  StudentClassMapper studentClassesMapper;
        
        
        /**
         * 查找所有班级
         * @return
         */
        public List<StudentClasses>  queryAllClasses(){
             return  studentClassesMapper.queryAllClasses();
        }
}
