package cn.com.zzzy.service.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.zzzy.basemapper.studentmapper.StudentMessageMapper;
import cn.com.zzzy.entity.StudentMessage;

@Service
public class StudentMessageService {
        @Autowired
        private StudentMessageMapper    studentMessageMapper;
        
        /**
         * 查询所有的消息
         * @return
         */
        public List<StudentMessage>  queryAllMessage(Integer stuId){
               return studentMessageMapper.queryAllMessage(stuId);
        }
        
        /**
         * 插入消息
         * @param studentMessage
         */
        public void   insertMessage(StudentMessage studentMessage){
               studentMessageMapper.insertMessage(studentMessage);
        }
}

