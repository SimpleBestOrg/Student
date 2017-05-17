package cn.com.zzzy.basemapper.studentmapper;

import java.util.List;

import cn.com.zzzy.entity.StudentMessage;

public interface StudentMessageMapper {
    
        /**
         * 查询所有的消息
         * @return
         */
        List<StudentMessage>  queryAllMessage(Integer stuId);
        
        /**
         * 插入学生信息表
         * @param studentMessage
         */
        void insertMessage(StudentMessage studentMessage);
        
        
        /**
         * 更新好友消息内容(点击同意或者拒绝时需要更新 消息中的两个按钮)
         * @param studentMessage
         */
        void  updateMessageContext(StudentMessage studentMessage); 
        
        /**
         * 根据消息ID删除消息
         * @param stuMessageId
         */
        void  deleteMessageByMessId(Integer stuMessageId);
        
        /**
         * 根据学生ID删除学生消息
         * @param studentId
         */
        void  deleteMessageByStuId(Integer studentId);
        
}
