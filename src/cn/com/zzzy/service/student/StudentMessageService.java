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
        
        /**
         * 更新消息内容(点击同意或者拒绝按钮时  更新消息内容)
         * @param studentMessage
         */
        public void updateMessageContext(StudentMessage studentMessage){
               studentMessageMapper.updateMessageContext(studentMessage);
        }
        
        /**
         * 根据消息ID进行删除
         * @param stuMessageId
         */
        public void deleteMessageByMessId(Integer stuMessageId){
               studentMessageMapper.deleteMessageByMessId(stuMessageId);
        }
        
        /**
         * 根据学生ID删除消息
         * @param studentId
         */
        public void deleteMessageByStuId(Integer studentId){
               studentMessageMapper.deleteMessageByStuId(studentId);
        }
}

